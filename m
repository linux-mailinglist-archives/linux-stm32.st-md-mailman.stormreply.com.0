Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGl/BIHod2mwmQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 23:19:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FE8DE64
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 23:19:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BAACAC36B13;
	Mon, 26 Jan 2026 22:19:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95313C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 22:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769465982; x=1801001982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MfG5mNjjM2G02N3+AWG0P0JkfwOAvfM7VEWe3256V5c=;
 b=logroeGZurHhURm6cbM0p2kIkx4gPp+cfK7Vf3hFFIooQlSWBT9oa8Zy
 tjK0KAuLdOlkBPGKy5fYGA5cponsW6bhHg3aE+VPHvkvLE70AXTgy7QbJ
 Zruhw2ztjxG+p9JIN13gWh48oKz7EBn4b5J2kdWooj1JTKK9hp/g8d9hY
 hXDXAF4e7WGsj6aiv75HYB4iDBeV29Jg48P5aQfeZ/pLQRvosmVsKr64R
 lSRofxK/eOp7dD5KRjfrcVQLHMl9YH4LoABcX20nDp5GO4UwYlhOabJFl
 mNb/NaRCFMZSAWqrKWwUcweRQcadfRNKiKkIiSv5HRVDBAApy02l1ElSq w==;
X-CSE-ConnectionGUID: Joq6myTcQxekyiDg9CfXIg==
X-CSE-MsgGUID: v0g8p3B1S5apr82iy9DkwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82020723"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="82020723"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 14:19:40 -0800
X-CSE-ConnectionGUID: g4hHWet8R1qn9oh1nF18gQ==
X-CSE-MsgGUID: tuyl5+JHQhyy8v27GXZOhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="245405233"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 14:19:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkUvl-00000000Xjy-2AbJ;
 Mon, 26 Jan 2026 22:19:33 +0000
Date: Tue, 27 Jan 2026 06:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <202601270652.AmCxSo3f-lkp@intel.com>
References: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vkL2I-00000005usu-42Hy@rmk-PC.armlinux.org.uk>
Cc: Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
 oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 08/22] net: stmmac: rk:
 convert rk3588 to mask-based interface mode config
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:netdev@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:edumazet@google.com,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[intel.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:mid,intel.com:email]
X-Rspamd-Queue-Id: 218FE8DE64
X-Rspamd-Action: no action

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-rk-avoid-phy_power_on/20260126-234820
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vkL2I-00000005usu-42Hy%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next v2 08/22] net: stmmac: rk: convert rk3588 to mask-based interface mode config
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601270652.AmCxSo3f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270652.AmCxSo3f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270652.AmCxSo3f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c: In function 'rk_write_gmac_grf_reg':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c:132:24: warning: variable 'regmap' set but not used [-Wunused-but-set-variable]
     132 |         struct regmap *regmap;
         |                        ^~~~~~


vim +/regmap +132 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

   129	
   130	static int rk_write_gmac_grf_reg(struct rk_priv_data *bsp_priv, u32 val)
   131	{
 > 132		struct regmap *regmap;
   133	
   134		if (bsp_priv->ops->gmac_grf_reg_in_php)
   135			regmap = bsp_priv->php_grf;
   136		else
   137			regmap = bsp_priv->grf;
   138	
   139		return regmap_write(bsp_priv->grf, bsp_priv->gmac_grf_reg, val);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
