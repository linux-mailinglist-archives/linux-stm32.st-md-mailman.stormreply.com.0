Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EF9AA0CC
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Oct 2024 13:05:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 237A3C78027;
	Tue, 22 Oct 2024 11:05:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96FDAC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 11:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729595148; x=1761131148;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lk6aSBgrBEc1NRKveTngB3JmIdfkK85pmGw8ldyXGEM=;
 b=RsQmbME5bxx16sYOL+Aw56LhbfijX1CAJzcC0thPyzzUvc9YvddV1teP
 twURUrVWLOJEyn1TK4CWOT0xcDJlDnpAyidOMeWgGwKeCYEpcjGmze6Sg
 BVL1UKw2WFPfZXEyTNaYFTGzc6VcZ8B43VGnx1a+SttROmtO/XCTvQYzb
 Ap6LVwBI5kSk6VUlV233Brh0akx4BbgbXnOxHqdtZenc4pIx5bZ/8EOBP
 FokR0ZficFey5Sov6w5zqUHr2M4KIvOLvVxcXxOWtP9VzN+H4Sd7ESH0K
 uHjU7AtU8mgTmkekBobR/SHEYX4wQDC2BasXA02bxnSmprUq6WmxplUWa g==;
X-CSE-ConnectionGUID: /dtXgHW+R/eVnkHHV0VFcg==
X-CSE-MsgGUID: x/A9CprmQRymxm9KweI+/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="29014479"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="29014479"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 04:05:40 -0700
X-CSE-ConnectionGUID: M5Fes5M9R4qe3m5f1zbR5Q==
X-CSE-MsgGUID: bsraSG9CSeiejIeei9+NFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79778327"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
 by orviesa010.jf.intel.com with ESMTP; 22 Oct 2024 04:05:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1t3Che-000TTS-2k;
 Tue, 22 Oct 2024 11:05:30 +0000
Date: Tue, 22 Oct 2024 19:04:36 +0800
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
Message-ID: <202410221853.0nt4WyvW-lkp@intel.com>
References: <20241021103617.653386-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021103617.653386-5-inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] net: stmmac: Add glue layer for
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
[also build test WARNING on sophgo/for-next sophgo/fixes net-next/main net/main linus/master v6.12-rc4 next-20241021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Inochi-Amaoto/dt-bindings-net-snps-dwmac-Add-dwmac-5-30a-version/20241021-184301
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241021103617.653386-5-inochiama%40gmail.com
patch subject: [PATCH 4/4] net: stmmac: Add glue layer for Sophgo SG2044 SoC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241022/202410221853.0nt4WyvW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410221853.0nt4WyvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410221853.0nt4WyvW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:41:2: warning: variable 'rate' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
      41 |         default:
         |         ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:46:36: note: uninitialized use occurs here
      46 |         ret = clk_set_rate(dwmac->clk_tx, rate);
         |                                           ^~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c:28:20: note: initialize the variable 'rate' to silence this warning
      28 |         unsigned long rate;
         |                           ^
         |                            = 0
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +/rate +41 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c

    24	
    25	static void sophgo_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
    26	{
    27		struct sophgo_dwmac *dwmac = priv;
    28		unsigned long rate;
    29		int ret;
    30	
    31		switch (speed) {
    32		case SPEED_1000:
    33			rate = 125000000;
    34			break;
    35		case SPEED_100:
    36			rate = 25000000;
    37			break;
    38		case SPEED_10:
    39			rate = 2500000;
    40			break;
  > 41		default:
    42			dev_err(dwmac->dev, "invalid speed %u\n", speed);
    43			break;
    44		}
    45	
    46		ret = clk_set_rate(dwmac->clk_tx, rate);
    47		if (ret)
    48			dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
