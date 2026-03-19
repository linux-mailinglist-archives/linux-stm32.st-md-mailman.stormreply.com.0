Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE8oL/nyu2nkqQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 13:58:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B082CB8BC
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 13:58:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5FB5C87ED3;
	Thu, 19 Mar 2026 12:58:32 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8E5AC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z7R0pn7ZfdsYWdr21Qctdy5ZMqO7uhqsnnOEXcHNYDI=; b=zxpv3RsH1j0RgeyxZ9QHdWZhmC
 lFnfS4AluSgqoW0Ktrf02KNVAy4qiftcMGC3jfrsFBWzpTqaQwAJ1AW+g8chPTOCmutDfi9k7Evaz
 KU1VJpc58NGgX2euaAZJhqiE0RxEiAteyQi7WxqXmCzkESLPGJxSWIbrWWcgCfW3TTTRkyNFQLIXB
 EpziFXgvzqIcLeViTs1sUUW1tm4DKdlRYwgOB+5xgeUF+zg0+vO5W6gqv3y1cvRlVZYExQpTEsBVW
 Pvzr1i6JlyzfF5+3xYYuwRhiSeImWqBxXJDeLeT40ly4HU9dvNv0LeJES9IpMlxtewEnK079koyAH
 UKG0/sxw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45602)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w3CxC-000000004lO-0Uh7;
 Thu, 19 Mar 2026 12:58:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w3Cx8-0000000088u-3p1e; Thu, 19 Mar 2026 12:58:18 +0000
Date: Thu, 19 Mar 2026 12:58:18 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Message-ID: <abvy6nZyjyxUXMuf@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <abdEscs44fU4kRag@oss.qualcomm.com>
 <abdYu864OmNWiWIW@shell.armlinux.org.uk>
 <ablpxwGks9m38fhM@shell.armlinux.org.uk>
 <absjNQ2s3Z5N2Zwo@oss.qualcomm.com>
 <abtE7sDT75I7uPnk@shell.armlinux.org.uk>
 <abvAuHFZzCFobO-V@shell.armlinux.org.uk>
 <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7566c66b-2dda-4b29-b59e-4e4a7e159e21@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: improve PCS
	support
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.610];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 53B082CB8BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 11:09:33AM +0100, Konrad Dybcio wrote:
> On 3/19/26 10:24 AM, Russell King (Oracle) wrote:
> > On Thu, Mar 19, 2026 at 12:35:58AM +0000, Russell King (Oracle) wrote:
> >> On Thu, Mar 19, 2026 at 03:42:05AM +0530, Mohd Ayaan Anwar wrote:
> >>> [    8.650486] qcom-ethqos 23040000.ethernet: clk_csr value out of range (0xffffff00 exceeds mask 0x00000f00), truncating
> >>
> >> Please look into this first - with the MDIO bus operating at
> >> who-knows-what frequency, this could make reading from the PHY
> >> unreliable.
> > 
> > My guess is clk_get_rate(priv->plat->stmmac_clk) is returning zero,
> > which means we don't know the rate of the CSR clock.
> > 
> > From what I can see in drivers/clk/qcom/gcc-qcs404.c and
> > drivers/clk/qcom/gcc-sdx55.c, this looks like this case - the
> > struct clk_branch makes no mention of any clock rate, nor does it
> > have any parent. From what I can see, neither of these drivers
> > specify any rates for any of their clocks, which likely means that
> > clk_get_rate() will be zero for all of them.
> > 
> > Sadly, when I designed the clk API, I didn't think that people would
> > be stupid enough not to implement the API properly, more fool me.
> > 
> > Under the old code, we would've used STMMAC_CSR_20_35M, which means
> > we're assuming that the CSR clock is between 20 and 35MHz, even
> > though the value is zero. Is that the case? If it's higher than
> > 35MHz, then you've been operating the MDIO bus out of IEEE 802.3
> > specification, which can make PHY access unrealible.
> > 
> > In any case, please fix your clock drivers.
> 
> I'm not 100% sure the currently-passed AXI clock is what we want
> there and the docs aren't super helpful.. is there a synopsys-name
> for it? What rates would you expect it to run at?

There is no easy answer to that - it depends on the bus interfaces
and whether the CSR (register) clock is separate.

The likely possible names are hclk_i (for AHB master), aclk_i (for
AXI master), or clk_csr_i.

It does state that the CSR clock should have a minimum frequency of
25MHz to allow all statistics to be properly collected.

The rate of the CSR clock needs to be known, as selecting the divider
for generating MDC within IEEE 802.3 specifications is rather
fundamental. You may find something there which hints at what rate
the dwmac's CSR clock runs at.

Hope this helps.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
