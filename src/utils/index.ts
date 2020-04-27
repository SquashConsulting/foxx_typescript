/* Exports */

export { pipe, compose };

/* Module Functions */

function compose(...fns: Function[]): Function {
  return fns.reduceRight(
    (prevFn: Function, nextFn: Function): any => (...args: any[]): any =>
      nextFn(prevFn(...args)),
    (value: any): any => value,
  );
}

function pipe(fn: Function, ...fns: Function[]): any {
  return (...args: any[]) =>
    fns.reduce(
      (prevFn: Function, nextFn: Function): any => nextFn(prevFn),
      fn(...args),
    );
}
