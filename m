Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 749AE6E8138
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Apr 2023 20:27:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1000DC6B461;
	Wed, 19 Apr 2023 18:27:26 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB46CC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Apr 2023 18:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681928843; x=1713464843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hMwknj2fnthEuseGk77ISBlfTv6f5/iv+yEnHLXoIAw=;
 b=MSwlw0Un/bwkm91A8zrtnDBZ83zks3HRNXLULcKgWZ+P0bPlOZnwPNqp
 rST7POG1D1Rrj0EpngJG7hpbNgsIitzBp89blAjjyqSpvBU84w0PAt9y5
 XaRck9vKwI0KvSoQQEH91i16ALa+eJFKkAtcM4KlzPgS4U8ooHPRyhVjJ
 WZ0OSBy4RcmVwnF2tuHPIy3JDgcK7lMU2F/a+pavm+6T3DR0ZauE8oSuW
 xj1qOFltO79BEUy/gC2paO6srxkuHKarM6M0Iflqvp5lEtT/TK9LGYU24
 iIP1hgoDjqnbW5WiwIi7mDOyCaJyp/bJXcR5ycvPPCC2qfvBrd2+bMsXH g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="410757550"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="410757550"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 11:26:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="937765285"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="937765285"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2023 11:26:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ppCVD-000f5y-2o;
 Wed, 19 Apr 2023 18:25:59 +0000
Date: Thu, 20 Apr 2023 02:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>
Message-ID: <202304200216.kvZgZcao-lkp@intel.com>
References: <20230419141328.37472-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230419141328.37472-1-quic_jinlmao@quicinc.com>
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mao Jinlong <quic_jinlmao@quicinc.com>, linux-kernel@vger.kernel.org,
 Tao Zhang <quic_taozha@quicinc.com>, oe-kbuild-all@lists.linux.dev,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, Hao Zhang <quic_hazha@quicinc.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] stm: class: Add MIPI OST protocol
	support
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Mao,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on linus/master v6.3-rc7 next-20230418]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/stm-class-Add-MIPI-OST-protocol-support/20230419-221653
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20230419141328.37472-1-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2] stm: class: Add MIPI OST protocol support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230420/202304200216.kvZgZcao-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/54db7d137859caf5a14de2b166d80913b0c80218
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mao-Jinlong/stm-class-Add-MIPI-OST-protocol-support/20230419-221653
        git checkout 54db7d137859caf5a14de2b166d80913b0c80218
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304200216.kvZgZcao-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/hwtracing/stm/p_ost.c: In function 'ost_write':
>> drivers/hwtracing/stm/p_ost.c:174:46: error: implicit declaration of function 'get_current'; did you mean 'get_cred'? [-Werror=implicit-function-declaration]
     174 |         *(u64 *)(trc_hdr + 8) = task_tgid_nr(get_current());
         |                                              ^~~~~~~~~~~
         |                                              get_cred
>> drivers/hwtracing/stm/p_ost.c:174:46: warning: passing argument 1 of 'task_tgid_nr' makes pointer from integer without a cast [-Wint-conversion]
     174 |         *(u64 *)(trc_hdr + 8) = task_tgid_nr(get_current());
         |                                              ^~~~~~~~~~~~~
         |                                              |
         |                                              int
   In file included from include/linux/sched/mm.h:7,
                    from include/linux/xarray.h:19,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/module.h:21,
                    from drivers/hwtracing/stm/p_ost.c:9:
   include/linux/sched.h:1582:54: note: expected 'struct task_struct *' but argument is of type 'int'
    1582 | static inline pid_t task_tgid_nr(struct task_struct *tsk)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +174 drivers/hwtracing/stm/p_ost.c

   131	
   132	static ssize_t notrace ost_write(struct stm_data *data,
   133			struct stm_output *output, unsigned int chan,
   134			const char *buf, size_t count)
   135	{
   136		unsigned int c = output->channel + chan;
   137		unsigned int m = output->master;
   138		const unsigned char nil = 0;
   139		u32 header = DATA_HEADER;
   140		u8 trc_hdr[16];
   141		ssize_t sz;
   142	
   143		struct ost_output *op = output->pdrv_private;
   144	
   145		/*
   146		 * Identify the source by entity type.
   147		 * If entity type is not set, return error value.
   148		 */
   149		if (op->node.entity_type == OST_ENTITY_TYPE_FTRACE) {
   150			header |= OST_ENTITY_FTRACE;
   151		} else if (op->node.entity_type == OST_ENTITY_TYPE_CONSOLE) {
   152			header |= OST_ENTITY_CONSOLE;
   153		} else {
   154			pr_debug("p_ost: Entity must be set for trace data.");
   155			return -EINVAL;
   156		}
   157	
   158		/*
   159		 * STP framing rules for OST frames:
   160		 *   * the first packet of the OST frame is marked;
   161		 *   * the last packet is a FLAG with timestamped tag.
   162		 */
   163		/* Message layout: HEADER / DATA / TAIL */
   164		/* HEADER */
   165		sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
   166				  4, (u8 *)&header);
   167		if (sz <= 0)
   168			return sz;
   169	
   170		/* DATA */
   171		*(u16 *)(trc_hdr) = STM_MAKE_VERSION(0, 4);
   172		*(u16 *)(trc_hdr + 2) = STM_HEADER_MAGIC;
   173		*(u32 *)(trc_hdr + 4) = raw_smp_processor_id();
 > 174		*(u64 *)(trc_hdr + 8) = task_tgid_nr(get_current());
   175		sz = stm_data_write(data, m, c, false, trc_hdr, sizeof(trc_hdr));
   176		if (sz <= 0)
   177			return sz;
   178	
   179		sz = stm_data_write(data, m, c, false, buf, count);
   180	
   181		/* TAIL */
   182		if (sz > 0)
   183			data->packet(data, m, c, STP_PACKET_FLAG,
   184				STP_PACKET_TIMESTAMPED, 0, &nil);
   185	
   186		return sz;
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
