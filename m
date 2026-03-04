Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHZ/A9mTqGkLvwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 21:19:37 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7D72078AD
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 21:19:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DAAAC87ED3;
	Wed,  4 Mar 2026 20:19:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B8E0C87ED1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 20:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772655574; x=1804191574;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iikIQE7d5BrMbz5QoKczt9e+EFI540Qu1haop92OMoM=;
 b=SOj/+DoFr64zqtUpqPiXGhgW1jlW9PnHbh8DCGH3s1Xg21Wp+e4KYR1R
 vVZNv9PQ1bxeHcMRVZGGqTYH+wdWa00UVAQWyW5Zqn7e4v3XdGbjTzFeh
 rqaNE8tscsI3M/6sHzGDNVnaxOPjsp/JYGZYMBNulCZZ3SBUysWdVK4qI
 fVUm778sGgHEt7DPXgb8qMIa8efrs7M++lqd5m6rUp2g6L+K/hWV962kF
 KZrk5O0gL10PW/lzQQBuqs3VjUMbEIEosiKec+RtWDokiz/Vx3IUC9EX2
 Ao/xjsEjA5bYlSJjXFHWJ2L8UrnO7Fh6B6OqHXSLDI66u3U+2KvO14z9a A==;
X-CSE-ConnectionGUID: Im/f9bxBRCmt+WHyMJZG7Q==
X-CSE-MsgGUID: Vuu7+lxZTHi/PpwIOOXsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84815869"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="84815869"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 12:19:32 -0800
X-CSE-ConnectionGUID: Ya7/Uf4pRGabToPTi0eQCw==
X-CSE-MsgGUID: 8GePQ8mUR2+NTCVoDJpoKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="256331372"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
 by orviesa001.jf.intel.com with ESMTP; 04 Mar 2026 12:19:29 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vxsgn-000000004S5-2C0D;
 Wed, 04 Mar 2026 20:19:25 +0000
Date: Thu, 5 Mar 2026 04:18:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <202603050424.TDlVj9FT-lkp@intel.com>
References: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, llvm@lists.linux.dev, linux-sunxi@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 8/8] net: stmmac: make pcs_mask
	and phy_mask u32
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
X-Rspamd-Queue-Id: 9C7D72078AD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[intel.com:s=Intel];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[intel.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:edumazet@google.com,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:wens@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.537];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,01.org:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-mdio-use-same-test-for-MDC-clock-divisor-lookups/20260304-183416
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vxjNj-0000000Br1c-2Fg7%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 8/8] net: stmmac: make pcs_mask and phy_mask u32
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603050424.TDlVj9FT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050424.TDlVj9FT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050424.TDlVj9FT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:171:35: error: call to undeclared function 'BIT_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |         plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
         |                                          ^
   1 error generated.


vim +/BIT_u32 +171 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

   164	
   165	static int loongson_gnet_data(struct pci_dev *pdev,
   166				      struct plat_stmmacenet_data *plat)
   167	{
   168		loongson_default_data(pdev, plat);
   169	
   170		plat->phy_interface = PHY_INTERFACE_MODE_GMII;
 > 171		plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
   172		plat->fix_mac_speed = loongson_gnet_fix_speed;
   173	
   174		return 0;
   175	}
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
