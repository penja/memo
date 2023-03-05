from fastapi import FastAPI
from src.prisma import prisma

app = FastAPI()
@app.on_event("startup")
async def startup():
    await prisma.connect()
@app.on_event("shutdown")
async def shutdown():
    await prisma.disconnect()

@app.get("/")
async def root():
    return await prisma.user.find_first(
        where={
            "email": "john@example.com"
        }
    )