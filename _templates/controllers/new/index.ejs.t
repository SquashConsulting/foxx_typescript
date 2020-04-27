---
to: src/controllers/<%= collection %>.ts
---
<%
 const model = h.capitalize(collection);
-%>
import { db } from '@arangodb';

/* Collection Definitions */

const <%= model %>: ArangoDB.Collection = db._collection('<%= collection %>');

/* Exports */

export {
  list,
  find,
  create,
  edit,
  remove,
}

/* Module Functions */

function list(): ArangoDB.Document[] {
  const <%= collection %>: ArangoDB.Document[] = <%= model %>.all().toArray();

  return <%= collection %>;
}

function find(_key: string, res: Foxx.Response): ArangoDB.Document {
  const document: ArangoDB.Document = <%= model %>.document({ _key });

  if (!document) res.throw('not found');

  return document;
}

function create(body: object, res: Foxx.Response): ArangoDB.Document {
  try {
    const meta: ArangoDB.InsertResult = <%= model %>.save(body);
    const result: ArangoDB.Document = { ...meta, ...body };

    return result;
  } catch (error) {
    console.error(error);
    res.throw('unprocessable entity');
  }
}

function edit(
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

function remove(_key: string): void {
  <%= model %>.remove({ _key });
}
