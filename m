Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03587A47BC2
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 12:17:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC70FC7A847;
	Thu, 27 Feb 2025 11:17:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 938AFC7A843
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 11:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740655072; x=1772191072;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CNhFV9T14sh7OY2SRFlpy7R8+gM04CqgJ0xYvF9HFpo=;
 b=SbyJ5jgD2FVkFA16kT3VMrJe4xQMSbjx3ogSrh75KBBSGE97RM13ZUYh
 HylR+M5ZTaBY5+/DSJlNU4Tm5ngl5R5r0GhgaMihnwm1aYmq9WYsOscbr
 Ai5eRtQEbZG3cwrPcBzpmtOMk3nAYXkmOJfCDGqwM72KLncM2ZcxA6GEg
 s29UGb8LdffDR/A6Ud6VWlQY+OVKvq9DlbyFGUZUqiGxk323WxNmoouSN
 Y0fHFuspBD9kEOmcy2AkbHXSyfcd2vRjcpsXwD3Fm4x6YMg+jCqXLTAR+
 WHeHy8R4156FgADkdjScWq9P4QvYyUX/99hW3HuCpuG8vxOBZSw+7Hj2R Q==;
X-CSE-ConnectionGUID: //r7voq7Tdy5XWWbUoaCAA==
X-CSE-MsgGUID: tPcNptuWR9Wzzh528o3zyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58955497"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="58955497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:17:49 -0800
X-CSE-ConnectionGUID: 3Tb9u1sUQPaKicuPXGkj2w==
X-CSE-MsgGUID: 45DyLiKXRPyvMBlpNWZcDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117172315"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.81.210])
 ([10.247.81.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:17:41 -0800
Message-ID: <1ff2fcac-d9d5-4c70-a101-f7026b50646a@linux.intel.com>
Date: Thu, 27 Feb 2025 19:17:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-2-yong.liang.choong@linux.intel.com>
 <Z780cM9bejxhzTXO@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z780cM9bejxhzTXO@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next v8 1/6] net: phylink: use
 pl->link_interface in phylink_expects_phy()
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



On 26/2/2025 11:34 pm, Russell King (Oracle) wrote:
> On Wed, Feb 26, 2025 at 03:48:32PM +0800, Choong Yong Liang wrote:
>> The phylink_expects_phy() function allows MAC drivers to check if they are
>> expecting a PHY to attach. The checking condition in phylink_expects_phy()
>> aims to achieve the same result as the checking condition in
>> phylink_attach_phy().
>>
>> However, the checking condition in phylink_expects_phy() uses
>> pl->link_config.interface, while phylink_attach_phy() uses
>> pl->link_interface.
>>
>> Initially, both pl->link_interface and pl->link_config.interface are set
>> to SGMII, and pl->cfg_link_an_mode is set to MLO_AN_INBAND.
>>
>> When the interface switches from SGMII to 2500BASE-X,
>> pl->link_config.interface is updated by phylink_major_config().
>> At this point, pl->cfg_link_an_mode remains MLO_AN_INBAND, and
>> pl->link_config.interface is set to 2500BASE-X.
>> Subsequently, when the STMMAC link goes down and comes up again,
>> it is blocked by phylink_expects_phy().
> 
> I thought we ascertained that it's not "link goes down" but when the
> interface is taken down administratively. "Link goes down" to most
> people mean an event such as the network cable being unplugged.
> Please fix the patch description.
> 
>> Since phylink_expects_phy() and phylink_attach_phy() aim to achieve the
>> same result, phylink_expects_phy() should check pl->link_interface,
>> which never changes, instead of pl->link_config.interface, which is
>> updated by phylink_major_config().
>>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> With, and *only* with the above fixed:
> 
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks!
> 
Thank you for your feedback and clarification. I will update the patch 
description to accurately reflect the administrative interface down scenario.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
