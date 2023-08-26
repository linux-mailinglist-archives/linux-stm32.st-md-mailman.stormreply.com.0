Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E45D7896E8
	for <lists+linux-stm32@lfdr.de>; Sat, 26 Aug 2023 15:32:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A0FEC6B44F;
	Sat, 26 Aug 2023 13:32:21 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7677C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 13:32:19 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5007f3d3235so2763387e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Aug 2023 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693056739; x=1693661539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IkJ7s8OrsLy9BfgJwAFkbNy+c764NK4QgxuZUl0LtFo=;
 b=bUcLauVa3UalyuzHJnik09YWrDw/DeI+/Ao3YFhMPPx9zWGHjn71E0vHNj2inQe6WO
 r26MvoC7HE+ISnOssAMaHidPPi0j8ZsPrAAoB39t0tjH4jGZ4qngR0p/QMqosPvwID3t
 +Z+bb1rHxw6RByu6rw2yCKU6hF5Wo+KZuO6+3D2Gteo7zLjCIwDdYsuALuSKU+oGDd3y
 RssbsMa1FYxf7oq2/S7afqVVWhWgE0KuMhE3rHf/U5xnjZvLI3gqp7cu0gEaPiu5TJhl
 2O7rav7xd339Vd2pGMA2xga+2HkTuPucLKF24jjjVxzQnBxeSfbcytPHsQG7F87Ddq9C
 n4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693056739; x=1693661539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkJ7s8OrsLy9BfgJwAFkbNy+c764NK4QgxuZUl0LtFo=;
 b=giqZLxtbwluQtPCDjx4D91zxLdlv4aslxSbN9EVy3g3At2niBTSZpL9ErmHfZO/REr
 88CdwARqragcqbZqKIKZ6QbBBcji4dlEJyFr3tVxNfpJ4kC3nxe5d1bffyjbjfvtQfvK
 sl7J5LjZF+NnoEODAB3n7JlLmvZtBJ6LPiAo0Zzq1Mfzuvzzi/GwlNwo+3ubZ4EoPPU5
 NmKD1IYnEnyE/MyjEbX7fuSImKrF3Bk6jc4t43op/dQjJkTiaq/fDtErJ+SgjYOSoGXO
 MSIwbb1TX2O8SwKn3YHmEQ8oCOBr8reA9UDEBtSOdFtoTCsD3uJd7chno9h1IRCenkFu
 32Jw==
X-Gm-Message-State: AOJu0YzlTUsQaGhthE4qjS6o45JowJqemuzYcQJomcrnnKOIi1iIucf2
 e6VcbITLfDUcIO68mN+yPE0=
X-Google-Smtp-Source: AGHT+IER9+Ix/5U4zo/mvxWZ8NAT0EXTNAoaCbHNthqYpZAi1xLAQEQ/2uTxn94TPquRaZnTHv7tdA==
X-Received: by 2002:a05:6512:1042:b0:4fe:d0f:1f1e with SMTP id
 c2-20020a056512104200b004fe0d0f1f1emr18744343lfb.25.1693056738553; 
 Sat, 26 Aug 2023 06:32:18 -0700 (PDT)
Received: from mobilestation ([95.79.200.178])
 by smtp.gmail.com with ESMTPSA id
 x2-20020ac25dc2000000b004fe39f31dc7sm715616lfq.294.2023.08.26.06.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 06:32:17 -0700 (PDT)
Date: Sat, 26 Aug 2023 16:32:15 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <rpwsyyjdzeixx3f7o3pxeslyff7yc3fuutm436ygjggoyiwjcb@7s3skg627mid>
References: <ZOddFH22PWmOmbT5@shell.armlinux.org.uk>
 <E1qZAXd-005pUP-JL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qZAXd-005pUP-JL@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 08/10] net: stmmac: move xgmac
 specific phylink caps to dwxgmac2 core
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

On Thu, Aug 24, 2023 at 02:38:29PM +0100, Russell King (Oracle) wrote:
> Move the xgmac specific phylink capabilities to the dwxgmac2 support
> core.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 10 ++++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c   | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index 34e1b0c3f346..f352be269deb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -47,6 +47,14 @@ static void dwxgmac2_core_init(struct mac_device_info *hw,
>  	writel(XGMAC_INT_DEFAULT_EN, ioaddr + XGMAC_INT_EN);
>  }
>  
> +static void xgmac_phylink_get_caps(struct stmmac_priv *priv)
> +{
> +	priv->phylink_config.mac_capabilities |= MAC_2500FD | MAC_5000FD |
> +						 MAC_10000FD | MAC_25000FD |
> +						 MAC_40000FD | MAC_50000FD |
> +						 MAC_100000FD;
> +}
> +
>  static void dwxgmac2_set_mac(void __iomem *ioaddr, bool enable)
>  {
>  	u32 tx = readl(ioaddr + XGMAC_TX_CONFIG);
> @@ -1490,6 +1498,7 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr, u32 num_txq,
>  
>  const struct stmmac_ops dwxgmac210_ops = {
>  	.core_init = dwxgmac2_core_init,

> +	.phylink_get_caps = xgmac_phylink_get_caps,

This doesn't look correct. DW XGMAC doesn't support 25/40/50/100Gbps
speeds.

>  	.set_mac = dwxgmac2_set_mac,
>  	.rx_ipc = dwxgmac2_rx_ipc,
>  	.rx_queue_enable = dwxgmac2_rx_queue_enable,
> @@ -1551,6 +1560,7 @@ static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
>  
>  const struct stmmac_ops dwxlgmac2_ops = {
>  	.core_init = dwxgmac2_core_init,

> +	.phylink_get_caps = xgmac_phylink_get_caps,

This is ok.

-Serge(y)

>  	.set_mac = dwxgmac2_set_mac,
>  	.rx_ipc = dwxgmac2_rx_ipc,
>  	.rx_queue_enable = dwxlgmac2_rx_queue_enable,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 0b02845e7e9d..5cf8304564c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1227,16 +1227,6 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
>  	/* Get the MAC specific capabilities */
>  	stmmac_mac_phylink_get_caps(priv);
>  
> -	if (priv->plat->has_xgmac) {
> -		priv->phylink_config.mac_capabilities |= MAC_2500FD;
> -		priv->phylink_config.mac_capabilities |= MAC_5000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_10000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_25000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_40000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_50000FD;
> -		priv->phylink_config.mac_capabilities |= MAC_100000FD;
> -	}
> -
>  	/* Half-Duplex can only work with single queue */
>  	if (priv->plat->tx_queues_to_use > 1)
>  		priv->phylink_config.mac_capabilities &=
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
