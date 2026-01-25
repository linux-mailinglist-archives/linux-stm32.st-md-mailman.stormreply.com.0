Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 67KfMnWXdmnoSgEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A87AD82ABC
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 23:21:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ADC7C87EDB;
	Sun, 25 Jan 2026 22:14:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A97AC87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Jan 2026 22:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 321A4600C3;
 Sun, 25 Jan 2026 22:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED55EC4CEF1;
 Sun, 25 Jan 2026 22:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769379247;
 bh=iZlQMjT87MAKVDpNXN3PnkGFzV2iu5aW29TTIBiz4LU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J6akJgre43BvTHV/oVpuun6heVrwS1teSyBWH6FuCNcPiuDiEFO1PgpjDWyLdqP8N
 QOsluSCZROsPBl5eVixeH74A1gNrAVod6jue+z9olPAMdcM6v7L2iSrq5h1cH8v+52
 6XUIosoZiM4ohYRhYXi2143dPv+iUUh2syQRhIbAJx5NOkLnNCVfklF1UNtAqQ50kS
 D6bIljup//yXFN3doJv8I4aRgDuvNMdEjZJKQ8s4WFqcLSzfu59UkUrrqWYXtIuQtr
 SMQP64HzuOLGlgr2mhNknQFPUmOw+okgeif9F50vg+UrLJCvKw8pS3r53domFjqAI4
 x9N3q6FO5pbdA==
From: Jakub Kicinski <kuba@kernel.org>
To: jan.petrous@oss.nxp.com
Date: Sun, 25 Jan 2026 14:14:05 -0800
Message-ID: <20260125221405.3395497-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123-dwmac_multi_irq-v3-4-cc53f2be8961@oss.nxp.com>
References: <20260123-dwmac_multi_irq-v3-4-cc53f2be8961@oss.nxp.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, s32@nxp.com, edumazet@google.com,
 ghennadi.procopciuc@oss.nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 chester62515@gmail.com, mbrugger@suse.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, kernel@pengutronix.de,
 krzk+dt@kernel.org, shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [v3,
	4/4] stmmac: s32: enable support for Multi-IRQ mode
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A87AD82ABC
X-Rspamd-Action: no action

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
stmmac: s32: enable support for Multi-IRQ mode

This patch enables Multi-IRQ mode for the S32 DWMAC driver when both
multi-queue and per-queue IRQs are configured. The driver now selects
between Multi-IRQ and MAC IRQ modes based on device tree configuration.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..342091045714 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c

[ ... ]

> @@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>  	plat->core_type = DWMAC_CORE_GMAC4;
>  	plat->pmt = 1;
>  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +
> +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
> +	if (plat->rx_queues_to_use > 1 &&
> +	    (res.rx_irq[0] >= 0 || res.tx_irq[0] >= 0)) {
                        ^^^^            ^^^^

Should these checks be "> 0" instead of ">= 0"?

stmmac_get_platform_resources() initializes the res structure with
memset(0), then only writes positive IRQ values when per-queue IRQs are
found in the device tree. If no "rx-queue-0" or "tx-queue-0" interrupt
names are defined, rx_irq[0] and tx_irq[0] remain 0 from the memset.

Since 0 >= 0 evaluates to true, this condition will enable Multi-IRQ
mode even when no per-queue IRQs are available. The commit message states
that "queue based IRQs are set" is a prerequisite, but the current check
does not properly verify this.

> +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +		dev_info(dev, "Multi-IRQ mode (per queue IRQ) selected\n");

[ ... ]
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
