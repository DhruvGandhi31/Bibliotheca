import '../utils/book.dart';

List<Book> books = [
  Book(
    bookId: '1',
    title: 'Wings Of Fire',
    author: 'A P J Abdul Kalam',
    publishedDate: '1999',
    image:
        'https://m.media-amazon.com/images/I/91jib9oFZDL._AC_UF350,350_QL50_.jpg',
    description:
        '"Wings of Fire" is an autobiography written by former President of India, Dr. A.P.J. Abdul Kalam, describing his life journey from a small town to becoming a renowned scientist and eventually the President of India, with insights on his contributions to the Indian space and missile programs.',
    price: '500',
    availability: true,
  ),
  Book(
    bookId: '2',
    title: 'Playing It My Way',
    author: 'Sachin Tendulkar',
    publishedDate: '2014',
    image: 'https://m.media-amazon.com/images/I/41PrmmLat4L.jpg',
    description:
        'Playing it My Way is an autobiography of Indian cricket legend Sachin Tendulkar, detailing his personal and professional life, including his early childhood, cricket career, and his experiences and insights on the game of cricket.',
    price: '600',
    availability: false,
  ),
  Book(
    bookId: '3',
    title: 'My Experiments With Truth',
    author: 'M. K. Gandhi',
    publishedDate: '1927',
    image: 'https://m.media-amazon.com/images/I/81zcPB7uMNL.jpg',
    description:
        'My Experiment with Truth is an autobiography of Mahatma Gandhi, chronicling his life from childhood to his journey towards becoming a political and spiritual leader in India, with a focus on his personal philosophy of non-violence and his role in India\'s struggle for independence.',
    price: '350',
    availability: true,
  ),
  Book(
    bookId: '4',
    title: 'Long Walk To Freedom',
    author: 'Nelson Mandela',
    publishedDate: '1994',
    image: 'https://m.media-amazon.com/images/I/8191IDl+IQL.jpg',
    description:
        'Long Walk to Freedom is an autobiography of South African anti-apartheid revolutionary and politician, Nelson Mandela, detailing his early life, education, his fight against racial oppression, his 27 years of imprisonment, and his eventual release and rise to the presidency, providing insights into the history of South Africa and the struggles of its people.',
    price: '450',
    availability: true,
  ),
  Book(
    bookId: '5',
    title: 'I Am Malala',
    author: 'Malala Yousafzai',
    publishedDate: '2013',
    image: 'https://m.media-amazon.com/images/I/91jj+OWbC1L.jpg',
    description:
        'I am Malala is an autobiography of Malala Yousafzai, a Pakistani activist for female education and the youngest Nobel Prize laureate, describing her early life in Pakistan, her fight for education rights, the assassination attempt on her life by the Taliban, and her continued advocacy for education and women\'s rights.',
    price: '300',
    availability: false,
  ),
  Book(
    bookId: '6',
    title: 'Harry Potter And The Prisoner Of Azkaban',
    author: 'J K Rowling',
    publishedDate: '1999',
    image: 'https://m.media-amazon.com/images/I/81f7bXC-tTL.jpg',
    description:
        'Harry Potter and the Prisoner of Azkaban is the third book in the Harry Potter series written by J.K. Rowling, following the adventures of young wizard Harry Potter and his friends Ron Weasley and Hermione Granger, as they try to save Sirius Black from the infamous wizard prison, Azkaban. In this book, Harry learns about his family\'s past and faces new challenges, including a mysterious black dog, time travel, and the truth about his parents\' deaths. With its intricate plot and engaging characters, this book is a beloved favorite of fans of all ages.',
    price: '499',
    availability: true,
  ),
  Book(
    bookId: '7',
    title: 'Rich Dad Poor Dad',
    author: 'Robert T Kiyosaki',
    publishedDate: '1997',
    image: 'assets/images/image_7.png',
    description:
        ' "Rich Dad Poor Dad" is a personal finance book written by Robert Kiyosaki, based on his experiences growing up with two different fathers, one rich and one poor, highlighting the differences in their financial mindset and providing insights on how to achieve financial success through investing, entrepreneurship, and financial education.',
    price: '340',
    availability: true,
  ),
  Book(
    bookId: '22',
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    publishedDate: '1988',
    image:
        'https://m.media-amazon.com/images/I/51FXs5gTmdL._SX427_BO1,204,203,200_.jpg',
    description:
        'The Alchemist is a novel by Brazilian author Paulo Coelho, following the journey of a young shepherd named Santiago as he sets out to fulfill his dreams and discover his purpose in life. Along the way, he meets a series of characters who help guide him on his journey, leading him to the realization that the universe conspires to help those who follow their hearts.',
    price: '399',
    availability: true,
  ),
  Book(
    bookId: '8',
    title: 'Hamlet Prince Of Denmark',
    author: 'William Shakespeare',
    publishedDate: '1600',
    image:
        'https://kbimages1-a.akamaihd.net/e919fc20-6c6b-4971-91ee-109e2624d76e/1200/1200/False/hamlet-prince-of-denmark-22.jpg',
    description:
        'Hamlet, Prince of Denmark is a tragedy written by William Shakespeare, telling the story of Prince Hamlet\'s quest for revenge against his uncle, Claudius, who has murdered Hamlet\'s father, the king, and seized the throne. The play explores themes of revenge, madness, mortality, and the complexities of the human condition.',
    price: '299',
    availability: false,
  ),
  Book(
    bookId: '9',
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    publishedDate: '1960',
    image: 'https://m.media-amazon.com/images/I/81gepf1eMqL.jpg',
    description:
        ' "To Kill a Mockingbird" is a novel by Harper Lee, set in the 1930s in a fictional town in Alabama. The story is told through the eyes of Scout Finch, a young girl, and explores themes of racial injustice, loss of innocence, and the importance of compassion and empathy.',
    price: '550',
    availability: true,
  ),
  Book(
    bookId: '10',
    title: 'Pride and Prejudice',
    author: 'Jane Austen',
    publishedDate: '1813',
    image:
        'https://kbimages1-a.akamaihd.net/afcd8653-3b27-4423-bee9-570fb1441aed/353/569/90/False/pride-and-prejudice-71.jpg',
    description:
        ' "Pride and Prejudice" is a novel by Jane Austen, set in rural England in the late 18th century. The story follows the Bennet family, particularly the second eldest daughter, Elizabeth, as she navigates the societal norms of the time and falls in love with the wealthy and proud Mr. Darcy.',
    price: '450',
    availability: true,
  ),
  Book(
    bookId: '11',
    title: '1984',
    author: 'George Orwell',
    publishedDate: '1949',
    image: 'https://m.media-amazon.com/images/I/514CVwOrybL.jpg',
    description:
        ' "1984" is a dystopian novel by George Orwell, set in a future totalitarian society where individualism and independent thought are banned. The story follows the life of Winston Smith, a member of the ruling Party who begins to rebel against the oppressive regime and question the nature of reality itself.',
    price: '650',
    availability: true,
  ),
  Book(
    bookId: '12',
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    publishedDate: '1925',
    image: 'https://m.media-amazon.com/images/I/71FTb9X6wsL.jpg',
    description:
        ' "The Great Gatsby" is a novel by F. Scott Fitzgerald, set in the roaring twenties in New York City. The story follows the wealthy and enigmatic Jay Gatsby as he tries to win back his lost love, the beautiful Daisy Buchanan, and ultimately faces tragic consequences.',
    price: '500',
    availability: true,
  ),
  Book(
    bookId: '13',
    title: 'The Catcher in the Rye',
    author: 'J.D. Salinger',
    publishedDate: '1951',
    image: 'https://m.media-amazon.com/images/I/61fgOuZfBGL.jpg',
    description:
        ' "The Catcher in the Rye" is a novel by J.D. Salinger, set in the 1950s in New York City. The story is told from the perspective of Holden Caulfield, a teenage boy who has been expelled from his prep school and is struggling with the transition to adulthood.',
    price: '550',
    availability: true,
  ),
  Book(
    bookId: '14',
    title: 'The Catcher in the Rye',
    author: 'J.D. Salinger',
    publishedDate: '1951',
    image: 'https://m.media-amazon.com/images/I/61fgOuZfBGL.jpg',
    description:
        ' "The Catcher in the Rye" is a novel by J.D. Salinger, narrated by a teenage boy named Holden Caulfield who is undergoing psychiatric treatment after being expelled from his prep school. The book deals with themes of innocence, adolescence, alienation, and identity.',
    price: '350',
    availability: true,
  ),
  Book(
    bookId: '15',
    title: 'The Lord of the Rings',
    author: 'J.R.R. Tolkien',
    publishedDate: '1954',
    image: 'https://m.media-amazon.com/images/I/81zqkBcTTCL.jpg',
    description:
        ' "The Lord of the Rings" is a high fantasy novel by J.R.R. Tolkien, set in the fictional world of Middle-earth. The book follows hobbit Frodo Baggins as he embarks on a quest to destroy the One Ring and defeat the evil Sauron. The book explores themes of power, corruption, friendship, and sacrifice.',
    price: '550',
    availability: true,
  ),
  Book(
    bookId: '16',
    title: 'Harry Potter and the Philosopher\'s Stone',
    author: 'J.K. Rowling',
    publishedDate: '1997',
    image: 'https://m.media-amazon.com/images/I/91AbRwk2S0L.jpg',
    description:
        'Harry Potter and the Philosopher\'s Stone is the first novel in the Harry Potter series written by J.K. Rowling. The story follows young wizard Harry Potter as he discovers his true identity, attends Hogwarts School of Witchcraft and Wizardry, and battles the evil Lord Voldemort.',
    price: '600',
    availability: true,
  ),
  Book(
    bookId: '17',
    title: 'Harry Potter and the Chamber of Secrets',
    author: 'J.K. Rowling',
    publishedDate: '1998',
    image: 'https://m.media-amazon.com/images/I/81S0LnPGGUL.jpg',
    description:
        'Harry Potter and the Chamber of Secrets is the second novel in the Harry Potter series written by J.K. Rowling. The story follows young wizard Harry Potter as he investigates a mysterious series of attacks at Hogwarts School of Witchcraft and Wizardry, and uncovers the truth about a hidden chamber and the monster within it.',
    price: '700',
    availability: true,
  ),
  Book(
    bookId: '18',
    title: 'Harry Potter and the Goblet of Fire',
    author: 'J.K. Rowling',
    publishedDate: '2000',
    image: 'https://m.media-amazon.com/images/I/810jKiNChxL.jpg',
    description:
        'Harry Potter and the Goblet of Fire is the fourth novel in the Harry Potter series written by J.K. Rowling. The story follows young wizard Harry Potter as he competes in the dangerous Triwizard Tournament, uncovers a conspiracy within the wizarding world, and faces his darkest challenge yet.',
    price: '800',
    availability: true,
  ),
  Book(
    bookId: '19',
    title: 'Harry Potter and the Order of Phoenix',
    author: 'J.K. Rowling',
    publishedDate: '2003',
    image:
        'https://upload.wikimedia.org/wikipedia/en/7/70/Harry_Potter_and_the_Order_of_the_Phoenix.jpg',
    description:
        'Harry Potter and the Order of Phoenix is the fifth novel in the Harry Potter series written by J.K. Rowling. The story follows young wizard Harry Potter as he forms a secret organization to fight against the evil Lord Voldemort and his followers, while also dealing with the challenges of adolescence and the interference of the Ministry of Magic.',
    price: '900',
    availability: true,
  ),
  Book(
    bookId: '20',
    title: 'Harry Potter and the Half-Blood Prince',
    author: 'J.K. Rowling',
    publishedDate: '2005',
    image: 'https://m.media-amazon.com/images/I/A1clNOpnpNL.jpg',
    description:
        'Harry Potter and the Half-Blood Prince is the sixth novel in the Harry Potter series written by J.K. Rowling. The story follows young wizard Harry Potter as he learns more about the past of Lord Voldemort, works with Professor Dumbledore to prepare for their final confrontation, and deals with the complicated feelings of love and friendship.',
    price: '1000',
    availability: true,
  ),
  Book(
    bookId: '21',
    title: 'Harry Potter and the Deathly Hallows',
    author: 'J.K. Rowling',
    publishedDate: '2007',
    image:
        'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/91wVjqUvhFL.jpg',
    description:
        'The seventh and final book in the Harry Potter series, following the adventures of Harry, Ron, and Hermione as they search for and destroy the remaining Horcruxes, objects containing pieces of Voldemort\'s soul. The book culminates in the final battle between Harry and Voldemort, with the fate of the wizarding world hanging in the balance.',
    price: '599',
    availability: true,
  ),
];
