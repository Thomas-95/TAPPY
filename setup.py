from setuptools import setup


setup(
    name="tappy",
    install_requires=None,
    entry_points="""\
      [paste.app_factory]
      main = tappy:main
      """,
    version="0.0.1",
)
