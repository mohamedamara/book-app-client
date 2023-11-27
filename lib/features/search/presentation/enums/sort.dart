enum Sort {
  bookTitleAZ((
    sortBy: 'title',
    sortOrder: 'ascending',
  )),
  bookTitleZA((
    sortBy: 'title',
    sortOrder: 'descending',
  )),
  publicationDateAsc((
    sortBy: 'publicationDate',
    sortOrder: 'ascending',
  )),
  publicationDateDesc((
    sortBy: 'publicationDate',
    sortOrder: 'descending',
  ));

  const Sort(this.value);
  final ({String sortBy, String sortOrder}) value;
}
