from database import Base, engine 
from models import DiseaseType, Country, Disease, Users, PublicServant, Doctor, Discover, Record, Specialize

print("Creating DB...")

Base.metadata.create_all(bind=engine)

