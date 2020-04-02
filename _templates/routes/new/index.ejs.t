---
to: src/routes/<%= name %>.ts
unless_exists: true
---
<%
  const { response } = JSON.parse(config)
-%>
import joi from "joi";

export default function <%= name %>(router: Foxx.Router): Foxx.Router {
  router
    .get("/hello", (_req: Foxx.Request, res: Foxx.Response) => {
      const result: string = "Hello World!";

      res.send({ result });
    })
    .response(
      joi
        .object({
          result: <%= response.result %>
        })
        .required(),
      "result"
    )
    .summary("Returns hello world")
    .description("Example route that sends hello world message");

  return router;
}
