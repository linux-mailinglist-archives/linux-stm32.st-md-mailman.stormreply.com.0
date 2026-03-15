Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEBACiPetmlMJwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 17:28:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B53372916D0
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2026 17:28:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F9C8CFAC40;
	Sun, 15 Mar 2026 16:28:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90C22C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2026 16:28:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AE3660130;
 Sun, 15 Mar 2026 16:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97E1C4CEF7;
 Sun, 15 Mar 2026 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773592096;
 bh=xOjKR0tFQLh7NVKP3TuLU6yEiJpBek/7xxzo0eG2SsE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g7LkekBrPJ9cKt/zbK+Lo5Xfhdj3uJc5sNkE8qRDj9+aYIpOrz7GPNnbQ4TdC8GUc
 6GmCGs58jD6kKrvf+CAztmbX8gJTuPsJ6dgzCfxBWtRG81On1wtBnirmdNnJ3MFxgQ
 a6Jm3xF0RzTobFkLPSN3HzEjy5Iheldwz+WvOtjtfqzADfEbbZVoesidFnPkw41qte
 ydXYJS/4EmXl14omp/KQBYmMlQhC7uhtCHvFw2na3xwE228IBwvydRweuL4woSjER0
 WAsbhlPqvR5a6HR26rn2XBjTcAuIzzxZ9o8ylRAbYiUmWnWMd1AF50dSs0n0sdoXXV
 UoqKB4okRRJcQ==
From: Simon Horman <horms@kernel.org>
To: lizhi2@eswincomputing.com
Date: Sun, 15 Mar 2026 16:27:35 +0000
Message-ID: <20260315162735.1427325-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313075416.1607-1-lizhi2@eswincomputing.com>
References: <20260313075416.1607-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 Simon Horman <horms@kernel.org>, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 pinkesh.vaghela@einfochips.com, linmin@eswincomputing.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 palmer@dabbelt.com, mcoquelin.stm32@gmail.com, pjw@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [net-next, v4,
	2/3] net: stmmac: eic7700: enable clocks before syscon access and
	correct RX sampling timing
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:horms@kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B53372916D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: eic7700: enable clocks before syscon access and correct RX sampling timing

The second Ethernet controller (eth1) on the Eswin EIC7700 SoC may fail
to sample RX data correctly at Gigabit speed due to EIC7700-specific
receive clock to data skew at the MAC input in the silicon. The existing
internal delay configuration does not provide sufficient adjustment range
to compensate for this condition at 1000Mbps. Update the EIC7700 DWMAC
glue driver to apply EIC7700-specific clock sampling inversion only
during Gigabit operation on MAC instances that require it.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> index bcb8e000e720..b230bc5b902a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-eic7700.c

[ ... ]

> @@ -61,8 +81,26 @@ static int eic7700_clks_config(void *priv, bool enabled)
>  static int eic7700_dwmac_init(struct device *dev, void *priv)
>  {
>  	struct eic7700_qos_priv *dwc = priv;
> +	int ret;
> +
> +	ret = eic7700_clks_config(dwc, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_set_bits(dwc->eic7700_hsp_regmap,
> +			      dwc->eth_phy_ctrl_offset,
> +			      EIC7700_ETH_TX_CLK_SEL |
> +			      EIC7700_ETH_PHY_INTF_SELI);
> +	if (ret)
> +		return ret;

Does this code leak the enabled clocks? The function calls
eic7700_clks_config(dwc, true) to enable the clocks, then later calls
regmap_set_bits(). If regmap_set_bits() fails, the function returns
without disabling the clocks.

Looking at the caller in stmmac_main.c:stmmac_dvr_probe():

    if (priv->plat->init) {
        ret = priv->plat->init(priv->device, priv->plat->bsp_priv);
        if (ret)
            return ret;
    }

    ret = __stmmac_dvr_probe(priv->device, priv->plat, &res);
    if (ret)
        goto error_exit_init;

The exit handler is only called when __stmmac_dvr_probe() fails, not
when init() fails. This leaves the bulk clocks in the prepared-and-enabled
state on this error path.

> +
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_axi_lp_ctrl_offset,
> +		     EIC7700_ETH_CSYSREQ_VAL);
>
> -	return eic7700_clks_config(dwc, true);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_txd_offset, 0);
> +	regmap_write(dwc->eic7700_hsp_regmap, dwc->eth_rxd_offset, 0);
> +
> +	return 0;
>  }

[ ... ]
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
