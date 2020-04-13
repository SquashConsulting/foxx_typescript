---
inject: true
to: src/routes/index.ts
after: "const rootRouter"
---
rootRouter.use('<%= namespace %>', <%= collection %>Router);