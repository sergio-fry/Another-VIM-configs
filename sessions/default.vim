" ~/Dropbox/SQ/Home/.vim/sessions/default.vim: Vim session script.
" Created by session.vim 1.5 on 16 November 2012 at 18:11:15.
" Open this file in Vim and run :source % to restore your session.

set guioptions=aegimrLt
silent! set guifont=
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'xoria256' | colorscheme xoria256 | endif
call setqflist([{'lnum': 14, 'col': 28, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '               :columns => PgqPageCollector::STATUSES_NAMES.map{|k|k[1]}.map{|c| [c, "Количество для параметра #{c}"]},'}, {'lnum': 16, 'col': 26, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '               :data => [PgqPageCollector::STATUSES_NAMES.map{|k|k[0]}.map{|x| @tasks_online.find {|t| t.first == x}.try(:last) }],'}, {'lnum': 43, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/seo_collector/yap.rb', 'text': '        PgqPageCollector.send_new_page_to_title(page)'}, {'lnum': 103, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/seo_collector/pr.rb', 'text': '        PgqPageCollector.update_stat(''(lf) !yap,pr=0 destroyed'' => 1)'}, {'lnum': 108, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/seo_collector/pr.rb', 'text': '        PgqPageCollector.update_stat(''(lf) !yap,pr=0 leaved'' => 1)'}, {'lnum': 111, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/seo_collector/pr.rb', 'text': '      PgqPageCollector.update_stat(''(lf) !yap,pr=0 ok updated_pr'' => 1)'}, {'lnum': 35, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/seo_collector/gop.rb', 'text': '        PgqPageCollector.send_new_page_to_title(page)'}, {'lnum': 26, 'col': 5, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '    PgqPageCollector::QUEUE_NAME => PgqPageCollector,'}, {'lnum': 27, 'col': 5, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '    PgqPageCollector::QUEUE_NAME_1 => PgqPageCollector,'}, {'lnum': 27, 'col': 5, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '    PgqPageCollector::QUEUE_NAME_2 => PgqPageCollector,'}, {'lnum': 1, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': 'class PgqPageCollector < PgqSimpleConsumer'}, {'lnum': 148, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector::Stat.inc(k, v)'}, {'lnum': 183, 'col': 17, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '                PgqPageCollector.update_stat(''(lf) TRUST dont give page because only gop'' => 1)'}, {'lnum': 208, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) created'' => @created) if @created > 0'}, {'lnum': 209, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) updated (total)'' => @updated) if @updated > 0'}, {'lnum': 210, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) updated (yap)'' => @updated_yap) if @updated_yap > 0'}, {'lnum': 211, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) updated (gop)'' => @updated_gop) if @updated_gop > 0'}, {'lnum': 212, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) skipped (no places)'' => @skipped) if @skipped > 0'}, {'lnum': 213, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) page uri without page'' => @no_page) if @no_page > 0'}, {'lnum': 214, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) failed to create page, already exists'' => @failed_to_create) if @failed_to_create > 0'}, {'lnum': 216, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '      PgqPageCollector.update_stat(''(lf) platforms missing'' => 1)'}, {'lnum': 242, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '        PgqPageCollector.send_new_page_to_title page'}, {'lnum': 244, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '        PgqPageCollector.update_stat(''(lf) page created, but platform disapear'' => 1)'}, {'lnum': 361, 'col': 27, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/pgq/pgq_page_collector.rb', 'text': '    logger.error "failed: PgqPageCollector\##{event[''ev_type'']} failed: #{event} (#{ex.class}: #{ex.message})"'}, {'lnum': 448, 'col': 5, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/platform.rb', 'text': '    PgqPageCollector.update_stat(''(lf) destroyed pages'' => self.pages.count)'}, {'lnum': 32, 'col': 7, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/models/page_updater.rb', 'text': '      PgqPageCollector.update_stat(''(lf) destroyed pages'' => pages_destroyed.size)'}, {'lnum': 248, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/seo_collector/seo_collector_gop_spec.rb', 'text': '        PgqPageCollector.should_receive(:send_new_page_to_title).with(an_instance_of(Page))'}, {'lnum': 283, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/seo_collector/seo_collector_yap_spec.rb', 'text': '        PgqPageCollector.should_receive(:send_new_page_to_title).with(an_instance_of(Page))'}, {'lnum': 3, 'col': 10, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': 'describe PgqPageCollector do'}, {'lnum': 403, 'col': 19, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '      @consumer = PgqPageCollector.new("what''s that?")'}, {'lnum': 410, 'col': 33, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        events = [{''ev_type'' => PgqPageCollector::TYPE_AP, ''ev_data'' => @platform.id, ''ev_extra1'' => YAML.dump(links), ''ev_extra2'' => stats ? YAML.dump(stats) : nil}]'}, {'lnum': 551, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        PgqPageCollector.should_receive(:get_seo_stats_for_page).with(an_instance_of(Page))'}, {'lnum': 726, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        PgqPageCollector.get_seo_stats_for_page(@page)'}, {'lnum': 732, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        PgqPageCollector.get_seo_stats_for_page(@page)'}, {'lnum': 740, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        PgqPageCollector.get_seo_stats_for_page(@page)'}, {'lnum': 748, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        PgqPageCollector.get_seo_stats_for_page(@page)'}, {'lnum': 757, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        PgqPageCollector.get_seo_stats_for_page(@page)'}, {'lnum': 766, 'col': 9, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        PgqPageCollector.get_seo_stats_for_page(@page)'}, {'lnum': 771, 'col': 34, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/models/pgq/pgq_page_collector_spec.rb', 'text': '        @events = [{''ev_type'' => PgqPageCollector::TYPE_PCD, ''ev_data'' => @platform.id}.merge(m)]'}, {'lnum': 13, 'col': 56, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/miscs/pgq_spec.rb', 'text': '    InvokerPgq.queue_class(''page_collector'').should == PgqPageCollector'}, {'lnum': 14, 'col': 58, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/miscs/pgq_spec.rb', 'text': '    InvokerPgq.queue_class(''page_collector_1'').should == PgqPageCollector'}, {'lnum': 15, 'col': 58, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'spec/miscs/pgq_spec.rb', 'text': '    InvokerPgq.queue_class(''page_collector_2'').should == PgqPageCollector'}, {'lnum': 3, 'col': 41, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090907083421_add_second_page_collector_queue.rb', 'text': '    ActiveRecord::Base.pgq_create_queue(PgqPageCollector::QUEUE_NAME_2)'}, {'lnum': 4, 'col': 46, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090907083421_add_second_page_collector_queue.rb', 'text': '    ActiveRecord::Base.pgq_register_consumer(PgqPageCollector::QUEUE_NAME_2, InvokerPgq::PGQ_CONSUMER)'}, {'lnum': 8, 'col': 48, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090907083421_add_second_page_collector_queue.rb', 'text': '    ActiveRecord::Base.pgq_unregister_consumer(PgqPageCollector::QUEUE_NAME_2, InvokerPgq::PGQ_CONSUMER)'}, {'lnum': 9, 'col': 39, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090907083421_add_second_page_collector_queue.rb', 'text': '    ActiveRecord::Base.pgq_drop_queue(PgqPageCollector::QUEUE_NAME_2)'}, {'lnum': 18, 'col': 15, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091117121619_create_new_pgq_collectors_queues.rb', 'text': '    add_queue(PgqPageCollector::QUEUE_NAME)'}, {'lnum': 19, 'col': 15, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091117121619_create_new_pgq_collectors_queues.rb', 'text': '    add_queue(PgqPageCollector::QUEUE_NAME_2)'}, {'lnum': 27, 'col': 18, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091117121619_create_new_pgq_collectors_queues.rb', 'text': '    remove_queue(PgqPageCollector::QUEUE_NAME)'}, {'lnum': 28, 'col': 18, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091117121619_create_new_pgq_collectors_queues.rb', 'text': '    remove_queue(PgqPageCollector::QUEUE_NAME_2)'}, {'lnum': 3, 'col': 15, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091119103025_add_page_collector_queue1.rb', 'text': '    add_queue(PgqPageCollector::QUEUE_NAME_1)'}, {'lnum': 7, 'col': 18, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091119103025_add_page_collector_queue1.rb', 'text': '    remove_queue(PgqPageCollector::QUEUE_NAME_1)'}, {'lnum': 3, 'col': 18, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091123121258_drop_queues.rb', 'text': '    remove_queue(PgqPageCollector::QUEUE_NAME, ActiveRecord::Base)'}, {'lnum': 4, 'col': 18, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20091123121258_drop_queues.rb', 'text': '    remove_queue(PgqPageCollector::QUEUE_NAME_2, ActiveRecord::Base)'}, {'lnum': 3, 'col': 41, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090520063736_add_page_collector_queue_to_pgq.rb', 'text': '    ActiveRecord::Base.pgq_create_queue(PgqPageCollector::QUEUE_NAME)'}, {'lnum': 4, 'col': 46, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090520063736_add_page_collector_queue_to_pgq.rb', 'text': '    ActiveRecord::Base.pgq_register_consumer(PgqPageCollector::QUEUE_NAME, InvokerPgq::PGQ_CONSUMER)'}, {'lnum': 8, 'col': 48, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090520063736_add_page_collector_queue_to_pgq.rb', 'text': '    ActiveRecord::Base.pgq_unregister_consumer(PgqPageCollector::QUEUE_NAME, InvokerPgq::PGQ_CONSUMER)'}, {'lnum': 9, 'col': 39, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'db/migrate/20090520063736_add_page_collector_queue_to_pgq.rb', 'text': '    ActiveRecord::Base.pgq_drop_queue(PgqPageCollector::QUEUE_NAME)'}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Code/linkfeed
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +45 app/models/pgq/pgq_page_collector.rb
badd +1 spec/models/pgq/pgq_page_collector_spec.rb
args \[BufExplorer]
set lines=50 columns=185
edit spec/models/pgq/pgq_page_collector_spec.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 92 + 92) / 185)
exe 'vert 2resize ' . ((&columns * 92 + 92) / 185)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 284 - ((14 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
284
normal! 0
lcd ~/Code/linkfeed
wincmd w
argglobal
edit ~/Code/linkfeed/app/models/pgq/pgq_page_collector.rb
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 157 - ((23 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
157
normal! 08l
lcd ~/Code/linkfeed
wincmd w
exe 'vert 1resize ' . ((&columns * 92 + 92) / 185)
exe 'vert 2resize ' . ((&columns * 92 + 92) / 185)
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
tabnext 1
1wincmd w

" vim: ft=vim ro nowrap smc=128
