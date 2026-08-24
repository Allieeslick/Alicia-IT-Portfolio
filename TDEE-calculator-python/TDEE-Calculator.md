# Python TDEE Calculator

This project is a Python script that calculates Total Daily Energy Expenditure (TDEE) based on user input. It demonstrates foundational Python skills including variables, user input, arithmetic operations, conditional logic, and dictionary usage.

---

## Features
- Converts weight (lbs → kg) and height (ft/in → cm)
- Calculates BMR using the Mifflin–St Jeor equation
- Determines activity level based on weekly workout minutes
- Applies the correct multiplier to estimate TDEE
- Generates calorie goals for:
  - Maintenance  
  - Mild loss  
  - Moderate loss  
  - Mild gain  
  - Moderate gain  

---

## Skills Demonstrated
- Python variables  
- User input handling  
- Math operations  
- Conditional statements (`if/elif`)  
- Dictionaries  
- Basic automation logic  

---

## Full Script

```python
import math

weightPounds = float(input('Enter weight in pounds: '))
heightFeet = float(input('Enter height in feet: '))
heightInches = float(input('Enter height in inches: '))
Age = int(input('Enter age: '))
sex = input("female or male?")

KG = weightPounds / 2.20462
CM = (heightFeet * 30.48) + (heightInches * 2.54)

if sex == 'male':
    BMR = (10 * KG) + (6.25 * CM) - (5 * Age) + 5
elif sex == 'female':
    BMR = (10 * KG) + (6.25 * CM) - (5 * Age) - 161

minutes = int(input('Enter number of minutes workout per week: '))

if minutes <=0 or minutes <= 60:
    print('Your activity is sedentary.')
    multiplier = 1.2
elif minutes <= 90 or minutes <= 150:
    print('Your activity is light.')
    multiplier = 1.375
elif minutes <= 151 or minutes <= 300:
    print('Your activity is moderate.')
    multiplier = 1.55
elif minutes <= 301 or minutes <= 420:
    print('Your activity is very active.')
    multiplier = 1.725
else:
    print('You are extra active.')
    multiplier = 1.9

TDEE = math.ceil(BMR * multiplier)

print(f'Your BMR is: {math.ceil(BMR)}')
print(f'Your TDEE is: {math.ceil(TDEE)}')

goals = {
    'maintenance': TDEE,
    'mild_loss': TDEE - 250,
    'moderate_loss': TDEE - 500,
    'mild_gain': TDEE + 250,
    'moderate_gain': TDEE + 500
}

print("\nCalorie Goals:")
for goal, value in goals.items():
    print(f"{goal.replace('_', ' ').capitalize()}: {value} kcal/day")
```

---

## Summary
This script provides a quick estimate of daily calorie needs and demonstrates practical Python programming skills suitable for entry‑level IT automation and scripting.

