Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOeGFxrQd2mxlQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 21:35:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1238D1E0
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Jan 2026 21:35:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70ECDC87EDB;
	Mon, 26 Jan 2026 20:35:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FEA1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Jan 2026 20:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769459735; x=1800995735;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hv73xovg7rs+ED9F7z8l/VwWVkfiGm/GSqfIJQSKT6M=;
 b=ncCWfv2HigwMk/nUL28y1V+KsHC+ovQqQQ9JLeOsgWo0oCy3Y47cs+ox
 VudJ5lW/bFqL/xjGl/BwXUsKgm3mgtaRFEVqQMh7s0nkVIhWIXo1alOnK
 0B+pOOlohR/sWnjS9iVjzGxXVxb7MqPe26LUDARsQ826rMu2UXbLEcD9X
 VAx1VhZGBeYbs3lSx5X27WQ7sgt1jO4S7vMuNpd3R/RZYmfgKFf6mt5py
 eaXpDn+4Vr5BrB2WBa5wAcGzAyi0jbBhCQyOmUBxF4ZnXO2PtLSQRyI0r
 xRZGJMtwpXu7jwKdrVl75EpRWn3L4o0r3St60M6enZlwEgF83/6gW9ftC A==;
X-CSE-ConnectionGUID: Z0O27yJwRzqDXOKapDq/Jg==
X-CSE-MsgGUID: Vc10IM1dTDawJgUdE9kdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70548996"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="70548996"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 12:35:33 -0800
X-CSE-ConnectionGUID: sagnajPzQ5CRUn3YbCDE2w==
X-CSE-MsgGUID: nd9RHMb/SPikWc1P17fuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; d="scan'208";a="208125486"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by fmviesa010.fm.intel.com with ESMTP; 26 Jan 2026 12:35:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vkTJ2-00000000XfO-2ljl;
 Mon, 26 Jan 2026 20:35:28 +0000
Date: Tue, 27 Jan 2026 04:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <202601270450.IAoLETfq-lkp@intel.com>
References: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vkLXO-00000005uxQ-31ZV@rmk-PC.armlinux.org.uk>
Cc: netdev@vger.kernel.org, llvm@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
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
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:llvm@lists.linux.dev,m:edumazet@google.com,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: DE1238D1E0
X-Rspamd-Action: no action

Hi Russell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-report-active-PHY-interface/20260126-201908
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vkLXO-00000005uxQ-31ZV%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next] net: stmmac: report active PHY interface
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20260127/202601270450.IAoLETfq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270450.IAoLETfq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270450.IAoLETfq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c:41:10: warning: 'PHY_INTF_RGMII' macro redefined [-Wmacro-redefined]
      41 | #define  PHY_INTF_RGMII                 FIELD_PREP(PHY_INTF_MASK, 1)
         |          ^
   drivers/net/ethernet/stmicro/stmmac/common.h:328:9: note: previous definition is here
     328 | #define PHY_INTF_RGMII          1
         |         ^
   1 warning generated.


vim +/PHY_INTF_RGMII +41 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c

33a1a01e3afa724 Jisheng Zhang 2024-11-03  18  
33a1a01e3afa724 Jisheng Zhang 2024-11-03  19  #define GMAC_CLK_EN			0x00
33a1a01e3afa724 Jisheng Zhang 2024-11-03  20  #define  GMAC_TX_CLK_EN			BIT(1)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  21  #define  GMAC_TX_CLK_N_EN		BIT(2)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  22  #define  GMAC_TX_CLK_OUT_EN		BIT(3)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  23  #define  GMAC_RX_CLK_EN			BIT(4)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  24  #define  GMAC_RX_CLK_N_EN		BIT(5)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  25  #define  GMAC_EPHY_REF_CLK_EN		BIT(6)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  26  #define GMAC_RXCLK_DELAY_CTRL		0x04
33a1a01e3afa724 Jisheng Zhang 2024-11-03  27  #define  GMAC_RXCLK_BYPASS		BIT(15)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  28  #define  GMAC_RXCLK_INVERT		BIT(14)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  29  #define  GMAC_RXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  30  #define GMAC_TXCLK_DELAY_CTRL		0x08
33a1a01e3afa724 Jisheng Zhang 2024-11-03  31  #define  GMAC_TXCLK_BYPASS		BIT(15)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  32  #define  GMAC_TXCLK_INVERT		BIT(14)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  33  #define  GMAC_TXCLK_DELAY		GENMASK(4, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  34  #define GMAC_PLLCLK_DIV			0x0c
33a1a01e3afa724 Jisheng Zhang 2024-11-03  35  #define  GMAC_PLLCLK_DIV_EN		BIT(31)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  36  #define  GMAC_PLLCLK_DIV_NUM		GENMASK(7, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  37  #define GMAC_GTXCLK_SEL			0x18
33a1a01e3afa724 Jisheng Zhang 2024-11-03  38  #define  GMAC_GTXCLK_SEL_PLL		BIT(0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  39  #define GMAC_INTF_CTRL			0x1c
33a1a01e3afa724 Jisheng Zhang 2024-11-03  40  #define  PHY_INTF_MASK			BIT(0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03 @41  #define  PHY_INTF_RGMII			FIELD_PREP(PHY_INTF_MASK, 1)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  42  #define  PHY_INTF_MII_GMII		FIELD_PREP(PHY_INTF_MASK, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  43  #define GMAC_TXCLK_OEN			0x20
33a1a01e3afa724 Jisheng Zhang 2024-11-03  44  #define  TXCLK_DIR_MASK			BIT(0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  45  #define  TXCLK_DIR_OUTPUT		FIELD_PREP(TXCLK_DIR_MASK, 0)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  46  #define  TXCLK_DIR_INPUT		FIELD_PREP(TXCLK_DIR_MASK, 1)
33a1a01e3afa724 Jisheng Zhang 2024-11-03  47  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
