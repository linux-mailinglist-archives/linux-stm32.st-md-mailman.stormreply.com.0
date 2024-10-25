Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CA59B05F0
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 16:37:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41F4AC7801C;
	Fri, 25 Oct 2024 14:37:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC898C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 14:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729867043; x=1761403043;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wBK4Q5W4WJLNTzG1NF53EifkW/90VdiVn34zzoNQPnk=;
 b=OX6jlmUyIA/P0pnECygr6wG/NIHI4dpW4Ees7EPUTtSUIsVh+NzEciCl
 Ts6vLcJfkvwOWqcOHvgJtYF+zcNRI+sX+izTWhbcGU/SFeGGjg2aLLSRE
 X+p1rK7q3kNzLNsZELdXJWtP04eUiG9RIvjWyZpNjre+n9TG+FqLer5xP
 f0hlzHq5BSW57Xsoswj+8noUKcnVcLKH/ZcOoZZJJbZ92cv75ZLP9y9EX
 pplOBzFUhYwPmsSnTqDizwKW1Li5N+ibTUMHUaYsD/AFtcT3XsaJQynO+
 Y7PtBOpoP5zQLRx6H22M2IzsatBYHnb12uWA1BxqdRMpTfTYDtlVLJusi g==;
X-CSE-ConnectionGUID: af9NcPvfTv+4iKbqG+pcJA==
X-CSE-MsgGUID: lcwFnhiUQFqY2rLESZuoNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="47021778"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="47021778"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 07:37:15 -0700
X-CSE-ConnectionGUID: bCV38PoTTeCmNINXGqmYRA==
X-CSE-MsgGUID: j5RovBWzSgW+deRdUluG6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="85699443"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 07:37:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t4LR4-000YMs-0J;
 Fri, 25 Oct 2024 14:37:06 +0000
Date: Fri, 25 Oct 2024 22:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Message-ID: <202410252215.79396yyg-lkp@intel.com>
References: <20241025011000.244350-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241025011000.244350-5-inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, oe-kbuild-all@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/4] net: stmmac: Add glue layer for
	Sophgo SG2044 SoC
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

Hi Inochi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on sophgo/for-next sophgo/fixes net-next/main net/main linus/master v6.12-rc4 next-20241025]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-net-snps-dwmac-Add-dwmac-5-30a-version/20241025-091315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241025011000.244350-5-inochiama%40gmail.com
patch subject: [PATCH v2 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20241025/202410252215.79396yyg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410252215.79396yyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410252215.79396yyg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_dwmac_fix_mac_speed':
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:30:16: error: implicit declaration of function 'rgmii_clock' [-Werror=implicit-function-declaration]
      30 |         rate = rgmii_clock(speed);
         |                ^~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_sg2044_dwmac_init':
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:46:13: warning: unused variable 'ret' [-Wunused-variable]
      46 |         int ret;
         |             ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c: In function 'sophgo_dwmac_fix_mac_speed':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:31:12: warning: 'ret' is used uninitialized [-Wuninitialized]
      31 |         if (ret < 0) {
         |            ^
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:28:13: note: 'ret' was declared here
      28 |         int ret;
         |             ^~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +/ret +31 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

    23	
    24	static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
    25	{
    26		struct sophgo_dwmac *dwmac = priv;
    27		long rate;
    28		int ret;
    29	
    30		rate = rgmii_clock(speed);
  > 31		if (ret < 0) {
    32			dev_err(dwmac->dev, "invalid speed %u\n", speed);
    33			return;
    34		}
    35	
    36		ret = clk_set_rate(dwmac->clk_tx, rate);
    37		if (ret)
    38			dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
