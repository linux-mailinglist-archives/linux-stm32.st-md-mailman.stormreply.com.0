Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RXmDMQ2C/Wk7fQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 08:26:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5C4F271D
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 08:26:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B77DCC03FCA;
	Fri,  8 May 2026 06:26:20 +0000 (UTC)
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net
 (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F5F4C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 06:26:19 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 8 May 2026 14:25:53 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 8 May 2026 14:25:53 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <92e8a3dd-a46a-499f-b5f6-99f7b99f45f5@bootlin.com>
References: <20260507083037.152-1-lizhi2@eswincomputing.com>
 <20260507083214.192-1-lizhi2@eswincomputing.com>
 <92e8a3dd-a46a-499f-b5f6-99f7b99f45f5@bootlin.com>
MIME-Version: 1.0
Message-ID: <2cfe5945.7d11.19e064395e0.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: en_US
X-CM-TRANSID: TAJkCgBn_HDxgf1pndsXAA--.6347W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEBDGn8vxET+gAAsc
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: robh@kernel.org, conor+dt@kernel.org, pritesh.patel@einfochips.com,
 weishangjuan@eswincomputing.com, linmin@eswincomputing.com,
 devicetree@vger.kernel.org, ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH net v1 2/2] net: stmmac: eic7700: fix
 delay step calculation and ensure safe register initialization
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
X-Rspamd-Queue-Id: 10E5C4F271D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,einfochips.com,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.973];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action




> -----Original Messages-----
> From: "Maxime Chevallier" <maxime.chevallier@bootlin.com>
> Send time:Thursday, 07/05/2026 19:21:41
> To: lizhi2@eswincomputing.com, andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
> Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com, pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com
> Subject: Re: [PATCH net v1 2/2] net: stmmac: eic7700: fix delay step calculation and ensure safe register initialization
> 
> Hi,
> 
> On 07/05/2026 10:32, lizhi2@eswincomputing.com wrote:
> > From: Zhi Li <lizhi2@eswincomputing.com>
> > 
> > Fix several issues in the EIC7700 DWMAC glue driver related to delay
> > configuration and register initialization.
> > 
> > The hardware implements TX/RX delay with a granularity of 20 ps per
> > step, but the driver previously assumed a 100 ps step. Update the
> > definitions to match the actual hardware behaviour and align with
> > the binding constraints.
> > 
> > Introduce explicit definitions for the maximum programmable delay
> > range based on the hardware limits.
> > 
> > Move HSP CSR configuration into the initialization path after clocks
> > are enabled. This ensures that all register accesses occur with the
> > required clocks active, avoiding undefined behaviour.
> > 
> > Clear the TXD and RXD delay control registers during initialization
> > to override any residual configuration left by the bootloader. This
> > ensures deterministic RGMII timing and prevents unintended delay
> > being applied.
> > 
> > The MAC RGMII delay programming is only required for 100Mbps and
> > 1000Mbps modes, where precise clock-to-data alignment is necessary for
> > reliable sampling.
> > 
> > For 10Mbps operation, timing margins are sufficiently relaxed and no
> > additional delay compensation is required. In this case, the driver
> > falls back to a safe default configuration with delay disabled.
> > 
> > For unsupported or unexpected link speeds, the driver avoids
> > programming invalid delay values and falls back to a safe default
> > state by explicitly clearing the delay configuration.
> > 
> > Explicitly programming zero ensures that no residual delay settings
> > from previous configurations or bootloader state remain active.
> > 
> > These changes fix incorrect delay programming and initialization
> > ordering for existing users.
> > 
> > This also aligns the driver implementation with the updated device
> > tree binding.
> 
> There's a lot going on in this patch, can you split this into patches
> that solves each of these individual issues ?
> 
> It's a mix of fixes (the reg access moved after clk config for example)
> and non-fixes (the RGMII timings, you're improving the granularity of
> the delays, is this required to fix existing setups, or is it a generic
> improvement ?), splitting this would make it both easier to review, and
> easier to bisect should problems arise in the future.
> 

Thanks for the detailed review and suggestions.

You're right that the current patch mixes several logically independent
changes, and splitting them will make the series easier to review and
bisect. I will follow your suggestion and split the current patch into
multiple smaller patches within the same series.

All five changes below are correctness fixes addressing hardware or driver
issues, not improvements or new features.

Based on the current change set, the individual fixes are:

1. TX/RX delay granularity correction (100 ps -> 20 ps step)
   This corrects an incorrect hardware capability modeling in the driver.
   The driver previously assumed a 100 ps step, while the hardware actually
   implements 20 ps granularity.
   This fixes incorrect delay programming that could occur when fine-grained
   delay values are used, ensuring correct representation of the hardware
   capability.

2. Introduce explicit maximum delay range definitions
   This fixes missing enforcement of hardware constraints, preventing invalid
   delay values from being accepted or programmed.

3. Move HSP CSR configuration after clock enable
   This fixes a register access ordering issue where accessing HSP CSR before
   clocks are enabled may result in undefined behavior during initialization.

4. Clear TXD/RXD delay control registers during initialization
   This fixes residual configuration left by bootloader state, ensuring
   deterministic behavior across reboot and driver reload.

5. Delay handling for 10Mbps and invalid link speeds
   This fixes incorrect application of RGMII delay programming outside valid
   operating modes, preventing invalid configuration from being applied.

I will split these into separate patches in the next revision, while keeping
them within the same series.

For the DT binding side, would you also recommend splitting the binding
changes to match the driver-level granularity, or would it be better to keep
them consolidated in a single binding patch?

If you have any further suggestions on the split or classification, please
let me know.

Thanks,
Zhi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
