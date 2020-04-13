---
to: src/scripts/setup.ts
---
<%
  const cols = collections.split(',');
  const edgCols = edges.split(',');
-%>
import { db } from '@arangodb';

const collections: string[] = [
<% cols.forEach(collection => { -%>
  '<%= collection %>',
<% }) -%>
];

const edges: string[] = [
<% edgCols.forEach(edge => { -%>
  '<%= edge %>',
<% }) -%>
];

// Initiate Document Collections
collections.forEach((collection: string): void => {
  if (!db._collection(collection)) {
    db._createDocumentCollection(collection);
  } else {
    console.debug(`
      Collection [${collection}] already exists. Leaving it untouched.
    `);
  }
});

// Initiate Edge Collections
edges.forEach((edge: string): void => {
  if (!db._collection(edge)) {
    db._createEdgeCollection(edge);
  } else {
    console.debug(`
      Edge collection [${edge}] already exists. Leaving it untouched.
    `);
  }
});

// Ensure Indexes On Edges
edges.forEach((edge: string): void => {
  const EdgeCollection: ArangoDB.Collection = db._collection(edge);

  EdgeCollection.ensureIndex({
    type: 'hash',
    unique: true,
    fields: ['_from', '_to'],
  });
})