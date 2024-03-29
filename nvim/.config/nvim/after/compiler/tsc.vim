if exists(':CompilerSet') != 2
  command -nargs=* CompilerSet setlocal <args>
endif

let s:pack_path = parmort#traverse('package.json')
let s:lint='tsc\ --noEmit\ --incremental\ false'

if len(s:pack_path) > 1
  try
    let s:pack_data = json_decode(readfile(s:pack_path))
    if (type(s:pack_data) == v:t_dict)
      if has_key(s:pack_data, 'scripts')
        let s:scripts = s:pack_data['scripts']
        if has_key(s:scripts, 'build')
          if executable('yarn')
            let s:lint = 'yarn\ run\ build'
          else
            let s:lint = 'npm\ run\ build'
          endif
        endif
      endif
    endif
  catch
  endtry
endif

execute 'CompilerSet makeprg=' . s:lint

CompilerSet errorformat=
      \%f(%l\\,%c):\ %trror\ TS%n:\ %m,
      \%-G>\ %.%#,
      \%-G

finish " Sample output follows:
yarn run v1.17.3
$ tsc --noEmit
src/renderer/hooks/usePrevious.ts:24:5 - error TS2322: Type 'T' is not assignable to type 'undefined'.

24     ref.current = value;
       ~~~~~~~~~~~

src/renderer/index.tsx:11:14 - error TS2552: Cannot find name 'doscument'. Did you mean 'Document'?

11 const root = doscument.getElementById('root');
                ~~~~~~~~~

  node_modules/typescript/lib/lib.dom.d.ts:4952:13
    4952 declare var Document: {
                     ~~~~~~~~
    'Document' is declared here.

src/renderer/store/__tests__/filterNotes-test.ts:35:24 - error TS2345: Argument of type 'null' is not assignable to parameter of type 'string | undefined'.

35     expect(filterNotes(null, notes)).toStrictEqual(notes);
                          ~~~~

src/renderer/store/filterNotes.ts:63:22 - error TS2345: Argument of type 'number' is not assignable to parameter of type 'string'.

63         indices.push(index);
                        ~~~~~

src/renderer/store/reducer.ts:20:36 - error TS2345: Argument of type 'string | null' is not assignable to parameter of type 'string | undefined'.
  Type 'null' is not assignable to type 'string | undefined'.

20         filteredNotes: filterNotes(action.query, store.notes),
                                      ~~~~~~~~~~~~

src/renderer/store/reducer.ts:33:36 - error TS2345: Argument of type 'string | null' is not assignable to parameter of type 'string | undefined'.
  Type 'null' is not assignable to type 'string | undefined'.

33         filteredNotes: filterNotes(store.query, notes),
                                      ~~~~~~~~~~~


Found 6 errors.

error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
