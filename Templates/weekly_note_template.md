---
created: {{date:YYYY-MM-DD}} {{time:HH:mm:ss}}
updated: {{date:YYYY-MM-DD}} {{time:HH:mm:ss}}  # This will be updated automatically
---

## 🙏 Thankful
> "What am I grateful for this week?"

## 🎉 Wins 
> "What went well this week (work & life)?" (progress)

## 🚧 Challenges 
> "What didn’t go well, and why?"

## 📈 Progress 
> "Did I make progress on my key goals? (Work/Life)"

## 💡 Lessons 
> "What’s one thing I learned this week?"

## 📅 Priorities 
> "What are my top priorities for next week (work & life)?"


## 🐾 Footer 
-----
<%*
const date = tp.file.title;

// left and right error 
let yesterday =  moment(tp.file.title, 'YYYY-[W]ww').subtract(1, 'w');
let tomorrow = moment(tp.file.title, 'YYYY-[W]ww').add(1, 'w')
let leftArrow = `[[Journals/${yesterday.format('YYYY')}/${yesterday.format('YYYY')}-W${yesterday.format('ww')}|<<]]`;
let rightArrow = `[[Journals/${tomorrow.format('YYYY')}/${tomorrow.format('YYYY')}-W${tomorrow.format('ww')}|>>]]`;

tR += `${leftArrow} | ${rightArrow}`;
%>

