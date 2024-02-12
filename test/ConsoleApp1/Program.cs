using System;
namespace testprog
{
    class Program
    {
        static void Main()
        {
            Console.WriteLine("Укажить путь к файлу");
            string inputFilePath = Console.ReadLine();
            string outputFilePath = "output.txt";

            string text = File.ReadAllText(inputFilePath);

            Dictionary<string, int> wordCount = new Dictionary<string, int>();
            string[] words = text.Split(new char[] { ' ', '\n', '\r', '\t', '.', ',', ';', ':', '!', '?' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string word in words)
            {
                string cleanedWord = word.ToLower();
                if (wordCount.ContainsKey(cleanedWord))
                    wordCount[cleanedWord]++;
                else
                    wordCount[cleanedWord] = 1;
            }

            var sortedWordCount = wordCount.OrderByDescending(w => w.Value);

            using (StreamWriter outputFile = new StreamWriter(outputFilePath))
            {
                foreach (var word in sortedWordCount)
                {
                    outputFile.WriteLine($"{word.Key} {word.Value}");
                }
            }
        }
    }
}