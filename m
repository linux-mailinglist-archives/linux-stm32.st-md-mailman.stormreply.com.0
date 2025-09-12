Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 156BFB53F5D
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Sep 2025 02:02:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6ABC9C3F930;
	Fri, 12 Sep 2025 00:02:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F02FAC3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Sep 2025 00:02:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7B31F40501;
 Fri, 12 Sep 2025 00:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C03CCC4CEF0;
 Fri, 12 Sep 2025 00:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757635321;
 bh=0wrrUK4oFK61WEcwJoC3CXhY9QFy4rgtgWwUYrq0Opk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kd44Djh7pYO5hpTr2eXfUuw2U3SIZXAP03Bx/lMr6U5OjMqZoVFGwuKp9niagx3mW
 J7wtpMixRjTORzLjl3S57ubl0+IUzLk2Jwu1UVqVexsGvGbvJnRYY+mfuDQ3hUEkt4
 y0za4yPT4yyi/dVgIcHUQEK6ourw0nMI3CYlkmVqykCbpokVXyaeIChewqrrWBSgif
 vZh8FxXMumht53cMKwt5uakXzo17LP/lsOSN5N6iZN7VpaPIeXChx0YXuUVaX+Tf8J
 wFrn2ZgrkBGKTmDjZs0myx2YZDxAwO2DWG630RBOHmXYddJusBJhctH/sQIZCqypnJ
 t87HiHPMP/kLg==
Date: Thu, 11 Sep 2025 17:01:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250911170159.383edcc6@kernel.org>
In-Reply-To: <2d00df77-870d-426c-a823-3a9f53d9eb30@altera.com>
References: <20250911-qbv-fixes-v1-0-e81e9597cf1f@altera.com>
 <20250911-qbv-fixes-v1-1-e81e9597cf1f@altera.com>
 <aMKxc6AuEiWplhcV@shell.armlinux.org.uk>
 <2d00df77-870d-426c-a823-3a9f53d9eb30@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/2] net: stmmac: est: Fix GCL bounds
	checks
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

On Thu, 11 Sep 2025 18:12:16 +0530 G Thomas, Rohan wrote:
> On 9/11/2025 4:54 PM, Russell King (Oracle) wrote:
> > On Thu, Sep 11, 2025 at 04:22:59PM +0800, Rohan G Thomas via B4 Relay wrote:  
> >> @@ -1012,7 +1012,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
> >>   		s64 delta_ns = qopt->entries[i].interval;
> >>   		u32 gates = qopt->entries[i].gate_mask;
> >>   
> >> -		if (delta_ns > GENMASK(wid, 0))
> >> +		if (delta_ns >= BIT(wid))  
> > 
> > While I agree this makes it look better, you don't change the version
> > below, which makes the code inconsistent. I also don't see anything
> > wrong with the original comparison.  
> 
> Just to clarify the intent behind this change:
> For example, if wid = 3, then GENMASK(3, 0) = 0b1111 = 15. But the
> maximum supported gate interval in this case is actually 7, since only 3
> bits are available to represent the value. So in the patch, the
> condition delta_ns >= BIT(wid) effectively checks if delta_ns is 8 or
> more, which correctly returns an error for values that exceed the 3-bit
> limit.

Comparison to BIT() looks rather odd, I think it's better to correct
the GENMASK() bound?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
