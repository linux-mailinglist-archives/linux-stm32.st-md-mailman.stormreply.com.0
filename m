Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BCFC24DDA
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 12:53:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C030C62D9F;
	Fri, 31 Oct 2025 11:53:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4BA8C1A983
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 11:53:29 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E7D664E41439;
 Fri, 31 Oct 2025 11:53:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BA19160704;
 Fri, 31 Oct 2025 11:53:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F171D118120AD; Fri, 31 Oct 2025 12:53:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761911607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=od4tl//dkTjTTGruGKmAJY8x9vKseCkLwaepLH9PMTU=;
 b=gqKwR/CoH45ZjL/r6y039td1WrA3k224uIqW+R73xxUh2pc8PGQjGi4BPbx8t8QYiDup2j
 Dg5E6vslqvFHFBlm9PfNtuEYxQhPL8DkwBrr7GHb1+mlTg8V24sWgrgdoEoJFVUwbJLF6z
 f8R44rk8WH//zLPrjZJeCxuQwX6I/8HOUmgT3XtrmGCHfF9VOYHk37enoPP4B1WonpSIlZ
 YAujIsDnmsXY2FB5846Al9F/YIZN5AOBb6vJkys8fVvs0f0c9LNaYQ4f6PwVoF4SzFikVm
 mER8Ymg7LwFJT3XtuuG3PK+CkQU2ZBU6H/Uh7SPTYivUyYI+CmTtzN/Cdxh9Fw==
Message-ID: <baa56d1d-02f2-4c87-a3da-a7c1cba5a34a@bootlin.com>
Date: Fri, 31 Oct 2025 12:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vEn1W-0000000CHoi-2koP@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>,
 netdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Fabio Estevam <festevam@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: imx: use phylink's
 interface mode for set_clk_tx_rate()
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

On 31/10/2025 12:10, Russell King (Oracle) wrote:
> imx_dwmac_set_clk_tx_rate() is passed the interface mode from phylink
> which will be the same as plat_dat->phy_interface. Use the passed-in
> interface mode rather than plat_dat->phy_interface.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Tested on imx8mp w/ rgmii-id PHY (ksz9131)

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index 4268b9987237..147fa08d5b6e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -195,9 +195,6 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
>  static int imx_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
>  				     phy_interface_t interface, int speed)
>  {
> -	struct imx_priv_data *dwmac = bsp_priv;
> -
> -	interface = dwmac->plat_dat->phy_interface;
>  	if (interface == PHY_INTERFACE_MODE_RMII ||
>  	    interface == PHY_INTERFACE_MODE_MII)
>  		return 0;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
