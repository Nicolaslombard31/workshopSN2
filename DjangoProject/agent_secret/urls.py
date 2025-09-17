from django.contrib import admin
from django.urls import include, path

urlpatterns = [
    path("communication_secrete/", include("communication_secrete.urls")),
    path("admin/", admin.site.urls),
]