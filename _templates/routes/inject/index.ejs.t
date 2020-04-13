--
inject: true
to: src/routes/index.ts
after: rootRouter
skip_if: "rootRouter.use(<%= collection %>Router)"
--
<%
  const ns = namespace || '/'
-%>
rootRouter.use('<%= ns %>', <%= collection %>Router);
