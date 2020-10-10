"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const tslib_1 = require("tslib");
const which_1 = tslib_1.__importDefault(require("which"));
const coc_nvim_1 = require("coc.nvim");
function activate(context) {
    return tslib_1.__awaiter(this, void 0, void 0, function* () {
        let { subscriptions } = context;
        const config = coc_nvim_1.workspace.getConfiguration().get('pyls', {});
        const enable = config.enable;
        if (enable === false)
            return;
        const command = config.commandPath || 'pyls';
        try {
            which_1.default.sync(command);
        }
        catch (e) {
            let items = [
                'Install python-language-server with pip',
                'Install python-language-server with pip3',
                'Checkout documentation of python-language-server'
            ];
            let idx = yield coc_nvim_1.workspace.showQuickpick(items, `${command} not found in $PATH`);
            if (idx == -1 && idx > 2)
                return;
            if (idx == 2) {
                coc_nvim_1.workspace.nvim.call('coc#util#open_url', ['https://github.com/palantir/python-language-server#installation'], true); // tslint:disable-line
                return;
            }
            let cmd = `${idx == 1 ? 'pip' : 'pip3'} install python-language-server`;
            let res = yield coc_nvim_1.workspace.runTerminalCommand(cmd);
            if (!res.success)
                return;
        }
        let serverOptions = {
            command,
            args: ['-vv']
        };
        let clientOptions = {
            documentSelector: ['python'],
            synchronize: {
                configurationSection: 'pyls'
            },
            outputChannelName: 'pyls',
            revealOutputChannelOn: coc_nvim_1.RevealOutputChannelOn.Never,
            initializationOptions: config.initializationOptions || {}
        };
        let client = new coc_nvim_1.LanguageClient('pyls', 'Python language server', serverOptions, clientOptions);
        subscriptions.push(coc_nvim_1.services.registLanguageClient(client));
    });
}
exports.activate = activate;
//# sourceMappingURL=index.js.map