local_travis:
	docker run --name travis-debug -dit travisci/ci-garnet:packer-1512502276-986baf0 /sbin/init
	docker exec -it travis-debug bash -l
	su - travis
	git clone --depth=50 --branch=master https://github.com/Thomas-95/TAPPY.git Thomas-95/TAPPY
	export PIPENV_IGNORE_VIRTUALENVS=1
	source ~/virtualenv/python3.6/bin/activate
	pip install pipenv
	pipenv install
	pipenv run py.test
	pipenv run COVERALLS_REPO_TOKEN=PBp3zqA5w5xr27OmZHas4vP71q11RYqgB coveralls

remove_debug_container:
	docker stop travis-debug
	docker rm travis-debug

general_container_remove:
	containers=$(docker ps -a -q)
	docker stop ${containers}
	docker rm $(docker ps -a -q)
