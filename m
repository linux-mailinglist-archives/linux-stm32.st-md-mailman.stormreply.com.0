Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E8773A79
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 15:26:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98214C6B469;
	Tue,  8 Aug 2023 13:26:46 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EDF9C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TONQWGBEefR53xCwNIMqBbfwJkoHzB+BW3pjEzAo/Vk=; b=Q5Mw52YTP2WyavImCS6k7amT0W
 ruy8Pus8OBffBbQ8/CgYtJD0ZV11Fj+/f4kIj3dKJkbRYTU2+XNBkmlbUJmWQ8UJpidfHO1P9AC8v
 gv5TeBrL2JBmgbXN2KEmHy9mBzxoLrL9hxcz/aaKIIjIP0flNOIAupgt4w8NvxYuKAAdk76MGO5G0
 TIWAYziNRfQj38Uuf8JG0FY8Hiyo6cWhw9npHZsgtejfaoa4NresaJyvrzUoyLv+yky01EeywoZDN
 NDEFGKezpRxCpRW0EnhoXrRmiLUw6aeDmtogJQVCuiy8cDlMAwfqZvW0/YLBKLfeDwJMeSgkS0FEk
 3P5szoTw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51866)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qTMjH-0007zl-33;
 Tue, 08 Aug 2023 14:26:31 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qTMjF-00088c-F4; Tue, 08 Aug 2023 14:26:29 +0100
Date: Tue, 8 Aug 2023 14:26:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <ZNJChfKPkAuhzDCO@shell.armlinux.org.uk>
References: <20230807193102.6374-1-brgl@bgdev.pl>
 <54421791-75fa-4ed3-8432-e21184556cde@lunn.ch>
 <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc6COaxM6GExHF2M+=v2TBpz87RciAv=9kHr41HkjQhCg@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, Aug 08, 2023 at 10:13:09AM +0200, Bartosz Golaszewski wrote:
> Ok so upon some further investigation, the actual culprit is in stmmac
> platform code - it always tries to register an MDIO bus - independent
> of whether there is an actual mdio child node - unless the MAC is
> marked explicitly as having a fixed-link.
> =

> When I fixed that, MAC1's probe is correctly deferred until MAC0 has
> created the MDIO bus.
> =

> Even so, isn't it useful to actually reference the shared MDIO bus in som=
e way?
> =

> If the schematics look something like this:
> =

> --------           -------
> | MAC0 |--MDIO-----| PHY |
> -------- |     |   -------
>          |     |
> -------- |     |   -------
> | MAC1 |--     ----| PHY |
> --------           -------
> =

> Then it would make sense to model it on the device tree?

So I think what you're saying is that MAC0 and MAC1's have MDIO bus
masters, and the hardware designer decided to tie both together to
a single set of clock and data lines, which then go to two PHYs.

In that case, I would strongly advise only registering one MDIO bus,
and avoid registering the second one - thereby preventing any issues
caused by both MDIO bus masters trying to talk at the same time.

The PHYs should be populated in firmware on just one of the buses.

You will also need to ensure that whatever registers the bus does
make sure that the clocks necessary for communicating on the bus
are under control of the MDIO bus code and not the ethernet MAC
code. We've run into problems in the past where this has not been
the case, and it means - taking your example above - that when MAC1
wants to talk to its PHY, if MAC0 isn't alive it can't.

So just be aware of the clocking situation and make sure that your
MDIO bus code is managing the clocks necessary for the MDIO bus
master to work.

In regard to sharing of the MDIO bus signals between two bus
masters, I do not believe that is permissible - there's no
collision detection in hardware like there is on I=B2C. So
having two MDIO bus masters talking at the same time would
end up corrupting the MDC (clock) and MDIO (data) signals if
both were active at the same time.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
