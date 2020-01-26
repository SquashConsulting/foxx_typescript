# Foxx TypeScript Service Template

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

## License

Copyright (c) 2020 Squash Consulting. All rights reserved.
