"""
ASGI config for chatbox project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/howto/deployment/asgi/
"""

import os
import django
from channels.routing import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'chatbox.settings')
django.setup()
application = get_asgi_application()
