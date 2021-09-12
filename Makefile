generate:
	@ytt -f splits/crd.yml -f splits/rbac.yml -f splits/deployment.yml -f splits/webhooks.yml -f values.yml > /tmp/output.yml

deploy:
	@kapp deploy -c -a app1 -f /tmp/output.yml
