Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E7CB1DFE5
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Aug 2025 02:02:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DCDFC3F952;
	Fri,  8 Aug 2025 00:02:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23A73C3F951
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 00:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754611325; x=1786147325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OVvKRnCZPCkUikFXoenXFVKIrczw+FKb6AEftfO2P4w=;
 b=hVt4WbhKDE2dfpo7gNa1bSBduVhjsyF/i2MXrnwMLctFBnrkNSAo8Cnl
 gWphMN0Fvsh0yoQY7s83LOWOUEr7KriH3Htovu1kxPeovhC9+IlEXuQVo
 NLKAmDJhxL39NLJRSZijpMdw2wraVMAW4YA6JMWUS4isiEPv3GeaPWyi0
 0II5llXESdXBTRSxpguVhcf4yvUW+glRqxXxtxN3gihRE9B0pIAMxAyU1
 oWKiLk0pDBMQu0kOlwal+6kFWdNCPAzwcz94LcrRzGexdM7AfOb5DsLlb
 0HLbFNr8gKqzLJmS4IjNigw/ABEmflyD4tg2tE94FrkTVOH6W+Cf/TB3E w==;
X-CSE-ConnectionGUID: 8QMFHwRbQfiWtL7SG7ZEMA==
X-CSE-MsgGUID: EflOIbjwR/mDRGJju+z+uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74414985"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="74414985"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 17:02:00 -0700
X-CSE-ConnectionGUID: K9G9rRQIT+mYRaMSHQtB3w==
X-CSE-MsgGUID: q4VJ23B+QR6CUoOx9V79fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="202356501"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
 by orviesa001.jf.intel.com with ESMTP; 07 Aug 2025 17:01:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1ukAYS-0003NS-0k;
 Fri, 08 Aug 2025 00:01:52 +0000
Date: Fri, 8 Aug 2025 08:00:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, David Wu <david.wu@rock-chips.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <202508080746.BIDlKMy5-lkp@intel.com>
References: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ujwIY-007qKa-Ka@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: rk: put the PHY clock on
	remove
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

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rk-put-the-PHY-clock-on-remove/20250807-165054
base:   net/main
patch link:    https://lore.kernel.org/r/E1ujwIY-007qKa-Ka%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net] net: stmmac: rk: put the PHY clock on remove
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250808/202508080746.BIDlKMy5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080746.BIDlKMy5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080746.BIDlKMy5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:1774:6: error: use of undeclared identifier 'plat'
    1774 |         if (plat->phy_node && bsp_priv->integrated_phy)
         |             ^~~~
   1 error generated.


vim +/plat +1774 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

  1765	
  1766	static void rk_gmac_remove(struct platform_device *pdev)
  1767	{
  1768		struct rk_priv_data *bsp_priv = get_stmmac_bsp_priv(&pdev->dev);
  1769	
  1770		stmmac_dvr_remove(&pdev->dev);
  1771	
  1772		rk_gmac_powerdown(bsp_priv);
  1773	
> 1774		if (plat->phy_node && bsp_priv->integrated_phy)
  1775			clk_put(bsp_priv->clk_phy);
  1776	}
  1777	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
