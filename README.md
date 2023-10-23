# s4md (Scripts for Markdown)

**s4md** is a Shell script designed to automate the execution of user scripts in markdown files. This tool searches for code blocks in markdown files with the following format:

```markdown

```
text
```

```

It then runs corresponding user scripts using the block's name as a parameter. This provides the ability to create and execute various user scripts for tasks such as generating graphs (dot), creating charts (Octave, R), converting tables to CSV format, and more.

## Syntax

To use **s4md**, run the following command in the command line:

```sh
sh [path_to_md_file] [attachment_folder] > [result_in_md_file]
```

- `[path_to_md_file]`: The path to the markdown file containing code blocks.
- `[attachment_folder]`: The folder that will be used for storing attachments (e.g., images).
- `[result_in_md_file]`: The path to the markdown file where the results of user scripts will be written.

## Example

Here is an example markdown file that contains code blocks:

```markdown
```
digraph { a->b }
```
```

![1 dot graph](./test_folder/1.svg)

Instructions for running this code block might look like this:

```sh
output_image="$output_folder/$count.svg"
output_text=$(printf "\n![$count dot graph]($output_image)\n")
echo $input_text | dot -Tsvg -o $output_image
((count++))
```

Using **s4md**, this code block will be executed, and an SVG image will be created and inserted into the markdown file.

## License

This project is distributed under the MIT license. See the LICENSE file for details.

## Authors and Contacts

Author: Jerzy Pavka
