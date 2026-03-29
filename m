Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH11Cq90yWmxyAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 20:51:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30F353ACC
	for <lists+linux-stm32@lfdr.de>; Sun, 29 Mar 2026 20:51:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5853EC8F269;
	Sun, 29 Mar 2026 18:51:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73596C8F260
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 29 Mar 2026 18:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MkB3zjZHS6vwd8b3RjjpKkeR3qneJxmhLMAiJQwBqNQ=; b=TCX48G0oF8y68pyA/xRADyxEkq
 jROR84zUloQc8DGevldQokQgi6xVTEQQhemuENKvZzLxppUHSfIODkj5rGEp/eAx5TifM36relQ3J
 Va0kGHW6imY3KKE+Z+RnFfVHwJuFhg7CEfCbLLerxkUaPjDur0NAkmoQjn82KfSzt+gk/fox6kCuN
 ZWHbg9L48Q4jPv89fY1tyj2/GKZv328BqM1Ahl2CWGjQ453e9oGiLk4YFQV/HQE/qjk+mAM08jn7l
 2pS5ZsvysQ0797dn8zG3S1ffpZMrCyf0K8l0N2jLBk2Sn3/UVShJ4iefMLZsA4FFhfdRTaNi5rSBG
 Tb1eIhPw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48698)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w6vEF-000000008CD-24t8;
 Sun, 29 Mar 2026 19:51:19 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w6vED-000000001wx-10vu; Sun, 29 Mar 2026 19:51:17 +0100
Date: Sun, 29 Mar 2026 19:51:17 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <acl0pTqJ97o0PRxY@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <20260329111123.740bada9@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260329111123.740bada9@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 00/10] net: stmmac: TSO
	fixes/cleanups
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.843];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,armlinux.org.uk:url,stm-ict-prod-mailman-01.stormreply.prv:helo,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: BE30F353ACC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 11:11:23AM -0700, Jakub Kicinski wrote:
> On Sat, 28 Mar 2026 21:36:21 +0000 Russell King (Oracle) wrote:
> > Hot off the press from reading various sources of dwmac information,
> > this series attempts to fix the buggy hacks that were previously
> > merged, and clean up the code handling this.
> 
> We have a limit of 15 outstanding patches per tree.
> Please follow the community guidelines.

I see that restriction was newly introduced back in January.

> While I have you - you have a significantly negative "reviewer score".
> You post much more than you review. Which should earn you extra 24h
> of delay in our system. I've been trying to ignore that and prioritize
> applying your patches but it'd be great if you could review a bit more.

Sorry, but given the effort that stmmac is taking, I don't have much
capacity to extend mental cycles elsewhere.

This two patch series wouldn't have exploded into ten (or maybe even
more) patches had someone not pointed out the problem with
suspend/resume interacting with disabling TSO... which prompted me to
look deeper and discover a multitude of other problems. Should I
instead ignore these bugs and not bother trying to fix this stuff?

Honestly, I'm getting tired of stmmac with it sucking lots of my time,
and I suspect you're getting tired of the constant stream of patches
for it - but the reason there's a constant stream is because there's
so much that's wrong or broken in this driver.

So either we let the driver rot, or... what?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
