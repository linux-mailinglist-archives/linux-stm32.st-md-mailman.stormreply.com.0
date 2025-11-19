Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65844C70052
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Nov 2025 17:19:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B7DCC36B30;
	Wed, 19 Nov 2025 16:19:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0568C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Nov 2025 16:19:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B63B40243;
 Wed, 19 Nov 2025 16:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E806EC116B1;
 Wed, 19 Nov 2025 16:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763569168;
 bh=BPzTK2gEFsViZFmyOno1UxdtkaYyPLFM9cgU3Gme0aY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qT0M/WXX2B9Kv1nVbIu43kmraVe20viEsQAOxsj+uCaOZTXTFtX5KOnOvI5cfNmZm
 1fSlTx54W2q3AxaOoKrmQ5pzDOPg+pJvj3VKLpbGobNGSgppaNPXtlUIWhPBR50WJh
 Sybx5lTWfm5yXaL76r02PUgOwjW90/L9Zjl0USXTbFCERWWrMzx+17YRsqTwijis8Q
 u0JdTIiPOpqWZjC3uWRDxBEVjq+u+lKKpHddPkhK8sBHV0LoczsBu6274ZzhzcU0FC
 Sm151mMoH8kI9mCj1Er9C34XhLeKg+50DT2lamDVDt3hO8+WOpEkC5xAdI5oU845dQ
 ooQgLNOwT7Uaw==
Date: Thu, 20 Nov 2025 00:01:36 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aR3p4NBK-AnCGK6a@xhacker>
References: <20251119153526.13780-1-jszhang@kernel.org>
 <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aR3snSb1YUFh9Dwp@shell.armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 resend] net: stmmac: add support for
	dwmac 5.20
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

On Wed, Nov 19, 2025 at 04:13:17PM +0000, Russell King (Oracle) wrote:
> On Wed, Nov 19, 2025 at 11:35:26PM +0800, Jisheng Zhang wrote:
> > The dwmac 5.20 IP can be found on some synaptics SoCs. 
> > 
> > The binding doc has been already upstreamed by
> > commit 13f9351180aa ("dt-bindings: net: snps,dwmac: Add dwmac-5.20
> > version")
> > 
> > So we just need to add a compatibility flag in dwmac generic driver.
> 
> Do we _need_ to add it to the generic driver? Do the platforms that are
> using this really not need any additional code to support them?
> 
> Looking at all the DT that mention dwmac-5.20 in their compatible
> strings, that is always after other compatibles that point to other
> platform specific drivers.
> 
> So, can you point to a platform that doesn't have its own platform
> glue, and would be functional when using the dwmac-generic driver?

Synatpics platforms use the dwmac-generic driver, it's enough now.
But we haven't upstreamed related platforms, but will do soon.
> 
> For reference, the dts that refer to dwmac-5.20 are:
> 
> arch/arm64/boot/dts/renesas/r9a09g047.dtsi
> arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> arch/arm64/boot/dts/st/stm32mp251.dtsi
> arch/arm64/boot/dts/st/stm32mp253.dtsi
> arch/arm64/boot/dts/st/stm32mp233.dtsi
> arch/arm64/boot/dts/st/stm32mp231.dtsi
> arch/riscv/boot/dts/starfive/jh7110.dtsi
> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
