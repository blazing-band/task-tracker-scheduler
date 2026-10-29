from celery import Celery
from celery.schedules import crontab

app = Celery()
app.conf.update(
    enable_utc=True,
    timezone="Europe/Moscow"
)

app.conf.beat_schedule = {
    "form-message-every-midnight": {
        "task": "tasks.form_message",
        "schedule": crontab(minute=0, hour=0)
    }
}

@app.task(name="tasks.form_message")
def form_message():
    pass
