from datetime import datetime
import pytest
import sqlalchemy
from szurubooru import api, config, db
from szurubooru.util import misc

@pytest.fixture
def session():
    engine = sqlalchemy.create_engine('sqlite:///:memory:')
    session_maker = sqlalchemy.orm.sessionmaker(bind=engine)
    session_instance = sqlalchemy.orm.scoped_session(session_maker)
    db.Base.query = session_instance.query_property()
    db.Base.metadata.create_all(bind=engine)
    return session_instance

@pytest.fixture
def context_factory(session):
    def factory(request=None, input=None, files=None, user=None):
        ctx = api.Context()
        ctx.input = input or {}
        ctx.session = session
        ctx.request = request or {}
        ctx.files = files or {}
        ctx.user = user or db.User()
        return ctx
    return factory

@pytest.fixture
def config_injector():
    def injector(new_config_content):
        config.config = new_config_content
    return injector

@pytest.fixture
def user_factory():
    def factory(name='dummy', rank='regular_user'):
        user = db.User()
        user.name = name
        user.password = 'dummy'
        user.password_salt = 'dummy'
        user.password_hash = 'dummy'
        user.email = 'dummy'
        user.rank = rank
        user.creation_time = datetime(1997, 1, 1)
        user.avatar_style = db.User.AVATAR_GRAVATAR
        return user
    return factory