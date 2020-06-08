// PART 1

struct Person {
    char *firstName;
    char *lastName;
    int age;
};
typedef struct Person Person;

Person *AllocPerson(void);
Person *InitPerson(Person *person,
                   const char *firstName,
                   const char *lastName,
                   int age);

// PART 2

char *CreateDescriptionOfPerson(Person *person);

// PART 3

void PrintPerson(Person *self);

// PART 4

Person *NewPerson(const char *firstName,
                  const char *lastName,
                  int age);

// Bonus Lab.

void DeallocPerson(Person *self);

void SetFirstName(Person *self, const char *name);
void SetLastName (Person *self, const char *name);
