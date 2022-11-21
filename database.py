from sqlalchemy.orm import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

final_db_url ="postgresql://postgres:l8E8bq3zP2IDXejF@db.tymojvhecoudapuzesbu.supabase.co:5432/postgres"

engine = create_engine(final_db_url, echo=True)
Base = declarative_base()
SessionLocal = sessionmaker(bind=engine)
