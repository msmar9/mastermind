# Mastermind game
Proposed by the Odin Project's curriculum

A 4-digit secret code is proposed. For each guess feedback is given about the number of matching digits in the same or other position.

There are 12 tries.

The data representation of a key is a 4-char string.

### Match structure
- The player is asked for the role to be played: codemaker or codebreaker
- (Codemaker -> The player chooses a 4-digit key.)
- Loop until reaching max turns or finding the key:
  - Ask for a key
  - Compare keys
  - Update game log
  - Display game log
- Display game conclussion
