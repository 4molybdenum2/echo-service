def ensure_inject_network_parameters(r, inputRoutes, inputHosts, appName):

    hostExp = ""
    for host in inputHosts:
        hostExp = hostExp + "Host(`{}`) || ".format(host)
    
    if hostExp.endswith(" || "):
      hostExp = hostExp[:-len(" || ")]

    if r["apiVersion"] == "traefik.containo.us/v1alpha1" and r["kind"] == "IngressRoute" and r["metadata"]["name"] == appName:
        routes = r["spec"]["routes"]
        for inputRoute in inputRoutes:
            matchExp = hostExp + " && " + inputRoute["match"]

            for route in routes:
              if matchExp == route["match"]:
                return
            nextRoute = inputRoute
            nextRoute["match"] = matchExp
            routes.append(nextRoute)
        
        tls = r["spec"]["tls"]
        tls["secretName"] = appName + "-cert"

  inputParams = ctx.resource_list["functionConfig"]["params"]
  inputRoutes = inputParams["routes"]
  inputHosts = inputParams["hosts"]
  appName = inputParams["app"]
  
  for resource in ctx.resource_list["items"]:
    ensure_inject_network_parameters(resource, inputRoutes, inputHosts, appName)
