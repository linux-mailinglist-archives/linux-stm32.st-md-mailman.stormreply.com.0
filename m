Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEAFC39F8A
	for <lists+linux-stm32@lfdr.de>; Thu, 06 Nov 2025 10:59:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 923F9C349C4;
	Thu,  6 Nov 2025 09:59:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79EA3C36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Nov 2025 09:59:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3D5364E41562;
 Thu,  6 Nov 2025 09:59:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0CDCD6068C;
 Thu,  6 Nov 2025 09:59:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 12B131185084B; Thu,  6 Nov 2025 10:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762423188; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=sjkbsLOk1J1qbLCFsYmPb8UirWX2oJ8irk9dUQoB4+U=;
 b=B3IcTBqO/gW+Sgfrc4K+C+Ppa0WmthcAcwmEc8d/tYlh16a9N864/hF+pdvPZ6OFLuq/Ka
 EqH+nU0tmFWYA3tXH7EMnUkdrzDEuWdnYSSp+4+Il2ZZ40C6US3YIEgwVGYekStUM2sLch
 Ie02IvL8iVR3iZflib2CttF3wnYu21CPxeqrpDFEE4AKLS7vvN7xAWEyQO7Xthungwk0+3
 G/vK72aetJmuX5n4MUPRtGLecgnthw0ckfhEyhTzJ5GfLd4oLYfxEom0CILmd/Lg89wAE2
 lldxPxFZd8ucyFh88orHbZfNfmEXEKC0p2yjG+rARrta4IfmkAqvmbTMbihvfQ==
Message-ID: <79e02a0f-b426-40a6-8927-cf029d72e7fd@bootlin.com>
Date: Thu, 6 Nov 2025 10:59:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQxinH5WWcunfP7p@shell.armlinux.org.uk>
 <E1vGvoA-0000000DWoV-064n@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <E1vGvoA-0000000DWoV-064n@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/11] net: stmmac: ingenic:
 use PHY_INTF_SEL_xxx to select PHY interface
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



On 06/11/2025 09:57, Russell King (Oracle) wrote:
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
