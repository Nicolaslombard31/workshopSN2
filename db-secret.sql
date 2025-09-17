-- users
CREATE TABLE users (
  id CHAR(36) PRIMARY KEY,
  email VARCHAR(320) UNIQUE NOT NULL,
  name VARCHAR(200),
  password BLOB,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- rooms
CREATE TABLE rooms (
  id CHAR(36) PRIMARY KEY,
  name TEXT,
  owner CHAR(36) NOT NULL,
  FOREIGN KEY (owner) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- room_members
CREATE TABLE room_members (
  room_id CHAR(36) NOT NULL,
  user_id CHAR(36) NOT NULL,
  PRIMARY KEY (room_id, user_id),
  FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- messages
CREATE TABLE messages (
  id CHAR(36) PRIMARY KEY,
  content TEXT NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  user_id CHAR(36) NOT NULL,
  room_id CHAR(36) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (room_id) REFERENCES rooms(id) ON DELETE CASCADE,
  INDEX idx_room_created (room_id, created)
) ENGINE=InnoDB;

///
DELIMITER $$

CREATE EVENT IF NOT EXISTS purge_messages_every_30s
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
  DELETE FROM messages WHERE created < NOW() - INTERVAL 30 SECOND;
END$$

DELIMITER ;
