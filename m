Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2DFA2849E
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 07:50:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B30E5C78F88;
	Wed,  5 Feb 2025 06:50:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21E7BC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 06:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738738252; x=1770274252;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=55hxtyx4DMhF2qYY+kBeRk1DqvJKGJ9IUbKzhKO8vbg=;
 b=TpU/On9e/FkZL8B9DH+HG4rRyyttiFLkXBkSyNAVgnspQ2hrTtlUMayp
 GpAg/rVNGRPLaf/7KsSoLeVxNxDVN7HbWzcOheRrkE6EXCrkS6nRF7ox2
 59FdPINat4VGktCOQKmhrE7UfgMZJQtMFqGIFcL6PAqk2IyO0+PpCvEN2
 GRj1jZfweD93l8Yt22iF63LwEVI6fYHb3+2FI/pf603Z1xfle2I51hc95
 GYB1OdYNWggCmHYwWXtwD2gIKcMDuBTdnXiBmGRJEOn1r3jzWKGkz89H+
 JV6mM0cCnBC1BrEu3RtCsUMg064fTEFEJdKgRHGGBeeU5OjZL/pshEarZ w==;
X-CSE-ConnectionGUID: dsqHJ8ygQi25z5FlhBRXFQ==
X-CSE-MsgGUID: Fn2mn+53TdyHl00+sBDCFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39175603"
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="39175603"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 22:50:44 -0800
X-CSE-ConnectionGUID: oo32QqH1QrmHW2tYAHIDrw==
X-CSE-MsgGUID: W8AT1xq9Tz+DU8R6MpUXgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,260,1732608000"; d="scan'208";a="111400846"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.100.100])
 ([10.247.100.100])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 22:50:35 -0800
Message-ID: <c25c2da7-18fa-46b7-b992-fb5b17a01749@linux.intel.com>
Date: Wed, 5 Feb 2025 14:50:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250204061020.1199124-1-yong.liang.choong@linux.intel.com>
 <20250204061020.1199124-2-yong.liang.choong@linux.intel.com>
 <Z6ICO06RbJ1ulDh1@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z6ICO06RbJ1ulDh1@shell.armlinux.org.uk>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, linux-stm32@st-md-mailman.stormreply.com,
 x86@kernel.org, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
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
Subject: Re: [Linux-stm32] [PATCH net-next v6 1/7] net: phylink: use
 act_link_an_mode to determine PHY
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



On 4/2/2025 8:04 pm, Russell King (Oracle) wrote:
> On Tue, Feb 04, 2025 at 02:10:14PM +0800, Choong Yong Liang wrote:
>> When the interface mode is SGMII and act_link_an_mode is MLO_AN_INBAND,
>> switching to the 2500BASE-X interface mode will trigger
>> phylink_major_config, and act_link_an_mode will be updated to MLO_AN_PHY
>> in phylink_pcs_neg_mode when the PCS does not support in-band mode.
>> The MAC and PCS will configure according to the interface mode
>> and act_link_an_mode.
> 
> act_link_an_mode must only ever be updated by phylink_major_config()
> since it defines state for the currently configured mode, and must
> stay in sync with how the hardware has been programmed at all times.
> 
>> However, when the interface goes link down and then link up again, the MAC
>> will attempt to attach the PHY.
> 
> Why is the MAC trying to disconnect and reconnect the PHY on link
> changes? Do you really mean "link down" and "link up" as in "connection
> with the link partner" or do you mean administratively taking the
> interface down and up (which is a completely different thing.)
> 

The "link down" and "link up" I mention in this part refer to using the 
command:
ifconfig <interface> down/up

>> The interface mode remains as 2500BASE-X,
>> but cfg_link_an_mode still holds MLO_AN_INBAND. This causes a failure to
>> attach the PHY.
> 
> Hmm.
> 
> pl->link_interface is the configured setting from firmware etc and doesn't
> change.
> 
> pl->cfg_link_an_mode is the configured mode from firmware etc which was
> passed to phylink_create(), and again doesn't change.
> 
> So there should be no difference unless something weird is going on,
> which as you're talking about stmmac, could be the case.
> 

Thank you for pointing that out.

I think I was confused between pl->link_interface and
pl->link_config.interface. The function phylink_attach_phy() uses
pl->link_interface, whereas phylink_expects_phy() uses
pl->link_config.interface.

When the interface switches from SGMII to 2500BASE-X,
pl->link_config.interface is updated by phylink_major_config().
So, when the STMMAC link goes down and comes up again,
it is blocked by phylink_expects_phy().
At this point, pl->cfg_link_an_mode is MLO_AN_INBAND and 
pl->link_config.interface is 2500BASE-X.

Since phylink_expects_phy() is trying to achieve the same checking 
condition as phylink_attach_phy(), it should use pl->link_interface for the 
check as well.

Does that make sense to you?

> More information needed, but as this patch currently stands, I deem it
> to be incorrect, sorry.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
