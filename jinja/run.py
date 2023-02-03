#!/usr/bin/python
import jinja2, yaml

templateFilePath = jinja2.FileSystemLoader('./')
jinjaEnv = jinja2.Environment(loader=templateFilePath)
jTemplate = jinjaEnv.get_template("html-template.j2")

with open("input.yml") as config:
    config = yaml.load(config)
    output = jTemplate.render(config)
    print(output)
    outFileH = open('index.html', 'w')
    outFileH.write(output)
    outFileH.close()
