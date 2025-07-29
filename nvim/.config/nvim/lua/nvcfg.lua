function read_nvcfg()
	local tablelength = function(T)
		local count = 0
		for _ in pairs(T) do
			count = count + 1
		end
		return count
	end
	if vim.uv.fs_stat("./nvcfg.json") then
		local cfgtext = vim.fn.readfile("./nvcfg.json")
		if tablelength(cfgtext) == 0 then
			return nil
		end
		local cfgdict = vim.fn.json_decode(cfgtext)
		if tablelength(cfgdict) == 0 then
			return nil
		end
		return cfgdict
	else
		return nil
	end
end

function Nvcfg_configure()
	local cfg = read_nvcfg()
	if cfg and cfg.build and cfg.build.configure then
		vim.system(vim.split(cfg.build.configure, " "), { text = true }, function(obj)
			print(obj.code)
			print(obj.signal)
			print(obj.stdout)
			print(obj.stderr)
		end)
	end
end

-- vim.keymap.set("n", "<F3>", Nvcfg_configure)
