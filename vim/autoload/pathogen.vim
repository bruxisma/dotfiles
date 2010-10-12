
    

  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
        <title>autoload/pathogen.vim at master from tpope's vim-pathogen - GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="http://github.com/fluidicon.png" title="GitHub" />

    <link href="http://assets3.github.com/stylesheets/bundle_common.css?0260fd09e4addb5b7e5793ab932ea40995810234" media="screen" rel="stylesheet" type="text/css" />
<link href="http://assets2.github.com/stylesheets/bundle_github.css?0260fd09e4addb5b7e5793ab932ea40995810234" media="screen" rel="stylesheet" type="text/css" />

    <script type="text/javascript" charset="utf-8">
      var GitHub = {}
      var github_user = null
      
    </script>
    <script src="http://assets0.github.com/javascripts/jquery/jquery-1.4.2.min.js?0260fd09e4addb5b7e5793ab932ea40995810234" type="text/javascript"></script>
    <script src="http://assets1.github.com/javascripts/bundle_common.js?0260fd09e4addb5b7e5793ab932ea40995810234" type="text/javascript"></script>
<script src="http://assets1.github.com/javascripts/bundle_github.js?0260fd09e4addb5b7e5793ab932ea40995810234" type="text/javascript"></script>

        <script type="text/javascript" charset="utf-8">
      GitHub.spy({
        repo: "tpope/vim-pathogen"
      })
    </script>

    
  
    
  

  <link href="http://github.com/tpope/vim-pathogen/commits/master.atom" rel="alternate" title="Recent Commits to vim-pathogen:master" type="application/atom+xml" />

        <meta name="description" content="pathogen.vim: manage your runtimepath" />
    <script type="text/javascript">
      GitHub.nameWithOwner = GitHub.nameWithOwner || "tpope/vim-pathogen";
      GitHub.currentRef = 'master';
    </script>
  

            <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-3769691-2']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script');
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        ga.setAttribute('async', 'true');
        document.documentElement.firstChild.appendChild(ga);
      })();
    </script>

  </head>

  

  <body class="logged_out ">
    

    
      <script type="text/javascript">
        var _kmq = _kmq || [];
        function _kms(u){
          var s = document.createElement('script'); var f = document.getElementsByTagName('script')[0]; s.type = 'text/javascript'; s.async = true;
          s.src = u; f.parentNode.insertBefore(s, f);
        }
        _kms('//i.kissmetrics.com/i.js');_kms('//doug1izaerwt3.cloudfront.net/406e8bf3a2b8846ead55afb3cfaf6664523e3a54.1.js');
      </script>
    

    

    

    

    <div class="subnavd" id="main">
      <div id="header" class="true">
        
          <a class="logo boring" href="http://github.com">
            <img src="/images/modules/header/logov3.png?changed" class="default" alt="github" />
            <![if !IE]>
            <img src="/images/modules/header/logov3-hover.png" class="hover" alt="github" />
            <![endif]>
          </a>
        
        
        <div class="topsearch">
  
    <ul class="nav logged_out">
      <li><a href="http://github.com">Home</a></li>
      <li class="pricing"><a href="/plans">Pricing and Signup</a></li>
      <li><a href="http://github.com/training">Training</a></li>
      <li><a href="http://gist.github.com">Gist</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="https://github.com/login">Login</a></li>
    </ul>
  
</div>

      </div>

      
      
        
    <div class="site">
      <div class="pagehead repohead vis-public   ">

      

      <div class="title-actions-bar">
        <h1>
          <a href="/tpope">tpope</a> / <strong><a href="http://github.com/tpope/vim-pathogen">vim-pathogen</a></strong>
          
          
        </h1>

        
    <ul class="actions">
      

      
        <li class="for-owner" style="display:none"><a href="https://github.com/tpope/vim-pathogen/edit" class="minibutton btn-admin "><span><span class="icon"></span>Admin</span></a></li>
        <li>
          <a href="/tpope/vim-pathogen/toggle_watch" class="minibutton btn-watch " id="watch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '22dcef42e8bf83adba5798edcc4e99ec22357e6e'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Watch</span></a>
          <a href="/tpope/vim-pathogen/toggle_watch" class="minibutton btn-watch " id="unwatch_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '22dcef42e8bf83adba5798edcc4e99ec22357e6e'); f.appendChild(s);f.submit();return false;" style="display:none"><span><span class="icon"></span>Unwatch</span></a>
        </li>
        
          
            <li class="for-notforked" style="display:none"><a href="/tpope/vim-pathogen/fork" class="minibutton btn-fork " id="fork_button" onclick="var f = document.createElement('form'); f.style.display = 'none'; this.parentNode.appendChild(f); f.method = 'POST'; f.action = this.href;var s = document.createElement('input'); s.setAttribute('type', 'hidden'); s.setAttribute('name', 'authenticity_token'); s.setAttribute('value', '22dcef42e8bf83adba5798edcc4e99ec22357e6e'); f.appendChild(s);f.submit();return false;"><span><span class="icon"></span>Fork</span></a></li>
            <li class="for-hasfork" style="display:none"><a href="#" class="minibutton btn-fork " id="your_fork_button"><span><span class="icon"></span>Your Fork</span></a></li>
          

          
        
      
      
      <li class="repostats">
        <ul class="repo-stats">
          <li class="watchers"><a href="/tpope/vim-pathogen/watchers" title="Watchers" class="tooltipped downwards">167</a></li>
          <li class="forks"><a href="/tpope/vim-pathogen/network" title="Forks" class="tooltipped downwards">10</a></li>
        </ul>
      </li>
    </ul>

      </div>

        
  <ul class="tabs">
    <li><a href="http://github.com/tpope/vim-pathogen/tree/master" class="selected" highlight="repo_source">Source</a></li>
    <li><a href="http://github.com/tpope/vim-pathogen/commits/master" highlight="repo_commits">Commits</a></li>

    
    <li><a href="/tpope/vim-pathogen/network" highlight="repo_network">Network (10)</a></li>

    

    
      
      <li><a href="/tpope/vim-pathogen/issues" highlight="issues">Issues (4)</a></li>
    

                    
    <li><a href="/tpope/vim-pathogen/graphs" highlight="repo_graphs">Graphs</a></li>

    <li class="contextswitch nochoices">
      <span class="toggle leftwards" >
        <em>Branch:</em>
        <code>master</code>
      </span>
    </li>
  </ul>

  <div style="display:none" id="pl-description"><p><em class="placeholder">click here to add a description</em></p></div>
  <div style="display:none" id="pl-homepage"><p><em class="placeholder">click here to add a homepage</em></p></div>

  <div class="subnav-bar">
  
  <ul>
    <li>
      <a href="#" class="dropdown">Switch Branches (1)</a>
      <ul>
        
          
            <li><strong>master &#x2713;</strong></li>
            
      </ul>
    </li>
    <li>
      <a href="#" class="dropdown ">Switch Tags (2)</a>
              <ul>
                      
              <li><a href="/tpope/vim-pathogen/blob/v1.2/autoload/pathogen.vim">v1.2</a></li>
            
                      
              <li><a href="/tpope/vim-pathogen/blob/v1.1/autoload/pathogen.vim">v1.1</a></li>
            
                  </ul>
      
    </li>
    <li>
    
    <a href="/tpope/vim-pathogen/branches" class="manage">Branch List</a>
    
    </li>
  </ul>
