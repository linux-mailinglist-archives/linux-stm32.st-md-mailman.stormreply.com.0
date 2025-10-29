Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3610C213D3
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 17:40:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85B8BC57B41;
	Thu, 30 Oct 2025 16:40:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9FD1C62D55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 19:29:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D118F4E413D7;
 Wed, 29 Oct 2025 19:29:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89565606E8;
 Wed, 29 Oct 2025 19:29:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7CC4117FD242; Wed, 29 Oct 2025 20:28:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761766144; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=ScvcTy8ozlqmT8s8gsLtsWpW/tRbjYKzmG+MWRwqsow=;
 b=er6dy6F0AkewbZOEtLIUH1uP7pet6Cc/msERkGQj89coxq5gPxp79ydF7hrtmMaQwPae2e
 uKdCy801xdNppwVzk/dnqIlmlEooSk/olx+i977JcRUAOAZsVebEvZLagVUJ0GR5gFCoYj
 1wG5ZcCJvB5MbkqzdG+DEVfkE9enbz3rcHSu3T8DRrGQ5IEFBbaXpBi2/WIWrY/8uFjC58
 uDQ6O6z2aTI7krrSv6/9WHoGrx8Gg1HrDd7uxWjdQuLgdxX5Gm0kERnj+x6t7h14gCgG5w
 xU5A0dKajRosGpPsX+Autsu+EYwon2yf2lb9QOA6VLsOi9U/q565lvcFW9s9fQ==
Message-ID: <45ebd2eb-9b09-43fa-a451-29299b33f06a@bootlin.com>
Date: Wed, 29 Oct 2025 20:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Inochi Amaoto <inochiama@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-3-inochiama@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251028003858.267040-3-inochiama@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Thu, 30 Oct 2025 16:40:14 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 2/3] net: phy: Add helper for fixing
 RGMII PHY mode based on internal mac delay
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

Hi,

On 28/10/2025 01:38, Inochi Amaoto wrote:
> The "phy-mode" property of devicetree indicates whether the PCB has
> delay now, which means the mac needs to modify the PHY mode based
> on whether there is an internal delay in the mac.
> 
> This modification is similar for many ethernet drivers. To simplify
> code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
> mac_rxid) to fix PHY mode based on whether mac adds internal delay.
> 
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

Name may be a bit long, but I'm not the best at naming stuff :)

I agree with the logic of that helper,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/phy/phy-core.c | 43 ++++++++++++++++++++++++++++++++++++++
>  include/linux/phy.h        |  3 +++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
> index 605ca20ae192..4f258fb409da 100644
> --- a/drivers/net/phy/phy-core.c
> +++ b/drivers/net/phy/phy-core.c
> @@ -101,6 +101,49 @@ const char *phy_rate_matching_to_str(int rate_matching)
>  }
>  EXPORT_SYMBOL_GPL(phy_rate_matching_to_str);
>  
> +/**
> + * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
> + * mode based on whether mac adds internal delay
> + *
> + * @interface: The current interface mode of the port
> + * @mac_txid: True if the mac adds internal tx delay
> + * @mac_rxid: True if the mac adds internal rx delay
> + *
> + * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
> + * not apply the internal delay
> + */
> +phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
> +						bool mac_txid, bool mac_rxid)
> +{
> +	if (!phy_interface_mode_is_rgmii(interface))
> +		return interface;
> +
> +	if (mac_txid && mac_rxid) {
> +		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> +			return PHY_INTERFACE_MODE_RGMII;
> +		return PHY_INTERFACE_MODE_NA;
> +	}
> +
> +	if (mac_txid) {
> +		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> +			return PHY_INTERFACE_MODE_RGMII_RXID;
> +		if (interface == PHY_INTERFACE_MODE_RGMII_TXID)
> +			return PHY_INTERFACE_MODE_RGMII;
> +		return PHY_INTERFACE_MODE_NA;
> +	}
> +
> +	if (mac_rxid) {
> +		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
> +			return PHY_INTERFACE_MODE_RGMII_TXID;
> +		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
> +			return PHY_INTERFACE_MODE_RGMII;
> +		return PHY_INTERFACE_MODE_NA;
> +	}
> +
> +	return interface;
> +}
> +EXPORT_SYMBOL_GPL(phy_fix_phy_mode_for_mac_delays);
> +
>  /**
>   * phy_interface_num_ports - Return the number of links that can be carried by
>   *			     a given MAC-PHY physical link. Returns 0 if this is
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3c7634482356..0bc00a4cceb2 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1813,6 +1813,9 @@ static inline bool phy_is_pseudo_fixed_link(struct phy_device *phydev)
>  	return phydev->is_pseudo_fixed_link;
>  }
>  
> +phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
> +						bool mac_txid, bool mac_rxid);
> +
>  int phy_save_page(struct phy_device *phydev);
>  int phy_select_page(struct phy_device *phydev, int page);
>  int phy_restore_page(struct phy_device *phydev, int oldpage, int ret);

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
