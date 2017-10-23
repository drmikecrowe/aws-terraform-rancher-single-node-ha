<!DOCTYPE html>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="Author" content="Made by 'tree'">
 <meta name="GENERATOR" content="$Version: $ tree v1.7.0 (c) 1996 - 2014 by Steve Baker, Thomas Moore, Francesc Rocher, Florian Sesser, Kyosuke Tokoro $">
 <title>Directory Tree</title>
 <style type="text/css">
  <!-- 
  BODY { font-family : ariel, monospace, sans-serif; }
  P { font-weight: normal; font-family : ariel, monospace, sans-serif; color: black; background-color: transparent;}
  B { font-weight: normal; color: black; background-color: transparent;}
  A:visited { font-weight : normal; text-decoration : none; background-color : transparent; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:link    { font-weight : normal; text-decoration : none; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:hover   { color : #000000; font-weight : normal; text-decoration : underline; background-color : yellow; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  A:active  { color : #000000; font-weight: normal; background-color : transparent; margin : 0px 0px 0px 0px; padding : 0px 0px 0px 0px; display: inline; }
  .VERSION { font-size: small; font-family : arial, sans-serif; }
  .NORM  { color: black;  background-color: transparent;}
  .FIFO  { color: purple; background-color: transparent;}
  .CHAR  { color: yellow; background-color: transparent;}
  .DIR   { color: blue;   background-color: transparent;}
  .BLOCK { color: yellow; background-color: transparent;}
  .LINK  { color: aqua;   background-color: transparent;}
  .SOCK  { color: fuchsia;background-color: transparent;}
  .EXEC  { color: green;  background-color: transparent;}
  -->
 </style>
</head>
<body>
	<h1>Directory Tree</h1><p>
	<a class="NORM" href="#">#</a><br>
	├── <a class="DIR" href="#/production/">production</a><br>
	│   ├── <a class="DIR" href="#/production/rancher_hosts/">rancher_hosts</a><br>
	│   │   ├── <a class="NORM" href="#/production/rancher_hosts/common-variables.tf">common-variables.tf</a><br>
	│   │   ├── <a class="DIR" href="#/production/rancher_hosts/files/">files</a><br>
	│   │   ├── <a class="EXEC" href="#/production/rancher_hosts/init.sh">init.sh</a><br>
	│   │   ├── <a class="EXEC" href="#/production/rancher_hosts/main.tf">main.tf</a><br>
	│   │   ├── <a class="NORM" href="#/production/rancher_hosts/Makefile">Makefile</a><br>
	│   │   ├── <a class="DIR" href="#/production/rancher_hosts/modules/">modules</a><br>
	│   │   ├── <a class="EXEC" href="#/production/rancher_hosts/outputs.tf">outputs.tf</a><br>
	│   │   ├── <a class="EXEC" href="#/production/rancher_hosts/provider.tf">provider.tf</a><br>
	│   │   ├── <a class="EXEC" href="#/production/rancher_hosts/README.md">README.md</a><br>
	│   │   └── <a class="NORM" href="#/production/rancher_hosts/variables.tf">variables.tf</a><br>
	│   └── <a class="DIR" href="#/production/rancher_server/">rancher_server</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/alb.tf">alb.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="NORM" href="#/production/rancher_server/common-variables.tf">common-variables.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/dns.tf">dns.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="DIR" href="#/production/rancher_server/files/">files</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/init.sh">init.sh</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/main.tf">main.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="NORM" href="#/production/rancher_server/Makefile">Makefile</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="DIR" href="#/production/rancher_server/modules/">modules</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/outputs.tf">outputs.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/provider.tf">provider.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/rds.tf">rds.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/README.md">README.md</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/server.tf">server.tf</a><br>
	│   &nbsp;&nbsp;&nbsp; ├── <a class="EXEC" href="#/production/rancher_server/set_access_control.sh">set_access_control.sh</a><br>
	│   &nbsp;&nbsp;&nbsp; └── <a class="NORM" href="#/production/rancher_server/variables.tf">variables.tf</a><br>
	└── <a class="DIR" href="#/staging/">staging</a><br>
	&nbsp;&nbsp;&nbsp; ├── <a class="DIR" href="#/staging/rancher_hosts/">rancher_hosts</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="NORM" href="#/staging/rancher_hosts/common-variables.tf">common-variables.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="DIR" href="#/staging/rancher_hosts/files/">files</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_hosts/init.sh">init.sh</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_hosts/main.tf">main.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="NORM" href="#/staging/rancher_hosts/Makefile">Makefile</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="DIR" href="#/staging/rancher_hosts/modules/">modules</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_hosts/outputs.tf">outputs.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_hosts/provider.tf">provider.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_hosts/README.md">README.md</a><br>
	&nbsp;&nbsp;&nbsp; │   └── <a class="NORM" href="#/staging/rancher_hosts/variables.tf">variables.tf</a><br>
	&nbsp;&nbsp;&nbsp; ├── <a class="DIR" href="#/staging/rancher_server/">rancher_server</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/alb.tf">alb.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="NORM" href="#/staging/rancher_server/common-variables.tf">common-variables.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/dns.tf">dns.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="DIR" href="#/staging/rancher_server/files/">files</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/init.sh">init.sh</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/main.tf">main.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="NORM" href="#/staging/rancher_server/Makefile">Makefile</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="DIR" href="#/staging/rancher_server/modules/">modules</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/outputs.tf">outputs.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/provider.tf">provider.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/rds.tf">rds.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/README.md">README.md</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/server.tf">server.tf</a><br>
	&nbsp;&nbsp;&nbsp; │   ├── <a class="EXEC" href="#/staging/rancher_server/set_access_control.sh">set_access_control.sh</a><br>
	&nbsp;&nbsp;&nbsp; │   └── <a class="NORM" href="#/staging/rancher_server/variables.tf">variables.tf</a><br>
	&nbsp;&nbsp;&nbsp; └── <a class="NORM" href="#/staging/staging.tfvars">staging.tfvars</a><br>
	<br><br>
	</p>
	<p>

14 directories, 43 files
	<br><br>
	</p>
	<hr>
	<p class="VERSION">
		 tree v1.7.0 © 1996 - 2014 by Steve Baker and Thomas Moore <br>
		 HTML output hacked and copyleft © 1998 by Francesc Rocher <br>
		 JSON output hacked and copyleft © 2014 by Florian Sesser <br>
		 Charsets / OS/2 support © 2001 by Kyosuke Tokoro
	</p>
</body>
</html>
