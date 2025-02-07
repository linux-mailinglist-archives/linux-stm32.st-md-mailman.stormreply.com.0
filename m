Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A224CA2BF18
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Feb 2025 10:20:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50CE8C78F67;
	Fri,  7 Feb 2025 09:20:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD295C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Feb 2025 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738920049; x=1770456049;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hA2SG/by2VlZkg0k+rBAIateDa8Wr9F6Pl3v/Hw6QSU=;
 b=GCVCRHLwAcUtMBmeGsBaTQecgIG5du0Ww0DP0mAtxf852xDSIMZu8Mnd
 XTI9/RDg48de5/a4tJUJvlDQSTS9phbEeZkDNfqfcpSaYWBMlFBREnbqD
 jeHudLOHpHtln24dttWIexe3d5/dIJ8/f9enhhWjzce5o/+Ts1SjRHJBI
 xRB8PqFnspyQguUT8UBPO7Bh5eHRQvy3Dg5TkIyERDt1p6o7veA757eL7
 +8lc9Ol/AJH7pgEX9096q7mZVbbz05+7oV8NXxs2tCPX2YPljXLfF4XLS
 vxHJBjKWCmIqp02qWPeAcN3XW1xNF7zEUsgafCY72vCWfyNwjVH9w04GM g==;
X-CSE-ConnectionGUID: ScDXv0eOQoiDxGlmqLTXvQ==
X-CSE-MsgGUID: Kr/lq7j9RRGeJTE+M0wj6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39428961"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39428961"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:20:40 -0800
X-CSE-ConnectionGUID: Rs/q4v6kTrSfo8mlMCbvMQ==
X-CSE-MsgGUID: 4DBwnz/7TVqAchVWKhRZfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="148692076"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.39.73])
 ([10.247.39.73])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 01:20:32 -0800
Message-ID: <564ede5d-9f53-40be-9305-63f63b384e15@linux.intel.com>
Date: Fri, 7 Feb 2025 17:20:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250206131859.2960543-1-yong.liang.choong@linux.intel.com>
 <20250206131859.2960543-3-yong.liang.choong@linux.intel.com>
 <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6TVmdCZeWerAZKP@shell.armlinux.org.uk>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v7 2/7] net: pcs: xpcs:
 re-initiate clause 37 Auto-negotiation
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



On 6/2/2025 11:30 pm, Russell King (Oracle) wrote:
> On Thu, Feb 06, 2025 at 09:18:54PM +0800, Choong Yong Liang wrote:
>> The xpcs_switch_interface_mode function was introduced to handle
>> interface switching.
>>
>> According to the XPCS datasheet, a soft reset is required to initiate
>> Clause 37 auto-negotiation when the XPCS switches interface modes.
> 
> Hmm. Given that description, taking it literally, claus 37
> auto-negotiation is 1000BASE-X, not Cisco SGMII (which isn't an IEEE
> 802.3 standard.) Are you absolutely sure that this applies to Cisco
> SGMII?
> 
Hi Russell,

Yes, you are correct that Clause 37 auto-negotiation is for 1000BASE-X. 
However, I do not believe it applies to Cisco SGMII. The XPCS implements 
Clause 37 auto-negotiation for both 1000BASE-X and SGMII.

> If the reset is required when switching to SGMII, should it be done
> before or after configuring the XPCS for SGMII?
> 
A soft reset is required before configuring the XPCS for SGMII. Based on 
the existing XPCS handling in the initial state, the xpcs_create() function 
will be called, and then xpcs->need_reset will be set to true. Later on, 
phylink_major_config() will call xpcs_pre_config() to perform the 
xpcs_soft_reset(), and then it will continue with xpcs_config().

I apologize for missing this patch: 
https://patchwork.kernel.org/project/netdevbpf/patch/E1svfMA-005ZI3-Va@rmk-PC.armlinux.org.uk/

I think I should move xpcs_switch_interface_mode() to xpcs_pre_config() and 
just update xpcs->need_reset instead of implementing my own method for 
calling xpcs_soft_reset().

> Also, if the reset is required, what happens if we're already using
> SGMII, but AN has been disabled temporarily and is then re-enabled?
> Is a reset required?
> 
Good point. I cannot find this scenario in the datasheet. Please allow me 
some time to test this scenario. I will update you with the results.

> What about 1000BASE-X when AN is enabled or disabled and then switching
> to SGMII?
> 
According to the datasheet, a soft reset is required.

>> +static int xpcs_switch_to_aneg_c37_sgmii(const struct dw_xpcs_compat *compat,
>> +					 struct dw_xpcs *xpcs,
>> +					 unsigned int neg_mode)
>> +{
>> +	bool an_c37_enabled;
>> +	int ret, mdio_ctrl;
>> +
>> +	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {
>> +		mdio_ctrl = xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
>> +		if (mdio_ctrl < 0)
>> +			return mdio_ctrl;
>> +
>> +		an_c37_enabled = mdio_ctrl & BMCR_ANENABLE;
>> +		if (!an_c37_enabled) {
> 
> I don't think that we need "an_c37_enabled" here, I think simply:
> 
> 		if (!(mdio_ctrl & BMCR_ANENABLE)) {
> 
> would be sufficient.
> 
>> +			//Perform soft reset to initiate C37 auto-negotiation
>> +			ret = xpcs_soft_reset(xpcs, compat);
>> +			if (ret)
>> +				return ret;
>> +		}
>> +	}
>> +	return 0;
> 
> I'm also wondering (as above) whether this soft reset needs to happen
> _after_ xpcs_config_aneg_c37_sgmii() has done its work - this function
> temporarily disables AN while it's doing its work.
> 
Based on the programming sequence in the datasheet, it is not necessary to 
perform a soft reset after xpcs_config_aneg_c37_sgmii() has completed its work.

> I'm also wondering whether AN being disabled is really a deciding
> factor (e.g. when switching from 1000BASE-X AN-enabled to SGMII, is a
> reset required?)
> 

Thank you for pointing this out. The datasheet only mentions performing a 
soft reset when switching to the 1000BASE-X and SGMII interfaces, and it 
does not specify whether AN needs to be enabled or disabled. I thought 
adding a check would reduce the calls to the soft reset. However, I did not 
consider the scenario of switching from 1000BASE-X with AN enabled to SGMII 
with AN enabled. This scenario might cause regression. I will remove all 
the checks and just perform a soft reset when switching to the SGMII interface.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
