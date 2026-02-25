Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qARwJPy/nmnsXAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 10:25:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B151194E8C
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 10:25:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E035EC8F284;
	Wed, 25 Feb 2026 09:25:15 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44557C8F281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 09:25:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 15D2F40E0B;
 Wed, 25 Feb 2026 09:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C5DC19422;
 Wed, 25 Feb 2026 09:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772011512;
 bh=NVl0XIW72KAhGvaPeyo/7NTd/1b/tlHpMZEcCiTlegM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MlFU4BBWC1HPasx276GWqfaq/QOBboToGp0pvjjvuj1GJAEAIP1IVxHdQ229N1nJ1
 cH5zb92QVL+SPBmBIzFGM17hk4NsxeQg+eQvsCCb01wQ7FZ0mNNmZu9pT5aRUWaJqT
 7beomQPmrFZFEHjyuOGfgbeKw2a9KjIorAW2fSboKnnUwoWy1c7JacDG4JYhV80+1w
 U07ANgmSqXtfa0TkFaPk3mq4GYWLh4DeBO18ffsWZsqR4xlFTV47rAtd/1kxZIQQGT
 hMfuqOW4kbN1o4c/c5499KlPCxm//TtzFnfmgIZdm/1TvJBxwgG9hsb/hpQJyMe45g
 shnTEi0SQ4oTQ==
From: Simon Horman <horms@kernel.org>
To: jan.petrous@oss.nxp.com
Date: Wed, 25 Feb 2026 09:24:56 +0000
Message-ID: <20260225092456.174241-1-horms@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223-dwmac_multi_irq-v5-1-8fc699a5fac4@oss.nxp.com>
References: <20260223-dwmac_multi_irq-v5-1-8fc699a5fac4@oss.nxp.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, s32@nxp.com, Frank.Li@nxp.com, edumazet@google.com,
 ghennadi.procopciuc@oss.nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 kernel@pengutronix.de, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, chester62515@gmail.com,
 mcoquelin.stm32@gmail.com, mbrugger@suse.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 Simon Horman <horms@kernel.org>, krzk+dt@kernel.org, shawnguo@kernel.org,
 davem@davemloft.net
Subject: Re: [Linux-stm32] [v5, 1/4] net: stmmac: platform: read channels irq
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:kernel@pengutronix.de,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mcoquelin.stm32@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
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
	NEURAL_HAM(-0.00)[-0.279];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 3B151194E8C
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: platform: read channels irq

This commit adds support for reading IRQ resources for all rx/tx channels
in the stmmac platform driver to enable Multi-IRQ mode for platform glue
drivers.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 5c9fd91a1db9..6166a9b0c0bb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
>  int stmmac_get_platform_resources(struct platform_device *pdev,
>  				  struct stmmac_resources *stmmac_res)
>  {
> +	char name[16];
> +	int i;
> +
>  	memset(stmmac_res, 0, sizeof(*stmmac_res));
>
>  	/* Get IRQ information early to have an ability to ask for deferred
> @@ -735,7 +738,42 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
>
>  	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
>
> -	return PTR_ERR_OR_ZERO(stmmac_res->addr);
> +	if (IS_ERR(stmmac_res->addr))
> +		return PTR_ERR(stmmac_res->addr);
> +
> +	/* RX channels irq */
> +	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
> +		scnprintf(name, sizeof(name), "rx-queue-%d", i);
> +		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev,
> +									 name);
> +		if (stmmac_res->rx_irq[i] <= 0) {
> +			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			dev_dbg(&pdev->dev, "IRQ rx-queue-%d not found\n", i);
> +
> +			/* Stop on first unset rx-queue-%i property member */
> +			stmmac_res->rx_irq[i] = 0;
> +			break;
> +		}
> +	}
> +
> +	/* TX channels irq */
> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
> +		scnprintf(name, sizeof(name), "tx-queue-%d", i);
> +		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev,
> +									 name);
> +		if (stmmac_res->tx_irq[i] <= 0) {
> +			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
> +				return -EPROBE_DEFER;
> +			dev_dbg(&pdev->dev, "IRQ tx-queue-%d not found\n", i);
> +
> +			/* Stop on first unset tx-queue-%i property member */
> +			stmmac_res->tx_irq[i] = 0;
> +			break;
> +		}
> +	}

This isn't a bug, but the RX and TX channel IRQ handling blocks follow an
identical 14-line pattern that differs only in the queue name format string
and target array. Both blocks format the IRQ name with scnprintf(), call
platform_get_irq_byname_optional(), check for -EPROBE_DEFER, log a debug
message on error, and break on the first missing IRQ.

Could this duplication be reduced with a helper function? Note that the
existing code in this function already contains similar non-factored
patterns for wol_irq and sfty_irq handling, so this level of duplication
may be acceptable in this file's style.

> +
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
