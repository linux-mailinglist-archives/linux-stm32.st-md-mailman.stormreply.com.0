Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DZ/Eim8d2l8kgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 20:10:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4298C606
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 20:10:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A304C87EDB;
	Mon, 26 Jan 2026 19:10:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80061C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769454631; x=1800990631;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y8WZa5lTxZhinaJ1vI22gqo62u2Mkl4bP9hj4eR0CVE=;
 b=mWrTb06nDpL12KDBClKnvS6gJEGlOBWX4W22bLMcUB2ayDUgIUOka80K
 FAQ3YqgmKOhqJ+An/nj11z2F2lq0gJ2qZWo4AixDzuywZe88Sqa/P6S8l
 qTiUzA6m+/dB3QDTgTksJ1VWpjK/gkk7s19tcLKzRtAAVtpX1vlLVglb3
 3r7usjwZPw8GVz1wIaC/B2b2fkoJvUrgO/M+tiurzsEuH5LfsW/HElxLb
 aGgabYC0Xl4xZLPKqhxMSMdBAYTHz78RxmZkbIjWh3wcD3x7Re7i7Psfo
 mFcnKjSNNBVDV6VZpv55CKJPZMOWqkVd9bxJ4puDcNKcBdbxudchsV9KC A==;
X-CSE-ConnectionGUID: RBkuIbR2RGW1MRAhgqfupw==
X-CSE-MsgGUID: oktdFLQpSSaXA+YkWcRmew==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58212094"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="58212094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 11:10:29 -0800
X-CSE-ConnectionGUID: JQZN/nleR1mKrX8NgdsnHw==
X-CSE-MsgGUID: 9Fr2sKWUTraXYXXumoWrtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="212217771"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2026 11:10:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkRyh-00000000Xbu-3oiy;
 Mon, 26 Jan 2026 19:10:23 +0000
Date: Tue, 27 Jan 2026 03:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <202601270336.BzkH3lDa-lkp@intel.com>
References: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: report active PHY
	interface
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
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:edumazet@google.com,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,01.org:url,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 8B4298C606
X-Rspamd-Action: no action

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-report-active-PHY-interface/20260126-201908
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vkLXO-00000005uxQ-31ZV%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next] net: stmmac: report active PHY interface
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601270336.BzkH3lDa-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270336.BzkH3lDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270336.BzkH3lDa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:41:10: warning: 'PHY_INTF_RGMII' redefined
      41 | #define  PHY_INTF_RGMII                 FIELD_PREP(PHY_INTF_MASK, 1)
         |          ^~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/stmicro/stmmac/stmmac.h:20,
                    from drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h:12,
                    from drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:17:
   drivers/net/ethernet/stmicro/stmmac/common.h:328:9: note: this is the location of the previous definition
     328 | #define PHY_INTF_RGMII          1
         |         ^~~~~~~~~~~~~~


vim +/PHY_INTF_RGMII +41 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

33a1a01e3afa72 Jisheng Zhang 2024-11-03  18  
33a1a01e3afa72 Jisheng Zhang 2024-11-03  19  #define GMAC_CLK_EN			0x00
33a1a01e3afa72 Jisheng Zhang 2024-11-03  20  #define  GMAC_TX_CLK_EN			BIT(1)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  21  #define  GMAC_TX_CLK_N_EN		BIT(2)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  22  #define  GMAC_TX_CLK_OUT_EN		BIT(3)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  23  #define  GMAC_RX_CLK_EN			BIT(4)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  24  #define  GMAC_RX_CLK_N_EN		BIT(5)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  25  #define  GMAC_EPHY_REF_CLK_EN		BIT(6)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  26  #define GMAC_RXCLK_DELAY_CTRL		0x04
33a1a01e3afa72 Jisheng Zhang 2024-11-03  27  #define  GMAC_RXCLK_BYPASS		BIT(15)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  28  #define  GMAC_RXCLK_INVERT		BIT(14)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  29  #define  GMAC_RXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  30  #define GMAC_TXCLK_DELAY_CTRL		0x08
33a1a01e3afa72 Jisheng Zhang 2024-11-03  31  #define  GMAC_TXCLK_BYPASS		BIT(15)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  32  #define  GMAC_TXCLK_INVERT		BIT(14)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  33  #define  GMAC_TXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  34  #define GMAC_PLLCLK_DIV			0x0c
33a1a01e3afa72 Jisheng Zhang 2024-11-03  35  #define  GMAC_PLLCLK_DIV_EN		BIT(31)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  36  #define  GMAC_PLLCLK_DIV_NUM		GENMASK(7, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  37  #define GMAC_GTXCLK_SEL			0x18
33a1a01e3afa72 Jisheng Zhang 2024-11-03  38  #define  GMAC_GTXCLK_SEL_PLL		BIT(0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  39  #define GMAC_INTF_CTRL			0x1c
33a1a01e3afa72 Jisheng Zhang 2024-11-03  40  #define  PHY_INTF_MASK			BIT(0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03 @41  #define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  42  #define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  43  #define GMAC_TXCLK_OEN			0x20
33a1a01e3afa72 Jisheng Zhang 2024-11-03  44  #define  TXCLK_DIR_MASK			BIT(0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  45  #define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  46  #define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
33a1a01e3afa72 Jisheng Zhang 2024-11-03  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
