from sqlalchemy.orm import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine("postgresql://pjyqaxfsuxclil:b022a8e56f9fc6bb26cdea8ece92cedcc7fdb5696f9fbeb2cab81632565b6900@ec2-34-248-169-69.eu-west-1.compute.amazonaws.com:5432/d8ps1mfph35nnh", echo=True)
Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)
