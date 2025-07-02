default: apply-all

init-all:
	@make init-dev
	@make init-prod

init-dev:
	(cd env/dev/crm && terraform init)

init-prod:
	(cd env/prod/crm && terraform init)

apply-all:
	@make apply-dev
	@make apply-prod

apply-dev:
	(cd env/dev/crm && terraform apply -auto-approve)

apply-prod:
	(cd env/prod/crm && terraform apply -auto-approve)

destroy-all:
	@make destroy-dev
	@make destroy-prod

destroy-dev:
	(cd env/dev/crm && terraform destroy -auto-approve)

destroy-prod:
	(cd env/prod/crm && terraform destroy -auto-approve)
