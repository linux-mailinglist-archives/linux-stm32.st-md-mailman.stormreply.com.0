Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3247FA7E809
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 19:21:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2558C7128A;
	Mon,  7 Apr 2025 17:21:52 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B950C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 17:21:51 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6ecf0e07947so46458086d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 10:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744046510; x=1744651310;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=;
 b=SPq3gzT3csrOOepIO0qAUw3QK0CxbYi0su5LkwlQaPgvIzv0Q9o0tkyA+CBqJ82ZSo
 Y52LKEGWPDhoj1Q9qDg/D2PkcQAjLqMVRVyvvrbC2LphBd7oDOuZbnTgRl6vY2Uq9deO
 jdS24pr3D5gwIBGjt3/tUEFXfemt6t4wRS4mQanZKmZya1bPfkzqschPgw9otUbSIOz0
 9yEvg3x31qQNh/vpUMBR7VbKAQ1VA6WbIqKBTKCqdI4l1Z4tR53+xHaZnA+qAcB6yfqn
 lU57Y6TPg/gWAQVv8gtaqvO1ChKhlMw4OacnyIcFpIShR91wxxZqswFozc5wvT2nGtcY
 niKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744046510; x=1744651310;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Lpv+G8DKtsTH/9Jnl9+3WmC00rN+BEBcmyoDdyEm2g=;
 b=slXS240Vv1NLmI6DupF0w1St5aQJ1LUMtsEintR+up6tVKh7LyTYkGDxghIn4P6AGx
 VGiv7lWKWoF+ma2o/64hACdbTo3FGiKd0UZfKjTpvnbfl/SSXjTF71J5OPHJSrjtTSjV
 346UbbgsSr+VnWw9WLKs0zsjf/SQVQq4lSpcIZRqImMcyh9g3cr1JL4NgGLcjzjN7lrI
 E78fsozqXQVxE0H0nFJ6heHLDq4o8UX4rkytWMwRLELeIkUGwddaLYDmVZtTWhxnE3tu
 L2fbFSnUVV1nWEvFdAMneKkOEKv66BvUHgj2ZbqO27qploBDBGrY6d53zqrxpcmyRoSy
 4o4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXtfIfT934M3/O9zuCk3A/gjDDEguAefVgxj6rdJEnVQYcDPeIKIVDH0tniFVLhIv6J3WTxe/alenYZA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxEafxa0FSoa5v+XjMXq4elZz2AtP96lfwp6FBepOu/g4AgJK6j
 MxE/954bXnQPxnYZXM6swlcBaQicCHsNaiILe5W7Zxa8Yya6w/0A6DnQZS6mkwz3YG4AQ5bO1gS
 XUSghlcOTRpfGlmeTsWzz3R5htnk=
X-Gm-Gg: ASbGncvPrfUdhYIJQzcfR+K6Pk+fjZsPeMsTB6CKU4kp6Sa8GVyq1X2N0fsXV5Tg6LM
 0r/6j8Td+OH2yeRaqQiymWWVPUoYAewXb7ZLuLlzLDNkl/sghz9DdQeXunSzcVDJr/Yh5y7bZZE
 Cf8g91Ap04x6N2qm6zQfL+N5Bl1cojZiCcnwU=
X-Google-Smtp-Source: AGHT+IE7oF7zYUiFClD9j+MaUG+QMzWikeMa5fdbd6jkjTVPOvWSr5tLM3OX7RIKBrrUgH1CqT/Ky1y9rQ5HCbtZCIc=
X-Received: by 2002:a0c:c688:0:b0:6ed:18cd:956d with SMTP id
 6a1803df08f44-6f0d25479aamr4072856d6.22.1744046510291; Mon, 07 Apr 2025
 10:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
 <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
 <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
 <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
In-Reply-To: <1aec6dab-ed03-4ca3-8cd1-9cfbb807be10@linux.dev>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 7 Apr 2025 19:21:38 +0200
X-Gm-Features: ATxdqUFVoaO2wEB2GhdEUNwWwPj2cMvxUNhs7goYdYdDae4Y74aVkceCOkA0pWY
Message-ID: <CA+_ehUzeMBFrDEb7Abn3UO3S7VVjMiKc+2o=p5RGjPDkfLPVtQ@mail.gmail.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Rob Herring <robh@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Saravana Kannan <saravanak@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Joyce Ooi <joyce.ooi@intel.com>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, UNGLinuxDriver@microchip.com,
 Clark Wang <xiaoning.wang@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Naveen N Rao <naveen@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Robert Hancock <robert.hancock@calian.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Wei Fang <wei.fang@nxp.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RFC net-next PATCH 00/13] Add PCS core support
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

