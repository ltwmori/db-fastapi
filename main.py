import datetime
from fastapi import FastAPI,status,HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Optional,List
from database import SessionLocal
import models

app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

class Users(BaseModel):
    email: str
    name: str
    surname: str
    salary: int
    phone: str
    cname: str
    class Config:
       orm_mode = True

class PublicServant(BaseModel):
    email: str
    department: str
    class Config:
       orm_mode = True

class Doctor(BaseModel):
    email: str
    degree: str
    class Config:
       orm_mode = True

class DiseaseType(BaseModel):
    id: int
    description: str
    class Config:
       orm_mode = True

class Country(BaseModel):
    cname: str
    population: int
    class Config:
       orm_mode = True

class Disease(BaseModel):
    disease_code: str
    pathogen: str
    description: str
    id: int
    class Config:
       orm_mode = True

class Discover(BaseModel):
    cname: str
    disease_code: str
    first_enc_date: datetime.date
    class Config:
       orm_mode = True

class Record(BaseModel):
    disease_code: str
    email: str
    cname: str
    total_deaths: int
    total_patients: int
    class Config:
       orm_mode = True

class Specialize(BaseModel):
    email: str
    id: int
    class Config:
       orm_mode = True

# --------------------------------------------Users--------------------------------------------

@app.get("/users", response_model=List[Users],status_code=200)
def get_users():
    db = SessionLocal()
    users = db.query(models.Users).all()
    return users

@app.get("/users/{email}", response_model=Users, status_code=status.HTTP_200_OK)
def get_user(email: str):
    db = SessionLocal()
    user = db.query(models.Users).filter(models.Users.email == email).first()
    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    return user

@app.post("/users", response_model=Users, status_code=status.HTTP_201_CREATED)
def create_user(user: Users):
    db = SessionLocal()
    new_user = models.Users(email=user.email, name=user.name, surname=user.surname, salary=user.salary, phone=user.phone, cname=user.cname)
    db.add(new_user)
    db.commit()
    return user

@app.put("/users/{email}",  response_model=Users,  status_code=status.HTTP_202_ACCEPTED)
def update_user(email: str, user: Users):
    db = SessionLocal()
    db_user = db.query(models.Users).filter(models.Users.email == email).first()
    if db_user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    db_user.name = user.name
    db_user.surname = user.surname
    db_user.salary = user.salary
    db_user.phone = user.phone
    db_user.cname = user.cname
    db.commit()
    return user

@app.delete("/users/{email}")
def delete_user(email: str):
    db = SessionLocal()
    user = db.query(models.Users).filter(models.Users.email == email).first()
    if user is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="User not found")
    db.delete(user)
    db.commit()
    return {"message": "User deleted successfully"}

# --------------------------------------------Public Servant--------------------------------------------

@app.get("/publicservant", response_model=List[PublicServant])
def get_publicservant():
    db = SessionLocal()
    publicservant = db.query(models.PublicServant).all()
    return publicservant

@app.get("/publicservant/{email}", response_model=PublicServant)
def get_publicservant(email: str):
    db = SessionLocal()
    publicservant = db.query(models.PublicServant).filter(models.PublicServant.email == email).first()
    if publicservant is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Public servant not found")
    return publicservant

@app.post("/publicservant", status_code=status.HTTP_201_CREATED)
def create_publicservant(publicservant: PublicServant):
    db = SessionLocal()
    new_publicservant = models.PublicServant(email=publicservant.email, department=publicservant.department)
    db.add(new_publicservant)
    db.commit()
    return publicservant

@app.put("/publicservant/{email}", status_code=status.HTTP_202_ACCEPTED)
def update_publicservant(email: str, publicservant: PublicServant):
    db = SessionLocal()
    db_publicservant = db.query(models.PublicServant).filter(models.PublicServant.email == email).first()
    if db_publicservant is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Public servant not found")
    db_publicservant.department = publicservant.department
    db.commit()
    return publicservant

@app.delete("/publicservant/{email}", status_code=status.HTTP_204_NO_CONTENT)
def delete_publicservant(email: str):
    db = SessionLocal()
    publicservant = db.query(models.PublicServant).filter(models.PublicServant.email == email).first()
    if publicservant is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Public servant not found")
    db.delete(publicservant)
    db.commit()
    return {"message": "Public servant deleted successfully"}

# # --------------------------------------------Doctor--------------------------------------------

@app.get("/doctor", response_model=List[Doctor])
def get_doctor():
    db = SessionLocal()
    doctor = db.query(models.Doctor).all()
    return doctor

@app.get("/doctor/{email}", response_model=Doctor)
def get_doctor(email: str):
    db = SessionLocal()
    doctor = db.query(models.Doctor).filter(models.Doctor.email == email).first()
    if doctor is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Doctor not found")
    return doctor

