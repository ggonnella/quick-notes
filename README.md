# QuickNotes

QuickNotes is a system for creating single line synchronized notes on the
command line.

The ``quick-notes`` Bash script is not called directly by the user. Instead
_implementation scripts_ are called, which are created with a given purpose
(e.g. storing single line installation protocols).

# Implementation scripts

Implementation script consists in configuration code (see below) and
the call to ``quick-notes``. Scripts store their data in a file,
whose path is given in the configuration.
Examples of
implementation scripts with different purposes are provided in the repository
(``bookmark``, ``installed``, ``learned``, ``questions``).

# Installation

To install a quick notes implementation, the ``quick-notes`` script and the
implementation script must be executable and in path.
Also: an auto-completion for Bash can be enabled, by sourcing the
``quick-notes-completion.bash`` file (e.g. in a Bash startup file).

Furthermore, a data file
must be provided, where the script stores the information. The path to the
file is by default ``$HOME/.local/share/quick-notes`` but can be changed
(see below).

The directory where the data file is stored, shall be a
git directory. The ``origin`` remote must be configured.
It will be employed as a central repository (e.g on Github).

# Notes metadata

To each note, one or multiple tags can be added. Notes can be filtered by tag
and the available tags can be listed.

Each note is assigned to a pre-determined number of groups.
Depending on the configuration, different group categories are available:
hostname, current date, manually assigned groups.

Finally a URL can be associated with a note.

# Configuration

## Mandatory configuration

The following variables must be set before the ``quick-notes`` call:
- ``QUICKNOTES_PURPOSE``: single line message stating the purpose of the
  implementation script (for use in help messages)
- ``QUICKNOTES_DATAFILE``: path to the data file, should be in a .git
  repository, in order to enable the synchronization feature
- ``QUICKNOTES_CMDNAME``: name of the implementation script

## Group assignment configuration

Furthermore the following optional variables can be set, to control how notes
are automatically assigned to groups:
- ``QUICKNOTES_GRP_HOST=yes``: automatically assign to a group named
after the hostname (or the value of the env variable
``$NETWORK``)
- ``QUICKNOTES_GRP_DATE=no``: do not automatically assign to a group named
after the current date
- ``QUICKNOTES_GRP_REQTAG=yes``: assign to a group entered manually, as the
first word in the command line (while the note itself is the rest of the command
line).

## Other optional configuration

- ``QUICKNOTES_DATADIR``: path to the directory where to store
  the data file, should be in a git repository; necessary
  in order to enable the synchronization feature; the default
  is ``$HOME/.local/share/quick-notes``.

- ``QUICKNOTES_ENABLE_URL=yes``: enable the storage of a URL associated
with each note, when using the ``-u`` option of quick-notes

# Command line interface

When calling an implementation of ``quick-notes`` from the command line,
multiple usage options are available. In the following sections ``QN``
is a placeholder for the name of the implementation.

## Basic usage, without category

- ``QN (empty)``: show lines, grouped by hostname / date
- ``QN note content``: store a new note, with the given content

## Assigning tags

- ``QN -t <tag>``     show only lines tagged by ``<tag>``
- ``QN -a <tag>``     add a tag to last line added
- ``QN --tags``       list tags used until now

## Assigning an URL

If ``QUICKNOTES_ENABLE_URL`` is set:
- ``QN -u <url>``:    add an URL to the last line

## Manually assigning categories

If ``QUICKNOTES_GRP_REQTAG`` is set:
- ``QN (empty)``: show lines, grouped by hostname / manually assigned category / date
- ``QN <cat>``: show lines of current host and manually assigned category cat
- ``QN <cat> <line>``: add line (prefixed by hostname / manually assigned category / date)
- ``QN <cat> note content``: store a new line, assigning it to manually assigned
                            category ``<cat>``

## manually editing the data file
- ``QN --vi``:        open data file in vi editor
- ``QN --path``:      show data file path


