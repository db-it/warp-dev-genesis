PIP_REQUIREMENTS_FILE ?= project_requirements.ini

SSH_KEY_ID ?= ~/.ssh/id_rsa_rpi
SSH_KEY_TARGETS ?= pi@rpi2-2 pi@rpi4-1

PYTHON_BIN ?= venv/bin/python3
PIP_BIN ?= venv/bin/pip3
ANSIBLE_GALAXY_BIN ?= venv/bin/ansible-galaxy



.PHONY: init
init: bootstrap

.PHONY: bootstrap
bootstrap: venv install-ansible

.PHONY: venv
venv:
	rm -rf venv || true
	python3 -m venv venv
	$(PIP_BIN) install --upgrade pip setuptools wheel

.PHONY: install-ansible
install-ansible: install-packages install-galaxy-roles

# subtarget
.PHONY: install
install-packages:
	$(PIP_BIN) install --upgrade --requirement $(PIP_REQUIREMENTS_FILE)

# subtarget
.PHONY: install-galaxy-roles
install-galaxy-roles:
	$(ANSIBLE_GALAXY_BIN) role install -r requirements.yml

.PHONY: install-galaxy-collections
install-galaxy-collections:
	$(ANSIBLE_GALAXY_BIN) collection install -r requirements.yml

ssh-keys-install:
	@for target in $(SSH_KEY_TARGETS); do \
		ssh-copy-id -i $(SSH_KEY_ID) $${target}; \
	done
	