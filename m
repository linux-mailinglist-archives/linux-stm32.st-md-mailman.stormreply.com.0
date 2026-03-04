Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKaQOSyHqGn2vQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 20:25:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CB72070CF
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 20:25:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1513EC87ED1;
	Wed,  4 Mar 2026 19:25:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39F47C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 19:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772652330; x=1804188330;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=93zi98/SCHi0Xdt2/6okf2xCqWA0WfMJZVk3NLVoY/Y=;
 b=hg29ljLCenEOO3XIUC+duk6lhRw+dqknogSwxMXn+edZ30mUG3g9vmtJ
 7Ts9RbKkI9bUo0LV/RTQxMVI8qG7rJfwZTap0UnkBrZsiUr7ps+YFF8Yl
 I27JQbkQQf+f6glIPXMAB8yb3YAklaSiqlD+LpJIWsm2kvA03AKZppggU
 uCAumcCVbebWAS/ShHAm8uEETG+pWqrhaJ8CnKcpXoUiiTS79dnafxSiq
 iL1TX8pl3FtSFr7Gjia+g6S6uIm1cJQqzY7ZbiAwkGVLo0+RakVFUzYTj
 f/GXQ52Vht3teI1eUF2i5zyjNvUQzOFwNnz3lhBdQ71Xj1QbJntxXDRoL w==;
X-CSE-ConnectionGUID: MEZ7KzcdRiqV88wMnpkMeQ==
X-CSE-MsgGUID: AITs+5vLQQCZPki0Ycw1UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="72753235"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="72753235"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 11:25:28 -0800
X-CSE-ConnectionGUID: dct93SjiSJaEO42FIENObw==
X-CSE-MsgGUID: ajr2Y/TORySK9X58Glk5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="218378608"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2026 11:25:26 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vxrqU-000000004O5-0gkS;
 Wed, 04 Mar 2026 19:25:22 +0000
Date: Thu, 5 Mar 2026 03:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Message-ID: <202603050340.7qkvXUGq-lkp@intel.com>
References: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1vxjNj-0000000Br1c-2Fg7@rmk-PC.armlinux.org.uk>
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
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
X-Rspamd-Queue-Id: 82CB72070CF
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:rmk+kernel@armlinux.org.uk,m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:edumazet@google.com,m:oe-kbuild-all@lists.linux.dev,m:kuba@kernel.org,m:wens@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.507];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,01.org:url,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

Hi Russell,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Russell-King-Oracle/net-stmmac-mdio-use-same-test-for-MDC-clock-divisor-lookups/20260304-183416
base:   net-next/main
patch link:    https://lore.kernel.org/r/E1vxjNj-0000000Br1c-2Fg7%40rmk-PC.armlinux.org.uk
patch subject: [PATCH net-next 8/8] net: stmmac: make pcs_mask and phy_mask u32
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260305/202603050340.7qkvXUGq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050340.7qkvXUGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050340.7qkvXUGq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c: In function 'loongson_gnet_data':
>> drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c:171:42: error: implicit declaration of function 'BIT_u32'; did you mean 'BIT_U32'? [-Wimplicit-function-declaration]
     171 |         plat->mdio_bus_data->phy_mask = ~BIT_u32(2);
         |                                          ^~~~~~~
         |                                          BIT_U32


vim +171 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c

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
