def ensure_inject_routes_to_ingress(r, matchExp):
    if r["apiVersion"] == "traefik.containo.us/v1alpha1" and r["kind"] == "IngressRoute" and r["metadata"]["name"] == "echo-server-insecure":
      routes = r["spec"]["routes"]
      for route in routes:
        if route["match"] == matchExp:
          return
      nextRoute = {
        "match": matchExp,
        "kind": "Rule",
        "services": [{
          "name": "echo-server",
          "port": 80
        }]
      }
      routes.append(nextRoute)
routeExp = ctx.resource_list["functionConfig"]["params"]["routeExp"]
for resource in ctx.resource_list["items"]:
    ensure_inject_routes_to_ingress(resource, routeExp)