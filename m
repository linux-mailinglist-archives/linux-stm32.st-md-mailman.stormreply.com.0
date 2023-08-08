Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E133774534
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 20:38:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17714C6B45C;
	Tue,  8 Aug 2023 18:38:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3C4EC65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 18:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/GzwtgyO3yL3knqSnKkQgDt/ZjWhgYmwDUnxSNeivU=; b=ZTaAl906VvA1CO04UyyOSNt18z
 +3IsbiVKTQid2ofLWwAJuV39pbuhwcrgBohShnT12TDmSKX2N398Smb0yQ6vYmLiMSQI9SmWE0ST8
 /HLOX7gO106Vq7WzEURe/5tYXFhRWYMXi3GeTQv6ElTJ6RsBP+fmFhTpgWlGtr9iGHGDvZ7KtytVB
 HEV8tzkFgXo8CCAK+ekTHO020J4KkSVQw2RNgKj8vzxYDdcwvl2MN9QFi0hEzMMIi9m1102JahkG8
 glkP/uOPnrvH2Sdkg/PqFXfhl4KSnLpr0mDWeN71gIBtcfe2J8lxXA548ZuypvtcoOdL130E/jCjC
 NTlYDDug==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42308)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qTRar-0001Vc-0w;
 Tue, 08 Aug 2023 19:38:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qTRao-0008LX-FJ; Tue, 08 Aug 2023 19:38:06 +0100
Date: Tue, 8 Aug 2023 19:38:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ZNKLjuxnR2+V3g1D@shell.armlinux.org.uk>
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
 <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
 <CAMRc=MczKgBFvuEanKu=mERYX-6qf7oUO2S4B53sPc+hrkYqxg@mail.gmail.com>
 <65b53003-23cf-40fa-b9d7-f0dbb45a4cb2@lunn.ch>
 <CAMRc=MecYHi=rPaT44kuX_XMog=uwB9imVZknSjnmTBW+fb5WQ@mail.gmail.com>
 <xfme5pgj4eqlgao3vmyg6vazaqk6qz2wq6kitgujtorouogjty@cklyof3xz2zm>
 <d021b8ae-a6a3-4697-a683-c9bd45e6c74b@lunn.ch>
 <CAMRc=MegMdB0LZNRRrCfqFGZQWMFdBhd8o+_NBxwLk0xS99M_w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=MegMdB0LZNRRrCfqFGZQWMFdBhd8o+_NBxwLk0xS99M_w@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alex Elder <elder@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: Re: [Linux-stm32] [PATCH 0/2] net: stmmac: allow sharing MDIO lines
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

On Tue, Aug 08, 2023 at 08:26:22PM +0200, Bartosz Golaszewski wrote:
> When I say "device unbind", I don't just mean manual unbinding using
> sysfs. I mean any code path (rmmod, unplugging the USB, etc.) that
> leads to the device being detached from its driver. This is a
> perfectly normal situation and should work correctly.
> 
> I won't be fixing it for this series but may end up looking into
> establishing some kind of device links between MACs and their "remote"
> PHYs that would allow to safely unbind them.

I don't think you're the first to suggest that!

That gets difficult - because although the PHY may be a different
driver, the MDIO bus may be provided by the _same_ hardware as the
ethernet MAC itself. So you end up with a circular dependency - the
PHY device depends on the MDIO bus device (which is the ethernet MAC)
and then you make the ethernet MAC depend on the PHY device.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
