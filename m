Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJVaFeAoeGl7oQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 03:54:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE018F41E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jan 2026 03:54:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C2DBC36B30;
	Tue, 27 Jan 2026 02:54:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBCA6C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jan 2026 02:54:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A02E7439C0;
 Tue, 27 Jan 2026 02:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030B4C116C6;
 Tue, 27 Jan 2026 02:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769482460;
 bh=t5Ws8K9ruX9jK+rrFbsHhjSSQv/nHotDIXG0CEYJYd8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gwrFUzI00eEw/Xbx59fhVsGFJm6+EaEH58Fw34xJ2gBMcoAuxFP3JYa77vY6YQpsb
 CUXwOZopU/dGFO8MasO7NZGLZFWB67RIr9HPG7u6whk3ifg1rP6xqMHJZx9AHshYZN
 TTQtK5Z15YmL/Yi02BXYkdARCr0TwsfaRkVgeu3NZxJ4jU64ZFv8sFYdK+f68iHbxY
 t77HU3V+bmyt5ybyLh/WIcR2MOrhHmtuIBs+wLrp49R0h4Xy/FNW8Z+LnsPXMoI6Jr
 fOZPLFajNKmCGntEK6lwFdhpxpU4aA+AsJEIwt/dPoEifECT4uHoiCkYCyVW9uzjfG
 sZ/R6K6MGG7MA==
Date: Mon, 26 Jan 2026 18:54:19 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260126185419.626ba56e@kernel.org>
In-Reply-To: <aXgbEYvjcXqQKRIx@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
 <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
 <aXd7aSk7KIxlQd5z@shell.armlinux.org.uk>
 <20260126165144.25055591@kernel.org>
 <aXgN2UjiI_OxWHH-@shell.armlinux.org.uk>
 <20260126171606.6153aa1a@kernel.org>
 <aXgbEYvjcXqQKRIx@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 06/22] net: stmmac: rk: add
 SoC specific ->init() method
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
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:heiko@sntech.de,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: DFE018F41E
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 01:55:29 +0000 Russell King (Oracle) wrote:
> On Mon, Jan 26, 2026 at 05:16:06PM -0800, Jakub Kicinski wrote:
> > On Tue, 27 Jan 2026 00:59:05 +0000 Russell King (Oracle) wrote:  
> > > This sounds like my contributions to netdev aren't valued, and if that's
> > > the case, I will stop.  
> > 
> > Quite the opposite, what I'm saying is that your complaints make me
> > feel like the weekends spent on trying to make this project come out 
> > of stone age testing-wise are not appreciated. Of course your
> > contributions are appreciated.
> > 
> > The AI code reviews on existing buggy code are indeed very painful.
> > Not sure what we can do here to make the contributing easier.
> > It costs us around $2 now to review a single patch so we can't afford
> > public access. I think Google is working on making Gemini code reviews
> > public and free, hopefully that materializes.  
> 
> For a series of this size and complexity, the AI reviews are valued
> because it's finding real issues that I can't test for.
> 
> The big problem is that the AI only finds one issue with a patch, not
> all the issues. So, it's going to take multiple submissions to get to
> a point where the AI review of this series is clean.
> 
> I suspect the problem with "AI only finds one issue" is that the AI
> systems aren't advanced enough to do anything else yet.

Yes, looking at its "reasoning" output it both goes down different
investigation paths each time but more importantly it runs out of
tokens at some point, so it won't cover all the same paths each time.

> So, do I continue fixing the AI issues each day and resubmitting a new
> version of this series each day this week, costing $44 each time?

I think so.. I don't want to change our process because of AI, but 
some ways to save cost rhyme with our normal recommendations.
Keep the series under 15 patches. Split the series up, and extract
trivial patches out so that they can be applied and not reposted.

> Do we reach a point where it gets merged even though the AI review
> still has issues?

Whether the comment comes from AI is secondary, so it's just a question
of whether we merge code knowing that it has issues. Rarely, I guess.

> These are honest questions... and if they haven't been considered, I
> think they need to be, because I can see this series becoming very
> expensive.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
