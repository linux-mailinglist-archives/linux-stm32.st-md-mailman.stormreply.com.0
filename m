Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF964C39BDF
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 10:06:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 907DCC36B3C;
	Thu,  6 Nov 2025 09:06:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C54C7C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762420010; x=1793956010;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=i3D2gBal5+YbLDjTq5ytrhJTTHuFXbJwZnfo0rk6QCQ=;
 b=Z05RICN8hRDHCbgAKwpIybaM2yVqvck79wES1/jtM0VHRDBmyxnSWGfI
 Paz6rPmXmSmwclYhCW6LwwHt7DK/wP4iKLwSRkKtTrgqclRVvUgs6Ak76
 rmdtgp94vlauVXyq/FmWBTiOMMXYsywEPnXbXAAXoniStsPz8u75Uuan2
 hC9RZrkROJ0bOrRSGnntrXRVjmRn7bKZ4JaOn/zmZ29AZDmxHdy1Cn7te
 cwNWbHEEruYGjbT3UmL9Zf5ZkU4N6Z3oThK0oa99Ja+k7Khutpmx5Vlrm
 XR9u38gjp3AgcJS7N/SKKqdjYjya9zme4NJ7LwjJB/m9rukILNBAIHGt5 g==;
X-CSE-ConnectionGUID: vtxL2pOaQ9u+s/YKneUAxA==
X-CSE-MsgGUID: gC3cs3DAThWMJZCJtXyVkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63562763"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="63562763"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:06:48 -0800
X-CSE-ConnectionGUID: 2/NgE5SQQ6eOREXwCKlqMw==
X-CSE-MsgGUID: zC1S65aLSVeEoNWP8khe0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="218366584"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
 by orviesa002.jf.intel.com with ESMTP; 06 Nov 2025 01:06:44 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1vGvx3-000Tha-2Z;
 Thu, 06 Nov 2025 09:06:41 +0000
Date: Thu, 6 Nov 2025 17:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <202511061640.PHWz6zWt-lkp@intel.com>
References: <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: ingenic:
 simplify x2000 mac_set_mode()
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-ingenic-move-ingenic_mac_init/20251106-015834
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vGdXJ-0000000CloA-3yVc%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 09/11] net: stmmac: ingenic: simplify x2000 mac_set_mode()
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20251106/202511061640.PHWz6zWt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061640.PHWz6zWt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061640.PHWz6zWt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:142:2: note: uninitialized use occurs here
     142 |         val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
         |         ^~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:9: note: remove the 'if' if its condition is always true
     128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:123:18: note: initialize the variable 'val' to silence this warning
     123 |         unsigned int val;
         |                         ^
         |                          = 0
   1 warning generated.


vim +128 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c

   118	
   119	static int x2000_mac_set_mode(struct plat_stmmacenet_data *plat_dat,
   120				      u8 phy_intf_sel)
   121	{
   122		struct ingenic_mac *mac = plat_dat->bsp_priv;
   123		unsigned int val;
   124	
   125		if (phy_intf_sel == PHY_INTF_SEL_RMII) {
   126			val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN) |
   127			      FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
 > 128		} else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
   129			if (mac->tx_delay == 0)
   130				val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_ORIGIN);
   131			else
   132				val = FIELD_PREP(MACPHYC_TX_SEL_MASK, MACPHYC_TX_SEL_DELAY) |
   133				      FIELD_PREP(MACPHYC_TX_DELAY_MASK, (mac->tx_delay + 9750) / 19500 - 1);
   134	
   135			if (mac->rx_delay == 0)
   136				val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_ORIGIN);
   137			else
   138				val |= FIELD_PREP(MACPHYC_RX_SEL_MASK, MACPHYC_RX_SEL_DELAY) |
   139					   FIELD_PREP(MACPHYC_RX_DELAY_MASK, (mac->rx_delay + 9750) / 19500 - 1);
   140		}
   141	
   142		val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
   143	
   144		/* Update MAC PHY control register */
   145		return regmap_update_bits(mac->regmap, 0, mac->soc_info->mask, val);
   146	}
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
