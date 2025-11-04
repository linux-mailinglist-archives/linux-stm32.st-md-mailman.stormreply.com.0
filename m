Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2141C3029F
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 10:08:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C33BC62ECF;
	Tue,  4 Nov 2025 09:08:05 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7F70C62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 09:08:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 177C61A1877;
 Tue,  4 Nov 2025 09:08:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D2ACD606EF;
 Tue,  4 Nov 2025 09:08:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 87FD110B50499; Tue,  4 Nov 2025 10:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762247281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IqrKvT/39GIw4bETHcXxm6B86XwJZy5zQulp7Zkzg80=;
 b=aPVPylMf2uPJTc5vq8FUwy26OuucAub5M8J+o+CEOCkoo6sjLGddx2uuKXPLxChca5uE9n
 rCXLuYN1N5fV0jjH/bgGSLJaTrW4CvemCkaJB58wOL+bN8kMOtZUORX0zHjAvWGVCblCRL
 1mOBICgLxRa47LV5NCBmyt104DOWZex53RAm0Lhb9Yok62+5FpbXSPK3BuCkl9tKKzmAUQ
 tbxFO3TU5e2f50fJyb69LnMQWuCzGv6/9rCll6F26cvAbX8GJofb+wJvvg2nZA3WXgI79A
 /g9jd600NqLXDLBVOrJk4PHYNpsN0UOSDA7OAEXG7oR8YBNadRWHBTijAJ96/w==
Message-ID: <4f029450-df4f-419d-adb4-493a8ca03e63@bootlin.com>
Date: Tue, 4 Nov 2025 10:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
 <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
 <aQm-LnN0LifBvkoz@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aQm-LnN0LifBvkoz@shell.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: Andrew Lunn <andrew@lunn.ch>, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Jan Petrous <jan.petrous@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 04/11] net: stmmac: add
	stmmac_get_phy_intf_sel()
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



On 04/11/2025 09:49, Russell King (Oracle) wrote:
> On Tue, Nov 04, 2025 at 09:34:31AM +0100, Maxime Chevallier wrote:
>>> +int stmmac_get_phy_intf_sel(phy_interface_t interface)
>>> +{
>>> +	int phy_intf_sel = -EINVAL;
>>> +
>>> +	if (interface == PHY_INTERFACE_MODE_MII ||
>>> +	    interface == PHY_INTERFACE_MODE_GMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
>>> +	else if (phy_interface_mode_is_rgmii(interface))
>>> +		phy_intf_sel = PHY_INTF_SEL_RGMII;
>>> +	else if (interface == PHY_INTERFACE_MODE_SGMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_SGMII;
>>> +	else if (interface == PHY_INTERFACE_MODE_RMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_RMII;
>>> +	else if (interface == PHY_INTERFACE_MODE_REVMII)
>>> +		phy_intf_sel = PHY_INTF_SEL_REVMII;
>>> +
>>> +	return phy_intf_sel;
>>> +}
>>> +EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);
>>
>> Nothng wrong with your code, this is out of curiosity.
>>
>> I'm wondering how we are going to support cases like socfpga (and
>> probably some other) where the PHY_INTF_SEL_xxx doesn't directly
>> translate to the phy_interface, i.e.  when you have a PCS or other
>> IP that serialises the MAC interface ?
> 
> It also doesn't differentiate between MII and GMII. That's fine for
> this - this is about producing the configuration for the dwmac's
> phy_intf_sel_i signals. It isn't for configuring the glue hardware
> for any other parameters such as RGMII delays.
>  
>> for socfpga for example, we need to set the PHY_INTF_SEL to GMII_MII
>> when we want to use SGMII / 1000BaseX, but we do set it to RGMII when
>> we need to output RGMII.
> 
> From what I remember for socfpga, you use an external PCS that needs
> GMII. This function doesn't take account of external PCS, and thus
> platform glue that makes use of an external PCS can't implement
> .set_phy_intf_sel() yet.

Makes sense

> As noted, it also doesn't handle TBI (which,
> although we have PHY_INTERFACE_MODE_TBI, Synopsys intended this mode
> to be used to connect to a SerDes for 1000BASE-X.)

That's fine by me, thanks for the clarifications :)

> 
>> Do you have a plan in mind for that ? (maybe a .get_phy_intf_sel() ops ?)
> 
> Yes, there will need to be a way to override this when an external
> PCS is being used. I suspect that all external 1G PCS will use GMII,
> thus we can probably work it out in core code.
> 
> Note, however, that socfpga doesn't use the phy_intf_sel encoding:
> 
> #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII 0x0
> #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RGMII 0x1
> #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RMII 0x2
> 
> #define PHY_INTF_SEL_GMII_MII   0
> #define PHY_INTF_SEL_RGMII      1
> #define PHY_INTF_SEL_RMII       4
> 
> It's close, but it isn't the phy_intf_sel_i[2:0] signal values.

> 
Yeah :/

I'll give this series a try on dwmac-imx once I get a bit of time then !

thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
