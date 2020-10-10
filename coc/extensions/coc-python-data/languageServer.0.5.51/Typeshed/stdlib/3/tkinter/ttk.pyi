import sys
from typing import Any
import tkinter

def tclobjs_to_py(adict): ...
def setup_master(master=None): ...

class Style:
    master = ...  # type: Any
    tk = ...  # type: Any
    def __init__(self, master=None): ...
    def configure(self, style, query_opt=None, **kw): ...
    def map(self, style, query_opt=None, **kw): ...
    def lookup(self, style, option, state=None, default=None): ...
    def layout(self, style, layoutspec=None): ...
    def element_create(self, elementname, etype, *args, **kw): ...
    def element_names(self): ...
    def element_options(self, elementname): ...
    def theme_create(self, themename, parent=None, settings=None): ...
    def theme_settings(self, themename, settings): ...
    def theme_names(self): ...
    def theme_use(self, themename=None): ...

class Widget(tkinter.Widget):
    def __init__(self, master, widgetname, kw=None): ...
    def identify(self, x, y): ...
    def instate(self, statespec, callback=None, *args, **kw): ...
    def state(self, statespec=None): ...

class Button(Widget):
    def __init__(self, master=None, **kw): ...
    def invoke(self): ...

class Checkbutton(Widget):
    def __init__(self, master=None, **kw): ...
    def invoke(self): ...

class Entry(Widget, tkinter.Entry):
    def __init__(self, master=None, widget=None, **kw): ...
    def bbox(self, index): ...
    def identify(self, x, y): ...
    def validate(self): ...

class Combobox(Entry):
    def __init__(self, master=None, **kw): ...
    def current(self, newindex=None): ...
    def set(self, value): ...

class Frame(Widget):
    def __init__(self, master=None, **kw): ...

class Label(Widget):
    def __init__(self, master=None, **kw): ...

class Labelframe(Widget):
    def __init__(self, master=None, **kw): ...

LabelFrame = ...  # type: Any

class Menubutton(Widget):
    def __init__(self, master=None, **kw): ...

class Notebook(Widget):
    def __init__(self, master=None, **kw): ...
    def add(self, child, **kw): ...
    def forget(self, tab_id): ...
    def hide(self, tab_id): ...
    def identify(self, x, y): ...
    def index(self, tab_id): ...
    def insert(self, pos, child, **kw): ...
    def select(self, tab_id=None): ...
    def tab(self, tab_id, option=None, **kw): ...
    def tabs(self): ...
    def enable_traversal(self): ...

class Panedwindow(Widget, tkinter.PanedWindow):
    def __init__(self, master=None, **kw): ...
    forget = ...  # type: Any
    def insert(self, pos, child, **kw): ...
    def pane(self, pane, option=None, **kw): ...
    def sashpos(self, index, newpos=None): ...

PanedWindow = ...  # type: Any

class Progressbar(Widget):
    def __init__(self, master=None, **kw): ...
    def start(self, interval=None): ...
    def step(self, amount=None): ...
    def stop(self): ...

class Radiobutton(Widget):
    def __init__(self, master=None, **kw): ...
    def invoke(self): ...

class Scale(Widget, tkinter.Scale):
    def __init__(self, master=None, **kw): ...
    def configure(self, cnf=None, **kw): ...
    def get(self, x=None, y=None): ...

class Scrollbar(Widget, tkinter.Scrollbar):
    def __init__(self, master=None, **kw): ...

class Separator(Widget):
    def __init__(self, master=None, **kw): ...

class Sizegrip(Widget):
    def __init__(self, master=None, **kw): ...

if sys.version_info >= (3, 7):
    class Spinbox(Entry):
        def __init__(self, master: Any = ..., **kw: Any) -> None: ...
        def set(self, value: Any) -> None: ...

class Treeview(Widget, tkinter.XView, tkinter.YView):
    def __init__(self, master=None, **kw): ...
    def bbox(self, item, column=None): ...
    def get_children(self, item=None): ...
    def set_children(self, item, *newchildren): ...
    def column(self, column, option=None, **kw): ...
    def delete(self, *items): ...
    def detach(self, *items): ...
    def exists(self, item): ...
    def focus(self, item=None): ...
    def heading(self, column, option=None, **kw): ...
    def identify(self, component, x, y): ...
    def identify_row(self, y): ...
    def identify_column(self, x): ...
    def identify_region(self, x, y): ...
    def identify_element(self, x, y): ...
    def index(self, item): ...
    def insert(self, parent, index, iid=None, **kw): ...
    def item(self, item, option=None, **kw): ...
    def move(self, item, parent, index): ...
    reattach = ...  # type: Any
    def next(self, item): ...
    def parent(self, item): ...
    def prev(self, item): ...
    def see(self, item): ...
    def selection(self, selop=None, items=None): ...
    def selection_set(self, items): ...
    def selection_add(self, items): ...
    def selection_remove(self, items): ...
    def selection_toggle(self, items): ...
    def set(self, item, column=None, value=None): ...
    def tag_bind(self, tagname, sequence=None, callback=None): ...
    def tag_configure(self, tagname, option=None, **kw): ...
    def tag_has(self, tagname, item=None): ...

class LabeledScale(Frame):
    label = ...  # type: Any
    scale = ...  # type: Any
    def __init__(self, master=None, variable=None, from_=0, to=10, **kw): ...
    def destroy(self): ...
    value = ...  # type: Any

class OptionMenu(Menubutton):
    def __init__(self, master, variable, default=None, *values, **kwargs): ...
    def __getitem__(self, item): ...
    def set_menu(self, default=None, *values): ...
    def destroy(self): ...
