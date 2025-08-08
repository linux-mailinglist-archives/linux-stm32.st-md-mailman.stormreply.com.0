Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ED6B1E9B1
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Aug 2025 15:57:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ECD39C3F952;
	Fri,  8 Aug 2025 13:57:15 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB22EC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Aug 2025 13:57:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D5665C6832;
 Fri,  8 Aug 2025 13:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29736C4CEED;
 Fri,  8 Aug 2025 13:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754661432;
 bh=AgMrnqxhNaxCNBFzW1CbjSj7+1BQvkwh3Ak4/ManYq8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2EzPM4nZP1QcAlZ2twuc6dYXtrX046zg9nolGES4MFdm9zE1vVUiCwVbbZcrZUkq
 8MsDCMRT/j1bJ1by3EKEKcJ+EyKNVRQyRaNZaQZAv9D5S2NVYU+6+w4wIR9kkAdl8G
 YEK5X/uSDR5qfFnqqWpQiCVTLFHoflYMh8ZYAmuRA7upA/QBkKt8DE+43Heob76niF
 s0fxTYvCxFbM1rqIUIXv/tmoMUSTtQoeIBRojgMhHTwJkHrL2Okg15442yUdORHMMc
 NsN+a7LihHhlyyD0Z1MmnOMIDrdSbHVirL1Cw7/xiOBCNhQtdcAqnQds49wexNRLz9
 oF6XD8AsFZAwg==
Date: Fri, 8 Aug 2025 14:57:07 +0100
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20250808135707.GE1705@horms.kernel.org>
References: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ukM1S-0086qo-PC@rmk-PC.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: rk: put the PHY clock
	on remove
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

On Fri, Aug 08, 2025 at 01:16:34PM +0100, Russell King (Oracle) wrote:
> The PHY clock (bsp_priv->clk_phy) is obtained using of_clk_get(), which
> doesn't take part in the devm release. Therefore, when a device is
> unbound, this clock needs to be explicitly put. Fix this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> Spotted this resource leak while making other changes to dwmac-rk.
> Would be great if the dwmac-rk maintainers can test it.
> 
> v2: fix build error

Thanks for the update Russell.

This fix looks good to me.
Reviewed-by: Simon Horman <horms@kernel.org>

And I guess it ought to be marked with.
Fixes: fecd4d7eef8b ("net: stmmac: dwmac-rk: Add integrated PHY support")

If correct, then I don't think any further action is required as supplying
tags via email should be sufficient.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
