---
to: src/controllers/<%= collection %>.ts
---
<%
 const model = h.capitalize(collection);
-%>
import { db } from '@arangodb';

const <%= model %>: ArangoDB.Collection = db._collection('<%= collection %>');

export function list(): ArangoDB.Document[] {
  const <%= collection %>: ArangoDB.Document[] = <%= model %>.all().toArray();

  return <%= collection %>;
}

export function find(_key: string, res: Foxx.Response): ArangoDB.Document {
  const document: ArangoDB.Document = <%= model %>.document({ _key });

  if (!document) res.throw('not found');

  return document;
}

export function create(body: object, res: Foxx.Response): ArangoDB.Document {
  try {
    const meta: ArangoDB.InsertResult = <%= model %>.save(body);
    const result: ArangoDB.Document = { ...meta, ...body };

    return result;
  } catch (error) {
    console.error(error);
    res.throw('unprocessable entity');
  }
}

export function edit(
  _key: string,
  body: object,
  res: Foxx.Response,
): ArangoDB.Document {
  try {
    const meta: ArangoDB.UpdateResult = <%= model %>.update({ _key }, body);
    const result: ArangoDB.Document = { ...meta, ...body };

    return result;
  } catch (error) {
    console.error(error);
    res.throw('unprocessable entity');
  }
}

export function remove(_key: string): void {
  <%= model %>.remove({ _key });
}
