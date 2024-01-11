# npm-package-consumer

This repo provides a minimally functioning example of how to use a repository that you publish.
Follow the lesson plan in [npm-package-demo](https://github.com/samayer12/npm-package-demo) for details.

## To run the consumer:

1. Run `npm install`.
2. Run `npm run dev`.
3. Navigate to the localhost URL provided by terminal output.
4. Observe the "Imported component" that is displayed on-screen.
5. Try changing the dependency listed in the `package.json` for `@samayer12/npm-package-demo` to some other value.
    * Version `0.0.7` should display the imported component with blue text.
    * Version `0.0.8` or `0.0.9` should display the imported component with red text.
6. Observe how the "Imported component" changes without you needing to make any changes to your implementation.

## Notes

`self-check.sh` contains a brittle script to make sure that the project runs using two different versions of the `@samayer12/npm-package-demo` dependency.
