from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from .models import Message

@login_required
def chat_view(request):
    agents = User.objects.exclude(id=request.user.id)

    if request.method == "POST":
        receiver_id = request.POST.get("receiver")
        text = request.POST.get("message")
        if receiver_id and text:
            receiver = User.objects.get(id=receiver_id)
            Message.objects.create(sender=request.user, receiver=receiver, message=text)
            return redirect("chat")

    # messages envoyés ou reçus par l’agent connecté
    messages = Message.objects.filter(sender=request.user) | Message.objects.filter(receiver=request.user)
    messages = messages.order_by("date")

    return render(request, "chat.html", {"agents": agents, "messages": messages})