Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2447BE1EAD
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Oct 2025 09:26:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 85CF3C5719D;
	Thu, 16 Oct 2025 07:26:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A74EDC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Oct 2025 07:26:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 753A21A1410;
 Thu, 16 Oct 2025 07:26:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B5756062C;
 Thu, 16 Oct 2025 07:26:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E9147102F22ED; 
 Thu, 16 Oct 2025 09:26:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760599602; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=SBvdFAlAi23UDp3ojHH2j4S4dE5DaAIeZoZagXYkEwU=;
 b=QlSiy2z8FRbylqOI5JK31H//tfXjG/m01GHMyopNZlnia8d5wYZsewwrDedc6gWliys3sD
 fPp9GCSSMoYnaNXpyLh4QGjRtXi+Xh5+wJt7lVcVzqwl8RWLVPl48qr1W33bQKcOhOVTZI
 MEqRyJLTHnIkLNsIeUHRYbPdmrK8GacEkBhl4nya5LTbR2fA0Gm7svxipgvANudElIDPK/
 D3n1zzDLOjzaxAjjHSfiUs7sbDthr9Bky7itfhnWsNmM7uVahnT1406L8rFXmZJy/hPFmo
 /EDz/QY7ov/lpSajdxtCVMSsM0tvCJs6G/Aez1kJyQN9vGqwd4C7t561HNTmCw==
Message-ID: <f78a625f-9138-41fe-827e-fe2e830a18b9@bootlin.com>
Date: Thu, 16 Oct 2025 09:26:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
 <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1v945d-0000000Ameh-3Bs7@rmk-PC.armlinux.org.uk>
X-Last-TLS-Session-Version: TLSv1.3
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 5/5] net: stmmac: rename
 stmmac_phy_setup() to include phylink
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


On 15/10/2025 18:11, Russell King (Oracle) wrote:
> stmmac_phy_setup() does not set up any PHY, but does setup phylink.
> Rename this function to stmmac_phylink_setup() to reflect more what
> it is doing.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 500cfd19e6b5..c9fa965c8566 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1185,7 +1185,7 @@ static int stmmac_init_phy(struct net_device *dev)
>  	return 0;
>  }
>  
> -static int stmmac_phy_setup(struct stmmac_priv *priv)
> +static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  {
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
>  	struct phylink_config *config;
> @@ -7642,7 +7642,7 @@ int stmmac_dvr_probe(struct device *device,
>  	if (ret)
>  		goto error_pcs_setup;
>  
> -	ret = stmmac_phy_setup(priv);
> +	ret = stmmac_phylink_setup(priv);
>  	if (ret) {
>  		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
>  		goto error_phy_setup;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
