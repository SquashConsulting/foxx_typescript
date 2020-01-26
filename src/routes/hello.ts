import joi from "joi";

export default function hello(router: Foxx.Router): Foxx.Router {
  router
    .get("/hello", (_req: Foxx.Request, res: Foxx.Response) => {
      const result: string = "Hello World!";

      res.send({ result });
    })
    .response(
      joi
        .object({
          result: joi.string().required()
        })
        .required(),
      "result"
    )
    .summary("Returns hello world")
    .description("Example route that sends hello world message");

  return router;
}
