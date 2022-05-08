local has_ts, distant = pcall(require, 'distant')
if not has_ts then return end
distant.setup{}
