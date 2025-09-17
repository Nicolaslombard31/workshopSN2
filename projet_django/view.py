from django.http import HttpResponse

def index(request):
    # Reçoit une HttpRequest - le paramètre request
    # réalise des opérations en utilisant les informations de la requête
    # Renvoie HttpResponse
    return HttpResponse('Hello from Django!')