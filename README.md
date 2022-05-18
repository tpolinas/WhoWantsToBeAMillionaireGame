# Who Wants To Be A Millionaire Game 

### Description 

    🤑 This is "Who wants to be a millionaire?" game. 💰
    👉 The first screen contains a label with the name of a game and two buttons - 'Play' & 'Records'.
    ➤ The first button will lead you straight to the second screen of game process, where you'll see a question and 4 answer options.
    If you'll choose the right one, the next question will appear. 
    There are 10 questions in the game, you can see your current score (amount of the money you won) with the label on the top of the screen.
    👉 Also there are four lifelines here - 
    1. "Call a friend" will show you an answer from your fictional friend. Remember, it can be wrong!
    2. "Ask the audience" will show you the poll with the fictional audience answers.
    3. "50/50" will remove 2 wrong answers .
    4. "Take cash" can be helpful if you're satisfied with the result and want to leave the game, taking the money you're earned. 
    ➤ Here is the second "Records" button on the first screen will head you straigh to the third screen of the records you have. 
    You can see when the record you made and what amount of money it was about. 
    All the records are safely stored on your device. If you want to get rid of it - press the trash can icon in the top right corner.

## Patterns this game used 

### 1. Delegate

    Data from GameScene goes to Game singleton via delegate.
    
### 2. Singleton

    'Game' singleton stores current session and records data.
    
### 3. Memento

    All the records are stored locally on your device in 'UserDefaults.standard'.
   
