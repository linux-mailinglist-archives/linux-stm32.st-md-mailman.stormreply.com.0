Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559717078A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 19:22:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D07AC36B0B;
	Wed, 26 Feb 2020 18:22:51 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 837CCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 18:22:50 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r21so5034111edq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2020 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4F5P1PauU1ebi/qO8Sg8RRFuYolggB9ao3VqBLODYOc=;
 b=RDEaga21ySZ72U2wyLsvv547LGdrKjUlXejb8qsNUo+YFMKVWP8sM/rbETj4Zz+ibr
 TMO4UvFdtSsO1ZfN4K0MWAWllIkXsYt75ggtVrrDpJJh/26ooVOpCvLdGbb51LDWiLSf
 4tnoK2g3HnRx9x2mYAirOKx8jukgJCmuWv6H1xogctnhhv4My4uO+w3HZ7HwEZ1LvgwJ
 lNlh7sH1FNsqJA0SdA92V36QN1Pt8GtYt8WRJN2IgTN7e8yJVLnt0FiZCeSa1wpxBCPJ
 tK3n/8wHMQ5Mx180pC9qZrpEuXq3btWQZcTFxR0kLz/57mJzzvu6Wq3WTqoLn1d6nsT2
 nYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4F5P1PauU1ebi/qO8Sg8RRFuYolggB9ao3VqBLODYOc=;
 b=YRQpugVnYH/SWXesSP5cNF/UXvgZK2DrqBaNAgUfvuX9JmtmG/XyWyQ8bLKzsPZfT/
 i922XHuqwvjOevdMnmBP5GXE+GHvylIUtUKK3JXkigu4IeQNrRHikt0vVCsGzMHJ3OJD
 Yjh+Q9xOaiRkKA9w7Fy2VL94Z0i2N/olnij/oF+3mLrN0JWabR5rhdLdlkw6xaKv1Y2V
 3jgJf7I+j09jFxjsJ8DWhsx+WxO1+2uf/mt4DR0hhAUZF73TIJgHRLzxUVzoG4c654Rc
 USxmJK5N1sVzSiNG/zvBiSrGu+jo4gf/1oO9SIRKLYtp+wFf1x/HR2896rkfxLGxzcOp
 yaLw==
X-Gm-Message-State: APjAAAWi/W08gjSIRk32UQaiBDax67e0OK51J9wSNUBdPinHY4wxzOxk
 bHIJCgVthDhftCkcy6MNe3W7hYOjjNtsOLjJ2TI=
X-Google-Smtp-Source: APXvYqzNB2eI1k7C3+5x8npyIPGw1ri/9DkGYVNZqj+crpBw+z1oumpxk11mzsPFWqmmwWOEY7cgnFNbkJ+PtccHAoI=
X-Received: by 2002:aa7:c44e:: with SMTP id n14mr622848edr.179.1582741370130; 
 Wed, 26 Feb 2020 10:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20200226102312.GX25745@shell.armlinux.org.uk>
 <E1j6tqv-0003G6-BO@rmk-PC.armlinux.org.uk>
 <CA+h21hrR1Xkx9gwAT2FHqcH38L=xjWiPxmF2Er7-4fHFTrA8pQ@mail.gmail.com>
 <20200226115549.GZ25745@shell.armlinux.org.uk>
 <CA+h21hqjMBjgQDee8t=Csy5DXVUk9f=PP0hHSDfkuA746ZKzSQ@mail.gmail.com>
 <20200226133614.GA25745@shell.armlinux.org.uk>
 <CA+h21hqHfC0joRDhCQP6MntFdVaApFiC51xk=tUf3+y-C7sX_Q@mail.gmail.com>
In-Reply-To: <CA+h21hqHfC0joRDhCQP6MntFdVaApFiC51xk=tUf3+y-C7sX_Q@mail.gmail.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Wed, 26 Feb 2020 20:22:39 +0200
Message-ID: <CA+h21hpzCY=+0U4JgFbqGLS=Sh6SjkSt=4J9e0AGVHKJPOHq1A@mail.gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Ioana Radulescu <ruxandra.radulescu@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/8] net: phylink: propagate
 resolved link config via mac_link_up()
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

On Wed, 26 Feb 2020 at 20:21, Vladimir Oltean <olteanv@gmail.com> wrote:
>
> On Wed, 26 Feb 2020 at 15:36, Russell King - ARM Linux admin
> <linux@armlinux.org.uk> wrote:
> >
> >
> > dpaa2 is complicated by the firmware, and that we can't switch the
> > interface mode between (SGMII,1000base-X) and 10G.
> >
> > If the firmware is in "DPMAC_LINK_TYPE_PHY" mode, it expects to be told
> > the current link parameters via the dpmac_set_link_state() call - it
> > isn't clear whether that needs to be called for other modes with the
> > up/down state (firmware API documentation is poor.)
> >
>
> With PCS control in Linux, I am pretty sure that you don't want
> anything other than DPMAC_LINK_TYPE_PHY anyway.
> Basically in DPMAC_LINK_TYPE_FIXED, the MC firmware is in control of
> the PCS and polls its link state to emit link notifications to objects
> connected to the DPMAC. So Linux control of PCS would class with

s/class/clash/

> firmware control of the PCS, leading to undesirable side-effects to
> say the least.
>
> > --
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> > According to speedtest.net: 11.9Mbps down 500kbps up
>
> Regards,
> -Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
