from django.db import models
from django.utils import timezone
from django.conf import settings

class Message(models.Model):
    id = models.AutoField(primary_key=True)
    sender = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='sender', on_delete=models.CASCADE)
    receiver = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='receiver', on_delete=models.CASCADE)
    message = models.TextField()
    date = models.DateTimeField(default=timezone.now)
    def __str__(self):
        return f"{self.sender} → {self.receiver} : {self.message[:50]}  \n {self.date}"
