Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C86BFC2BB
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Oct 2025 15:34:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E28DC57B7B;
	Wed, 22 Oct 2025 13:34:31 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31FF8C57B64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Oct 2025 13:34:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C342E1A15C8;
 Wed, 22 Oct 2025 13:34:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7D83E606DC;
 Wed, 22 Oct 2025 13:34:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D361102F242F; 
 Wed, 22 Oct 2025 15:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761140067; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=rkViBGu74KDxz9qDROM+0Y+EYcnboJC0J4JeqwsrGfw=;
 b=GlLCGWYivjHGhUt5UODhGa9mb++fg96pBZX0r044UV3KnmUGCn8/IVIiJoBTybhz4peGdy
 gdPWSBp/m26CR680XAnYDUjFnrPv54dOpLD5kS2pm5YHGQGoH/T6LuC7RYckY5V+6q8iKK
 D4C0K1aTkN9/x3Rxs6MdPx59TzRARq/MFhxp5ZN8JdinR0cF6JsoPDSqd0/PLVRi1jefkr
 U8F+cCMCFnjK4bt+ZJ8mD78OCeVKLDsvddhGwXe7z3QZJaTFsgFTp/TZQzOZrX+AvTCV6r
 NgY/fmcEmKNMpB6ktQQVpYPzFptSymM9UmJNwxHrKiqhEPR4vnZyMX5T0mo5gg==
Message-ID: <1e4d3ec3-2e20-46a3-95d3-d3e3c22db4bc@bootlin.com>
Date: Wed, 22 Oct 2025 15:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
 <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v9jCJ-0000000B2NQ-0mhG@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: phy: add
	phy_can_wakeup()
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



On 17/10/2025 14:04, Russell King (Oracle) wrote:
> Add phy_can_wakeup() to report whether the PHY driver has marked the
> PHY device as being wake-up capable as far as the driver model is
> concerned.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  include/linux/phy.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 3c7634482356..3eeeaec52832 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1379,6 +1379,18 @@ static inline void phy_disable_eee_mode(struct phy_device *phydev, u32 link_mode
>  	linkmode_clear_bit(link_mode, phydev->advertising_eee);
>  }
>  
> +/**
> + * phy_can_wakeup() - indicate whether PHY has driver model wakeup capabilities
> + * @phydev: The phy_device struct
> + *
> + * Returns: true/false depending on the PHY driver's device_set_wakeup_capable()
> + * setting.
> + */
> +static inline bool phy_can_wakeup(struct phy_device *phydev)
> +{
> +	return device_can_wakeup(&phydev->mdio.dev);
> +}
> +
>  void phy_resolve_aneg_pause(struct phy_device *phydev);
>  void phy_resolve_aneg_linkmode(struct phy_device *phydev);
>  

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
