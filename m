Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ILSCcC4eGlzsQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:08:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2A294A93
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 14:08:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71082C555BE;
	Tue, 27 Jan 2026 13:08:15 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC28BC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 13:08:13 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 76A9020295F;
 Tue, 27 Jan 2026 14:08:13 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5C3EA20295E;
 Tue, 27 Jan 2026 14:08:13 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id A168D20405;
 Tue, 27 Jan 2026 14:08:12 +0100 (CET)
Date: Tue, 27 Jan 2026 14:08:13 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <aXi4vRvcCa+8LSKt@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260123-dwmac_multi_irq-v3-4-cc53f2be8961@oss.nxp.com>
 <20260125221405.3395497-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260125221405.3395497-1-kuba@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: imx@lists.linux.dev, s32@nxp.com, edumazet@google.com,
 ghennadi.procopciuc@oss.nxp.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org, pabeni@redhat.com,
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
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:imx@lists.linux.dev,m:s32@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jan.petrous@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[jan.petrous@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,lsv051416.swis.nl-cdc01.nxp.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: BC2A294A93
X-Rspamd-Action: no action

On Sun, Jan 25, 2026 at 02:14:05PM -0800, Jakub Kicinski wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> 
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> stmmac: s32: enable support for Multi-IRQ mode
> 
> This patch enables Multi-IRQ mode for the S32 DWMAC driver when both
> multi-queue and per-queue IRQs are configured. The driver now selects
> between Multi-IRQ and MAC IRQ modes based on device tree configuration.
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > index 5a485ee98fa7..342091045714 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> 
> [ ... ]
> 
> > @@ -149,6 +149,16 @@ static int s32_dwmac_probe(struct platform_device *pdev)
> >  	plat->core_type = DWMAC_CORE_GMAC4;
> >  	plat->pmt = 1;
> >  	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> > +
> > +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
> > +	if (plat->rx_queues_to_use > 1 &&
> > +	    (res.rx_irq[0] >= 0 || res.tx_irq[0] >= 0)) {
>                         ^^^^            ^^^^
> 
> Should these checks be "> 0" instead of ">= 0"?
> 
> stmmac_get_platform_resources() initializes the res structure with
> memset(0), then only writes positive IRQ values when per-queue IRQs are
> found in the device tree. If no "rx-queue-0" or "tx-queue-0" interrupt
> names are defined, rx_irq[0] and tx_irq[0] remain 0 from the memset.

The AI is wrong on this statesment. The loop reading IRQs from DT
in stmmac_get_platform_resources() returns also negative value
for missed queue IRQ line. And this is used as flag if multi-IRQ
can be enabled or not.

But I must agree that the comparition shall not include 0 as valid
value for IRQ, so I will fix it in v4.

Thanks.
/Jan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
