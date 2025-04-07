Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1267DA7E715
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Apr 2025 18:46:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F56CC78F97;
	Mon,  7 Apr 2025 16:46:47 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9194DC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Apr 2025 16:46:46 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-6ecf0e07947so46093686d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Apr 2025 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744044405; x=1744649205;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
 b=UD6QCmFd5zJX6WQqnHAUlKn/1A/qU2Vk4xuFoGPETs0txA3WJQsruWBEC3IYpzerM3
 l3JJTsiuZpyG2RhjUTm4TtkCm2xKw3G9u3b0Ayed5i0Xbn9VaafIJnTnEjqULoJ0Tjdz
 WT19zqfGi2s64jyzj3lJ8K6PPLZijrCkCooiMW6y/voAUimnRHygaYfNKx85IQd6XB5v
 1nVWo1xx2sjCUSTZ/+fpBN0Tpdod7TePNk3yz1pC6s979oJml4x8hiW9PaW6QVhoHJb5
 XWcO8QiWxJnTCze15mDbr+5OTZ7VKZsye0syTygaQFEsibqGpexSP5jrP8hfXMpXx/+V
 0L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744044405; x=1744649205;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rcI46lTVSeHRR6PCsmQIdJkenRV/ajFn4WU+i3FnG5M=;
 b=NH+qcIO9w7BgR5wvztwsFsRiVOz3am1db2Cq4J8yPtOZ0jcCDOmkzBMTIGfYoghTUZ
 SH35sqeKzrvifyZYkEh/TOrwdNq6osImS/fyT/R1XgIptNWgNv5b8cyOvN5hjB+fC2OR
 wliUS9co/FNLwkKLYvp4aElofzY6JWn1RdBHbeKctZlvq8N9mh2zxiREnHOKjOwJZ2e/
 8KjzA6k+y2iwhulKREiYhd/YSbRn2fhmFDOPbEkaf+aQK8IAUXZ7TE4GAnrdAqxOfzRX
 d6ouY+KARPrLMky0W1/MWdeSTgJzzyD6KeSVXpSIYg46gLpZTi5hCjiyR2VmHKHUg2vQ
 wC3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx4ekxDPA3hDXb7x5qxF+wZyTyX10vUumfyS7bwKhkxhtqqr29Xl5U3Ww9OTgzsHSCS+/zBAh9KXoPMA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDKeVKQgghvvP18KbF0HvmWaj2egpr0BnpmvuXFgC8QY5rkKYj
 laJk1QxbqqNHyvDhkPMiQrpUarhVKf8zCryC6auAMln6K9sG8Uoq5WTc0G9X4mVfPZVn2Nsqo9x
 7YOfoOOIj7OQyJ6bqiHLZv7nl+GM=
X-Gm-Gg: ASbGnctSQlnmg6APtMVTjKvJcj5zaLzVGAwFnyNQ94FYnqnBOZ70NFr3WBxk6E1qe2N
 saSphPVsiLpetRPUfX/URw9ugIiF2r80BAbXyegWoYQIs1CNDCQkH6Cv7Uk8rpc6VafYM7TUHtb
 p+8op5oBGzOPwj1ffBXasZ8cw/
X-Google-Smtp-Source: AGHT+IHn1NWvGQNUg+cTWq77arIBOMg99zSiThdNcGxwwVSUpNgoUD/iAcjqlZYjSbS/ACMXvRhNvnrbFKc+S9VTrwY=
X-Received: by 2002:a05:6214:1307:b0:6e2:3761:71b0 with SMTP id
 6a1803df08f44-6f0d24ed16bmr3696846d6.5.1744044405300; Mon, 07 Apr 2025
 09:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250403181907.1947517-1-sean.anderson@linux.dev>
 <20250407182738.498d96b0@kmaincent-XPS-13-7390>
 <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
In-Reply-To: <720b6db8-49c5-47e7-98da-f044fc38fc1a@linux.dev>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Mon, 7 Apr 2025 18:46:34 +0200
X-Gm-Features: ATxdqUHTe6GO-vqbSM3EmiJ-FaS0XfNSqylpsewp4c0XXyMi1WCC05uIygoRAqs
Message-ID: <CA+_ehUyAo7fMTe_P0ws_9zrcbLEWVwBXDKbezcKVkvDUUNg0rg@mail.gmail.com>
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

Il giorno lun 7 apr 2025 alle ore 18:33 Sean Anderson
<sean.anderson@linux.dev> ha scritto:
>
> On 4/7/25 12:27, Kory Maincent wrote:
> > On Thu,  3 Apr 2025 14:18:54 -0400
> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >
> >> This series adds support for creating PCSs as devices on a bus with a
> >> driver (patch 3). As initial users,
> >>
> >> - The Lynx PCS (and all of its users) is converted to this system (patch 5)
> >> - The Xilinx PCS is broken out from the AXI Ethernet driver (patches 6-8)
> >> - The Cadence MACB driver is converted to support external PCSs (namely
> >>   the Xilinx PCS) (patches 9-10).
> >>
> >> The last few patches add device links for pcs-handle to improve boot times,
> >> and add compatibles for all Lynx PCSs.
> >>
> >> Care has been taken to ensure backwards-compatibility. The main source
> >> of this is that many PCS devices lack compatibles and get detected as
> >> PHYs. To address this, pcs_get_by_fwnode_compat allows drivers to edit
> >> the devicetree to add appropriate compatibles.
> >
> > I don't dive into your patch series and I don't know if you have heard about it
> > but Christian Marangi is currently working on fwnode for PCS:
> > https://lore.kernel.org/netdev/20250406221423.9723-1-ansuelsmth@gmail.com
> >
> > Maybe you should sync with him!
>
> I saw that series and made some comments. He is CC'd on this one.
>
> I think this approach has two advantages:
>
> - It completely solves the problem of the PCS being unregistered while the netdev
>   (or whatever) is up
> - I have designed the interface to make it easy to convert existing
>   drivers that may not be able to use the "standard" probing process
>   (because they have to support other devicetree structures for
>   backwards-compatibility).
>

I notice this and it's my fault for taking too long to post v2 of the PCS patch.
There was also this idea of entering the wrapper hell but I scrapped that early
as I really feel it's a workaround to the current problem present for
PCS handling.

And the real problem IMHO is that currently PCS handling is fragile and with too
many assumptions. With Daniel we also discussed backwards-compatibility.
(mainly needed for mt7621 and mt7986 (for mediatek side those are the 2
that slipped in before it was correctly complained that things were
taking a bad path)

We feel v2 permits correct support of old implementations.
The ""legacy"" implementation pose the assumption that PCS is never removed
(unless the MAC driver is removed)
That fits v2 where a MAC has to initially provide a list of PCS to
phylink instance.
With this implementation, a MAC can manually parse whatever PCS node structure
is in place and fill the PCS.

As really the "late" removal/addition of a PCS can only be supported with fwnode
implementation as dedicated PCS driver will make use of that.

I honestly hope we can skip having to enter the wrapper hell.
Anyway I also see you made REALLY GOOD documentation. Would be ideal to
collaborate for that. Anyway it's up to net maintainers on what path to follow.

Just my 2 cent on the PCS topic.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
