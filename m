Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OCGDGQKy2kNDQYAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 01:42:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC7D362628
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2026 01:42:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45F30C8F27C;
	Mon, 30 Mar 2026 23:42:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA3CDC87ED4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Mar 2026 23:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9B716001A;
 Mon, 30 Mar 2026 23:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0A5C4CEF7;
 Mon, 30 Mar 2026 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774914145;
 bh=aHrIbDCRF2C63qxAWklCYHcqyfF0RZoSgHISzrHOz9s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q1VSOtlxR4oiyc2fLxazcaNC8M5IhUGTkgAvRrzVAWCqhFe4l8xQDBgzerxWvD0KA
 yWFBZmBbHzI/fd2pbIxl+bGHyTikCvjZHZl/nhqo+sGe8MHIPYc8TeJuxZncvbUi0a
 htsWUlWRkufWs4hN76gc2I3zO+jpCDDc6+FMCQZfDXX/tFu+rnlL5DoIEBT5OzYfSv
 m4zXgSftUzB24MCIvy6YBxjiiFWih0qFSd2xUGU0/tt0ItYtavVyNGIH1kbtXsT3Rz
 RsDSZ7wtmzNqH3qpLb2GhuYJ1XdMZZl0I02CawjX5SopRiB7etyHl9+kaTKSDv8g+o
 0ffNP2TE7Zh/w==
Date: Mon, 30 Mar 2026 16:42:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260330164224.0b75f251@kernel.org>
In-Reply-To: <acl0pTqJ97o0PRxY@shell.armlinux.org.uk>
References: <achJ1dfeT6Q8rBuX@shell.armlinux.org.uk>
 <20260329111123.740bada9@kernel.org>
 <acl0pTqJ97o0PRxY@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.leong.ong@intel.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	NEURAL_SPAM(0.00)[0.678];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: BBC7D362628
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 19:51:17 +0100 Russell King (Oracle) wrote:
> > While I have you - you have a significantly negative "reviewer score".
> > You post much more than you review. Which should earn you extra 24h
> > of delay in our system. I've been trying to ignore that and prioritize
> > applying your patches but it'd be great if you could review a bit more.  
> 
> Sorry, but given the effort that stmmac is taking, I don't have much
> capacity to extend mental cycles elsewhere.
> 
> This two patch series wouldn't have exploded into ten (or maybe even
> more) patches had someone not pointed out the problem with
> suspend/resume interacting with disabling TSO... which prompted me to
> look deeper and discover a multitude of other problems. Should I
> instead ignore these bugs and not bother trying to fix this stuff?
> 
> Honestly, I'm getting tired of stmmac with it sucking lots of my time,
> and I suspect you're getting tired of the constant stream of patches
> for it - but the reason there's a constant stream is because there's
> so much that's wrong or broken in this driver.
> 
> So either we let the driver rot, or... what?

I was hoping to nudge you towards reviewing more rather than have you
slow down TBH :) Your patches are generally excellent so not a burden
for my PoV. And stmmac is a toilet, a very popular one at that, so
efforts to clean it up are most appreciated. If you could review a
couple of series every time you post - the balance should be restored
to our tooling universe.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
