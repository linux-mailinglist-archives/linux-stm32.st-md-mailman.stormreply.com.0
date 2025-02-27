Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A65A47BC7
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 12:18:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2F2FC7A847;
	Thu, 27 Feb 2025 11:18:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5CD1C7A843
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 11:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740655094; x=1772191094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K9BvBv3hLYw0IGq8eJuii6hDq4mM87UTjkwNlZVz44I=;
 b=Rtj2VP+Z1pmPotlofU3WtSOI6ZVTLWFhsJDEfC8/5WbncKY/myW9zPJv
 RNDUrYPrv3ebDggQgWrLn9Q04UHNsRj4IE9my1nLkGH+g1jzcKdD9W+GY
 msG+7r95ZyCu3cqZHKFVxtPKKD4EftZ3oLkXGcqengsbstX9mvtjEesTj
 wvfZDZ3RhtQyfVgpvW2l2bmDRjRh07WCkQyBp6fsOxanw+9j7fngVPCXK
 zRnY3Da/O87B+ToRlfEmmulVdJ6oEmU1KXabkcyaQpBHoeUaKEE5faqUx
 6e38Umo2TjfETDeDiX2Ciyi5lYTtDlKarmfJEQVKvQ/glQAVrJKqbxtu/ g==;
X-CSE-ConnectionGUID: i2T36zf1R0OeNAvyqPgLgw==
X-CSE-MsgGUID: YohfcMONRoC0FjwT5TzKDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="58955536"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="58955536"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:18:12 -0800
X-CSE-ConnectionGUID: PDI93uncReGm6znVKxCg+w==
X-CSE-MsgGUID: 4PYYlND1R6+gWOxBvTmk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="117172348"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.247.81.210])
 ([10.247.81.210])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:18:04 -0800
Message-ID: <55ddacb9-dc00-4477-aeab-9b8861563194@linux.intel.com>
Date: Thu, 27 Feb 2025 19:18:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
 <20250226074837.1679988-3-yong.liang.choong@linux.intel.com>
 <Z78141ZNWEYDSi5l@shell.armlinux.org.uk>
Content-Language: en-US
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <Z78141ZNWEYDSi5l@shell.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next v8 2/6] net: pcs: xpcs:
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



On 26/2/2025 11:40 pm, Russell King (Oracle) wrote:
> On Wed, Feb 26, 2025 at 03:48:33PM +0800, Choong Yong Liang wrote:
>> diff --git a/drivers/net/pcs/pcs-xpcs-wx.c b/drivers/net/pcs/pcs-xpcs-wx.c
>> index fc52f7aa5f59..f73ab04d09f0 100644
>> --- a/drivers/net/pcs/pcs-xpcs-wx.c
>> +++ b/drivers/net/pcs/pcs-xpcs-wx.c
>> @@ -172,11 +172,9 @@ int txgbe_xpcs_switch_mode(struct dw_xpcs *xpcs, phy_interface_t interface)
>>   		return 0;
>>   	}
>>   
>> -	if (xpcs->interface == interface && !txgbe_xpcs_mode_quirk(xpcs))
>> +	if (!txgbe_xpcs_mode_quirk(xpcs))
>>   		return 0;
>>   
>> -	xpcs->interface = interface;
>> -
> 
> ...
> 
>> --- a/drivers/net/pcs/pcs-xpcs.c
>> +++ b/drivers/net/pcs/pcs-xpcs.c
>> @@ -602,12 +602,37 @@ static void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
>>   		__set_bit(compat->interface, interfaces);
>>   }
>>   
>> +static int xpcs_switch_interface_mode(struct dw_xpcs *xpcs,
>> +				      phy_interface_t interface)
>> +{
>> +	int ret = 0;
>> +
>> +	if (xpcs->interface != interface) {
>> +		if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID) {
>> +			ret = txgbe_xpcs_switch_mode(xpcs, interface);
>> +			if (ret)
>> +				return ret;
> 
> The above modification changes the functionality.
> 
> In the old code, txgbe_xpcs_switch_mode() does its work when
> xpcs->interface is not the same as interface OR txgbe_xpcs_mode_quirk()
> is true.
> 
> Your replacement code calls txgbe_xpcs_switch_mode() when
> xpcs->interface is not the same as interface, *and* it can do its
> work when txgbe_xpcs_mode_quirk() returns true.
> 
> So, e.g. when txgbe_xpcs_mode_quirk() returns false, but the interface
> changes, txgbe_xpcs_mode_quirk() used to do its work, but as a result
> if your changes, it becomes a no-op.
> 
> The point of txgbe_xpcs_mode_quirk() is to always do the work if it
> returns true, even if the interface mode doesn't change.
> 
> Therefore, this patch is logically incorrect, and likely breaks TXGBE.
> 
Thank you for pointing out the oversight. I will review the logic and make 
the necessary corrections to ensure the patch does not disrupt the expected 
behavior.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