Il giorno lun 7 apr 2025 alle ore 19:00 Sean Anderson
<sean.anderson@linux.dev> ha scritto:
>
> On 4/7/25 12:46, Christian Marangi (Ansuel) wrote:
> > Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
> > <sean.anderson@linux.dev> ha scritto:
> >>
> >> On 4/7/25 12:27, Kory Maincent wrote:
> >> > On Thu,  3 Apr 2025 14:18:54 -0400
> >> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >> >
> >> >> This series adds support for creating PCSs as devices on a bus with a
> >> >> driver (patch 3). As initial users,
> >> >>
> >> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> >> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> >> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >> >>   the Xilinx PCS) (patches 9-10).
> >> >>
> >> >> The last few patches add device links for pcs-handle to improve boot times,
> >> >> and add compatibles for all Lynx PCSs.
> >> >>
> >> >> Care has been taken to ensure backwards-compatibility. The main source
> >> >> of this is that many PCS devices lack compatibles and get detected as
> >> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> >> the devicetree to add appropriate compatibles.
> >> >
> >> > I don't dive into your patch series and I don't know if you have heard about it
> >> > but Christian Marangi is currently working on fwnode for PCS:
> >> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> >> >
> >> > Maybe you should sync with him!
> >>
> >> I saw that series and made some comments. He is CC'd on this one.
> >>
> >> I think this approach has two advantages:
> >>
> >> - It completely solves the problem of the PCS being unregistered while the netdev
> >>   (or whatever) is up
> >> - I have designed the interface to make it easy to convert existing
> >>   drivers that may not be able to use the "standard" probing process
> >>   (because they have to support other devicetree structures for
> >>   backwards-compatibility).
> >>
> >
> > I notice this and it's my fault for taking too long to post v2 of the PCS patch.
> > There was also this idea of entering the wrapper hell but I scrapped that early
> > as I really feel it's a workaround to the current problem present for
> > PCS handling.
>
> It's no workaround. The fundamental problem is that drivers can become
> unbound at any time, and we cannot make consumers drop their references.
> Every subsystem must deal with this reality, or suffer from
> user-after-free bugs. See [1-3] for discussion of this problem in
> relation to PCSs and PHYs, and [4] for more discussion of my approach.
>
> [1] https://lore.kernel.org/netdev/YV7Kp2k8VvN7J0fY@shell.armlinux.org.uk/
> [2] https://lore.kernel.org/netdev/20220816163701.1578850-1-sean.anderson@seco.com/
> [3] https://lore.kernel.org/netdev/9747f8ef-66b3-0870-cbc0-c1783896b30d@seco.com/
> [3] https://lpc.events/event/17/contributions/1627/
>
> > And the real problem IMHO is that currently PCS handling is fragile and with too
> > many assumptions. With Daniel we also discussed backwards-compatibility.
> > (mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
> > that slipped in before it was correctly complained that things were
> > taking a bad path)
> >
> > We feel v2 permits correct support of old implementations.
> > The ""legacy"" implementation pose the assumption that PCS is never removed
> > (unless the MAC driver is removed)
> > That fits v2 where a MAC has to initially provide a list of PCS to
> > phylink instance.
>
> And what happens when the driver is unbound from the device and suddenly
> a PCS on that list is free'd memory but is in active use by a netdev?
>

driver bug for not correctly implementing the removal task.

The approach is remove as provider and call phylink removal phase
under rtnl lock.
We tested this with unbind, that is actually the main problem we are
trying to address
and works correctly.

> > With this implementation, a MAC can manually parse whatever PCS node structure
> > is in place and fill the PCS.
> >
> > As really the "late" removal/addition of a PCS can only be supported with fwnode
> > implementation as dedicated PCS driver will make use of that.
>
> I agree that a "cells" approach would require this, but
>
> - There are no in-tree examples of where this is necessary
> - I think this would be easy to add when necessary
>

There are no in-tree cause only now we are starting to support
complex configuration with multiple PCS placed outside the MAC.

I feel it's better to define a standard API for them now before
we permit even more MAC driver to implement custom property
and have to address tons of workaround for compatibility.

> > I honestly hope we can skip having to enter the wrapper hell.
>
> Unfortunately, this is required by the kernel driver model :l
>
> > Anyway I also see you made REALLY GOOD documentation.
>
> Thanks. One of my peeves is subsystems that have zero docs...
>
> > Would be ideal to
> > collaborate for that. Anyway it's up to net maintainers on what path to follow.
> >
> > Just my 2 cent on the PCS topic.
>
> --Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
