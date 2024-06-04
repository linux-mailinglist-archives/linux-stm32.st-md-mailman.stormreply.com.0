Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C78F08FBC02
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jun 2024 21:01:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BB90C6B444;
	Tue,  4 Jun 2024 19:01:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B933FC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jun 2024 19:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717527675; x=1749063675;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RqzDd6PqyNpUbR3KegZSUVXG8pajX9LJcIatMv0cgDU=;
 b=TfXesN9QSkDQ1CbuHw3Rbqbfx5Cw6SLaUQ+FETv3UT+9lE8gMAF712jV
 d0bNplaM8sOo0gHWI9mp/MzgcADetDTbpI+BVN+dWYWgqhRl+DdnfHmzN
 impNBAl5AWKFg+SdFBY54wBGHyDvY3qpY5iS5ySsv1DKR3CZpj6SpAZB4
 vFwTbefKxIMbTpj3KPckpt1ibpnkPf5rBGaWY1yUtsy7+m525T4b0/hUH
 +g0u968ewKNuk10GkZQIzufzzrNoPwTrXFc7YBGvkeP/2BWuCHt7l51Wu
 7jhhxiXvAxzaRYAYYvHvm3lwB8PjTdemjuu8vYhMRuYVkccu5+41jX/K1 Q==;
X-CSE-ConnectionGUID: dsL6/foaQkuXJfqUrAQgiw==
X-CSE-MsgGUID: jzYYDgVITpKJWxfh4zqFSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="11903038"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="11903038"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 12:01:07 -0700
X-CSE-ConnectionGUID: iY0xvanZRzqrvzsDJnXbdg==
X-CSE-MsgGUID: sth1H5/sS2yVeM9gjrFlaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="68149973"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 04 Jun 2024 12:01:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sEZP0-0000Pz-2Y;
 Tue, 04 Jun 2024 19:00:58 +0000
Date: Wed, 5 Jun 2024 03:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marek Vasut <marex@denx.de>
Message-ID: <202406050248.rGgTkevY-lkp@intel.com>
References: <20240604143502.154463-8-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240604143502.154463-8-christophe.roullier@foss.st.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 07/11] net: ethernet: stmmac: add
 management of stm32mp13 for stm32
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

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cd0057ad75116bacf16fea82e48c1db642971136]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Roullier/dt-bindings-net-add-STM32MP13-compatible-in-documentation-for-stm32/20240604-224324
base:   cd0057ad75116bacf16fea82e48c1db642971136
patch link:    https://lore.kernel.org/r/20240604143502.154463-8-christophe.roullier%40foss.st.com
patch subject: [PATCH v4 07/11] net: ethernet: stmmac: add management of stm32mp13 for stm32
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240605/202406050248.rGgTkevY-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050248.rGgTkevY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050248.rGgTkevY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:239:4: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
                           val |= SYSCFG_PMCR_ETH_SEL_MII;
                           ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:228:9: note: initialize the variable 'val' to silence this warning
           int val;
                  ^
                   = 0
   1 warning generated.


vim +/val +239 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c

   223	
   224	static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
   225	{
   226		struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
   227		u32 reg = dwmac->mode_reg;
   228		int val;
   229	
   230		switch (plat_dat->mac_interface) {
   231		case PHY_INTERFACE_MODE_MII:
   232			/*
   233			 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
   234			 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
   235			 * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
   236			 * supports only MII, ETH_SELMII is not present.
   237			 */
   238			if (!dwmac->is_mp13)	/* Select MII mode on STM32MP15xx */
 > 239				val |= SYSCFG_PMCR_ETH_SEL_MII;
   240			break;
   241		case PHY_INTERFACE_MODE_GMII:
   242			val = SYSCFG_PMCR_ETH_SEL_GMII;
   243			if (dwmac->enable_eth_ck)
   244				val |= SYSCFG_PMCR_ETH_CLK_SEL;
   245			break;
   246		case PHY_INTERFACE_MODE_RMII:
   247			val = SYSCFG_PMCR_ETH_SEL_RMII;
   248			if (dwmac->enable_eth_ck)
   249				val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
   250			break;
   251		case PHY_INTERFACE_MODE_RGMII:
   252		case PHY_INTERFACE_MODE_RGMII_ID:
   253		case PHY_INTERFACE_MODE_RGMII_RXID:
   254		case PHY_INTERFACE_MODE_RGMII_TXID:
   255			val = SYSCFG_PMCR_ETH_SEL_RGMII;
   256			if (dwmac->enable_eth_ck)
   257				val |= SYSCFG_PMCR_ETH_CLK_SEL;
   258			break;
   259		default:
   260			dev_err(dwmac->dev, "Mode %s not supported",
   261				phy_modes(plat_dat->mac_interface));
   262			/* Do not manage others interfaces */
   263			return -EINVAL;
   264		}
   265	
   266		dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
   267	
   268		/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
   269		val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
   270	
   271		/* Need to update PMCCLRR (clear register) */
   272		regmap_write(dwmac->regmap, dwmac->ops->syscfg_clr_off,
   273			     dwmac->mode_mask);
   274	
   275		/* Update PMCSETR (set register) */
   276		return regmap_update_bits(dwmac->regmap, reg,
   277					 dwmac->mode_mask, val);
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
