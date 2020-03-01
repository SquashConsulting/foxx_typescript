export const compose = (...fns: Function[]): Function =>
  fns.reduceRight(
    (prevFn: Function, nextFn: Function): any => (...args: any[]): any =>
      nextFn(prevFn(...args)),
    (value: any): any => value,
  );

export const pipe = (fn: Function, ...fns: Function[]): any => (
  ...args: any[]
) =>
  fns.reduce(
    (prevFn: Function, nextFn: Function): any => nextFn(prevFn),
    fn(...args),
  );
