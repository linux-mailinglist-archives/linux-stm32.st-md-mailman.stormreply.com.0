Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2B6C3001E
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 09:44:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9511C62ECF;
	Tue,  4 Nov 2025 08:44:11 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D85E1C62ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 08:44:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 57CFE1A1856;
 Tue,  4 Nov 2025 08:44:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 255AC606EF;
 Tue,  4 Nov 2025 08:44:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D10FD10B508D9; Tue,  4 Nov 2025 09:44:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762245848; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=0ou/gTfBTt7Wprt1RCKinoE0CRdPLoTJcbQgIfWcSKs=;
 b=jlF7lq3Iz+l+2JGMUu5dkgxs3HIUO5VzVJkidrjRxf99R05cpBkyiXt34TR+gjDc3Y9p/l
 /EFDclvJ4y+F/wqF3TBN912tjXIjmQUqfOlz43QsDOYDwUs/HhDYUZ4G0jMGicdJROUj/Z
 hxVkLjkrDxOwNepO1EuxbB++3q4kuC0JC/GYgp9MYw+lGNqk0YJN5rIzMMYvTG97JZmnAy
 FPD+kdAVa1r7xVf6TUtTYgPwl8wdgRXjdUa0vDYsHaHLp64/bHPPqbA+YkPIZXvOA+zLDX
 Yqiill3FxkQbWEf48OleR5Z+9qEj9M2Jna6akwP/5NldP7lQzdDDuY2yFviKog==
Message-ID: <e2d250f1-64d6-44e6-b894-510465787bd8@bootlin.com>
Date: Tue, 4 Nov 2025 09:44:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aQiWzyrXU_2hGJ4j@shell.armlinux.org.uk>
 <E1vFt4X-0000000ChoY-30p9@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vFt4X-0000000ChoY-30p9@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: imx@lists.linux.dev, s32@nxp.com,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 03/11] net: stmmac: add
 phy_intf_sel and ACTPHYIF definitions
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



On 03/11/2025 12:50, Russell King (Oracle) wrote:
> Add definitions for the active PHY interface found in DMA hardware
> feature register 0, and also used to configure the core in multi-
> interface designs via phy_intf_sel.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/common.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
> index 27083af54568..7395bbb94aea 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/common.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/common.h
> @@ -313,6 +313,16 @@ struct stmmac_safety_stats {
>  #define DMA_HW_FEAT_ACTPHYIF	0x70000000	/* Active/selected PHY iface */
>  #define DEFAULT_DMA_PBL		8
>  
> +/* phy_intf_sel_i and ACTPHYIF encodings */
> +#define PHY_INTF_SEL_GMII_MII	0
> +#define PHY_INTF_SEL_RGMII	1
> +#define PHY_INTF_SEL_SGMII	2
> +#define PHY_INTF_SEL_TBI	3
> +#define PHY_INTF_SEL_RMII	4
> +#define PHY_INTF_SEL_RTBI	5
> +#define PHY_INTF_SEL_SMII	6
> +#define PHY_INTF_SEL_REVMII	7
> +
>  /* MSI defines */
>  #define STMMAC_MSI_VEC_MAX	32
>  
This matches the docs I have :)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
