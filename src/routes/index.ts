import createRouter from "@arangodb/foxx/router";

import hello from "./hello";

const router: Foxx.Router = createRouter();

hello(router);

export default router;