@app.post("/doctor", status_code=status.HTTP_201_CREATED)
def create_doctor(doctor: Doctor):
    db = SessionLocal()
    new_doctor = models.Doctor(email=doctor.email, degree=doctor.degree)
    db.add(new_doctor)
    db.commit()
    return doctor

@app.put("/doctor/{email}", status_code=status.HTTP_202_ACCEPTED)
def update_doctor(email: str, doctor: Doctor):
    db = SessionLocal()
    db_doctor = db.query(models.Doctor).filter(models.Doctor.email == email).first()
    if db_doctor is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Doctor not found")
    db_doctor.degree = doctor.degree
    db.commit()
    return doctor

@app.delete("/doctor/{email}", status_code=status.HTTP_204_NO_CONTENT)
def delete_doctor(email: str):
    db = SessionLocal()
    doctor = db.query(models.Doctor).filter(models.Doctor.email == email).first()
    if doctor is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Doctor not found")
    db.delete(doctor)
    db.commit()
    return {"message": "Doctor deleted successfully"}

# # --------------------------------------------Discover--------------------------------------------
@app.get("/discover", response_model=List[Discover])
def get_discover():
    db = SessionLocal()
    discover = db.query(models.Discover).all()
    return discover

# create new rows query for Discover table
@app.post("/discover", status_code=status.HTTP_201_CREATED)
def create_discover(discover: Discover):
    db = SessionLocal()
    new_discover = models.Discover(country=discover.cname, disease_code=discover.disease_code, first_enc_date = discover.first_enc_date)
    db.add(new_discover)
    db.commit()
    return discover

# delete discover rows
@app.delete("/discover/{cname}", status_code=status.HTTP_204_NO_CONTENT)
def delete_discover(cname: str):
    db = SessionLocal()
    discover = db.query(models.Discover).filter(models.Discover.cname == cname).first()
    if discover is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Discover not found")
    db.delete(discover)
    db.commit()
    return {"message": "Discover deleted successfully"}

# update discover rows
@app.put("/discover/{cname}", status_code=status.HTTP_202_ACCEPTED)
def update_discover(cname: str, discover: Discover):
    db = SessionLocal()
    db_discover = db.query(models.Discover).filter(models.Discover.cname == cname).first()
    if db_discover is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Discover not found")
    db_discover.disease_code = discover.disease_code
    db_discover.first_enc_date = discover.first_enc_date
    db.commit()
    return discover

# # --------------------------------------------Disease--------------------------------------------
@app.get("/disease", response_model=List[Disease])
def get_disease():
    db = SessionLocal()
    disease = db.query(models.Disease).all()
    return disease

# create new rows query for Disease table
@app.post("/disease", status_code=status.HTTP_201_CREATED)
def create_disease(disease: Disease):
    db = SessionLocal()
    new_disease = models.Disease(disease_code=disease.disease_code, disease_name=disease.disease_name, disease_description = disease.disease_description)
    db.add(new_disease)
    db.commit()
    return disease

# delete disease rows
@app.delete("/disease/{disease_code}", status_code=status.HTTP_204_NO_CONTENT)
def delete_disease(disease_code: str):
    db = SessionLocal()
    disease = db.query(models.Disease).filter(models.Disease.disease_code == disease_code).first()
    if disease is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Disease not found")
    db.delete(disease)
    db.commit()
    return {"message": "Disease deleted successfully"}

# update disease rows
@app.put("/disease/{disease_code}", status_code=status.HTTP_202_ACCEPTED)
def update_disease(disease_code: str, disease: Disease):
    db = SessionLocal()
    db_disease = db.query(models.Disease).filter(models.Disease.disease_code == disease_code).first()
    if db_disease is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Disease not found")
    db_disease.disease_name = disease.disease_name
    db_disease.disease_description = disease.disease_description
    db.commit()
    return disease

# # --------------------------------------------Countries--------------------------------------------
@app.get("/country", response_model=List[Country])
def get_countries():
    db = SessionLocal()
    country = db.query(models.Country).all()
    return country

# create new rows query for Countries table
@app.post("/country", status_code=status.HTTP_201_CREATED)
def create_countries(country: Country):
    db = SessionLocal()
    new_countries = models.Country(cname=country.cname, population=country.population)
    db.add(new_countries)
    db.commit()
    return country

# delete countries rows
@app.delete("/country/{cname}", status_code=status.HTTP_204_NO_CONTENT)
def delete_countries(cname: str):
    db = SessionLocal()
    countries = db.query(models.Country).filter(models.Country.cname == cname).first()
    if countries is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Countries not found")
    db.delete(countries)
    db.commit()
    return {"message": "Countries deleted successfully"}

