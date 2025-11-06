Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 106F4C39EB5
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 10:53:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE6C0C349C4;
	Thu,  6 Nov 2025 09:53:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46A9CC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 09:53:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C84704E4155D;
 Thu,  6 Nov 2025 09:53:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 989D86068C;
 Thu,  6 Nov 2025 09:53:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2733811850340; Thu,  6 Nov 2025 10:53:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762422808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=pw5SlnDVGg7XnK8uA3BZSl59TvohLK7BdiQD5CmzpRU=;
 b=WGba7FfjxUihzh5NJ092gkGULz4A3iRfaOMgrATtvO0V+mEdHkt5mu5RcaVNdbwVCdzchD
 YTSbI5Z5C+q7DSadJT5kMyAlLaBj+IGJfrMEb1JnpFktZA/AtG/q8OkLKNcotGflqsCylO
 V/y/y9Cdr6wOAc7xpgqUs00jLgfnp/14Pk6bFZ49b7AMras6N1mnEVkyhu9iLsi+fMsRkd
 ACIDLypulDjblLVtCvGMeVNaDyDHtZBu25DYTzIGxP+ipFsrGBdrDP4OaTVQ9gX640P3hX
 BlyG0qWrvXF9UcrHrYBDuz8NJKhROBbJcwIfLHxubyfeqHwhwZsRHdBjZTVw3w==
Message-ID: <bc412e39-7286-426d-924b-49989434b9bb@bootlin.com>
Date: Thu, 6 Nov 2025 10:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
 <E1vGdWp-0000000Clna-18SE@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vGdWp-0000000Clna-18SE@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 03/11] net: stmmac: ingenic: use
 PHY_INTF_SEL_xxx to select PHY interface
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



On 05/11/2025 14:26, Russell King (Oracle) wrote:
> Use the common dwmac definitions for the PHY interface selection field.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> index c6c82f277f62..5de2bd984d34 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
> @@ -35,10 +35,10 @@
>  #define MACPHYC_RX_DELAY_MASK		GENMASK(10, 4)
>  #define MACPHYC_SOFT_RST_MASK		GENMASK(3, 3)
>  #define MACPHYC_PHY_INFT_MASK		GENMASK(2, 0)
> -#define MACPHYC_PHY_INFT_RMII		0x4
> -#define MACPHYC_PHY_INFT_RGMII		0x1
> -#define MACPHYC_PHY_INFT_GMII		0x0
> -#define MACPHYC_PHY_INFT_MII		0x0
> +#define MACPHYC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
> +#define MACPHYC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
> +#define MACPHYC_PHY_INFT_GMII		PHY_INTF_SEL_GMII_MII
> +#define MACPHYC_PHY_INFT_MII		PHY_INTF_SEL_GMII_MII
>  
>  #define MACPHYC_TX_DELAY_PS_MAX		2496
>  #define MACPHYC_TX_DELAY_PS_MIN		20

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
