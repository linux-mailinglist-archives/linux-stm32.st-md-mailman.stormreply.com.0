Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D0DC2FEB0
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 09:34:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02011C62ECF;
	Tue,  4 Nov 2025 08:34:45 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8D2FC62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 08:34:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 33E361A184C;
 Tue,  4 Nov 2025 08:34:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 046FE606EF;
 Tue,  4 Nov 2025 08:34:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94FB810B50919; Tue,  4 Nov 2025 09:34:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762245281; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=R2k3S0JM3GjzlqSiHtx7uGU4oJqackuOaOdMcXWCQD4=;
 b=DCd+FqUxRxIK4KCVyBl2bY1jDIpBnI7OcnY2/p/8CRdl0Idsdm5miT0nvhZL9+PvxW/5g4
 uhT2R3FGkTAnueao/HshktnCuxoAsYmnJz/QIr9rsKpKRWHbD/9lwGb3brlyQyb7aNQJSt
 6YMA05A4UmvBNktmLqQJKBPdxwrZrGQRtExXpstbIvUBv96Huj5Myjkdm3+opAabia8Uf7
 q6GlH55zcK9qoVuUD50tEindxjboWWp7lMVIRDUeZrHEX3xj2vL8O0eLvOCV/rqiffM6KU
 jPOeZdZ6P2OK58ZUes2loyO+XbaQ4HDYIsO8PfB7/dVQd0zJE+R1XEGXcKBQJw==
Message-ID: <db01f926-d5bb-4317-beac-e6dcc0025a80@bootlin.com>
Date: Tue, 4 Nov 2025 09:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vFt4c-0000000Choe-3SII@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

Hi Russell,

On 03/11/2025 12:50, Russell King (Oracle) wrote:
> Provide a function to translate the PHY interface mode to the
> phy_intf_sel pin configuration for dwmac1000 and dwmac4 cores that
> support multiple interfaces. We currently handle MII, GMII, RGMII,
> SGMII, RMII and REVMII, but not TBI, RTBI nor SMII as drivers do not
> appear to use these three and the driver doesn't currently support
> these.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

First, thanks for this work !

[...]

> +int stmmac_get_phy_intf_sel(phy_interface_t interface)
> +{
> +	int phy_intf_sel = -EINVAL;
> +
> +	if (interface == PHY_INTERFACE_MODE_MII ||
> +	    interface == PHY_INTERFACE_MODE_GMII)
> +		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
> +	else if (phy_interface_mode_is_rgmii(interface))
> +		phy_intf_sel = PHY_INTF_SEL_RGMII;
> +	else if (interface == PHY_INTERFACE_MODE_SGMII)
> +		phy_intf_sel = PHY_INTF_SEL_SGMII;
> +	else if (interface == PHY_INTERFACE_MODE_RMII)
> +		phy_intf_sel = PHY_INTF_SEL_RMII;
> +	else if (interface == PHY_INTERFACE_MODE_REVMII)
> +		phy_intf_sel = PHY_INTF_SEL_REVMII;
> +
> +	return phy_intf_sel;
> +}
> +EXPORT_SYMBOL_GPL(stmmac_get_phy_intf_sel);

Nothng wrong with your code, this is out of curiosity.

I'm wondering how we are going to support cases like socfpga (and
probably some other) where the PHY_INTF_SEL_xxx doesn't directly
translate to the phy_interface, i.e.  when you have a PCS or other
IP that serialises the MAC interface ?

for socfpga for example, we need to set the PHY_INTF_SEL to GMII_MII
when we want to use SGMII / 1000BaseX, but we do set it to RGMII when
we need to output RGMII.

Do you have a plan in mind for that ? (maybe a .get_phy_intf_sel() ops ?)

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
