class Data {
  // the questions that are added to firebase
  static List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the chemical symbol for gold?',
      'options': {
        'a': 'Au',
        'b': 'Ag',
        'c': 'Fe',
        'd': 'Cu',
      },
      'correctAnswer': 'a',
      'category': "science"
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'options': {
        'a': 'Earth',
        'b': 'Jupiter',
        'c': 'Mars',
        'd': 'Saturn',
      },
      'correctAnswer': 'b',
      'category': "science"
    },
    {
      'question':
          'What is the process by which plants make their own food using sunlight?',
      'options': {
        'a': 'Respiration',
        'b': 'Photosynthesis',
        'c': 'Fermentation',
        'd': 'Transpiration',
      },
      'correctAnswer': 'b',
      'category': "science"
    },
    {
      'question':
          'Which gas do plants primarily release during photosynthesis?',
      'options': {
        'a': 'Oxygen',
        'b': 'Carbon dioxide',
        'c': 'Nitrogen',
        'd': 'Hydrogen',
      },
      'correctAnswer': 'a',
      'category': "science"
    },
    {
      'question': 'What is the capital of France',
      'options': {
        'a': 'Rome',
        'b': 'Madrid',
        'c': 'Paris',
        'd': 'Berlin',
      },
      'correctAnswer': 'c',
      'category': "geography"
    },
    {
      'question': 'Which city serves as the capital of Russia?',
      'options': {
        'a': 'Moscow',
        'b': 'St. Petersburg',
        'c': 'Kiev',
        'd': 'Warsaw',
      },
      'correctAnswer': 'a',
      'category': "geography"
    },
    {
      'question': 'What is the capital of spain?',
      'options': {
        'a': 'Respiration',
        'b': 'Photosynthesis',
        'c': 'Fermentation',
        'd': 'Transpiration',
      },
      'correctAnswer': 'b',
      'category': "geography"
    },
    {
      'question': 'Which city is the capital of Germany?',
      'options': {
        'a': 'Vienna',
        'b': 'Amsterdam',
        'c': 'Berlin',
        'd': 'Brussels',
      },
      'correctAnswer': 'c',
      'category': "geography"
    },
    {
      'question': 'Who wrote the novel "Pride and Prejudice"?',
      'options': {
        'a': 'Emily Bronte',
        'b': 'Jane Austen',
        'c': 'Charlotte Bronte',
        'd': 'Virginia Woolf',
      },
      'correctAnswer': 'b',
      'category': "literature"
    },
    {
      'question':
          'What is the name of the ship in Herman Melville\'s novel "Moby-Dick"?',
      'options': {
        'a': 'Pequod',
        'b': 'Nautilus',
        'c': 'Titanic',
        'd': 'Endeavour',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question':
          'Which Shakespearean play features the characters Romeo and Juliet?',
      'options': {
        'a': 'Hamlet',
        'b': 'Othello',
        'c': 'Macbeth',
        'd': 'Romeo and Juliet',
      },
      'correctAnswer': 'd',
      'category': "literature"
    },
    {
      'question': '"1984" is a dystopian novel written by which author?',
      'options': {
        'a': 'George Orwell',
        'b': 'Aldous Huxley',
        'c': 'Ray Bradbury',
        'd': 'Margaret Atwood',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question':
          'The Great Wall of China was primarily built to defend against which group?',
      'options': {
        'a': 'Vikings',
        'b': 'Mongols',
        'c': 'Romans',
        'd': 'Egyptians',
      },
      'correctAnswer': 'b',
      'category': "history"
    },
    {
      'question': 'Who was the first President of the United States?',
      'options': {
        'a': 'Thomas Jefferson',
        'b': 'Benjamin Franklin',
        'c': 'George Washington',
        'd': 'John Adams',
      },
      'correctAnswer': 'c',
      'category': "history"
    },
    {
      'question':
          'The Renaissance is often associated with the revival of arts and learning in which historical period?',
      'options': {
        'a': 'Middle Ages',
        'b': 'Ancient Greece',
        'c': 'Industrial Revolution',
        'd': '14th-17th century',
      },
      'correctAnswer': 'd',
      'category': "history"
    },
    {
      'question':
          'The famous speech "I Have a Dream" was delivered by which civil rights leader?',
      'options': {
        'a': 'Malcolm X',
        'b': 'Nelson Mandela',
        'c': 'Martin Luther King Jr.',
        'd': 'Rosa Parks',
      },
      'correctAnswer': 'c',
      'category': "history"
    },
    {
      'question': 'Which gas is responsible for the Earth\'s ozone layer?',
      'options': {
        'a': 'Oxygen',
        'b': 'Methane',
        'c': 'Carbon dioxide',
        'd': 'Ozone',
      },
      'correctAnswer': 'a',
      'category': "science"
    },
    {
      'question': 'Who painted the Mona Lisa?',
      'options': {
        'a': 'Vincent van Gogh',
        'b': 'Pablo Picasso',
        'c': 'Leonardo da Vinci',
        'd': 'Michelangelo',
      },
      'correctAnswer': 'c',
      'category': "history"
    },
    {
      'question': 'Which natural disaster is measured using the Richter scale?',
      'options': {
        'a': 'Hurricane',
        'b': 'Earthquake',
        'c': 'Tornado',
        'd': 'Flood',
      },
      'correctAnswer': 'b',
      'category': "science"
    },
    {
      'question':
          'What year did the United States declare independence from Great Britain?',
      'options': {
        'a': '1776',
        'b': '1789',
        'c': '1812',
        'd': '1765',
      },
      'correctAnswer': 'a',
      'category': "history"
    },
    {
      'question': 'Who wrote the play "Romeo and Juliet"?',
      'options': {
        'a': 'William Shakespeare',
        'b': 'Mark Twain',
        'c': 'Charles Dickens',
        'd': 'Jane Austen',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question': 'Which planet is known as the "Red Planet"?',
      'options': {
        'a': 'Venus',
        'b': 'Mars',
        'c': 'Mercury',
        'd': 'Neptune',
      },
      'correctAnswer': 'b',
      'category': "science"
    },
    {
      'question': 'What is the largest mammal on Earth?',
      'options': {
        'a': 'Giraffe',
        'b': 'Elephant',
        'c': 'Blue Whale',
        'd': 'Hippopotamus',
      },
      'correctAnswer': 'c',
      'category': "science"
    },
    {
      'question': 'In which year did World War II end?',
      'options': {
        'a': '1945',
        'b': '1939',
        'c': '1918',
        'd': '1941',
      },
      'correctAnswer': 'a',
      'category': "history"
    },
    {
      'question': 'Which famous scientist developed the theory of relativity?',
      'options': {
        'a': 'Isaac Newton',
        'b': 'Albert Einstein',
        'c': 'Galileo Galilei',
        'd': 'Nikola Tesla',
      },
      'correctAnswer': 'b',
      'category': "science"
    },
    {
      'question': 'What is the capital city of Australia?',
      'options': {
        'a': 'Sydney',
        'b': 'Melbourne',
        'c': 'Canberra',
        'd': 'Brisbane',
      },
      'correctAnswer': 'c',
      'category': "geography"
    },
    {
      'question':
          'Which famous artist is known for painting the "Starry Night"?',
      'options': {
        'a': 'Leonardo da Vinci',
        'b': 'Pablo Picasso',
        'c': 'Vincent van Gogh',
        'd': 'Michelangelo',
      },
      'correctAnswer': 'c',
      'category': "art"
    },
    {
      'question': 'In what year did the Titanic sink on its maiden voyage?',
      'options': {
        'a': '1909',
        'b': '1912',
        'c': '1920',
        'd': '1917',
      },
      'correctAnswer': 'b',
      'category': "history"
    },
    {
      'question': 'Which gas makes up the majority of Earth\'s atmosphere?',
      'options': {
        'a': 'Oxygen',
        'b': 'Nitrogen',
        'c': 'Carbon dioxide',
        'd': 'Helium',
      },
      'correctAnswer': 'b',
      'category': "science"
    },
    {
      'question': 'Who wrote the novel "To Kill a Mockingbird"?',
      'options': {
        'a': 'J.K. Rowling',
        'b': 'Harper Lee',
        'c': 'George Orwell',
        'd': 'Mark Twain',
      },
      'correctAnswer': 'b',
      'category': "literature"
    },
    {
      'question': 'Who sculpted the statue of David?',
      'options': {
        'a': 'Leonardo da Vinci',
        'b': 'Pablo Picasso',
        'c': 'Vincent van Gogh',
        'd': 'Michelangelo',
      },
      'correctAnswer': 'd',
      'category': "art"
    },
    {
      'question':
          'Which artist is known for his series of paintings of water lilies?',
      'options': {
        'a': 'Claude Monet',
        'b': 'Salvador Dali',
        'c': 'Jackson Pollock',
        'd': 'Andy Warhol',
      },
      'correctAnswer': 'a',
      'category': "art"
    },
    {
      'question': 'The "Mona Lisa" is displayed in which famous museum?',
      'options': {
        'a': 'The Louvre',
        'b': 'The British Museum',
        'c': 'The Metropolitan Museum of Art',
        'd': 'The Museum of Modern Art',
      },
      'correctAnswer': 'a',
      'category': "art"
    },
    {
      'question':
          'Who is known for creating the iconic "Campbell\'s Soup Cans" artwork?',
      'options': {
        'a': 'Claude Monet',
        'b': 'Salvador Dali',
        'c': 'Jackson Pollock',
        'd': 'Andy Warhol',
      },
      'correctAnswer': 'd',
      'category': "art"
    },
    {
      'question':
          'Which famous artist is associated with the melting clocks in his artwork?',
      'options': {
        'a': 'Claude Monet',
        'b': 'Salvador Dali',
        'c': 'Jackson Pollock',
        'd': 'Andy Warhol',
      },
      'correctAnswer': 'b',
      'category': "art"
    },
    {
      'question': 'Who is known for painting "The Persistence of Memory"?',
      'options': {
        'a': 'Claude Monet',
        'b': 'Salvador Dali',
        'c': 'Jackson Pollock',
        'd': 'Andy Warhol',
      },
      'correctAnswer': 'b',
      'category': "art"
    },
    {
      'question':
          'Which art movement is characterized by its use of bold colors and geometric shapes?',
      'options': {
        'a': 'Cubism',
        'b': 'Pop Art',
        'c': 'Abstract Expressionism',
        'd': 'Surrealism',
      },
      'correctAnswer': 'b',
      'category': "art"
    },
    {
      'question': 'What is the unit of measurement for electric current?',
      'options': {
        'a': 'Watt',
        'b': 'Volt',
        'c': 'Ampere',
        'd': 'Ohm',
      },
      'correctAnswer': 'c',
      'category': "science"
    },
    {
      'question': 'Which element is a noble gas?',
      'options': {
        'a': 'Helium',
        'b': 'Oxygen',
        'c': 'Carbon',
        'd': 'Hydrogen',
      },
      'correctAnswer': 'a',
      'category': "science"
    },
    {
      'question': 'What type of radiation is used in X-rays?',
      'options': {
        'a': 'Alpha radiation',
        'b': 'Beta radiation',
        'c': 'Gamma radiation',
        'd': 'Delta radiation',
      },
      'correctAnswer': 'c',
      'category': "science"
    },
    {
      'question':
          'Which planet is known as the "Morning Star" or "Evening Star"?',
      'options': {
        'a': 'Venus',
        'b': 'Mars',
        'c': 'Mercury',
        'd': 'Jupiter',
      },
      'correctAnswer': 'a',
      'category': "science"
    },
    {
      'question': 'What is the process by which plants release water vapor?',
      'options': {
        'a': 'Transpiration',
        'b': 'Evaporation',
        'c': 'Condensation',
        'd': 'Precipitation',
      },
      'correctAnswer': 'a',
      'category': "science"
    },
    {
      'question': 'Which type of rock is formed from cooled magma or lava?',
      'options': {
        'a': 'Sedimentary rock',
        'b': 'Igneous rock',
        'c': 'Metamorphic rock',
        'd': 'Extraterrestrial rock',
      },
      'correctAnswer': 'b',
      'category': "science"
    },
    {
      'question':
          'What is the process by which water changes from a liquid to a gas?',
      'options': {
        'a': 'Freezing',
        'b': 'Melting',
        'c': 'Boiling',
        'd': 'Condensation',
      },
      'correctAnswer': 'c',
      'category': "science"
    },
    {
      'question': 'What is the main component of Earth\'s atmosphere?',
      'options': {
        'a': 'Oxygen',
        'b': 'Carbon dioxide',
        'c': 'Nitrogen',
        'd': 'Argon',
      },
      'correctAnswer': 'c',
      'category': "science"
    },
    {
      'question':
          'Which process involves the conversion of glucose into energy in cells?',
      'options': {
        'a': 'Photosynthesis',
        'b': 'Digestion',
        'c': 'Respiration',
        'd': 'Fermentation',
      },
      'correctAnswer': 'c',
      'category': "science"
    },
    {
      'question': 'What is the largest organ in the human body?',
      'options': {
        'a': 'Brain',
        'b': 'Liver',
        'c': 'Heart',
        'd': 'Skin',
      },
      'correctAnswer': 'd',
      'category': "science"
    },
    {
      'question':
          'Which ancient civilization is known for building the pyramids?',
      'options': {
        'a': 'Greek',
        'b': 'Roman',
        'c': 'Inca',
        'd': 'Egyptian',
      },
      'correctAnswer': 'd',
      'category': "history"
    },
    {
      'question':
          'Who was the leader of the Soviet Union during the Cuban Missile Crisis?',
      'options': {
        'a': 'Joseph Stalin',
        'b': 'Mikhail Gorbachev',
        'c': 'Vladimir Putin',
        'd': 'Nikita Khrushchev',
      },
      'correctAnswer': 'd',
      'category': "history"
    },
    {
      'question':
          'Which civilization was known for its city of Troy and the Trojan War?',
      'options': {
        'a': 'Roman',
        'b': 'Greek',
        'c': 'Persian',
        'd': 'Egyptian',
      },
      'correctAnswer': 'b',
      'category': "history"
    },
    {
      'question':
          'Who was the first female Prime Minister of the United Kingdom?',
      'options': {
        'a': 'Margaret Thatcher',
        'b': 'Angela Merkel',
        'c': 'Theresa May',
        'd': 'Jacinda Ardern',
      },
      'correctAnswer': 'a',
      'category': "history"
    },
    {
      'question':
          'Which famous speech marked the beginning of the French Revolution?',
      'options': {
        'a': 'Declaration of Independence',
        'b': 'Gettysburg Address',
        'c': 'Reign of Terror Speech',
        'd': 'Tennis Court Oath',
      },
      'correctAnswer': 'd',
      'category': "history"
    },
    {
      'question':
          'In which year did the Berlin Wall fall, leading to the reunification of Germany?',
      'options': {
        'a': '1989',
        'b': '1991',
        'c': '1995',
        'd': '1987',
      },
      'correctAnswer': 'a',
      'category': "history"
    },
    {
      'question': 'Who was the first President of the United States?',
      'options': {
        'a': 'Thomas Jefferson',
        'b': 'Benjamin Franklin',
        'c': 'George Washington',
        'd': 'John Adams',
      },
      'correctAnswer': 'c',
      'category': "history"
    },
    {
      'question':
          'Which famous explorer is credited with discovering the sea route to India?',
      'options': {
        'a': 'Christopher Columbus',
        'b': 'Ferdinand Magellan',
        'c': 'Vasco da Gama',
        'd': 'Marco Polo',
      },
      'correctAnswer': 'c',
      'category': "history"
    },
    {
      'question':
          'The Silk Road was a network of trade routes that connected which two regions?',
      'options': {
        'a': 'Africa and Europe',
        'b': 'North America and South America',
        'c': 'Asia and Europe',
        'd': 'Australia and Asia',
      },
      'correctAnswer': 'c',
      'category': "history"
    },
    {
      'question':
          'What historical event is often referred to as the "Shot Heard \'Round the World"?',
      'options': {
        'a': 'American Revolution',
        'b': 'French Revolution',
        'c': 'Russian Revolution',
        'd': 'Industrial Revolution',
      },
      'correctAnswer': 'a',
      'category': "history"
    },{
      'question': 'Who wrote the epic poem "The Iliad"?',
      'options': {
        'a': 'Homer',
        'b': 'Virgil',
        'c': 'Ovid',
        'd': 'Aristotle',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question': 'In George Orwell\'s novel "Animal Farm," which animals represent the ruling class?',
      'options': {
        'a': 'Horses',
        'b': 'Pigs',
        'c': 'Dogs',
        'd': 'Cows',
      },
      'correctAnswer': 'b',
      'category': "literature"
    },
    {
      'question': 'Which Shakespearean play features the character Hamlet?',
      'options': {
        'a': 'Macbeth',
        'b': 'Othello',
        'c': 'Romeo and Juliet',
        'd': 'Hamlet',
      },
      'correctAnswer': 'd',
      'category': "literature"
    },
    {
      'question': 'Who wrote the novel "Jane Eyre"?',
      'options': {
        'a': 'Emily Bronte',
        'b': 'Charlotte Bronte',
        'c': 'Anne Bronte',
        'd': 'Jane Austen',
      },
      'correctAnswer': 'b',
      'category': "literature"
    },
    {
      'question': 'Which novel begins with the famous line, "Call me Ishmael"?',
      'options': {
        'a': 'Moby-Dick',
        'b': 'The Great Gatsby',
        'c': 'Pride and Prejudice',
        'd': '1984',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question': 'In J.K. Rowling\'s "Harry Potter" series, what is the name of the three-headed dog guarding the trapdoor?',
      'options': {
        'a': 'Fluffy',
        'b': 'Fang',
        'c': 'Hedwig',
        'd': 'Crookshanks',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question': 'Which character is known for his adventures in Wonderland?',
      'options': {
        'a': 'Sherlock Holmes',
        'b': 'Huckleberry Finn',
        'c': 'Alice',
        'd': 'Peter Pan',
      },
      'correctAnswer': 'c',
      'category': "literature"
    },
    {
      'question': 'What is the title of the dystopian novel written by Aldous Huxley?',
      'options': {
        'a': 'Brave New World',
        'b': 'Fahrenheit 451',
        'c': '1984',
        'd': 'The Handmaid\'s Tale',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question': 'Who wrote the play "The Crucible," which is based on the Salem witch trials?',
      'options': {
        'a': 'Arthur Miller',
        'b': 'William Shakespeare',
        'c': 'Tennessee Williams',
        'd': 'George Bernard Shaw',
      },
      'correctAnswer': 'a',
      'category': "literature"
    },
    {
      'question': 'Which novel tells the story of a young girl named Scout Finch?',
      'options': {
        'a': 'To Kill a Mockingbird',
        'b': 'The Catcher in the Rye',
        'c': 'Lord of the Flies',
        'd': 'The Grapes of Wrath',
      },
      'correctAnswer': 'a',
      'category': "literature"
    }

  ];
}
