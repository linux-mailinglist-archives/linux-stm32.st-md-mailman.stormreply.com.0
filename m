Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F8A0A248
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Jan 2025 10:27:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2979FC78F75;
	Sat, 11 Jan 2025 09:27:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7388C78F71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jan 2025 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736587656; x=1768123656;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GOfrlgeXQrDZvxQihWPXR4B1GvTFhWoKCUJYDKzc80o=;
 b=e5YXsWbrBJg/Gk+rCDJ8Rfy3HhCmHpL8B8sG8Qf7N/cd+u6/avYcX9LO
 UyFj3pEobmOjdoTeqsXkxwEcz0NCSgsaP9GBJvi9C6EzTUoTqulRRaq0D
 YcwiKqRRvGeIzG2r56b7m+Fhcdaupz8tK+IOXiKBYFJRId0iLU4GMU2DX
 kPdhk3imQo1WN6N0QlH6WSxrD8fD5Q0eFXsc3nGXm3kDbW2CRUaGXQOCf
 7BmN7vgYN1rk7rmCbXH04H1PEWZkyDGi1RL0THrWcKZ8wJPeExF/WtVyf
 lQoc/ym/nnWsYTKFs10vsvMPcp4aVU2YYwhNdUD4LdpZitE1ofjw1Nk9b A==;
X-CSE-ConnectionGUID: nmSMbmb+SK+vApFb+AiRyg==
X-CSE-MsgGUID: aFbte7O1S/a3GB7BbO07fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36781798"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; d="scan'208";a="36781798"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2025 01:27:28 -0800
X-CSE-ConnectionGUID: 8HrRzHbrQYGz0eyCpnh0wg==
X-CSE-MsgGUID: +Y70tL11SF2QTds53BqZJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="108988526"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
 by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 01:27:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1tWXm5-000KQx-2U;
 Sat, 11 Jan 2025 09:27:21 +0000
Date: Sat, 11 Jan 2025 17:26:53 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Bruel <christian.bruel@foss.st.com>, vkoul@kernel.org,
 kishon@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, p.zabel@pengutronix.de,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com
Message-ID: <202501111758.hNwYV0yg-lkp@intel.com>
References: <20250110123356.974839-2-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250110123356.974839-2-christian.bruel@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH 1/1] phy: stm32: Optimize tuning values
	from DT.
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

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.13-rc6]
[also build test WARNING on linus/master next-20250110]
[cannot apply to atorgue-stm32/stm32-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Bruel/phy-stm32-Optimize-tuning-values-from-DT/20250110-203802
base:   v6.13-rc6
patch link:    https://lore.kernel.org/r/20250110123356.974839-2-christian.bruel%40foss.st.com
patch subject: [PATCH 1/1] phy: stm32: Optimize tuning values from DT.
config: hexagon-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111758.hNwYV0yg-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111758.hNwYV0yg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111758.hNwYV0yg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/phy/st/phy-stm32-combophy.c:250:35: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
                              SYSCFG_COMBOPHY_CR4_RX0_EQ, val);
                                                          ^~~
   drivers/phy/st/phy-stm32-combophy.c:165:40: note: initialize the variable 'val' to silence this warning
           u32 refclksel, pllmult, propcntrl, val;
                                                 ^
                                                  = 0
   1 warning generated.


vim +/val +250 drivers/phy/st/phy-stm32-combophy.c

