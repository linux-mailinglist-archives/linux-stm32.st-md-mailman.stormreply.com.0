Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOCMAt3QnmnwXQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 11:37:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A48CC195D98
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Feb 2026 11:37:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53FE6C8F284;
	Wed, 25 Feb 2026 10:37:16 +0000 (UTC)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47BF1C8F281
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 10:37:15 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C1BAC20125B;
 Wed, 25 Feb 2026 11:37:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A9551200D18;
 Wed, 25 Feb 2026 11:37:14 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com
 (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6CCF5203C7;
 Wed, 25 Feb 2026 11:37:14 +0100 (CET)
Date: Wed, 25 Feb 2026 11:37:14 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aZ7Q2saxrPzNXL+x@lsv051416.swis.nl-cdc01.nxp.com>
References: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
 <20260225-dwmac_multi_irq-v6-3-245bf1d7110c@oss.nxp.com>
 <aZ7ACLx1yUMWPAsZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ7ACLx1yUMWPAsZ@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v6 3/5] dt-bindings: net: nxp,
 s32-dwmac: Declare per-queue interrupts
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.Li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:linux-arm-kernel@lists.infradead.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jan.petrous@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.920];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,lsv051416.swis.nl-cdc01.nxp.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,nxp.com:email]
X-Rspamd-Queue-Id: A48CC195D98
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 09:25:28AM +0000, Russell King (Oracle) wrote:
> On Wed, Feb 25, 2026 at 10:20:35AM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> > set them to allow using Multi-IRQ mode.
> > 
> > Reviewed-by: Matthias Brugger <mbrugger@suse.com>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 44 +++++++++++++++++++---
> 
> As you have added support for these IRQs into the generic code,
> shouldn't the generic dwmac binding doc reflect that this is now
> supported?
> 

Hi Russell,

the generic yaml has such interrupt names already declared:
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/net/snps%2Cdwmac.yaml#L142

Here is the current interrupt snippet:

  interrupt-names:
    minItems: 1
    maxItems: 19
    items:
      oneOf:
        - description: Combined signal for various interrupt events
          const: macirq
        - description: The interrupt to manage the remote wake-up packet detection
          const: eth_wake_irq
        - description: The interrupt that occurs when Rx exits the LPI state
          const: eth_lpi
        - description: The interrupt that occurs when HW safety error triggered
          const: sfty
        - description: Per channel receive completion interrupt
          pattern: '^rx-queue-[0-7]$'
        - description: Per channel transmit completion interrupt
          pattern: '^tx-queue-[0-7]$'
        - description: PPS interrupt
          pattern: '^ptp-pps-[0-3]$'


BR.
/Jan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
