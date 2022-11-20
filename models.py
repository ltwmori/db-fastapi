from database import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey

class DiseaseType(Base):
    __tablename__ = 'DiseaseType'
    id = Column(Integer, primary_key=True)
    description = Column(String(140), unique=True)

    def __repr__(self) -> str:
        return super().__repr__()

class Country(Base):
    __tablename__ = 'Country'
    cname = Column(String(50), primary_key=True)
    population = Column(Integer)

    def __repr__(self) -> str:
        return super().__repr__()

class Disease(Base):
    __tablename__ = 'Disease'
    disease_code = Column(String(50), primary_key=True)
    pathogen = Column(String(20))
    description = Column(String(140))
    id = Column(Integer, ForeignKey('DiseaseType.id'))

    def __repr__(self) -> str:
        return super().__repr__()

class Users(Base):
    __tablename__ = 'Users'
    email = Column(String(60), primary_key=True)
    name = Column(String(30))
    surname = Column(String(40))
    salary = Column(Integer)
    phone = Column(String(20))
    cname = Column(String(50), ForeignKey('Country.cname'))

    def __repr__(self) -> str:
        return super().__repr__()

class PublicServant(Base):
    __tablename__ = 'PublicServant'
    email = Column(String(60), ForeignKey('Users.email'), primary_key=True)
    department = Column(String(50))

    def __repr__(self) -> str:
        return super().__repr__()

class Doctor(Base):
    __tablename__ = 'Doctor'
    email = Column(String(60), ForeignKey('Users.email'), primary_key=True)
    degree = Column(String(20))

    def __repr__(self) -> str:
        return super().__repr__()

class Discover(Base):
    __tablename__ = 'Discover'
    cname = Column(String(50), ForeignKey('Country.cname'), primary_key=True)
    disease_code = Column(String(40), ForeignKey('Disease.disease_code'), primary_key=True)
    first_enc_date = Column(DateTime)

    def __repr__(self) -> str:
        return super().__repr__()

class Specialize(Base):
    __tablename__ = 'Specialize'
    id = Column(Integer, ForeignKey('DiseaseType.id'), primary_key=True)
    email = Column(String(60), ForeignKey('Doctor.email'), primary_key=True)

    def __repr__(self) -> str:
        return super().__repr__()

class Record(Base):
    __tablename__ = 'Record'
    email = Column(String(60), ForeignKey('PublicServant.email'), primary_key=True)
    cname = Column(String(50), ForeignKey('Country.cname'), primary_key=True)
    disease_code = Column(String(50), ForeignKey('Disease.disease_code'), primary_key=True)
    total_deaths = Column(Integer)
    total_patients = Column(Integer)

    def __repr__(self) -> str:
        return super().__repr__()