47e1bb6b4ba098 Christian Bruel 2024-09-30  161  
47e1bb6b4ba098 Christian Bruel 2024-09-30  162  static int stm32_combophy_pll_init(struct stm32_combophy *combophy)
47e1bb6b4ba098 Christian Bruel 2024-09-30  163  {
47e1bb6b4ba098 Christian Bruel 2024-09-30  164  	int ret;
47e1bb6b4ba098 Christian Bruel 2024-09-30  165  	u32 refclksel, pllmult, propcntrl, val;
47e1bb6b4ba098 Christian Bruel 2024-09-30  166  	u32 clk_rate;
47e1bb6b4ba098 Christian Bruel 2024-09-30  167  	struct clk *clk;
47e1bb6b4ba098 Christian Bruel 2024-09-30  168  	u32 cr1_val = 0, cr1_mask = 0;
47e1bb6b4ba098 Christian Bruel 2024-09-30  169  
47e1bb6b4ba098 Christian Bruel 2024-09-30  170  	if (combophy->have_pad_clk)
47e1bb6b4ba098 Christian Bruel 2024-09-30  171  		clk = combophy->clks[PAD_CLK].clk;
47e1bb6b4ba098 Christian Bruel 2024-09-30  172  	else
47e1bb6b4ba098 Christian Bruel 2024-09-30  173  		clk = combophy->clks[KER_CLK].clk;
47e1bb6b4ba098 Christian Bruel 2024-09-30  174  
47e1bb6b4ba098 Christian Bruel 2024-09-30  175  	clk_rate = clk_get_rate(clk);
47e1bb6b4ba098 Christian Bruel 2024-09-30  176  
47e1bb6b4ba098 Christian Bruel 2024-09-30  177  	dev_dbg(combophy->dev, "%s pll init rate %d\n",
47e1bb6b4ba098 Christian Bruel 2024-09-30  178  		combophy->have_pad_clk ? "External" : "Ker", clk_rate);
47e1bb6b4ba098 Christian Bruel 2024-09-30  179  
47e1bb6b4ba098 Christian Bruel 2024-09-30  180  	if (combophy->type != PHY_TYPE_PCIE) {
47e1bb6b4ba098 Christian Bruel 2024-09-30  181  		cr1_mask |= SYSCFG_COMBOPHY_CR1_REFSSPEN;
47e1bb6b4ba098 Christian Bruel 2024-09-30  182  		cr1_val |= SYSCFG_COMBOPHY_CR1_REFSSPEN;
47e1bb6b4ba098 Christian Bruel 2024-09-30  183  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  184  
ce8b4a3e6b1975 Christian Bruel 2025-01-10  185  	if (combophy->have_ssc) {
47e1bb6b4ba098 Christian Bruel 2024-09-30  186  		dev_dbg(combophy->dev, "Enabling clock with SSC\n");
47e1bb6b4ba098 Christian Bruel 2024-09-30  187  		cr1_mask |= SYSCFG_COMBOPHY_CR1_SSCEN;
47e1bb6b4ba098 Christian Bruel 2024-09-30  188  		cr1_val |= SYSCFG_COMBOPHY_CR1_SSCEN;
47e1bb6b4ba098 Christian Bruel 2024-09-30  189  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  190  
47e1bb6b4ba098 Christian Bruel 2024-09-30  191  	switch (clk_rate) {
47e1bb6b4ba098 Christian Bruel 2024-09-30  192  	case 100000000:
47e1bb6b4ba098 Christian Bruel 2024-09-30  193  		pllmult = MPLLMULT_100;
47e1bb6b4ba098 Christian Bruel 2024-09-30  194  		refclksel = REFCLKSEL_0;
47e1bb6b4ba098 Christian Bruel 2024-09-30  195  		propcntrl = 0x8u << 4;
47e1bb6b4ba098 Christian Bruel 2024-09-30  196  		break;
47e1bb6b4ba098 Christian Bruel 2024-09-30  197  	case 19200000:
47e1bb6b4ba098 Christian Bruel 2024-09-30  198  		pllmult = MPLLMULT_19_2;
47e1bb6b4ba098 Christian Bruel 2024-09-30  199  		refclksel = REFCLKSEL_1;
47e1bb6b4ba098 Christian Bruel 2024-09-30  200  		propcntrl = 0x8u << 4;
47e1bb6b4ba098 Christian Bruel 2024-09-30  201  		break;
47e1bb6b4ba098 Christian Bruel 2024-09-30  202  	case 25000000:
47e1bb6b4ba098 Christian Bruel 2024-09-30  203  		pllmult = MPLLMULT_25;
47e1bb6b4ba098 Christian Bruel 2024-09-30  204  		refclksel = REFCLKSEL_0;
47e1bb6b4ba098 Christian Bruel 2024-09-30  205  		propcntrl = 0xeu << 4;
47e1bb6b4ba098 Christian Bruel 2024-09-30  206  		break;
47e1bb6b4ba098 Christian Bruel 2024-09-30  207  	case 24000000:
47e1bb6b4ba098 Christian Bruel 2024-09-30  208  		pllmult = MPLLMULT_24;
47e1bb6b4ba098 Christian Bruel 2024-09-30  209  		refclksel = REFCLKSEL_1;
47e1bb6b4ba098 Christian Bruel 2024-09-30  210  		propcntrl = 0xeu << 4;
47e1bb6b4ba098 Christian Bruel 2024-09-30  211  		break;
47e1bb6b4ba098 Christian Bruel 2024-09-30  212  	case 20000000:
47e1bb6b4ba098 Christian Bruel 2024-09-30  213  		pllmult = MPLLMULT_20;
47e1bb6b4ba098 Christian Bruel 2024-09-30  214  		refclksel = REFCLKSEL_0;
47e1bb6b4ba098 Christian Bruel 2024-09-30  215  		propcntrl = 0xeu << 4;
47e1bb6b4ba098 Christian Bruel 2024-09-30  216  		break;
47e1bb6b4ba098 Christian Bruel 2024-09-30  217  	default:
47e1bb6b4ba098 Christian Bruel 2024-09-30  218  		dev_err(combophy->dev, "Invalid rate 0x%x\n", clk_rate);
47e1bb6b4ba098 Christian Bruel 2024-09-30  219  		return -EINVAL;
e592a65584fce0 Yang Li         2024-10-17  220  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  221  
47e1bb6b4ba098 Christian Bruel 2024-09-30  222  	cr1_mask |= SYSCFG_COMBOPHY_CR1_REFCLKDIV2;
47e1bb6b4ba098 Christian Bruel 2024-09-30  223  	cr1_val |= REFCLDIV_0;
47e1bb6b4ba098 Christian Bruel 2024-09-30  224  
47e1bb6b4ba098 Christian Bruel 2024-09-30  225  	cr1_mask |= SYSCFG_COMBOPHY_CR1_REFCLKSEL;
47e1bb6b4ba098 Christian Bruel 2024-09-30  226  	cr1_val |= refclksel;
47e1bb6b4ba098 Christian Bruel 2024-09-30  227  
47e1bb6b4ba098 Christian Bruel 2024-09-30  228  	cr1_mask |= SYSCFG_COMBOPHY_CR1_MPLLMULT;
47e1bb6b4ba098 Christian Bruel 2024-09-30  229  	cr1_val |= pllmult;
47e1bb6b4ba098 Christian Bruel 2024-09-30  230  
47e1bb6b4ba098 Christian Bruel 2024-09-30  231  	/*
47e1bb6b4ba098 Christian Bruel 2024-09-30  232  	 * vddcombophy is interconnected with vddcore. Isolation bit should be unset
47e1bb6b4ba098 Christian Bruel 2024-09-30  233  	 * before using the ComboPHY.
47e1bb6b4ba098 Christian Bruel 2024-09-30  234  	 */
47e1bb6b4ba098 Christian Bruel 2024-09-30  235  	regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR2,
47e1bb6b4ba098 Christian Bruel 2024-09-30  236  			   SYSCFG_COMBOPHY_CR2_ISO_DIS, SYSCFG_COMBOPHY_CR2_ISO_DIS);
47e1bb6b4ba098 Christian Bruel 2024-09-30  237  
47e1bb6b4ba098 Christian Bruel 2024-09-30  238  	reset_control_assert(combophy->phy_reset);
47e1bb6b4ba098 Christian Bruel 2024-09-30  239  
47e1bb6b4ba098 Christian Bruel 2024-09-30  240  	if (combophy->type == PHY_TYPE_PCIE) {
ce8b4a3e6b1975 Christian Bruel 2025-01-10  241  		stm32_impedance_tune(combophy);
47e1bb6b4ba098 Christian Bruel 2024-09-30  242  
47e1bb6b4ba098 Christian Bruel 2024-09-30  243  		cr1_mask |= SYSCFG_COMBOPHY_CR1_REFUSEPAD;
47e1bb6b4ba098 Christian Bruel 2024-09-30  244  		cr1_val |= combophy->have_pad_clk ? SYSCFG_COMBOPHY_CR1_REFUSEPAD : 0;
47e1bb6b4ba098 Christian Bruel 2024-09-30  245  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  246  
ce8b4a3e6b1975 Christian Bruel 2025-01-10  247  	if (combophy->rx_eq != -1) {
ce8b4a3e6b1975 Christian Bruel 2025-01-10  248  		dev_dbg(combophy->dev, "Set RX equalizer %u\n", combophy->rx_eq);
47e1bb6b4ba098 Christian Bruel 2024-09-30  249  		regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR4,
47e1bb6b4ba098 Christian Bruel 2024-09-30 @250  			   SYSCFG_COMBOPHY_CR4_RX0_EQ, val);
47e1bb6b4ba098 Christian Bruel 2024-09-30  251  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  252  
47e1bb6b4ba098 Christian Bruel 2024-09-30  253  	regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR1, cr1_mask, cr1_val);
47e1bb6b4ba098 Christian Bruel 2024-09-30  254  
47e1bb6b4ba098 Christian Bruel 2024-09-30  255  	/*
47e1bb6b4ba098 Christian Bruel 2024-09-30  256  	 * Force elasticity buffer to be tuned for the reference clock as
47e1bb6b4ba098 Christian Bruel 2024-09-30  257  	 * the separated clock model is not supported
47e1bb6b4ba098 Christian Bruel 2024-09-30  258  	 */
47e1bb6b4ba098 Christian Bruel 2024-09-30  259  	regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR5,
47e1bb6b4ba098 Christian Bruel 2024-09-30  260  			   SYSCFG_COMBOPHY_CR5_COMMON_CLOCKS, SYSCFG_COMBOPHY_CR5_COMMON_CLOCKS);
47e1bb6b4ba098 Christian Bruel 2024-09-30  261  
47e1bb6b4ba098 Christian Bruel 2024-09-30  262  	reset_control_deassert(combophy->phy_reset);
47e1bb6b4ba098 Christian Bruel 2024-09-30  263  
47e1bb6b4ba098 Christian Bruel 2024-09-30  264  	ret = regmap_read_poll_timeout(combophy->regmap, SYSCFG_COMBOPHY_SR, val,
47e1bb6b4ba098 Christian Bruel 2024-09-30  265  				       !(val & STM32MP25_PIPE0_PHYSTATUS),
47e1bb6b4ba098 Christian Bruel 2024-09-30  266  				       10, 1000);
47e1bb6b4ba098 Christian Bruel 2024-09-30  267  	if (ret) {
47e1bb6b4ba098 Christian Bruel 2024-09-30  268  		dev_err(combophy->dev, "timeout, cannot lock PLL\n");
47e1bb6b4ba098 Christian Bruel 2024-09-30  269  		if (combophy->type == PHY_TYPE_PCIE && !combophy->have_pad_clk)
47e1bb6b4ba098 Christian Bruel 2024-09-30  270  			regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  271  					   STM32MP25_PCIEPRGCR_EN, 0);
47e1bb6b4ba098 Christian Bruel 2024-09-30  272  
47e1bb6b4ba098 Christian Bruel 2024-09-30  273  		if (combophy->type != PHY_TYPE_PCIE)
47e1bb6b4ba098 Christian Bruel 2024-09-30  274  			regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR1,
47e1bb6b4ba098 Christian Bruel 2024-09-30  275  					   SYSCFG_COMBOPHY_CR1_REFSSPEN, 0);
47e1bb6b4ba098 Christian Bruel 2024-09-30  276  
47e1bb6b4ba098 Christian Bruel 2024-09-30  277  		goto out;
47e1bb6b4ba098 Christian Bruel 2024-09-30  278  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  279  
47e1bb6b4ba098 Christian Bruel 2024-09-30  280  
47e1bb6b4ba098 Christian Bruel 2024-09-30  281  	if (combophy->type == PHY_TYPE_PCIE) {
47e1bb6b4ba098 Christian Bruel 2024-09-30  282  		if (!combophy->have_pad_clk)
47e1bb6b4ba098 Christian Bruel 2024-09-30  283  			regmap_update_bits(combophy->regmap, SYSCFG_PCIEPRGCR,
47e1bb6b4ba098 Christian Bruel 2024-09-30  284  					   STM32MP25_PCIEPRGCR_EN, STM32MP25_PCIEPRGCR_EN);
47e1bb6b4ba098 Christian Bruel 2024-09-30  285  
47e1bb6b4ba098 Christian Bruel 2024-09-30  286  		val = readl_relaxed(combophy->base + COMBOPHY_SUP_ANA_MPLL_LOOP_CTL);
47e1bb6b4ba098 Christian Bruel 2024-09-30  287  		val &= ~COMBOPHY_PROP_CNTRL;
47e1bb6b4ba098 Christian Bruel 2024-09-30  288  		val |= propcntrl;
47e1bb6b4ba098 Christian Bruel 2024-09-30  289  		writel_relaxed(val, combophy->base + COMBOPHY_SUP_ANA_MPLL_LOOP_CTL);
47e1bb6b4ba098 Christian Bruel 2024-09-30  290  	}
47e1bb6b4ba098 Christian Bruel 2024-09-30  291  
47e1bb6b4ba098 Christian Bruel 2024-09-30  292  	return 0;
47e1bb6b4ba098 Christian Bruel 2024-09-30  293  
47e1bb6b4ba098 Christian Bruel 2024-09-30  294  out:
47e1bb6b4ba098 Christian Bruel 2024-09-30  295  	regmap_update_bits(combophy->regmap, SYSCFG_COMBOPHY_CR2,
47e1bb6b4ba098 Christian Bruel 2024-09-30  296  			   SYSCFG_COMBOPHY_CR2_ISO_DIS, 0);
47e1bb6b4ba098 Christian Bruel 2024-09-30  297  
47e1bb6b4ba098 Christian Bruel 2024-09-30  298  	return ret;
47e1bb6b4ba098 Christian Bruel 2024-09-30  299  }
47e1bb6b4ba098 Christian Bruel 2024-09-30  300  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
