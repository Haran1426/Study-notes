import 'package:flutter/material.dart';
import 'dart:math';

void main()
{
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatefulWidget
{
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp>
{
  String displayText = '0';
  double firstValue = 0.0;
  String operator = '';

  bool shouldResetDisplay = false;

  void inputNumber(int number)
  {
    if (shouldResetDisplay || displayText == '0')
    {
      displayText = number.toString();
      shouldResetDisplay = false;
    }
    else
    {
      displayText += number.toString();
    }

    setState(()
    {
    });
  }

  void clear()
  {
    displayText = '0';
    firstValue = 0.0;
    operator = '';
    shouldResetDisplay = false;

    setState(()
    {
    });
  }

  void clearEnter()
  {
    displayText = '0';
    shouldResetDisplay = false;

    setState(()
    {
    });
  }

  void deleteNumber()
  {
    if (displayText.length <= 1 ||
        (displayText.startsWith('-') && displayText.length == 2))
    {
      displayText = '0';
    }
    else
    {
      displayText = displayText.substring(0, displayText.length - 1);
    }

    setState(()
    {
    });
  }

  void ReciprocalNumber()
  {
    double value = double.parse(displayText);

    if (value == 0)
      {
        displayText = 'Erroar';
        operator = '';
        shouldResetDisplay = true;
        setState(() {

        });
        return;
      }
    value = 1/ value;
    displayText = formatResult(value);
    shouldResetDisplay = true;

    setState(() {

    });
  }
  void SquareNumber()
  {
    double value = double.parse(displayText);

    value *= value;

    displayText = formatResult(value);
    shouldResetDisplay = true;

    setState(()
    {
    });
  }
  void SquareRootNumber()
  {
    double value = double.parse(displayText);

    if (value < 0)
    {
      displayText = 'Error';
      operator = '';
      shouldResetDisplay = true;
      setState(() {});
      return;
    }

    value = sqrt(value);
    displayText = formatResult(value);
    shouldResetDisplay = true;

    setState(() {});
  }
  void selectOperator(String newOperator)
  {
    if (operator.isNotEmpty && !shouldResetDisplay)
    {
      calculate();
    }

    firstValue = double.parse(displayText);
    operator = newOperator;
    shouldResetDisplay = true;

    setState(()
    {
    });
  }

  void MultiplicationNumber()
  {
    selectOperator("×");
  }

  void DivisionNumber()
  {
    selectOperator("÷");
  }

  void PlusNumber()
  {
    selectOperator("+");
  }

  void MinusNumber()
  {
    selectOperator("-");
  }

  void plusMinusNumber()
  {
    if (displayText.isNotEmpty)
    {
      double value = double.parse(displayText);

      value *= -1;

      setState(()
      {
        if (value % 1 == 0)
        {
          displayText = value.toInt().toString();
        }
        else
        {
          displayText = value.toString();
        }
      });
    }
  }

  void PointBtn() {
    if (shouldResetDisplay)
    {
      displayText = '0.';
      shouldResetDisplay = false;
    }
    else if (!displayText.contains('.'))
    {
      displayText += '.';
    }

    setState(() {});
  }

  void calculate()
  {
    if (operator.isEmpty)
    {
      return;
    }

    double secondValue = double.parse(displayText);
    double result = 0.0;

    if (operator == "+")
    {
      result = firstValue + secondValue;
    }
    else if (operator == "-")
    {
      result = firstValue - secondValue;
    }
    else if (operator == "×")
    {
      result = firstValue * secondValue;
    }
    else if (operator == "÷")
    {
      if (secondValue == 0)
      {
        displayText = 'Error';
        operator = '';
        shouldResetDisplay = true;

        return;
      }

      result = firstValue / secondValue;
    }

    displayText = formatResult(result);
    firstValue = result;
    operator = '';
    shouldResetDisplay = true;

    setState(()
    {
    });
  }

  String formatResult(double value)
  {
    if (value % 1 == 0)
    {
      return value.toInt().toString();
    }

    return value.toString();
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        operator.isEmpty
                            ? ''
                            : '$firstValue $operator',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        displayText,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                          },
                          child: const Text(
                            '%',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            clearEnter();
                          },
                          child: const Text(
                            'CE',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            clear();
                          },
                          child: const Text(
                            'C',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            deleteNumber();
                          },
                          child: const Text(
                            '⌫',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            ReciprocalNumber();
                          },
                          child: const Text(
                            '1/x',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            SquareNumber();
                          },
                          child: const Text(
                            'x²',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            SquareRootNumber();
                          },
                          child: const Text(
                            '²√x',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            DivisionNumber();
                          },
                          child: const Text(
                            '÷',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(7);
                          },
                          child: const Text(
                            '7',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(8);
                          },
                          child: const Text(
                            '8',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(9);
                          },
                          child: const Text(
                            '9',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            MultiplicationNumber();
                          },
                          child: const Text(
                            '×',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(4);
                          },
                          child: const Text(
                            '4',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(5);
                          },
                          child: const Text(
                            '5',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(6);
                          },
                          child: const Text(
                            '6',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            MinusNumber();
                          },
                          child: const Text(
                            '−',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(1);
                          },
                          child: const Text(
                            '1',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(2);
                          },
                          child: const Text(
                            '2',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(3);
                          },
                          child: const Text(
                            '3',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            PlusNumber();
                          },
                          child: const Text(
                            '+',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            plusMinusNumber();
                          },
                          child: const Text(
                            '±',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            inputNumber(0);
                          },
                          child: const Text(
                            '0',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            PointBtn();
                          },
                          child: const Text(
                            '.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            minimumSize: const Size(0, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: ()
                          {
                            calculate();
                          },
                          child: const Text(
                            '=',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget
{
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{
  double displayValue = 0;

  int _counter = 0;

  void _incrementCounter()
  {
    setState(()
    {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}