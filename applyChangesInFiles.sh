#!/bin/bash

echo "Patching files snyk/src/lib/types.ts and snyk/src/cli/commands/monitor/index.ts"
sed -i "s/MonitorOptions {/MonitorOptions {\n  'longFormProjectName'?: boolean;/" src/lib/types.ts
sed -i "s/apiTokenExists();/if(options.longFormProjectName \&\& \!options.allProjects) {\n      throw new Error(\'\`--longFormProjectName\` is only compatible with \`--all-projects\`\');\n  }\n  apiTokenExists();/" src/cli/commands/monitor/index.ts
sed -i "s/maybePrintDepGraph(options, projectDeps.depGraph);/if(options.longFormProjectName){\n              options[\"project-name\"] = projectDeps.depGraph.rootPkg.name + ':' +projectDeps.depGraph.rootPkg.version\n            }\n            maybePrintDepGraph(options, projectDeps.depGraph);/" src/cli/commands/monitor/index.ts
sed -i "s/maybePrintDepTree(options, projectDeps.depTree);/if(options.longFormProjectName){\n              options[\"project-name\"] = projectDeps.depTree.name + ':' +projectDeps.depTree.version\n            }\n            maybePrintDepTree(options, projectDeps.depTree);/"    src/cli/commands/monitor/index.ts