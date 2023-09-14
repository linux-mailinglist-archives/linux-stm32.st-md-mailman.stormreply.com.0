Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AAE7A0278
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 13:24:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21FA5C6B46F;
	Thu, 14 Sep 2023 11:24:22 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD235C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 11:24:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0BEE2CE2485;
 Thu, 14 Sep 2023 11:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44831C433C8;
 Thu, 14 Sep 2023 11:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694690656;
 bh=7cGyC78LHve3osM8Hvu3/twUfNtqcFKheYxSlDSNvcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bd9Xe3mx5JGh3jgZSki6z1tj+/aARC4uKcCns4P3tBfiete1jfzlH2DdaWEfq9X9k
 gb1AvrzVkQb/qC2jMYlAqD9QCsXBjB83V+ABCVPVvqt4aepydUtxeKjs45Rpo7jiSN
 OjtlbhMSuiOG0D/MFhxZ8WIMGaJ1gf/AP/ykcN7SzoWosRTP4HA18kbcxY2NsYD7CA
 qEeb2dn68yyrAafXTeOyMlQWAT5zn50kgnljKtRjckSuEg6TcoUS8RVp6wi5ccZlDD
 8hI3y3VisnYvoEthO2sfEwDy1cqkhEPvzWcbPoKUkdccjEvU7FZBAq+ClljuY9pSzY
 mckLxnlYZjO5w==
Date: Thu, 14 Sep 2023 13:24:06 +0200
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230914112406.GA401982@kernel.org>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfiqd-007TPL-7K@rmk-PC.armlinux.org.uk>
 <20230912145227.GE401982@kernel.org>
 <ZQDkR/YX2HPMKiF5@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQDkR/YX2HPMKiF5@shell.armlinux.org.uk>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, bpf@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] net: stmmac: add platform
	library
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

On Tue, Sep 12, 2023 at 11:20:55PM +0100, Russell King (Oracle) wrote:
> On Tue, Sep 12, 2023 at 04:52:27PM +0200, Simon Horman wrote:
> > On Mon, Sep 11, 2023 at 04:29:11PM +0100, Russell King (Oracle) wrote:
> > > +	default:
> > > +		return -ENOTSUPP;
> > 
> > Checkpatch seems to think that EOPNOTSUPP would be more appropriate
> > as "ENOTSUPP is not a SUSV4 error code".
> 
> It needs to be an error code that clk_set_rate() below isn't going to
> return - because if clk_set_rate() does return it, then the users are
> going to end up issuing an incorrect error message to the user. I
> suspect clk_set_rate() could quite legitimately return -EOPNOTSUPP
> or -EINVAL.
> 
> Sadly, the CCF implementation of clk_set_rate() doesn't detail what
> errors it could return, but it looks like -EBUSY, -EINVAL, or something
> from pm_runtime_resume_and_get().

Thanks Russell,

Understood.

In that case perhaps ENOTSUPP is not such a bad choice as:
a) it seems rather unlikely CCF would use it; and
b) the scope of usage is well contained - the helper and any direct callers.

No further objections from my side :)

> 
> Interestingly, while looking at this, pm_runtime_resume_and_get() can
> return '1' if e.g. rpm is disabled and the device is active. It looks
> to me like CCF treats that as an error in multiple locations.

The plot thickens...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
