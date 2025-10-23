Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E5EBFF14E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Oct 2025 06:16:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 048BEC5E2DF;
	Thu, 23 Oct 2025 04:16:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 824F3C5E2DD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 04:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761192978; x=1792728978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6qjfKhCFpW3nxPdf3q9ksCTq53TGoLVq65HUGLHWQeQ=;
 b=eJxa7ELblS6kUOxkWb2xvLggEqsWAag6cHZBLNRCO9adjbs6HS8YaQVE
 urx+T9IihnmfqU1R1K1UPj2Py0gxBu9uxAPnNki1ixxWzLDf53Mh67axd
 x0B02kiDRRPNqrZIeIVAuVGPeRqQVaowHlXLX2svePW6l4k7hqmVQcCBP
 1al3FoU5lKdjY6uTO4WSMiALzvMS2JLZ7eBnOvJOTB0rhVmOPV5vka3KE
 2SKB4z6PBApe9TzmZojl59bDTY6CKTsieLWhyUEdc3f3AlJftkfMn0CYJ
 08tVbL5Ssf05gMXV7jl3m1o/i8dlCCli3oYn08QLERj3MChoLCfqqTICc A==;
X-CSE-ConnectionGUID: 9crx3BUSS+uZo1+8oMm+yw==
X-CSE-MsgGUID: uqT8XlCGTzGqpJrNisjXDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63391915"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63391915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 21:16:16 -0700
X-CSE-ConnectionGUID: NVNLIeA3SvKuDnsRXMUh8w==
X-CSE-MsgGUID: cKr3VAJ2Q3OI8L/aitKNqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183945184"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa007.jf.intel.com with ESMTP; 22 Oct 2025 21:16:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vBmjU-000D0j-3C;
 Thu, 23 Oct 2025 04:15:34 +0000
Date: Thu, 23 Oct 2025 12:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <202510231127.UFDSOpIQ-lkp@intel.com>
References: <20251022071834.1658684-1-yingchao.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251022071834.1658684-1-yingchao.deng@oss.qualcomm.com>
Cc: linux-doc@vger.kernel.org, quic_yingdeng@quicinc.com,
 linux-kernel@vger.kernel.org, Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, oe-kbuild-all@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Subject: Re: [Linux-stm32] [PATCH v3] stm: class: Add MIPI OST protocol
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

Hi Yingchao,

kernel test robot noticed the following build errors:

[auto build test ERROR on atorgue-stm32/stm32-next]
[also build test ERROR on linus/master v6.18-rc2 next-20251022]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yingchao-Deng/stm-class-Add-MIPI-OST-protocol-support/20251022-152642
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20251022071834.1658684-1-yingchao.deng%40oss.qualcomm.com
patch subject: [PATCH v3] stm: class: Add MIPI OST protocol support
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251023/202510231127.UFDSOpIQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251023/202510231127.UFDSOpIQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510231127.UFDSOpIQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/stm/p_ost.c: In function 'ost_write':
>> drivers/hwtracing/stm/p_ost.c:201:27: error: implicit declaration of function 'task_tgid_nr' [-Wimplicit-function-declaration]
     201 |         hdr.tgid        = task_tgid_nr(current);
         |                           ^~~~~~~~~~~~
   drivers/hwtracing/stm/p_ost.c:172:13: warning: unused variable 'i' [-Wunused-variable]
     172 |         int i;
         |             ^


vim +/task_tgid_nr +201 drivers/hwtracing/stm/p_ost.c

   154	
   155	static ssize_t
   156	notrace ost_write(struct stm_data *data, struct stm_output *output,
   157			  unsigned int chan, const char *buf, size_t count,
   158			  struct stm_source_data *source)
   159	{
   160		unsigned int c = output->channel + chan;
   161		unsigned int m = output->master;
   162		const unsigned char nil = 0;
   163		u32 header = DATA_HEADER;
   164		struct trc_hdr {
   165			u16 version;
   166			u16 magic;
   167			u32 cpu;
   168			u64 timestamp;
   169			u64 tgid;
   170		} hdr;
   171		ssize_t sz;
   172		int i;
   173		struct ost_output *op = output->pdrv_private;
   174	
   175		/*
   176		 * Identify the source by entity type.
   177		 * If entity type is not set, return error value.
   178		 */
   179		if (op->node.entity_type)
   180			header |= ost_entity_value[op->node.entity_type];
   181		else
   182			return -EINVAL;
   183	
   184		/*
   185		 * STP framing rules for OST frames:
   186		 *   * the first packet of the OST frame is marked;
   187		 *   * the last packet is a FLAG with timestamped tag.
   188		 */
   189		/* Message layout: HEADER / DATA / TAIL */
   190		/* HEADER */
   191		sz = data->packet(data, m, c, STP_PACKET_DATA, STP_PACKET_MARKED,
   192				  4, (u8 *)&header);
   193		if (sz <= 0)
   194			return sz;
   195	
   196		/* DATA */
   197		hdr.version	= STM_MAKE_VERSION(0, 3);
   198		hdr.magic	= STM_HEADER_MAGIC;
   199		hdr.cpu		= raw_smp_processor_id();
   200		hdr.timestamp = sched_clock();
 > 201		hdr.tgid	= task_tgid_nr(current);
   202		sz = stm_data_write(data, m, c, false, &hdr, sizeof(hdr));
   203		if (sz <= 0)
   204			return sz;
   205	
   206		sz = stm_data_write(data, m, c, false, buf, count);
   207	
   208		/* TAIL */
   209		if (sz > 0)
   210			data->packet(data, m, c, STP_PACKET_FLAG,
   211				STP_PACKET_TIMESTAMPED, 0, &nil);
   212	
   213		return sz;
   214	}
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
