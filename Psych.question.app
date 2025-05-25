<!DOCTYPE html><html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Trauma Prompt Generator</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #121212;
      color: #f0f0f0;
      padding: 2rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
      min-height: 100vh;
    }
    #prompt-box {
      background: #1e1e1e;
      border-radius: 1rem;
      box-shadow: 0 0 20px rgba(255, 255, 255, 0.05);
      padding: 2rem;
      max-width: 700px;
      text-align: center;
      font-size: 1.2rem;
      margin-bottom: 1.5rem;
    }
    button {
      background: #725ac1;
      color: white;
      border: none;
      padding: 1rem 2rem;
      font-size: 1rem;
      border-radius: 0.75rem;
      cursor: pointer;
      transition: background 0.3s;
      margin: 0.5rem;
    }
    button:hover {
      background: #5e49a1;
    }
    #journal-box {
      width: 100%;
      max-width: 700px;
      height: 200px;
      background: #1e1e1e;
      color: #f0f0f0;
      border: 1px solid #444;
      border-radius: 0.75rem;
      padding: 1rem;
      margin-top: 1rem;
      font-size: 1rem;
    }
    #entries {
      max-width: 700px;
      width: 100%;
      margin-top: 2rem;
    }
    .entry {
      background: #1a1a1a;
      border: 1px solid #333;
      padding: 1rem;
      border-radius: 0.75rem;
      margin-bottom: 1rem;
    }
    .entry-title {
      font-weight: bold;
      margin-bottom: 0.5rem;
    }
  </style>
</head>
<body>
  <div id="prompt-box">Click below to receive a trauma-processing prompt.</div>
  <button onclick="generatePrompt()">New Prompt</button>
  <button onclick="clearEntries()">Clear Saved Entries</button>
  <textarea id="journal-box" placeholder="Write your thoughts here..."></textarea>
  <div id="entries"></div>  <script>
    const promptBox = document.getElementById('prompt-box');
    const journalBox = document.getElementById('journal-box');
    const entriesContainer = document.getElementById('entries');

    const prompts = [
      "Describe how your body communicates when your mind has gone quiet or numb.",
      "What does numbness protect you from, and what does it cost you access to?",
      "Describe something that felt like 'too much' today—but not in words. How did your body, speech, or environment express it for you?",
      "Describe how you felt time pass in your body today—rushed, suspended, or dragging? What might that reflect internally?",
      "Explore how your body reacted the last time you felt safe. What sensations told you safety was present?",
      "Explore the push-pull between wanting connection and avoiding exposure. What drives each part?",
      "Write about a situation you anticipated rejection in, and explore how that shaped your behavior before anything even happened.",
      "Trace a protective behavior you used today that others might call 'dramatic,' 'cold,' or 'avoidant'—but explain its logic from the inside out.",
      "Describe what 'safety' has cost you in terms of connection, growth, or authenticity.",
      "Describe a way you edited your authenticity in real-time today—what were you afraid would happen if you showed the full version?",
      "Describe what 'feeling something' meant for you today—not the emotion, but how you knew it was happening (or that it wasn’t).",
      "Write about an emotion you can’t name yet. Describe how it feels in metaphor, image, or texture.",
      "What emotion is hardest for you to stay present with—and what does it threaten in you when it arises?",
      "If you could externalize your emotional pain into an object, what would it look, feel, or behave like?",
      "What emotion are you most fluent in, and which one still speaks a foreign language to you?",
      "Explore something you're intellectually over—but your body keeps looping back to. What is unfinished in that loop?",
      "Unpack a recent overreaction or underreaction—not in terms of logic, but in terms of historical accuracy.",
      "Write about a moment you misunderstood your own reaction. What story did it actually come from?",
      "If your depression could speak, what would it say about its function in your life?",
      "Write from the voice of your burnout—what is it trying to protect you from ever feeling again?",
      "Describe a part of yourself you learned to suppress for safety—how does it try to come back to life now?",
      "Trace your desire for invisibility today—what it was shielding you from, and what part of you still wanted to be seen.",
      "Describe the feeling of abandonment—not as a story, but as a bodily or sensory experience.",
      "Explore a narrative you’ve internalized about being 'too intense' or 'too sensitive'—where did it start, and how do you push back now?",
      "Describe a past version of yourself you’re grieving, and what that version still longs for now.",
      "Describe how silence functioned today—was it a prison, a sanctuary, a mask, or a form of communication?",
      "Write about a place (digital, physical, relational) that made you feel like you could exhale today. Why?",
      "Describe the way time moved today—was it frozen, frantic, fragmented, or flat? How might that connect to your emotional state?",
      "Track how your attention moved today—where it locked on, what it rejected, and what that says about your internal landscape.",
      "Write about a hope or desire you’re quietly holding but afraid to admit to yourself. What’s the cost of naming it?"
    ];

    function generatePrompt() {
      saveEntry();
      const randomIndex = Math.floor(Math.random() * prompts.length);
      promptBox.textContent = prompts[randomIndex];
      journalBox.value = '';
    }

    function saveEntry() {
      const prompt = promptBox.textContent;
      const journal = journalBox.value.trim();
      if (!prompt || !journal) return;

      let saved = JSON.parse(localStorage.getItem('journalEntries') || '[]');
      saved.push({ prompt, journal, date: new Date().toLocaleString() });
      localStorage.setItem('journalEntries', JSON.stringify(saved));
      renderEntries();
    }

    function renderEntries() {
      entriesContainer.innerHTML = '';
      const saved = JSON.parse(localStorage.getItem('journalEntries') || '[]');
      saved.reverse().forEach(entry => {
        const div = document.createElement('div');
        div.className = 'entry';
        div.innerHTML = `<div class="entry-title">${entry.date} — ${entry.prompt}</div><div>${entry.journal.replace(/\n/g, '<br>')}</div>`;
        entriesContainer.appendChild(div);
      });
    }

    function clearEntries() {
      localStorage.removeItem('journalEntries');
      renderEntries();
    }

    renderEntries();
  </script></body>
</html>