</div>

  
  
  
  
  
  



        
    <div id="repo_details" class="metabox clearfix">
      <div id="repo_details_loader" class="metabox-loader" style="display:none">Sending Request&hellip;</div>

        <a href="/tpope/vim-pathogen/downloads" class="download-source" id="download_button" title="Download source, tagged packages and binaries."><span class="icon"></span>Downloads</a>

      <div id="repository_desc_wrapper">
      <div id="repository_description" rel="repository_description_edit">
        
          <p>pathogen.vim: manage your runtimepath
            <span id="read_more" style="display:none">&mdash; <a href="#readme">Read more</a></span>
          </p>
        
      </div>
      <div id="repository_description_edit" style="display:none;" class="inline-edit">
        <form action="/tpope/vim-pathogen/edit/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="22dcef42e8bf83adba5798edcc4e99ec22357e6e" /></div>
          <input type="hidden" name="field" value="repository_description">
          <input type="text" class="textfield" name="value" value="pathogen.vim: manage your runtimepath">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>

      
      <div class="repository-homepage" id="repository_homepage" rel="repository_homepage_edit">
        <p><a href="http://www.vim.org/scripts/script.php?script_id=2332" rel="nofollow">http://www.vim.org/scripts/script.php?script_id=2332</a></p>
      </div>
      <div id="repository_homepage_edit" style="display:none;" class="inline-edit">
        <form action="/tpope/vim-pathogen/edit/update" method="post"><div style="margin:0;padding:0"><input name="authenticity_token" type="hidden" value="22dcef42e8bf83adba5798edcc4e99ec22357e6e" /></div>
          <input type="hidden" name="field" value="repository_homepage">
          <input type="text" class="textfield" name="value" value="http://www.vim.org/scripts/script.php?script_id=2332">
          <div class="form-actions">
            <button class="minibutton"><span>Save</span></button> &nbsp; <a href="#" class="cancel">Cancel</a>
          </div>
        </form>
      </div>
      </div>
      <div class="rule "></div>
            <div id="url_box" class="url-box">
        <ul class="clone-urls">
          
            
            <li id="http_clone_url"><a href="http://github.com/tpope/vim-pathogen.git" data-permissions="Read-Only">HTTP</a></li>
            <li id="public_clone_url"><a href="git://github.com/tpope/vim-pathogen.git" data-permissions="Read-Only">Git Read-Only</a></li>
          
        </ul>
        <input type="text" spellcheck="false" id="url_field" class="url-field" />
              <span style="display:none" id="url_box_clippy"></span>
      <span id="clippy_tooltip_url_box_clippy" class="clippy-tooltip tooltipped" title="copy to clipboard">
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="14"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="http://assets0.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=url_box_clippy&amp;copied=&amp;copyto=">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="http://assets0.github.com/flash/clippy.swf?v5"
             width="14"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=url_box_clippy&amp;copied=&amp;copyto="
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      </span>

        <p id="url_description">This URL has <strong>Read+Write</strong> access</p>
      </div>
    </div>


        

      </div><!-- /.pagehead -->

      









<script type="text/javascript">
  GitHub.currentCommitRef = 'master'
  GitHub.currentRepoOwner = 'tpope'
  GitHub.currentRepo = "vim-pathogen"
  GitHub.downloadRepo = '/tpope/vim-pathogen/archives/master'
  GitHub.revType = "master"

  GitHub.controllerName = "blob"
  GitHub.actionName     = "show"
  GitHub.currentAction  = "blob#show"

  

  
