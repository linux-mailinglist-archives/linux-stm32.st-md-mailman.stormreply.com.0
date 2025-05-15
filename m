Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 143F7AB7CCC
	for <lists+linux-stm32@lfdr.de>; Thu, 15 May 2025 07:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8460C7A843;
	Thu, 15 May 2025 05:04:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1ACF6C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 May 2025 05:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747285444; x=1778821444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=A1DT69l4hCTQvl+W6lgZGKWwC2Lyi1FbgKgW9qNW6d0=;
 b=Pf5guIUte5NLOVJ9Ku/bJNE4XEW2Uy2Q0tImzXkbiIkmlG4mq74qzPE2
 VjrgDxTNtVB5ekMC42KZUUwV8qvhGH58ObV4bt1IMb+HSyOgqrJvnouXc
 qXuoD4pBS4Y0mP+9nWpF8YDdyhzfPtm2B+8B4Z55bDUjaMWdJMRjhf3H9
 4MCEccVBqBC145BzrmGHlbl9xaAW9c8H+nPt4CwY/JAxpcLDUxcmK7qPW
 U9BuJnk3mtH+SCV/bRFvk46EKK0k8fh2Tp4TaQBvunxZ0vdMV8P4xwPXM
 R0HAOxzj5czbRhuHs7fS1OtxO0V4WritP4rXRCVx/FCsKdRYmyjcBEMP9 A==;
X-CSE-ConnectionGUID: 178SIgj0SQitHbqdlMa84w==
X-CSE-MsgGUID: IN2+ylJ0TNucxefpdWeOpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="66759272"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="66759272"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 22:04:02 -0700
X-CSE-ConnectionGUID: pHVw2Ts6Ta6UMMsXsSi9uQ==
X-CSE-MsgGUID: +zLoQS0sS7ia7mtfmnifEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138754815"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 22:03:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uFQl9-000Hwd-1P;
 Thu, 15 May 2025 05:03:55 +0000
Date: Thu, 15 May 2025 13:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>
Message-ID: <202505151255.rCHp8Bvu-lkp@intel.com>
References: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/2] clocksource/drivers/renesas-ostm:
 Unconditionally enable reprobe support
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

Hi Prabhakar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on robh/for-next linus/master v6.15-rc6 next-20250514]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/dt-bindings-timer-renesas-ostm-Document-RZ-V2N-R9A09G056-support/20250506-223636
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250506103152.109525-3-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [PATCH v3 2/2] clocksource/drivers/renesas-ostm: Unconditionally enable reprobe support
config: hexagon-randconfig-001-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151255.rCHp8Bvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151255.rCHp8Bvu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/renesas-ostm.c:235:34: warning: unused variable 'ostm_of_table' [-Wunused-const-variable]
     235 | static const struct of_device_id ostm_of_table[] = {
         |                                  ^~~~~~~~~~~~~
   1 warning generated.


vim +/ostm_of_table +235 drivers/clocksource/renesas-ostm.c

3a3e9f23c2cae9 Biju Das 2021-11-12  234  
3a3e9f23c2cae9 Biju Das 2021-11-12 @235  static const struct of_device_id ostm_of_table[] = {
3a3e9f23c2cae9 Biju Das 2021-11-12  236  	{ .compatible = "renesas,ostm", },
3a3e9f23c2cae9 Biju Das 2021-11-12  237  	{ /* sentinel */ }
3a3e9f23c2cae9 Biju Das 2021-11-12  238  };
3a3e9f23c2cae9 Biju Das 2021-11-12  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
