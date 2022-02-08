Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 359254AE31F
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Feb 2022 22:49:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D593BC5E2CC;
	Tue,  8 Feb 2022 21:49:20 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38127C57B6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Feb 2022 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644356959; x=1675892959;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2yTF4CDelmoVvKA+lxgQXMC3zxjRDLz1IzX04021fBU=;
 b=BOwg5aALhZSpfX5Rcaj6wDS5tkERa6mGeqUots/d9PqPGlORsafiIM5r
 51KBOYlkt6CPcnun8gtdodPtmOp1diDPfeJgu821M4xYVajcAHmMQEoZN
 kWmboyWFkDK/l5J1urVMiXYKUxNoSudPuuBujhTttY8dY6kecdMV67sDW
 if5eVzOjmwvhIVoTjoE2KtdLsirpyxS5VWAW16qejQzfUxRft8s8OaW5V
 bQk2BkExLGY9eLCPJsfN3169Ym1FOvR40VxIXX29mGpqnaV7wTRq3XkoF
 xZpBjY2MIig5t5kpj1dWZCDMVz/mGol7GDiEqWzsx76Fs84300gpJ8ub6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="273593949"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="273593949"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:49:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="536710481"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 08 Feb 2022 13:49:11 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nHYMI-0000me-A5; Tue, 08 Feb 2022 21:49:10 +0000
Date: Wed, 9 Feb 2022 05:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Carlos Bilbao <carlos.bilbao@amd.com>, john.stultz@linaro.org,
 tglx@linutronix.de, sboyd@kernel.org, alexandre.belloni@bootlin.com,
 gregkh@linuxfoundation.org
Message-ID: <202202090554.VWOt2B2w-lkp@intel.com>
References: <20220208161049.865402-1-carlos.bilbao@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220208161049.865402-1-carlos.bilbao@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-rtc@vger.kernel.org, jgross@suse.com, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, Carlos Bilbao <carlos.bilbao@amd.com>,
 linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, bilbao@vt.edu,
 boon.leong.ong@intel.com, linux-ia64@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, mhiramat@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] include: linux: Reorganize timekeeping
 and ktime headers
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

Hi Carlos,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on geert-m68k/for-next]
[also build test ERROR on tip/timers/core tip/x86/core linus/master v5.17-rc3]
[cannot apply to next-20220208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Carlos-Bilbao/include-linux-Reorganize-timekeeping-and-ktime-headers/20220209-001309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
config: m68k-randconfig-r024-20220208 (https://download.01.org/0day-ci/archive/20220209/202202090554.VWOt2B2w-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5ed7d76f2d6aabedc437bc0b99020dc655ab5719
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Carlos-Bilbao/include-linux-Reorganize-timekeeping-and-ktime-headers/20220209-001309
        git checkout 5ed7d76f2d6aabedc437bc0b99020dc655ab5719
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/m68k/68000/timers.c: In function 'hw_tick':
>> arch/m68k/68000/timers.c:64:9: error: implicit declaration of function 'legacy_timer_tick' [-Werror=implicit-function-declaration]
      64 |         legacy_timer_tick(1);
         |         ^~~~~~~~~~~~~~~~~
   arch/m68k/68000/timers.c: At top level:
   arch/m68k/68000/timers.c:120:5: warning: no previous prototype for 'm68328_hwclk' [-Wmissing-prototypes]
     120 | int m68328_hwclk(int set, struct rtc_time *t)
         |     ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/legacy_timer_tick +64 arch/m68k/68000/timers.c

36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  57  
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  58  static irqreturn_t hw_tick(int irq, void *dummy)
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  59  {
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  60  	/* Reset Timer1 */
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  61  	TSTAT &= 0;
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  62  
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  63  	m68328_tick_cnt += TICKS_PER_JIFFY;
09323308f63708 arch/m68k/68000/timers.c               Arnd Bergmann 2020-09-24 @64  	legacy_timer_tick(1);
09323308f63708 arch/m68k/68000/timers.c               Arnd Bergmann 2020-09-24  65  	return IRQ_HANDLED;
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  66  }
36a90f26aa24c5 arch/m68knommu/platform/68328/timers.c Greg Ungerer  2008-02-01  67  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
