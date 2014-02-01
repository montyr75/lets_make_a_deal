/*
 * Let's Make a Deal!
 * In the game show, Monty Hall asked a contestant to choose one of three doors, after which one of
 * the doors that did not conceal the grand prize would be revealed. The contestant would then
 * be asked if they'd like to stick with the original guess or switch to the remaining closed door.
 * This program will prove that to maximize the chance of success, switching is the right choice.
 */

import 'dart:math';

//const int TRIALS = 1000000;
const int TRIALS = 1;

int correct = 0;
int grandPrizeDoor;
int guessDoor;

final List<int> doors = const [1, 2, 3];

Random random = new Random();

void main() {
  for (int i = 0; i < TRIALS; i++) {
    // randomly place grand prize
    grandPrizeDoor = random.nextInt(3) + 1;

    // randomly guess a door
    guessDoor = random.nextInt(3) + 1;

    // construct List of possible doors to eliminate
    List<int> eliminationDoors = doors.where((int door) => door != grandPrizeDoor && door != guessDoor);

    // select randomly from elimination List for door to eliminate
    int eliminateDoor = eliminationDoors[random.nextInt(eliminationDoors.length)];

    // switch guess
    guessDoor = doors.where((int door) => door != eliminateDoor && door != guessDoor).first;

    // if guess turns out correct, count it
    if (guessDoor == grandPrizeDoor) {
      correct++;
    }

    print("The percentage of correct guesses was ${(correct / TRIALS) * 100}%");
  }
}
