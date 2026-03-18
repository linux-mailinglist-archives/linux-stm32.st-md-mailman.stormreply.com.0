Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMpwDythumnFUgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 09:24:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A52B7D9B
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 09:24:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 670A5C35E3C;
	Wed, 18 Mar 2026 08:24:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55DC9C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 08:24:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E3CA5417BA;
 Wed, 18 Mar 2026 08:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53225C19421;
 Wed, 18 Mar 2026 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773822247;
 bh=zbrEzDQ0AblNhXke6/7cPNOTm3Avyhavj22x1LcfmRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FdWYyowzn9WA2aJGuHLNRqX/QEe2NLHcUNCkhDUY64ztt4svOZmzxFrWlzmUHI6xU
 /uZ6hPer+e0gNtoBPTWwrX/4/7Y7NvBA8sBZlt870hhJjKBW7mlNFErn5jRqmcWzUI
 ZvuE9nLCPHP31SJgQXUPwHPO6asgJzE8clgaERBQLzu6N9cYSGvueZs5NEtbkDxERW
 0uJbhCBwzFOmdXng/YhTB1b3/JQeJfKObJH/IhHBdmBsZiqjuYj2FAYfYX/gYxNizC
 3PxPrHxwNqCsWYeU/7l/EP6+bQvr/f/z2ZIb4fdI4QjIBTDeTbHHgHvFBmLlYCncbE
 OJTQxjRlH3XgQ==
From: Simon Horman <horms@kernel.org>
To: a0987203069@gmail.com
Date: Wed, 18 Mar 2026 08:23:46 +0000
Message-ID: <20260318082346.1825390-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316055427.1310569-4-a0987203069@gmail.com>
References: <20260316055427.1310569-4-a0987203069@gmail.com>
MIME-Version: 1.0
Cc: andrew@lunn.ch, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Simon Horman <horms@kernel.org>, richardcochran@gmail.com,
 peppe.cavallaro@st.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next, v14,
	3/3] net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35
	family
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
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:horms@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,davemloft.net];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.693];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url]
X-Rspamd-Queue-Id: CA0A52B7D9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

Add support for Gigabit Ethernet on Nuvoton MA35 series using dwmac
driver.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c
> @@ -0,0 +1,136 @@

[ ... ]

> +static int nvt_gmac_probe(struct platform_device *pdev)
> +{
> +	struct plat_stmmacenet_data *plat_dat;
> +	struct stmmac_resources stmmac_res;
> +	struct device *dev = &pdev->dev;
> +	struct nvt_priv_data *priv;
> +	int ret;
> +
> +	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get platform resources\n");
> +
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	if (IS_ERR(plat_dat))
> +		return dev_err_probe(dev, PTR_ERR(plat_dat), "Failed to get platform data\n");
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return dev_err_probe(dev, -ENOMEM, "Failed to allocate private data\n");
> +
> +	priv->regmap = syscon_regmap_lookup_by_phandle_args(dev->of_node, "nuvoton,sys",
> +							    1, &priv->macid);
> +	if (IS_ERR(priv->regmap))
> +		ret = dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");
> +
> +	if (priv->macid > 1)
> +		ret = dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");
>                                                                                   ^^^^

Does this code return the error on failure? The dev_err_probe() result is
assigned to ret but the function continues execution without returning.

Russell King's v12 review suggested using set_phy_intf_sel callback,
which led to significant refactoring in v12. This refactoring appears to
have inadvertently broken the error handling here and below.

The code should be:
	if (IS_ERR(priv->regmap))
		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to get sys register\n");

	if (priv->macid > 1)
		return dev_err_probe(dev, -EINVAL, "Invalid sys arguments\n");

See Russell's v12 review:
https://lore.kernel.org/netdev/aYsurPBMnzWDZCco@shell.armlinux.org.uk/

> +
> +	plat_dat->bsp_priv = priv;
> +	plat_dat->set_phy_intf_sel = nvt_set_phy_intf_sel;
> +
> +	return stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
> +}

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
