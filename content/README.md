# Content Organization

This directory contains all the content for the Hugo site. Here's how the content is organized:

## Image Organization

Images are organized using Hugo's page bundle approach for better maintainability:

### Blog Posts
- Each post has its own `images` directory within the post's directory
- Example: `/posts/2021-03-17-my-post/images/example.jpg`
- Images are referenced using relative paths: `images/example.jpg`
- This keeps images together with their content and makes posts more portable

### Product Pages
- Each product has its own `images` directory
- Example: `/peltier/images/product-image.jpg`
- This keeps product-specific images with their content
- Makes it easier to manage product-specific assets

### Portfolio
- Location: `/portfolio/images/`
- Contains certificates, project images, and other portfolio-specific assets
- Keeps portfolio assets separate from other content

## Content Types

1. **Blog Posts** (`/posts/`)
   - Technical tutorials
   - Articles and guides
   - Each post in its own directory with index.md

2. **Products** (individual directories)
   - Product descriptions and specifications
   - Product-specific images
   - Technical documentation

3. **Static Pages**
   - About page
   - Portfolio
   - Other standalone pages

## Best Practices

1. **Image Naming**
   - Use descriptive, lowercase names
   - Use hyphens for spaces
   - Include relevant prefixes for context

2. **Image References**
   - Use absolute paths for blog post images
   - Use relative paths for product images
   - Always include alt text for accessibility

3. **Organization**
   - Keep images close to their content when specific to one section
   - Use the centralized images directory for shared or blog post images
   - Maintain year/month structure for blog post images
