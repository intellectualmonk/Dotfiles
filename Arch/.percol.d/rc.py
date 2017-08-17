# Run command file for percol

percol.view.__class__.PROMPT = property(
    lambda self:
    ur"<bold><red>Input </red>[a]:</bold> %q" if percol.model.finder.case_insensitive
    else ur"<bold><red>Input </red>[A]:</bold> %q"
)

percol.view.CANDIDATES_LINE_SELECTED = ("underline", "on_red", "white")
