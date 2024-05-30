Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E308D46FB
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 10:25:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD4FC6C855;
	Thu, 30 May 2024 08:25:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04F37C030CA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717057545; x=1748593545;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=YKqNURWS8n2g55ZrdJEWt/gjHie39zpHSbth/z2c/c4=;
 b=lKwhw1WvZr5emWf5AI7MHXngUlvw/jQHpi0L2empiX3cC+xFhCgUWgEb
 TLqAk4IniQ/WwmPyKl6IdUnm0swM/RZyIx/6spKeuaE4HHU04svnKG75Z
 54WY3paQXG98FURQer8LhBHohzkKgfniPE9Rol3QszlD4aML1H6fBmJ1y
 o+D1IgUP50VwfR4nqfKEc41GfOxFLR5y8AG5PNkYxTpAVfjMxoK4rXYrT
 o+U3uS1Iu7fsSH7DhDjcl7Tg0+XZ6phXIL8j7PMyvDuqyrV+EUQ2m2YKd
 Hp5E4FQ7ez/sFw9gdzwxDQsI9A/glBJw3hbD0jPV+hox226lv2fz0apgZ A==;
X-CSE-ConnectionGUID: +5K8OaZFSxS1dbLPmdHwRQ==
X-CSE-MsgGUID: 41RFH6GRSrOvMbpZjAxqog==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17358447"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="17358447"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:25:27 -0700
X-CSE-ConnectionGUID: 2ClqADvBRt6M6ADjJgu1dw==
X-CSE-MsgGUID: iXQlDffJQPW0rqXEQT8ZBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="40183270"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.247.150])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 01:25:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 30 May 2024 11:25:16 +0300 (EEST)
To: "Ng, Boon Khai" <boon.khai.ng@intel.com>
In-Reply-To: <DM8PR11MB5751194374C75EC5D5889D6AC1F32@DM8PR11MB5751.namprd11.prod.outlook.com>
Message-ID: <322d8745-7eae-4a68-4606-d9fdb19b4662@linux.intel.com>
References: <20240527093339.30883-1-boon.khai.ng@intel.com>
 <20240527093339.30883-2-boon.khai.ng@intel.com>
 <48176576-e1d2-4c45-967a-91cabb982a21@lunn.ch>
 <DM8PR11MB5751469FAA2B01EB6CEB7B50C1F12@DM8PR11MB5751.namprd11.prod.outlook.com>
 <48673551-cada-4194-865f-bc04c1e19c29@lunn.ch>
 <DM8PR11MB5751194374C75EC5D5889D6AC1F32@DM8PR11MB5751.namprd11.prod.outlook.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "Ang,
 Tien Sung" <tien.sung.ang@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "G Thomas, Rohan" <rohan.g.thomas@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Looi, Hong Aun" <hong.aun.looi@intel.com>
Subject: Re: [Linux-stm32] [Enable Designware XGMAC VLAN Stripping Feature
 v2 1/1] net: stmmac: dwxgmac2: Add support for HW-accelerated VLAN
 Stripping
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

On Thu, 30 May 2024, Ng, Boon Khai wrote:

> > It is well know this driver is a mess. I just wanted to check you are not adding
> > to be mess by simply cut/pasting rather than refactoring code.
> 
> Okay sure Andrew, will take note on this.
> 
> > static void dwmac4_rx_hw_vlan(struct mac_device_info *hw,
> >                               struct dma_desc *rx_desc, struct sk_buff *skb) {
> >         if (hw->desc->get_rx_vlan_valid(rx_desc)) {
> >                 u16 vid = hw->desc->get_rx_vlan_tci(rx_desc);
> > 
> >                 __vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), vid);
> >         }
> > }
> > 
> > Looks identical to me.
> 
> Yes, some of the functions are identical, the driver has been divided 
> into dwmac4_core.c and dwxgmac2_core.c initially, so to enable the
> rx_hw_vlan, it is porting from dwmac4_core to dwxgmac2_core.
>   
> > The basic flow is the same. Lets look at the #defines:
> > 
> Right, the basic flow is direct copy and paste, and only the function
> name is updated from dwmac4 to dwxgmac2.

> > +static inline bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc
> > +*p) {
> > +	u32 et_lt;
> > +
> > +	et_lt = FIELD_GET(XGMAC_RDES3_ET_LT, le32_to_cpu(p->des3));
> > +
> > +	return et_lt >= XGMAC_ET_LT_VLAN_STAG &&
> > +	       et_lt <= XGMAC_ET_LT_DVLAN_STAG_CTAG; }
> > 
> > static bool dwmac4_wrback_get_rx_vlan_valid(struct dma_desc *p) {
> >         return ((le32_to_cpu(p->des3) & RDES3_LAST_DESCRIPTOR) &&
> >                 (le32_to_cpu(p->des3) & RDES3_RDES0_VALID)); }
> > 
> > #define RDES3_RDES0_VALID		BIT(25)
> > #define RDES3_LAST_DESCRIPTOR		BIT(28)
> > 
> > #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
> > +#define XGMAC_ET_LT_VLAN_STAG		8
> > +#define XGMAC_ET_LT_VLAN_CTAG		9
> > +#define XGMAC_ET_LT_DVLAN_CTAG_CTAG	10
> > 
> > This does actually look different.
> > 
> 
> Yes, this is the part in the descriptor where dwxgmac2 get the vlan  Valid. 
> it is described in Designware cores xgmac 10G Ethernet MAC version 3.10a
> page 1573.
> 
> > Please take a step back and see if you can help clean up some of the mess in
> > this driver by refactoring bits of identical code, rather than copy/pasting it.
> > 
> 
> Appreciate if you could help to point out which part that I have to cleanup?
> Do you mean I should combine the identical part between dwmac4_core.c
> and dwxgmac2_core.c? or I should update the part that looks different and
> make them the same?

You should generalize the existing functions into some other file within 
stmmac/ folder and call those functions from both dwmac4_core and dwxgmac2_core.
Do the rework of existing function & callers first and add the new bits 
in another patch in the patch series.

Unfortunately, it's hard to catch copy-paste like this from other files 
when not very familiar with the driver.


-- 
 i.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
