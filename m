Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020F7873C8
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Aug 2023 17:15:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46A2BC6B454;
	Thu, 24 Aug 2023 15:15:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6A5EC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 15:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692890111; x=1724426111;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j3s15fzbY21jU7a4dXxI63BSMfPORjJ31zoaNT3reHQ=;
 b=TNSOgWJb8DTMxZH3CjkSNS398S3ENfgLwsSiFLBrku8NZveypTO4rPGu
 hT3MgK770QXJZPz1TeAZVPZgLfjOh2c+ivzeIMEsBjpl1ZXRwUjNnoxKo
 W51dWWUNuJFiF6GdCj+3RV7YGuTCY6L1qzzDHxQyUhaqxVZ+2DYaKt4P9
 N8nB/5zIEgIkz5QRt9OaNZ+67sFz9NbmEZ7NmNWpczuYGY76MMktzM5GM
 82j5dJDpQUD21o8XmKjoRspnYGI6Pc1Y/p2fK9VBPBxMrPlsQNKgjZT1L
 7riVDI+SqUSFbcLR2PGTwpi/OEEZspra92e5HQQMHBrmgjHay8AMhgGTP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="374433214"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; d="scan'208";a="374433214"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 08:07:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="880838364"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2023 08:06:58 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qZBv5-0002me-0p;
 Thu, 24 Aug 2023 15:06:49 +0000
Date: Thu, 24 Aug 2023 23:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <202308242250.G39QxvdR-lkp@intel.com>
References: <20230820120213.2054-4-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230820120213.2054-4-jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/3] net: stmmac: add glue layer
 for T-HEAD TH1520 SoC
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

Hi Jisheng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dt-bindings-net-snps-dwmac-allow-dwmac-3-70a-to-set-pbl-properties/20230821-114902
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230820120213.2054-4-jszhang%40kernel.org
patch subject: [PATCH net-next 3/3] net: stmmac: add glue layer for T-HEAD TH1520 SoC
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230824/202308242250.G39QxvdR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308242250.G39QxvdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308242250.G39QxvdR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:151:3: warning: variable 'div' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     151 |                 default:
         |                 ^~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:156:50: note: uninitialized use occurs here
     156 |                                    GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
         |                                                                              ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:40:68: note: expanded from macro 'GMAC_PLLCLK_DIV_NUM'
      40 | #define  GMAC_PLLCLK_DIV_NUM(x)         FIELD_PREP(GMAC_PLLCLK_DIV_MASK, (x))
         |                                                                           ^
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
     114 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                                               ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
      68 |                 BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
         |                                                       ^~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:397:22: note: expanded from macro 'compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^~~~~~~~~
   include/linux/compiler_types.h:385:23: note: expanded from macro '_compiletime_assert'
     385 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^~~~~~~~~
   include/linux/compiler_types.h:377:9: note: expanded from macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:121:9: note: initialize the variable 'div' to silence this warning
     121 |         u32 div;
         |                ^
         |                 = 0
   1 warning generated.


vim +/div +151 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

   115	
   116	static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
   117	{
   118		struct thead_dwmac *dwmac = priv;
   119		struct plat_stmmacenet_data *plat = dwmac->plat;
   120		unsigned long rate;
   121		u32 div;
   122	
   123		switch (plat->interface) {
   124		/* For MII, rxc/txc is provided by phy */
   125		case PHY_INTERFACE_MODE_MII:
   126			return;
   127	
   128		case PHY_INTERFACE_MODE_RGMII:
   129		case PHY_INTERFACE_MODE_RGMII_ID:
   130		case PHY_INTERFACE_MODE_RGMII_RXID:
   131		case PHY_INTERFACE_MODE_RGMII_TXID:
   132			rate = clk_get_rate(plat->stmmac_clk);
   133			if (!rate || rate % GMAC_GMII_RGMII_RATE != 0 ||
   134			    rate % GMAC_MII_RATE != 0) {
   135				dev_err(dwmac->dev, "invalid gmac rate %ld\n", rate);
   136				return;
   137			}
   138	
   139			regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV, GMAC_PLLCLK_DIV_EN, 0);
   140	
   141			switch (speed) {
   142			case SPEED_1000:
   143				div = rate / GMAC_GMII_RGMII_RATE;
   144				break;
   145			case SPEED_100:
   146				div = rate / GMAC_MII_RATE;
   147				break;
   148			case SPEED_10:
   149				div = rate * 10 / GMAC_MII_RATE;
   150				break;
 > 151			default:
   152				dev_err(dwmac->dev, "invalid speed %u\n", speed);
   153				break;
   154			}
   155			regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
   156					   GMAC_PLLCLK_DIV_MASK, GMAC_PLLCLK_DIV_NUM(div));
   157	
   158			regmap_update_bits(dwmac->apb_regmap, GMAC_PLLCLK_DIV,
   159					   GMAC_PLLCLK_DIV_EN, GMAC_PLLCLK_DIV_EN);
   160			break;
   161		default:
   162			dev_err(dwmac->dev, "unsupported phy interface %d\n",
   163				plat->interface);
   164			return;
   165		}
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
