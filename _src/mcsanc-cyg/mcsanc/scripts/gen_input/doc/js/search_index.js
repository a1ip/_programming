var search_data = {"index":{"searchIndex":["config_gen","mcsanc_output","mcsanc_session","mcsancewparam","mcsancinput","helper","add()","bin_by_bin()","bunch_run()","copy()","cut()","new()","new()","new()","new()","new()","output()","qsub()","read_output()","run()","run_onscreen()","save()","save()","share()","share=()","readme"],"longSearchIndex":["config_gen","mcsanc_output","mcsanc_session","mcsancewparam","mcsancinput","mcsancinput::helper","config_gen#add()","mcsancinput#bin_by_bin()","mcsanc_session::bunch_run()","config_gen#copy()","mcsancinput#cut()","config_gen::new()","mcsanc_output::new()","mcsanc_session::new()","mcsancewparam::new()","mcsancinput::new()","config_gen#output()","mcsanc_session#qsub()","mcsanc_session#read_output()","mcsanc_session#run()","mcsanc_session#run_onscreen()","config_gen#save()","mcsanc_session#save()","mcsanc_session::share()","mcsanc_session::share=()",""],"info":[["Config_gen","","Config_gen.html","","<p>General class for config generation using @template erb file\n"],["MCSANC_Output","","MCSANC_Output.html","","<p>Parser for mcsanc output\n"],["MCSANC_Session","","MCSANC_Session.html","","<p>This class is responsible for running the mcsanc  with given MCSANCinput\nand MCSANCewparam objects in …\n"],["MCSANCewparam","","MCSANCewparam.html","","<p>Class for generation of MCSANC <strong>ewparam.cfg</strong> file using\n<strong>ewparam.cfg.erb</strong> template.  It inherits methods …\n"],["MCSANCinput","","MCSANCinput.html","","<p>Class for generation of MCSANC <strong>input.cfg</strong> file using\n<strong>input.cfg.erb</strong> template.  It inherits methods from …\n"],["MCSANCinput::Helper","","MCSANCinput/Helper.html","","<p>helper module with constants for flags\n\n<pre>include MCSANCinput::Helper\ninput=MCSANCinput.new {\n   @iflew[IBORN]=TOTAL ...</pre>\n"],["add","Config_gen","Config_gen.html#method-i-add","(&blk)","<p>Use to change or add multiple config vars. <code>add</code> gets block as\nargument, where one can change config instance …\n"],["bin_by_bin","MCSANCinput","MCSANCinput.html#method-i-bin_by_bin","(distr,tag=@run_tag)","<p>Helper method to create bin by bin distributions\n<p>arguments:\n<p>distribution by index in vbh_* arrays or name …\n"],["bunch_run","MCSANC_Session","MCSANC_Session.html#method-c-bunch_run","(array,nbunch,cubacores=nil)","<p>This method allows you to run an array of MCSANC_Session in bunches. While\nthe group is running, next …\n"],["copy","Config_gen","Config_gen.html#method-i-copy","()","<p>Make a deep copy of config\n\n<pre>config.copy</pre>\n"],["cut","MCSANCinput","MCSANCinput.html#method-i-cut","(name,low,up)","<p>Helper method to ease the cuts settings\n<p>arguments:\n<p>name of distribution as given in vbh_name\n"],["new","Config_gen","Config_gen.html#method-c-new","(&blk)","<p>Initialize new config. Pass given block to <code>add</code>.\n\n<pre>my_config=Config_gen.new {\n  @var1=&quot;something&quot;\n  @var2=@var1+&quot; ...</pre>\n"],["new","MCSANC_Output","MCSANC_Output.html#method-c-new","(path,tag)","<p>initialize the MCSANC_Output object and parse the output file\n<p>arguments:\n<p>path to dir where to search for …\n"],["new","MCSANC_Session","MCSANC_Session.html#method-c-new","(input=MCSANCinput.new,ewparam=MCSANCewparam.new,path=@@share,cubacores=nil)","<p>initialize new MCSANC_Session.\n<p>arguments:\n<p>input - MCSANCinput object, default is MCSANCinput.new\n"],["new","MCSANCewparam","MCSANCewparam.html#method-c-new","(&blk)",""],["new","MCSANCinput","MCSANCinput.html#method-c-new","(&blk)","<p>Initialize new input config, takes block as argument and pass it to #add.\n\n<pre>input=MCSANCinput.new\ninput=MCSANCinput.new ...</pre>\n"],["output","Config_gen","Config_gen.html#method-i-output","()","<p>config generation, return a string\n\n<pre>config.output</pre>\n"],["qsub","MCSANC_Session","MCSANC_Session.html#method-i-qsub","(ncpu=@cubacores, qargs=nil)","<p>the method run session to LIT cluster as a job\n<p>arguments\n<p>number of cores. It is equal to @cubacores by …\n"],["read_output","MCSANC_Session","MCSANC_Session.html#method-i-read_output","()","<p>after mcsanc job is finished, one can parse output with this method. For\nnow the only values read from …\n"],["run","MCSANC_Session","MCSANC_Session.html#method-i-run","(cubacores=@cubacores)","<p>save configs to @path, start mcsanc for this session and detach it (script\ncontinues the execution)  …\n"],["run_onscreen","MCSANC_Session","MCSANC_Session.html#method-i-run_onscreen","(cubacores=@cubacores)","<p>same as run, but it doesnt detach. All mcsanc output goes on screen.\n\n<pre>input=MCSANCinput.new\newparam=MCSANCewparam.new ...</pre>\n"],["save","Config_gen","Config_gen.html#method-i-save","(dir=File::dirname(__FILE__)+\"/../../../share\")","<p>Save config to file. Filename is defined by @filename var in config.\n<code>save</code> takes a directory as argument, …\n"],["save","MCSANC_Session","MCSANC_Session.html#method-i-save","(path=@path)","<p>save all configs to given dir, or to path set in MCSANC_Session.new\n\n<pre>input=MCSANCinput.new\newparam=MCSANCewparam.new ...</pre>\n"],["share","MCSANC_Session","MCSANC_Session.html#method-c-share","()","<p>It keeps the deafault path for saving and running sessions\n<strong>mcsanc/share</strong>.  You can overwrite it with your …\n"],["share=","MCSANC_Session","MCSANC_Session.html#method-c-share-3D","(arg)",""],["README","","README.html","","<p>How to write a main generator script\n<p> (see example.rb) \n<p>Executable ruby script start with\n"]]}}