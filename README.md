# Foxx TypeScript Service Template

#### Update: The next version of the template is being developed on the [next](https://github.com/SquashConsulting/foxx_typescript/tree/next) branch. It will support `npm`, as we decided to drop support for `yarn 2.0`, because of some unexpected behaivours. This template will be part of the [kaliningrad](https://github.com/squashconsulting/kaliningrad) project. Backwards compatability will be maintained, however, the usage of the template is encoureged through the kaliningrad's generator. Please note, you will still be able to use this as a standalone template. 
 
### Install packages

```sh
yarn install
```

#### Note: this projcet uses yarn version >= 2.0, and follows the `Zero Install` ideology. Follow [this link](https://yarnpkg.com/features/zero-installs) for more information.


### Install/Upgrade Foxx Service

In order to use the typescript service in ArangoDB, you need to run `yarn build` and then do `foxx {install,upgrade} <mount> --server <server_name> --database <db_name>`

## Editor configuration

`yarn@berry` which is used in this project does not use `node_modules`. Because of this, some editors won't recognize imported modules. Run this command to resolve the issue in VSCode.

```sh
yarn config:editor
```

In VSCode you also need to explicitly specify the version of TypeScript to use.

1. Press `{CTRL,CMD}+SHIFT+P` in a TypeScript file

1. Choose "Select TypeScript Version"

1. Pick "Use Workspace Version"

More info [here](https://next.yarnpkg.com/advanced/editor-sdks)