</script>








  <div id="commit">
    <div class="group">
        
  <div class="envelope commit">
    <div class="human">
      
        <div class="message"><pre><a href="/tpope/vim-pathogen/commit/f4f79bc7205b6c101955f32985a4d1b1da0be556">Fix appending "after" directories on Windows</a> </pre></div>
      

      <div class="actor">
        <div class="gravatar">
          
          <img src="http://www.gravatar.com/avatar/909752c59cf4143ac785840d0a9923b6?s=140&d=http%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
        </div>
        <div class="name"><a href="/leoluz">leoluz</a> <span>(author)</span></div>
        <div class="date">
          <abbr class="relatize" title="2010-05-16 17:12:46">Sun May 16 17:12:46 -0700 2010</abbr>
        </div>
      </div>

      
        <div class="actor">
          <div class="gravatar">
            <img src="http://www.gravatar.com/avatar/67259dd09c53aef920fe2aca18c7a8e0?s=140&d=http%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png" alt="" width="30" height="30"  />
          </div>
          <div class="name"><a href="/tpope">tpope</a> <span>(committer)</span></div>
          <div class="date"><abbr class="relatize" title="2010-05-16 17:12:46">Sun May 16 17:12:46 -0700 2010</abbr></div>
        </div>
      

    </div>
    <div class="machine">
      <span>c</span>ommit&nbsp;&nbsp;<a href="/tpope/vim-pathogen/commit/f4f79bc7205b6c101955f32985a4d1b1da0be556" hotkey="c">f4f79bc7205b6c101955</a><br />
      <span>t</span>ree&nbsp;&nbsp;&nbsp;&nbsp;<a href="/tpope/vim-pathogen/tree/f4f79bc7205b6c101955f32985a4d1b1da0be556" hotkey="t">6f0fa6b49ebd0aacb8f9</a><br />
      
        <span>p</span>arent&nbsp;
        
        <a href="/tpope/vim-pathogen/tree/9dc6d067fb089e37ae28e41b2a1bc5b5cf140554" hotkey="p">9dc6d067fb089e37ae28</a>
      

    </div>
  </div>

    </div>
  </div>



  
    <div id="path">
      <b><a href="/tpope/vim-pathogen/tree/master">vim-pathogen</a></b> / <a href="/tpope/vim-pathogen/tree/master/autoload">autoload</a> / pathogen.vim       <span style="display:none" id="clippy_2040">autoload/pathogen.vim</span>
      
      <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000"
              width="110"
              height="14"
              class="clippy"
              id="clippy" >
      <param name="movie" value="http://assets1.github.com/flash/clippy.swf?v5"/>
      <param name="allowScriptAccess" value="always" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param NAME="FlashVars" value="id=clippy_2040&amp;copied=copied!&amp;copyto=copy to clipboard">
      <param name="bgcolor" value="#FFFFFF">
      <param name="wmode" value="opaque">
      <embed src="http://assets1.github.com/flash/clippy.swf?v5"
             width="110"
             height="14"
             name="clippy"
             quality="high"
             allowScriptAccess="always"
             type="application/x-shockwave-flash"
             pluginspage="http://www.macromedia.com/go/getflashplayer"
             FlashVars="id=clippy_2040&amp;copied=copied!&amp;copyto=copy to clipboard"
             bgcolor="#FFFFFF"
             wmode="opaque"
      />
      </object>
      

    </div>

    <div id="files">
      <div class="file">
        <div class="meta">
          <div class="info">
            <span class="icon"><img alt="Txt" height="16" src="http://assets3.github.com/images/icons/txt.png?4145dfae543db1df6d2a0c8c31d5916c23ba6779" width="16" /></span>
            <span class="mode" title="File Mode">100644</span>
            
              <span>133 lines (118 sloc)</span>
            
            <span>4.097 kb</span>
          </div>
          <ul class="actions">
            
              <li><a id="file-edit-link" href="#" rel="/tpope/vim-pathogen/file-edit/__ref__/autoload/pathogen.vim">edit</a></li>
            
            <li><a href="/tpope/vim-pathogen/raw/master/autoload/pathogen.vim" id="raw-url">raw</a></li>
            
              <li><a href="/tpope/vim-pathogen/blame/master/autoload/pathogen.vim">blame</a></li>
            
            <li><a href="/tpope/vim-pathogen/commits/master/autoload/pathogen.vim">history</a></li>
          </ul>
        </div>
        
  <div class="data syntax type-vim">
    
      <table cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <pre class="line_numbers"><span id="LID1" rel="#L1">1</span>
