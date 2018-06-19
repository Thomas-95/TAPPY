from pyramid.config import Configurator
from .hello_world import hello_world


def main(global_config, **settings):
    config = Configurator(settings=settings)
    config.add_route("hello", "/")
    config.add_view(hello_world, route_name="hello")
    config.include("pyramid_jinja2")
    config.add_static_view("static", "static", cache_max_age=3600)
    config.add_route("home", "/")
    config.scan()
    return config.make_wsgi_app()
