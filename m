Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D280A3DE
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Dec 2023 13:50:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38A6EC6A613;
	Fri,  8 Dec 2023 12:50:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44360C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Dec 2023 12:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702039845; x=1733575845;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UGoPSX9gu3BQBbTuzfM3M80+dAInuUmZwML4XJudxgY=;
 b=dWHQdmDzkJWD0e8MuaFk0ZscyEqcskNuoSOvVHXFj4Ukh6vBL0Kchd1Y
 YSnlAPSviwnOaty4+qVeNCRNbgI9SI/Q+shuoM09plciLlbBXKEaFoydF
 CGGg7nkXl3zsrMCeoHp+omMH9SUYgMq5qOdTE4RWTWNG2LnAAllB9wchW
 tfYszrTcoH+WrQDZgcs+8cigwJD4is43DxO2lE0p5Pi4ysZJjm5a/GX4g
 9CHU7cXDEE/WZ3zMFwunKd+1XzV6JdNS6ANq8iHjwMIsJIPsb8igaH/Zw
 6mdsg09CWrWRezrCyd5wIuOdH3vM4zXtDOhgzv5xg4HdH9QhHe87Yza6J g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460877614"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="460877614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 04:50:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="801108362"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="801108362"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 08 Dec 2023 04:50:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rBaJK-000Djb-1K;
 Fri, 08 Dec 2023 12:50:30 +0000
Date: Fri, 8 Dec 2023 20:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org,
 suzuki.poulose@arm.com
Message-ID: <202312082029.j4D5rwSe-lkp@intel.com>
References: <20231115162834.355598-1-james.clark@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231115162834.355598-1-james.clark@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, James Clark <james.clark@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v2] coresight: Make current W=1 warnings
	default
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

Hi James,

kernel test robot noticed the following build warnings:

[auto build test WARNING on atorgue-stm32/stm32-next]
[also build test WARNING on soc/for-next linus/master v6.7-rc4 next-20231208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Clark/coresight-Make-current-W-1-warnings-default/20231116-004818
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20231115162834.355598-1-james.clark%40arm.com
patch subject: [PATCH v2] coresight: Make current W=1 warnings default
config: arm-randconfig-r131-20231117 (https://download.01.org/0day-ci/archive/20231208/202312082029.j4D5rwSe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312082029.j4D5rwSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312082029.j4D5rwSe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-tpdm.c:242:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/hwtracing/coresight/coresight-tpdm.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/hwtracing/coresight/coresight-etb10.c:840:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/hwtracing/coresight/coresight-etb10.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/hwtracing/coresight/coresight-funnel.c:395:17: sparse: sparse: Using plain integer as NULL pointer
   drivers/hwtracing/coresight/coresight-funnel.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +242 drivers/hwtracing/coresight/coresight-tpdm.c

   232	
   233	/*
   234	 * Different TPDM has different periph id.
   235	 * The difference is 0-7 bits' value. So ignore 0-7 bits.
   236	 */
   237	static struct amba_id tpdm_ids[] = {
   238		{
   239			.id = 0x000f0e00,
   240			.mask = 0x000fff00,
   241		},
 > 242		{ 0, 0, 0 },
   243	};
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