<span id="LID2" rel="#L2">2</span>
<span id="LID3" rel="#L3">3</span>
<span id="LID4" rel="#L4">4</span>
<span id="LID5" rel="#L5">5</span>
<span id="LID6" rel="#L6">6</span>
<span id="LID7" rel="#L7">7</span>
<span id="LID8" rel="#L8">8</span>
<span id="LID9" rel="#L9">9</span>
<span id="LID10" rel="#L10">10</span>
<span id="LID11" rel="#L11">11</span>
<span id="LID12" rel="#L12">12</span>
<span id="LID13" rel="#L13">13</span>
<span id="LID14" rel="#L14">14</span>
<span id="LID15" rel="#L15">15</span>
<span id="LID16" rel="#L16">16</span>
<span id="LID17" rel="#L17">17</span>
<span id="LID18" rel="#L18">18</span>
<span id="LID19" rel="#L19">19</span>
<span id="LID20" rel="#L20">20</span>
<span id="LID21" rel="#L21">21</span>
<span id="LID22" rel="#L22">22</span>
<span id="LID23" rel="#L23">23</span>
<span id="LID24" rel="#L24">24</span>
<span id="LID25" rel="#L25">25</span>
<span id="LID26" rel="#L26">26</span>
<span id="LID27" rel="#L27">27</span>
<span id="LID28" rel="#L28">28</span>
<span id="LID29" rel="#L29">29</span>
<span id="LID30" rel="#L30">30</span>
<span id="LID31" rel="#L31">31</span>
<span id="LID32" rel="#L32">32</span>
<span id="LID33" rel="#L33">33</span>
<span id="LID34" rel="#L34">34</span>
<span id="LID35" rel="#L35">35</span>
<span id="LID36" rel="#L36">36</span>
<span id="LID37" rel="#L37">37</span>
<span id="LID38" rel="#L38">38</span>
<span id="LID39" rel="#L39">39</span>
<span id="LID40" rel="#L40">40</span>
<span id="LID41" rel="#L41">41</span>
<span id="LID42" rel="#L42">42</span>
<span id="LID43" rel="#L43">43</span>
<span id="LID44" rel="#L44">44</span>
<span id="LID45" rel="#L45">45</span>
<span id="LID46" rel="#L46">46</span>
<span id="LID47" rel="#L47">47</span>
<span id="LID48" rel="#L48">48</span>
<span id="LID49" rel="#L49">49</span>
<span id="LID50" rel="#L50">50</span>
<span id="LID51" rel="#L51">51</span>
<span id="LID52" rel="#L52">52</span>
<span id="LID53" rel="#L53">53</span>
<span id="LID54" rel="#L54">54</span>
<span id="LID55" rel="#L55">55</span>
<span id="LID56" rel="#L56">56</span>
<span id="LID57" rel="#L57">57</span>
<span id="LID58" rel="#L58">58</span>
<span id="LID59" rel="#L59">59</span>
<span id="LID60" rel="#L60">60</span>
<span id="LID61" rel="#L61">61</span>
<span id="LID62" rel="#L62">62</span>
<span id="LID63" rel="#L63">63</span>
<span id="LID64" rel="#L64">64</span>
<span id="LID65" rel="#L65">65</span>
<span id="LID66" rel="#L66">66</span>
<span id="LID67" rel="#L67">67</span>
<span id="LID68" rel="#L68">68</span>
<span id="LID69" rel="#L69">69</span>
<span id="LID70" rel="#L70">70</span>
<span id="LID71" rel="#L71">71</span>
<span id="LID72" rel="#L72">72</span>
<span id="LID73" rel="#L73">73</span>
<span id="LID74" rel="#L74">74</span>
<span id="LID75" rel="#L75">75</span>
<span id="LID76" rel="#L76">76</span>
<span id="LID77" rel="#L77">77</span>
<span id="LID78" rel="#L78">78</span>
<span id="LID79" rel="#L79">79</span>
<span id="LID80" rel="#L80">80</span>
<span id="LID81" rel="#L81">81</span>
<span id="LID82" rel="#L82">82</span>
<span id="LID83" rel="#L83">83</span>
<span id="LID84" rel="#L84">84</span>
<span id="LID85" rel="#L85">85</span>
<span id="LID86" rel="#L86">86</span>
<span id="LID87" rel="#L87">87</span>
<span id="LID88" rel="#L88">88</span>
<span id="LID89" rel="#L89">89</span>
<span id="LID90" rel="#L90">90</span>
<span id="LID91" rel="#L91">91</span>
<span id="LID92" rel="#L92">92</span>
<span id="LID93" rel="#L93">93</span>
<span id="LID94" rel="#L94">94</span>
<span id="LID95" rel="#L95">95</span>
<span id="LID96" rel="#L96">96</span>
<span id="LID97" rel="#L97">97</span>
<span id="LID98" rel="#L98">98</span>
<span id="LID99" rel="#L99">99</span>
<span id="LID100" rel="#L100">100</span>
<span id="LID101" rel="#L101">101</span>
<span id="LID102" rel="#L102">102</span>
<span id="LID103" rel="#L103">103</span>
<span id="LID104" rel="#L104">104</span>
<span id="LID105" rel="#L105">105</span>
<span id="LID106" rel="#L106">106</span>
<span id="LID107" rel="#L107">107</span>
<span id="LID108" rel="#L108">108</span>
<span id="LID109" rel="#L109">109</span>
<span id="LID110" rel="#L110">110</span>
<span id="LID111" rel="#L111">111</span>
<span id="LID112" rel="#L112">112</span>
<span id="LID113" rel="#L113">113</span>
<span id="LID114" rel="#L114">114</span>
<span id="LID115" rel="#L115">115</span>
<span id="LID116" rel="#L116">116</span>
<span id="LID117" rel="#L117">117</span>
<span id="LID118" rel="#L118">118</span>
<span id="LID119" rel="#L119">119</span>
<span id="LID120" rel="#L120">120</span>
<span id="LID121" rel="#L121">121</span>
<span id="LID122" rel="#L122">122</span>
<span id="LID123" rel="#L123">123</span>
<span id="LID124" rel="#L124">124</span>
<span id="LID125" rel="#L125">125</span>
<span id="LID126" rel="#L126">126</span>
<span id="LID127" rel="#L127">127</span>
<span id="LID128" rel="#L128">128</span>
<span id="LID129" rel="#L129">129</span>
<span id="LID130" rel="#L130">130</span>
<span id="LID131" rel="#L131">131</span>
<span id="LID132" rel="#L132">132</span>
<span id="LID133" rel="#L133">133</span>
</pre>
          </td>
          <td width="100%">
            
              <div class="highlight"><pre><div class='line' id='LC1'><span class="c">" pathogen.vim - path option manipulation</span></div><div class='line' id='LC2'><span class="c">" Maintainer:   Tim Pope &lt;vimNOSPAM@tpope.org&gt;</span></div><div class='line' id='LC3'><span class="c">" Version:      1.2</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'><span class="c">" Install in ~/.vim/autoload (or ~\vimfiles\autoload).</span></div><div class='line' id='LC6'><span class="c">"</span></div><div class='line' id='LC7'><span class="c">" API is documented below.</span></div><div class='line' id='LC8'><br/></div><div class='line' id='LC9'><span class="k">if</span> exists<span class="p">(</span><span class="s2">"g:loaded_pathogen"</span><span class="p">)</span> <span class="p">||</span> &amp;<span class="k">cp</span></div><div class='line' id='LC10'>&nbsp;&nbsp;<span class="k">finish</span></div><div class='line' id='LC11'><span class="k">endif</span></div><div class='line' id='LC12'><span class="k">let</span> g:loaded_pathogen <span class="p">=</span> <span class="m">1</span></div><div class='line' id='LC13'><br/></div><div class='line' id='LC14'><span class="c">" Split a path into a list.</span></div><div class='line' id='LC15'><span class="k">function</span><span class="p">!</span> pathogen#split<span class="p">(</span><span class="nb">path</span><span class="p">)</span> abort <span class="c">" {{{1</span></div><div class='line' id='LC16'>&nbsp;&nbsp;<span class="k">if</span> type<span class="p">(</span>a:<span class="nb">path</span><span class="p">)</span> <span class="p">==</span> type<span class="p">(</span>[]<span class="p">)</span> <span class="p">|</span> <span class="k">return</span> a:<span class="nb">path</span> <span class="p">|</span> <span class="k">endif</span></div><div class='line' id='LC17'>&nbsp;&nbsp;<span class="k">let</span> split <span class="p">=</span> split<span class="p">(</span>a:<span class="nb">path</span><span class="p">,</span><span class="s1">&#39;\\\@&lt;!\%(\\\\\)*\zs,&#39;</span><span class="p">)</span></div><div class='line' id='LC18'>&nbsp;&nbsp;<span class="k">return</span> map<span class="p">(</span>split<span class="p">,</span><span class="s1">&#39;substitute(v:val,&#39;&#39;\\\([\\,]\)&#39;&#39;,&#39;&#39;\1&#39;&#39;,"g")&#39;</span><span class="p">)</span></div><div class='line' id='LC19'><span class="k">endfunction</span> <span class="c">" }}}1</span></div><div class='line' id='LC20'><br/></div><div class='line' id='LC21'><span class="c">" Convert a list to a path.</span></div><div class='line' id='LC22'><span class="k">function</span><span class="p">!</span> pathogen#<span class="k">join</span><span class="p">(</span>...<span class="p">)</span> abort <span class="c">" {{{1</span></div><div class='line' id='LC23'>&nbsp;&nbsp;<span class="k">if</span> type<span class="p">(</span>a:<span class="m">1</span><span class="p">)</span> <span class="p">==</span> type<span class="p">(</span><span class="m">1</span><span class="p">)</span> &amp;&amp; a:<span class="m">1</span></div><div class='line' id='LC24'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">=</span> <span class="m">1</span></div><div class='line' id='LC25'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> space <span class="p">=</span> <span class="s1">&#39; &#39;</span></div><div class='line' id='LC26'>&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">=</span> <span class="m">0</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> space <span class="p">=</span> <span class="s1">&#39;&#39;</span></div><div class='line' id='LC29'>&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC30'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> <span class="p">=</span> <span class="c">""</span></div><div class='line' id='LC31'>&nbsp;&nbsp;<span class="k">while</span> i <span class="p">&lt;</span> a:<span class="m">0</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> type<span class="p">(</span>a:<span class="m">000</span>[i]<span class="p">)</span> <span class="p">==</span> type<span class="p">(</span>[]<span class="p">)</span></div><div class='line' id='LC33'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">=</span> a:<span class="m">000</span>[i]</div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="k">j</span> <span class="p">=</span> <span class="m">0</span></div><div class='line' id='LC35'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">while</span> <span class="k">j</span> <span class="p">&lt;</span> len<span class="p">(</span><span class="nb">list</span><span class="p">)</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> escaped <span class="p">=</span> substitute<span class="p">(</span><span class="nb">list</span>[<span class="k">j</span>]<span class="p">,</span><span class="s1">&#39;[,&#39;</span>.space.<span class="s1">&#39;]\|\\[\,&#39;</span>.space.<span class="s1">&#39;]\@=&#39;</span><span class="p">,</span><span class="s1">&#39;\\&amp;&#39;</span><span class="p">,</span><span class="s1">&#39;g&#39;</span><span class="p">)</span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> .<span class="p">=</span> <span class="s1">&#39;,&#39;</span> . escaped</div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="k">j</span> <span class="p">+=</span> <span class="m">1</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endwhile</span></div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> .<span class="p">=</span> <span class="c">"," . a:000[i]</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">+=</span> <span class="m">1</span></div><div class='line' id='LC44'>&nbsp;&nbsp;<span class="k">endwhile</span></div><div class='line' id='LC45'>&nbsp;&nbsp;<span class="k">return</span> substitute<span class="p">(</span><span class="nb">path</span><span class="p">,</span><span class="s1">&#39;^,&#39;</span><span class="p">,</span><span class="s1">&#39;&#39;</span><span class="p">,</span><span class="s1">&#39;&#39;</span><span class="p">)</span></div><div class='line' id='LC46'><span class="k">endfunction</span> <span class="c">" }}}1</span></div><div class='line' id='LC47'><br/></div><div class='line' id='LC48'><span class="c">" Convert a list to a path with escaped spaces for &#39;path&#39;, &#39;tag&#39;, etc.</span></div><div class='line' id='LC49'><span class="k">function</span><span class="p">!</span> pathogen#legacyjoin<span class="p">(</span>...<span class="p">)</span> abort <span class="c">" {{{1</span></div><div class='line' id='LC50'>&nbsp;&nbsp;<span class="k">return</span> <span class="k">call</span><span class="p">(</span><span class="s1">&#39;pathogen#join&#39;</span><span class="p">,</span>[<span class="m">1</span>] <span class="p">+</span> a:<span class="m">000</span><span class="p">)</span></div><div class='line' id='LC51'><span class="k">endfunction</span> <span class="c">" }}}1</span></div><div class='line' id='LC52'><br/></div><div class='line' id='LC53'><span class="c">" Remove duplicates from a list.</span></div><div class='line' id='LC54'><span class="k">function</span><span class="p">!</span> pathogen#uniq<span class="p">(</span><span class="nb">list</span><span class="p">)</span> abort <span class="c">" {{{1</span></div><div class='line' id='LC55'>&nbsp;&nbsp;<span class="k">let</span> i <span class="p">=</span> <span class="m">0</span></div><div class='line' id='LC56'>&nbsp;&nbsp;<span class="k">let</span> seen <span class="p">=</span> {}</div><div class='line' id='LC57'>&nbsp;&nbsp;<span class="k">while</span> i <span class="p">&lt;</span> len<span class="p">(</span>a:<span class="nb">list</span><span class="p">)</span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> has_key<span class="p">(</span>seen<span class="p">,</span>a:<span class="nb">list</span>[i]<span class="p">)</span></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">call</span> remove<span class="p">(</span>a:<span class="nb">list</span><span class="p">,</span>i<span class="p">)</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> seen[a:<span class="nb">list</span>[i]] <span class="p">=</span> <span class="m">1</span></div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> i <span class="p">+=</span> <span class="m">1</span></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC64'>&nbsp;&nbsp;<span class="k">endwhile</span></div><div class='line' id='LC65'>&nbsp;&nbsp;<span class="k">return</span> a:<span class="nb">list</span></div><div class='line' id='LC66'><span class="k">endfunction</span> <span class="c">" }}}1</span></div><div class='line' id='LC67'><br/></div><div class='line' id='LC68'><span class="c">" \ on Windows unless shellslash is set, / everywhere else.</span></div><div class='line' id='LC69'><span class="k">function</span><span class="p">!</span> pathogen#separator<span class="p">()</span> abort <span class="c">" {{{1</span></div><div class='line' id='LC70'>&nbsp;&nbsp;<span class="k">return</span> <span class="p">!</span>exists<span class="p">(</span><span class="s2">"+shellslash"</span><span class="p">)</span> <span class="p">||</span> &amp;<span class="nb">shellslash</span> ? <span class="s1">&#39;/&#39;</span> : <span class="s1">&#39;\&#39;</span></div><div class='line' id='LC71'><span class="k">endfunction</span> <span class="c">" }}}1</span></div><div class='line' id='LC72'><br/></div><div class='line' id='LC73'><span class="c">" Convenience wrapper around glob() which returns a list.</span></div><div class='line' id='LC74'><span class="k">function</span><span class="p">!</span> pathogen#glob<span class="p">(</span>pattern<span class="p">)</span> abort <span class="c">" {{{1</span></div><div class='line' id='LC75'>&nbsp;&nbsp;<span class="k">let</span> <span class="k">files</span> <span class="p">=</span> split<span class="p">(</span>glob<span class="p">(</span>a:pattern<span class="p">),</span><span class="s2">"\n"</span><span class="p">)</span></div><div class='line' id='LC76'>&nbsp;&nbsp;<span class="k">return</span> map<span class="p">(</span><span class="k">files</span><span class="p">,</span><span class="s1">&#39;substitute(v:val,"[".pathogen#separator()."/]$","","")&#39;</span><span class="p">)</span></div><div class='line' id='LC77'><span class="k">endfunction</span> <span class="c">"}}}1</span></div><div class='line' id='LC78'><br/></div><div class='line' id='LC79'><span class="c">" Like pathogen#glob(), only limit the results to directories.</span></div><div class='line' id='LC80'><span class="k">function</span><span class="p">!</span> pathogen#glob_directories<span class="p">(</span>pattern<span class="p">)</span> abort <span class="c">" {{{1</span></div><div class='line' id='LC81'>&nbsp;&nbsp;<span class="k">return</span> filter<span class="p">(</span>pathogen#glob<span class="p">(</span>a:pattern<span class="p">),</span><span class="s1">&#39;isdirectory(v:val)&#39;</span><span class="p">)</span></div><div class='line' id='LC82'><span class="k">endfunction</span> <span class="c">"}}}1</span></div><div class='line' id='LC83'><br/></div><div class='line' id='LC84'><span class="c">" Prepend all subdirectories of path to the rtp, and append all after</span></div><div class='line' id='LC85'><span class="c">" directories in those subdirectories.</span></div><div class='line' id='LC86'><span class="k">function</span><span class="p">!</span> pathogen#runtime_prepend_subdirectories<span class="p">(</span><span class="nb">path</span><span class="p">)</span> <span class="c">" {{{1</span></div><div class='line' id='LC87'>&nbsp;&nbsp;<span class="k">let</span> sep    <span class="p">=</span> pathogen#separator<span class="p">()</span></div><div class='line' id='LC88'>&nbsp;&nbsp;<span class="k">let</span> before <span class="p">=</span> pathogen#glob_directories<span class="p">(</span>a:<span class="nb">path</span>.sep.<span class="s2">"*[^~]"</span><span class="p">)</span></div><div class='line' id='LC89'>&nbsp;&nbsp;<span class="k">let</span> after  <span class="p">=</span> pathogen#glob_directories<span class="p">(</span>a:<span class="nb">path</span>.sep.<span class="s2">"*[^~]"</span>.sep.<span class="s2">"after"</span><span class="p">)</span></div><div class='line' id='LC90'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">rtp</span> <span class="p">=</span> pathogen#split<span class="p">(</span>&amp;<span class="nb">rtp</span><span class="p">)</span></div><div class='line' id='LC91'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">path</span> <span class="p">=</span> expand<span class="p">(</span>a:<span class="nb">path</span><span class="p">)</span></div><div class='line' id='LC92'>&nbsp;&nbsp;<span class="k">call</span> filter<span class="p">(</span><span class="nb">rtp</span><span class="p">,</span><span class="s1">&#39;v:val[0:strlen(path)-1] !=# path&#39;</span><span class="p">)</span></div><div class='line' id='LC93'>&nbsp;&nbsp;<span class="k">let</span> &amp;<span class="nb">rtp</span> <span class="p">=</span> pathogen#<span class="k">join</span><span class="p">(</span>pathogen#uniq<span class="p">(</span>before <span class="p">+</span> <span class="nb">rtp</span> <span class="p">+</span> after<span class="p">))</span></div><div class='line' id='LC94'>&nbsp;&nbsp;<span class="k">return</span> &amp;<span class="nb">rtp</span></div><div class='line' id='LC95'><span class="k">endfunction</span> <span class="c">" }}}1</span></div><div class='line' id='LC96'><br/></div><div class='line' id='LC97'><span class="c">" For each directory in rtp, check for a subdirectory named dir.  If it</span></div><div class='line' id='LC98'><span class="c">" exists, add all subdirectories of that subdirectory to the rtp, immediately</span></div><div class='line' id='LC99'><span class="c">" after the original directory.  If no argument is given, &#39;bundle&#39; is used.</span></div><div class='line' id='LC100'><span class="c">" Repeated calls with the same arguments are ignored.</span></div><div class='line' id='LC101'><span class="k">function</span><span class="p">!</span> pathogen#runtime_append_all_bundles<span class="p">(</span>...<span class="p">)</span> <span class="c">" {{{1</span></div><div class='line' id='LC102'>&nbsp;&nbsp;<span class="k">let</span> sep <span class="p">=</span> pathogen#separator<span class="p">()</span></div><div class='line' id='LC103'>&nbsp;&nbsp;<span class="k">let</span> name <span class="p">=</span> a:<span class="m">0</span> ? a:<span class="m">1</span> : <span class="s1">&#39;bundle&#39;</span></div><div class='line' id='LC104'>&nbsp;&nbsp;<span class="k">if</span> <span class="c">"\n".s:done_bundles =~# "\\M\n".name."\n"</span></div><div class='line' id='LC105'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="c">""</span></div><div class='line' id='LC106'>&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC107'>&nbsp;&nbsp;<span class="k">let</span> s:done_bundles .<span class="p">=</span> name . <span class="c">"\n"</span></div><div class='line' id='LC108'>&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">=</span> []</div><div class='line' id='LC109'>&nbsp;&nbsp;<span class="k">for</span> <span class="nb">dir</span> <span class="k">in</span> pathogen#split<span class="p">(</span>&amp;<span class="nb">rtp</span><span class="p">)</span></div><div class='line' id='LC110'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="nb">dir</span> <span class="p">=~</span># <span class="s1">&#39;\&lt;after$&#39;</span></div><div class='line' id='LC111'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">+=</span>  pathogen#glob_directories<span class="p">(</span>substitute<span class="p">(</span><span class="nb">dir</span><span class="p">,</span><span class="s1">&#39;after$&#39;</span><span class="p">,</span>name<span class="p">,</span><span class="s1">&#39;&#39;</span><span class="p">)</span>.sep.<span class="s1">&#39;*[^~]&#39;</span>.sep.<span class="s1">&#39;after&#39;</span><span class="p">)</span> <span class="p">+</span> [<span class="nb">dir</span>]</div><div class='line' id='LC112'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">else</span></div><div class='line' id='LC113'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">let</span> <span class="nb">list</span> <span class="p">+=</span>  [<span class="nb">dir</span>] <span class="p">+</span> pathogen#glob_directories<span class="p">(</span><span class="nb">dir</span>.sep.name.sep.<span class="s1">&#39;*[^~]&#39;</span><span class="p">)</span></div><div class='line' id='LC114'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC115'>&nbsp;&nbsp;<span class="k">endfor</span></div><div class='line' id='LC116'>&nbsp;&nbsp;<span class="k">let</span> &amp;<span class="nb">rtp</span> <span class="p">=</span> pathogen#<span class="k">join</span><span class="p">(</span>pathogen#uniq<span class="p">(</span><span class="nb">list</span><span class="p">))</span></div><div class='line' id='LC117'>&nbsp;&nbsp;<span class="k">return</span> <span class="m">1</span></div><div class='line' id='LC118'><span class="k">endfunction</span></div><div class='line' id='LC119'><br/></div><div class='line' id='LC120'><span class="k">let</span> s:done_bundles <span class="p">=</span> <span class="s1">&#39;&#39;</span></div><div class='line' id='LC121'><span class="c">" }}}1</span></div><div class='line' id='LC122'><br/></div><div class='line' id='LC123'><span class="c">" Invoke :helptags on all non-$VIM doc directories in runtimepath.</span></div><div class='line' id='LC124'><span class="k">function</span><span class="p">!</span> pathogen#<span class="k">helptags</span><span class="p">()</span> <span class="c">" {{{1</span></div><div class='line' id='LC125'>&nbsp;&nbsp;<span class="k">for</span> <span class="nb">dir</span> <span class="k">in</span> pathogen#split<span class="p">(</span>&amp;<span class="nb">rtp</span><span class="p">)</span></div><div class='line' id='LC126'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="nb">dir</span>[<span class="m">0</span> : strlen<span class="p">(</span>$VIM<span class="p">)</span><span class="m">-1</span>] <span class="p">!=</span># $VIM &amp;&amp; isdirectory<span class="p">(</span><span class="nb">dir</span>.<span class="s1">&#39;/doc&#39;</span><span class="p">)</span> &amp;&amp; <span class="p">(!</span>filereadable<span class="p">(</span><span class="nb">dir</span>.<span class="s1">&#39;/doc/tags&#39;</span><span class="p">)</span> <span class="p">||</span> filewritable<span class="p">(</span><span class="nb">dir</span>.<span class="s1">&#39;/doc/tags&#39;</span><span class="p">))</span></div><div class='line' id='LC127'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">helptags</span> `<span class="p">=</span><span class="nb">dir</span>.<span class="s1">&#39;/doc&#39;</span>`</div><div class='line' id='LC128'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">endif</span></div><div class='line' id='LC129'>&nbsp;&nbsp;<span class="k">endfor</span></div><div class='line' id='LC130'><span class="k">endfunction</span> <span class="c">" }}}1</span></div><div class='line' id='LC131'><br/></div><div class='line' id='LC132'><span class="c">" vim:set ft=vim ts=8 sw=2 sts=2:</span></div><div class='line' id='LC133'><br/></div></pre></div>
            
          </td>
        </tr>
      </table>
    
  </div>


      </div>
    </div>

  


    </div>
  
      
    </div>

    <div id="footer" class="clearfix">
      <div class="site">
        <div class="sponsor">
          <a href="http://www.rackspace.com" class="logo">
            <img alt="Dedicated Server" src="http://assets2.github.com/images/modules/footer/rackspace_logo.png?v2?0260fd09e4addb5b7e5793ab932ea40995810234" />
          </a>
          Powered by the <a href="http://www.rackspace.com ">Dedicated
          Servers</a> and<br/> <a href="http://www.rackspacecloud.com">Cloud
          Computing</a> of Rackspace Hosting<span>&reg;</span>
        </div>

        <ul class="links">
          <li class="blog"><a href="http://github.com/blog">Blog</a></li>
          <li><a href="http://support.github.com">Support</a></li>
          <li><a href="http://github.com/training">Training</a></li>
          <li><a href="http://jobs.github.com">Job Board</a></li>
          <li><a href="http://shop.github.com">Shop</a></li>
          <li><a href="http://github.com/contact">Contact</a></li>
          <li><a href="http://develop.github.com">API</a></li>
          <li><a href="http://status.github.com">Status</a></li>
        </ul>
        <ul class="sosueme">
          <li class="main">&copy; 2010 <span id="_rrt" title="0.06510s from fe3.rs.github.com">GitHub</span> Inc. All rights reserved.</li>
          <li><a href="/site/terms">Terms of Service</a></li>
          <li><a href="/site/privacy">Privacy</a></li>
          <li><a href="http://github.com/security">Security</a></li>
        </ul>
      </div>
    </div><!-- /#footer -->

    
      
      
        <!-- current locale:  -->
        <div class="locales">
          <div class="site">

            <ul class="choices clearfix limited-locales">
              <li><span class="current">English</span></li>
              
                
                  <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=fr">Français</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=ru">Русский</a></li>
                
              
                
                  <li><a rel="nofollow" href="?locale=zh">中文</a></li>
                
              
              <li class="all"><a href="#" class="minibutton btn-forward js-all-locales"><span><span class="icon"></span>See all available languages</span></a></li>
            </ul>

            <div class="all-locales clearfix">
              <h3>Your current locale selection: <strong>English</strong>. Choose another?</h3>
              
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=en">English</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=af">Afrikaans</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=ca">Català</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=cs">Čeština</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=de">Deutsch</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=es">Español</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=fr">Français</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=hr">Hrvatski</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=id">Indonesia</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=it">Italiano</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=ja">日本語</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=nl">Nederlands</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=no">Norsk</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=pl">Polski</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=pt-BR">Português (BR)</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=ru">Русский</a></li>
                    
                  
                </ul>
              
                <ul class="choices">
                  
                    
                      <li><a rel="nofollow" href="?locale=sr">Српски</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=sv">Svenska</a></li>
                    
                  
                    
                      <li><a rel="nofollow" href="?locale=zh">中文</a></li>
                    
                  
                </ul>
              
            </div>

          </div>
          <div class="fade"></div>
        </div>
      
    

    <script>window._auth_token = "22dcef42e8bf83adba5798edcc4e99ec22357e6e"</script>
    <div id="keyboard_shortcuts_pane" style="display:none">
  <h2>Keyboard Shortcuts</h2>

  <div class="columns threecols">
    <div class="column first">
      <h3>Site wide shortcuts</h3>
      <dl class="keyboard-mappings">
        <dt>s</dt>
        <dd>Focus site search</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>?</dt>
        <dd>Bring up this help dialog</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column middle">
      <h3>Commit list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>t</dt>
        <dd>Open tree</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>p</dt>
        <dd>Open parent</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>c <em>or</em> o <em>or</em> enter</dt>
        <dd>Open commit</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column last">
      <h3>Pull request list</h3>
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
    </div><!-- /.columns.last -->
  </div><!-- /.columns.equacols -->

  <div class="rule"></div>

  <h3>Issues</h3>

  <div class="columns threecols">
    <div class="column first">
      <dl class="keyboard-mappings">
        <dt>j</dt>
        <dd>Move selected down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>k</dt>
        <dd>Move selected up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>x</dt>
        <dd>Toggle select target</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>o <em>or</em> enter</dt>
        <dd>Open issue</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column middle">
      <dl class="keyboard-mappings">
        <dt>I</dt>
        <dd>Mark selected as read</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>U</dt>
        <dd>Mark selected as unread</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>e</dt>
        <dd>Close selected</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>y</dt>
        <dd>Remove selected from view</dd>
      </dl>
    </div><!-- /.column.middle -->
    <div class="column last">
      <dl class="keyboard-mappings">
        <dt>c</dt>
        <dd>Create issue</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>l</dt>
        <dd>Create label</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>i</dt>
        <dd>Back to inbox</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>u</dt>
        <dd>Back to issues</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>/</dt>
        <dd>Focus issues search</dd>
      </dl>
    </div>
  </div>

  <div class="rule"></div>

  <h3>Network Graph</h3>
  <div class="columns equacols">
    <div class="column first">
      <dl class="keyboard-mappings">
        <dt>← <em>or</em> h</dt>
        <dd>Scroll left</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>→ <em>or</em> l</dt>
        <dd>Scroll right</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>↑ <em>or</em> k</dt>
        <dd>Scroll up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>↓ <em>or</em> j</dt>
        <dd>Scroll down</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>t</dt>
        <dd>Toggle visibility of head labels</dd>
      </dl>
    </div><!-- /.column.first -->
    <div class="column last">
      <dl class="keyboard-mappings">
        <dt>shift ← <em>or</em> shift h</dt>
        <dd>Scroll all the way left</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>shift → <em>or</em> shift l</dt>
        <dd>Scroll all the way right</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>shift ↑ <em>or</em> shift k</dt>
        <dd>Scroll all the way up</dd>
      </dl>
      <dl class="keyboard-mappings">
        <dt>shift ↓ <em>or</em> shift j</dt>
        <dd>Scroll all the way down</dd>
      </dl>
    </div><!-- /.column.last -->
  </div>

</div>
    

    <!--[if IE 8]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie8")
    </script>
    <![endif]-->

    <!--[if IE 7]>
    <script type="text/javascript" charset="utf-8">
      $(document.body).addClass("ie7")
    </script>
    <![endif]-->

    <script type="text/javascript">
      _kmq.push(['trackClick', 'entice-signup-button', 'Entice banner clicked']);
      
    </script>
    
  </body>
</html>