# update countries rows
@app.put("/country/{cname}", status_code=status.HTTP_202_ACCEPTED)
def update_countries(cname: str, country: Country):
    db = SessionLocal()
    db_countries = db.query(models.Country).filter(models.Country.cname == cname).first()
    if db_countries is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Countries not found")
    db_countries.cname = country.cname
    db_countries.population = country.population
    db.commit()
    return country


# # --------------------------------------------Disease Type--------------------------------------------

@app.get("/disease_type", response_model=List[DiseaseType])
def get_disease_type():
    db = SessionLocal()
    disease_type = db.query(models.DiseaseType).all()
    return disease_type

# create new rows query for Disease Type table
@app.post("/disease_type", status_code=status.HTTP_201_CREATED)
def create_disease_type(disease_type: DiseaseType):
    db = SessionLocal()
    new_disease_type = models.DiseaseType(id=disease_type.id, description = disease_type.description)
    db.add(new_disease_type)
    db.commit()
    return disease_type

# delete disease type rows
@app.delete("/disease_type/{id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_disease_type(id: int):
    db = SessionLocal()
    disease_type = db.query(models.DiseaseType).filter(models.DiseaseType.id == id).first()
    if disease_type is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Disease Type not found")
    db.delete(disease_type)
    db.commit()
    return {"message": "Disease Type deleted successfully"}

# update disease type rows
@app.put("/disease_type/{id}", status_code=status.HTTP_202_ACCEPTED)
def update_disease_type(id: int, disease_type: DiseaseType):
    db = SessionLocal()
    db_disease_type = db.query(models.DiseaseType).filter(models.DiseaseType.id == id).first()
    if db_disease_type is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Disease Type not found")
    db_disease_type.id = disease_type.id
    db_disease_type.description = disease_type.description
    db.commit()
    return disease_type

# # --------------------------------------------Specialize--------------------------------------------

@app.get("/specialize", response_model=List[Specialize])
def get_specialize():
    db = SessionLocal()
    specialize = db.query(models.Specialize).all()
    return specialize

# create new rows query for Specialize table
@app.post("/specialize", status_code=status.HTTP_201_CREATED)
def create_specialize(specialize: Specialize):
    db = SessionLocal()
    new_specialize = models.Specialize(id=specialize.id, email = specialize.email)
    db.add(new_specialize)
    db.commit()
    return specialize

# delete specialize rows
@app.delete("/specialize/{id}", status_code=status.HTTP_204_NO_CONTENT)
def delete_specialize(id: int):
    db = SessionLocal()
    specialize = db.query(models.Specialize).filter(models.Specialize.id == id).first()
    if specialize is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Specialize not found")
    db.delete(specialize)
    db.commit()
    return {"message": "Specialize deleted successfully"}

# update specialize rows
@app.put("/specialize/{id}", status_code=status.HTTP_202_ACCEPTED)
def update_specialize(id: int, specialize: Specialize):
    db = SessionLocal()
    db_specialize = db.query(models.Specialize).filter(models.Specialize.id == id).first()
    if db_specialize is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Specialize not found")
    db_specialize.id = specialize.id
    db_specialize.email = specialize.email
    db.commit()
    return specialize

# # --------------------------------------------Record--------------------------------------------

@app.get("/record", response_model=List[Record])
def get_record():
    db = SessionLocal()
    record = db.query(models.Record).all()
    return record

# create new rows query for Record table
@app.post("/record", status_code=status.HTTP_201_CREATED)
def create_record(record: Record):
    db = SessionLocal()
    new_record = models.Record(email = record.email, cname = record.cname, disease_code = record.disease_code, total_deaths = record.total_deaths, total_patients = record.total_patients)
    db.add(new_record)
    db.commit()
    return record

# delete record rows
@app.delete("/record/{email}", status_code=status.HTTP_204_NO_CONTENT)
def delete_record(email: str):
    db = SessionLocal()
    record = db.query(models.Record).filter(models.Record.email == email).first()
    if record is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Record not found")
    db.delete(record)
    db.commit()
    return {"message": "Record deleted successfully"}

# update record rows
@app.put("/record/{email}", status_code=status.HTTP_202_ACCEPTED)
def update_record(email: str, record: Record):
    db = SessionLocal()
    db_record = db.query(models.Record).filter(models.Record.email == email).first()
    if db_record is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Record not found")
    db_record.email = record.email
    db_record.cname = record.cname
    db_record.disease_code = record.disease_code
    db_record.total_deaths = record.total_deaths
    db_record.total_patients = record.total_patients
    db.commit()
    return record


