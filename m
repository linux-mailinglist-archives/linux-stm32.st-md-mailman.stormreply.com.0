Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A1D2A718
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Jan 2026 03:58:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1077C8F28F;
	Fri, 16 Jan 2026 02:58:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82C01C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jan 2026 02:58:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 79DF460167;
 Fri, 16 Jan 2026 02:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5783DC116D0;
 Fri, 16 Jan 2026 02:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768532332;
 bh=Z8pz7s7wIhRbbyi0eFN+WPj/og6acecvdgN9FzzA8w4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dnytLdQmwn45B3ZBFM/hT5sAyAKdFL8cS0MtmDxP7MsiosPTNfXT0MpvAg4XUmPR1
 9ilmf53jlm8YkeMW8Jc00GdC18E/n5VkbyRY35TuR4ZFW3xHmu5MqZhldWLAs9WUSK
 /f4lxWwLUTm3EtNqbHTGJ6xq8H/Hbkzv9EYuOXM3dRA+y+BjroCeUguepRPNbHs5bW
 HWXDCT8AAsaXSVsydq/roIP7T+Q4pURm9S1g6LaAWJgEtkvJTHu51+NaeveREFBpMY
 X9nW+jIvyV1Fwhk/5S6JbWK4h0Vdq7ghGQqgKK9I+Xsmal+MWtXHfobV8mowfGNh2C
 Fbshsj4QJPOxg==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Date: Thu, 15 Jan 2026 18:57:24 -0800
Message-ID: <20260116025723.354031-2-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
References: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: konrad.dybcio@oss.qualcomm.com, andrew@lunn.ch, mohd.anwar@oss.qualcomm.com,
 edumazet@google.com, neil.armstrong@linaro.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 vkoul@kernel.org, mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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

I haven't investigated too closely if this is legit or too defensive
TBH but since I'm sending the second one I'll include this as well..

This is an AI-generated review of your patch.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: add stmmac core serdes support

This commit adds SerDes PHY support to the stmmac core driver, moving it
from platform glue into the integrated PCS driver. The serdes field in
platform data is optional and NULL when not provided by platforms.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24a2555ca329..6c515f9efbe7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c

[ ... ]

> @@ -3549,12 +3550,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>
>  static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
>  {
> +	dwmac_serdes_power_on(priv);
> +	/* Only sets the SerDes mode if it wasn't already configured. */
> +	dwmac_serdes_init_mode(priv, priv->plat->phy_interface);

When priv->plat->serdes is NULL, dwmac_serdes_init_mode() will call
phy_get_mode(NULL). Unlike other phy_* functions (phy_power_on,
phy_power_off, phy_set_mode_ext, phy_init, phy_exit) which handle NULL
by returning early, phy_get_mode() is an inline that directly
dereferences the pointer:

    static inline enum phy_mode phy_get_mode(struct phy *phy)
    {
        return phy->attrs.mode;
    }

Can this NULL pointer dereference occur when a platform does not
populate plat->serdes? The call path stmmac_open() -> dwmac_serdes_init()
returns 0 (success) when serdes is NULL, allowing __stmmac_open() ->
stmmac_hw_setup() -> stmmac_clk_rx_i_require() to proceed.

> +	phylink_rx_clk_stop_block(priv->phylink);
>  }

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
> new file mode 100644
> index 000000000000..3003e1ae38d2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c

[ ... ]

> +int dwmac_serdes_init(struct stmmac_priv *priv)
> +{
> +	size_t i;
> +	int ret;
> +
> +	if (!priv->plat->serdes)
> +		return 0;

This returns success when serdes is NULL...

[ ... ]

> +int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	struct phy *serdes = priv->plat->serdes;
> +
> +	if (phy_get_mode(serdes) == PHY_MODE_ETHERNET)
                         ^^^^^^

...but dwmac_serdes_init_mode() has no NULL check before calling
phy_get_mode(), which will crash when serdes is NULL. Should this
function also check for NULL serdes before calling phy_get_mode()?

> +		return 0;
> +
> +	return dwmac_serdes_set_mode(priv, interface);
> +}
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
