import 'package:gutenburg/utils/assets_loader.dart';

import '../controllers/book_controller.dart';

const String adventure = 'ADVENTURE';
const String drama = 'DRAMA';
const String fiction = 'FICTION';
const String history = 'HISTORY';
const String humour = 'HUMOUR';
const String philosophy = 'PHILOSOPHY';
const String politics = 'POLITICS';

const String projectTitle = 'Gutenberg Project';
const String intro =
    'A social cataloging website that allows you to freely search its database of books, annotations, and reviews.';

List<Map<String, dynamic>> genreList = [
  {'genre': adventure, 'icon': AssetsLoader.adventure},
  {'genre': drama, 'icon': AssetsLoader.drama},
  {'genre': fiction, 'icon': AssetsLoader.fiction},
  {'genre': history, 'icon': AssetsLoader.history},
  {'genre': humour, 'icon': AssetsLoader.humour},
  {'genre': philosophy, 'icon': AssetsLoader.philosophy},
  {'genre': politics, 'icon': AssetsLoader.politics},
];

BooksController booksController = BooksController.instance;
