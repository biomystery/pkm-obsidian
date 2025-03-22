Here's how you can implement a task management system using **Journal (Daily Notes)** and **Dataview** with minimal plugins, using English for the template:

---

## Core Setup

### 1. Daily Notes Template

Configure your daily notes template in Obsidian with the following content:

````markdown
---
created: { { date } }
tags: daily
---

## 📝 Today's Tasks

```
TASK
WHERE file.day = date(today)
```
````

### 2. Task Recording Format

Record tasks in your daily notes using the following syntax:

```markdown
- [ ] Task Description
      ➕ Created: {{date:YYYY-MM-DD}}
      🔖 Tags: #ProjectA
      🎯 Due: 2025-03-25
      💡 Priority: P1
```

---

## Dataview Task Library

Create a file named `00-Task Overview.md` with the following query:

````markdown
```
TASK
WHERE !completed
SORT 💡 Priority DESC, 🎯 Due ASC
GROUP BY 🔖 Tags
```
````

---

## Advanced Features

### 1. Status Tracking System

Add status indicators to your tasks:

```markdown
- [ ] Write meeting minutes ➕ Created: 2025-03-22 🔄 Last Updated: 2025-03-22 📌 Status: #In Progress
```

### 2. Automatic Progress Statistics

Create a file named `00-Project Progress.md` with the following query:

````markdown
```
TABLE WITHOUT ID
  "🟢 " + round((filter(rows, r).completed).length / length(rows)*100) + "%" AS Progress,
  length(rows) AS Total Tasks
WHERE 🔖 Tags = "ProjectA"
GROUP BY 🔖 Tags
```
````

---

## Usage Flow

1. **Daily Recording**: Add tasks to your daily notes using the template.
2. **Global View**: Open `00-Task Overview.md` to view all tasks.
3. **Status Update**: Check the task box to update its status.
4. **Progress Tracking**: Use the project progress file to view statistics.

---

## Advantages

1. **Pure Text Management**: All data is stored in Markdown files.
2. **Dynamic Updates**: Dataview automatically summarizes the latest status.
3. **Multi-Dimensional Views**: Use different queries to view tasks by date, tags, or priority.
4. **Zero External Dependencies**: Only requires the Dataview plugin.

**Tip**: Use `ctrl/command+E` to quickly insert task template fields. Consider saving frequently used fields as code snippets (Snippets) to boost efficiency.

---

Answer from Perplexity: https://www.perplexity.ai/search/obsidian-he-journalzheng-he-za-Fj7oAavxQr2Tdc_hbh_xAQ?utm_source=copy_output
