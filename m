Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA7585596E
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Feb 2024 04:14:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 739E8C69066;
	Thu, 15 Feb 2024 03:14:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E89F4C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Feb 2024 03:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707966882; x=1739502882;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sLEedRMDncb0IeCD2q4hOTg4DPcXH151vX4zjRS2Q+o=;
 b=jNHkrqVu670oItB/+gz1iKCXk9oWMONpEGuITThuo8Tf8xwRKljfTRGk
 6OaRHo5nry6TY8ja9ysUnQwX8cp0TFbrP0HxaalETStYa2i1pPr9oB9bB
 z2Wu9tZQgvHUN48Tm6/GNBTIeACzEnLYAYnkO7pC38A254AoZ0LfQSzhc
 zsnQ4PAiVfzJS8iok25rZqgi+Ac5ov1PQmMxqWlt06QhILn79nNHha7q/
 vQWNzkAJKiQdQH8Wv2KIto/qIxBh6UKvS/acBQ4fXMrAeSxNncQIheip3
 jLSOswxLtBHIXu7nHwMb4HlmD+JVK+VJJp+377mku9g0cSkE3uXNCpMVB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="1914719"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="1914719"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 19:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="8056455"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.84.237])
 ([10.247.84.237])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 19:14:30 -0800
Message-ID: <9154ea9e-863b-49b3-8729-1ba077872bcc@linux.intel.com>
Date: Thu, 15 Feb 2024 11:14:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240129130253.1400707-1-yong.liang.choong@linux.intel.com>
 <20240129130253.1400707-7-yong.liang.choong@linux.intel.com>
 <ZbjNn+C/VHegH2t7@shell.armlinux.org.uk>
 <9e23671e-788c-4191-bdb4-94915ff7da5a@linux.intel.com>
 <ZbtYaXkNf2ZF1prE@shell.armlinux.org.uk>
 <2ad1f55c-f361-4439-9174-6af1bb429d55@linux.intel.com>
 <Zbys2orOUikYxeOm@shell.armlinux.org.uk>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Zbys2orOUikYxeOm@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 platform-driver-x86@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Abdul Rahim Faizal <faizal.abdul.rahim@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v4 06/11] net: stmmac: resetup
 XPCS according to the new interface mode
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2/2/2024 4:50 pm, Russell King (Oracle) wrote:
>> Thank you for taking the time to review, got your concerns, and I'll address
>> the following concerns before submitting a new patch series:
>>
>> 1. Remove allow_switch_interface and have the PHY driver fill in
>> phydev->possible_interfaces.
> 
> Yes please.
> 

Hi Russell,

I regret to inform you that I didn't implement everything exactly as 
proposed in the new patch series. My intention was to simplify the series, 
focusing solely on managing SGMII and 2500BASE-X interface mode switching. 
The recommendation to have the PHY driver fill in 
"phydev->possible_interfaces" will be addressed in a separate patch 
submission. I hope this is acceptable.

In the new patch series, I removed "allow_switch_interface" patches. The 
current solution continues to work with PHYs that are C45 and follow the 
legacy path, such as Marvell Alaska 88E2110. For the upcoming patch series, 
I will implement "phydev->possible_interfaces" for C22 and C45 PHYs.


>> 2. Rework on the PCS to have similar implementation with the following patch
>> "net: macb: use .mac_select_pcs() interface"
>> (https://lore.kernel.org/netdev/E1n568J-002SZX-Gr@rmk-PC.armlinux.org.uk/T/).
> 
> mac_select_pcs() is about returning to phylink the PCS that the MAC
> needs to use for the specified interface mode, or NULL if no PCS is
> required, nothing more, nothing less.
> 
> Plase do not copy that mac_select_pcs() implementation - changing the
> "ops" underneath phylink is no longer permitted.
> 

Upon further examination, I discovered that no change is required for the 
"mac_select_pcs()" function; we can still use the same PCS. According to 
the XPCS datasheet, a soft reset is necessary to re-initiate Clause 37 
auto-negotiation when switching to SGMII interface mode. This is the only 
setting required for properly configuring the SGMII interface mode, and 
nothing extra is needed for 2500BASE-X configuration.

In the new patch series, I removed "mac_select_pcs()" related patches and 
added a "xpcs_soft_reset()" patch for the XPCS.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
