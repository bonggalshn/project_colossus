# Data Model: Home Page in HTML

## Page Structure

### HTML Document

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>Navigation</header>
    <main>Content</main>
    <footer>Footer</footer>
</body>
</html>
```

### Components

| Component | Purpose | Elements |
|-----------|---------|---------|
| Header | Site navigation | Logo, nav links |
| Main | Primary content | Welcome message, Hero section |
| Footer | Site information | Copyright, contact links |

### CSS Structure

| Element | Properties |
|---------|-----------|
| :root | CSS custom properties for cyberpunk theme |
| body | Dark background, light text |
| nav | Flexbox navigation |
| main | Content container |
| footer | Fixed/sticky footer |

### No Data Persistence

This is a static HTML page - no database or backend required.