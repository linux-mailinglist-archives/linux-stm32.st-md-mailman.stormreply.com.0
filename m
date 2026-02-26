Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFwvAUo2oGkqgwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 13:02:18 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 702A01A5851
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 13:02:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2AB8C8F281;
	Thu, 26 Feb 2026 12:02:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAB32C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 12:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38A8D402F9;
 Thu, 26 Feb 2026 12:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683BDC116C6;
 Thu, 26 Feb 2026 12:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772107327;
 bh=sGT3zB4PMQOjRhDKzNF3kekJSTQmbRUhYHGyuKAUGNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TLfZrHWENmWZlBh81ogh6V/eGtLXm0ERJty8FFF8pp7dCJw3dmsqN/quGAJLid+l1
 MdQb07FXpoVMclP/sCh1opQYGsbNOkjzGHNfFJmF3fMMHoUlmPMKMDhql1WLd92w0S
 fqdxDfkyCb6k8QsI+Gti5qGykVvLMCtQA95nGUrVQ5pr+lFYHOW3GQeR/r5ty151re
 2NlRX1iv7osBll+mfheLd3oX+Dk1WhbkmMyW4WmYvMjTCTWWUW/2WkpbkAk17lAVut
 LtvidLytHdtiwt8Eo/gb0HanXjO3czrTjkAqhDKVmHh8z1lvNSpsJmKZ/Y+RmlqP2t
 LbPveDPjVPaAA==
Date: Thu, 26 Feb 2026 12:02:00 +0000
From: Simon Horman <horms@kernel.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Message-ID: <aaA2ODfcRcFDkPPt@horms.kernel.org>
References: <20260223-dwmac_multi_irq-v5-4-8fc699a5fac4@oss.nxp.com>
 <20260225092513.174261-1-horms@kernel.org>
 <aZ7IwgwP5iy2kej8@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ7IwgwP5iy2kej8@lsv051416.swis.nl-cdc01.nxp.com>
Cc: imx@lists.linux.dev, s32@nxp.com, Frank.Li@nxp.com, edumazet@google.com,
 ghennadi.procopciuc@oss.nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, chester62515@gmail.com,
 mbrugger@suse.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, kernel@pengutronix.de, krzk+dt@kernel.org,
 shawnguo@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [v5,
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jan.petrous@oss.nxp.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	GREYLIST(0.00)[pass,meta];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:server fail];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.596];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:url,stormreply.com:url,stormreply.com:email,horms.kernel.org:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 702A01A5851
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 11:02:42AM +0100, Jan Petrous wrote:
> On Wed, Feb 25, 2026 at 09:25:13AM +0000, Simon Horman wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> > ---
> > stmmac: s32: enable support for Multi-IRQ mode
> > 
> > This commit enables Multi-IRQ mode for the S32 DWMAC driver, allowing
> > per-queue IRQs for improved performance. The driver checks for multiple
> > queues and per-queue IRQs, enabling multi-IRQ mode when both are present.
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > > index af594a096676..4aad7077c9d6 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > 
> > [ ... ]
> > 
> > > @@ -165,6 +165,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
> > >  	plat->core_type = DWMAC_CORE_GMAC4;
> > >  	plat->pmt = 1;
> > >  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > > +
> > > +	/* Check for multi-IRQ config. Assumption: symmetrical rx/tx queues */
> > > +	if (plat->rx_queues_to_use > 1 &&
> > > +	    (res.rx_irq[0] > 0 && res.tx_irq[0] > 0)) {
> > > +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> > > +		dev_info(dev, "Multi-IRQ mode (per queue IRQs) selected\n");
> > > +	} else {
> > > +		dev_info(dev, "MAC IRQ mode selected\n");
> > > +	}
> > 
> > Does this validation check all queues have IRQs? The condition verifies
> > only res.rx_irq[0] and res.tx_irq[0] but doesn't confirm that higher
> > queues have IRQs when rx_queues_to_use > 1.
> > 
> > If a device tree specifies multiple queues but only provides IRQs for
> > queue 0:
> > 
> >     snps,rx-queues-to-use = <2>;
> >     interrupt-names = "macirq", "rx-queue-0", "tx-queue-0";
> >                       /* queue 1 IRQs missing */
> > 
> > The driver would enable STMMAC_FLAG_MULTI_MSI_EN, but later in
> > stmmac_request_irq_multi_msi() (drivers/net/ethernet/stmicro/stmmac/
> > stmmac_main.c), queues with rx_irq[i] == 0 are silently skipped:
> > 
> >     for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
> >         if (priv->rx_irq[i] <= 0)
> >             continue;  /* queue 1+ skipped, no handler registered */
> >         ...
> >     }
> > 
> > This would leave higher-numbered queues with no interrupt handler,
> > causing packet loss when traffic arrives on those queues.
> > 
> > Would it be safer to validate all queue IRQs before enabling multi-IRQ
> > mode, or fall back to MAC IRQ mode if any queue IRQ is missing?
> > 
> > > +
> > >  	plat->rx_fifo_size = 20480;
> > >  	plat->tx_fifo_size = 20480;
> 
> Hi Simon,
> 
> I already addressed this in v6 I sent today.

Thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
