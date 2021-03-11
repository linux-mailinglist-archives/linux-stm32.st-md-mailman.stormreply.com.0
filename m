Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01033337160
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 12:30:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC788C5718D;
	Thu, 11 Mar 2021 11:30:46 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D73EC57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 11:30:45 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id 81so21478964iou.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 03:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f3gZoSD9XMt2F+FjYcYEcTAHARCmwRCAu6NWB4KbPUE=;
 b=PUY5Pqimw/LtaQS015tDeEsb0Na1mCtDp83x5RGTdUv3LPLgMI0AS1uPnsWjW3RtL4
 E3lmr9npg1f/OhjGISD7SW+x/US8XNtv2uAi3aE9c9nwAA1LgOqMZK0RnUYqSV5H8m5N
 3t7ZNkkRdX4VfodDBiHIgA8LzBFnji403cpsyiMCX6jmm1pAded7oBSHIranPa3UJOzs
 DsmR+5/O1UWJoz9DhzF9BkWhHSVUtEDokhRe4PxBYH+cC8Gg3QuklgkC3jJdFHGonWOg
 xT87mWU0eiUgrN0sk1XQ4IZjmcNgtKMJUqu779INoY8UXdPawwQ5kNvSVfh/BsjOmWVo
 Ok2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f3gZoSD9XMt2F+FjYcYEcTAHARCmwRCAu6NWB4KbPUE=;
 b=rn5ufuTbx622NBa5++ugelyZagtXgT8ckS30vSciBoQddfcc5E9a68alkKQw+sLvW2
 eTB6TcAerYVUAAK9fVl4u7+wus+NY1Os2Jeurtup15iwJyrZ7oXbCO7VObsxSbm/Keau
 tF2/wLRRcRI/UfqwFQaLtDIPqyFuVnOky+112+rfZee4R8XjOWM35jch3lqEtHOU26ap
 bhzWX0vz31ZZ0BuDhVB8+Qk/11soLNcRGEChuoUtuosHUX2xlvgN9wTuX/tacRzdDWZQ
 zT3/tt6hYmVm2XmwzxrhODW1MKLIquRBxX6dv+5X+WYSgDBpRizayR0HHznm5muO8D9/
 yhOg==
X-Gm-Message-State: AOAM531prG0urI5UGCTZqoZqHECGFA7UfUG21/5RFjwQa+iAyVI5SGoU
 WalFcnz2L7YhAfMIU+l8bvM7EjjnDOjCMS6EiK4=
X-Google-Smtp-Source: ABdhPJx75yQq9Oic5WhR5n+pmSd8IkVz6UYuv4TvW8OiGFfJTLOtXs7bupKajR21pW+rwaCgPveGvcy7/KWFeTD88rs=
X-Received: by 2002:a05:6638:388e:: with SMTP id
 b14mr3156986jav.62.1615462244043; 
 Thu, 11 Mar 2021 03:30:44 -0800 (PST)
MIME-Version: 1.0
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <CAL9mu0LwT7GqWQY1Dpw3zLnS+oX8KFq=Lrp6NSBJvSgcsxEQVQ@mail.gmail.com>
 <AS8PR10MB47127FD40F6782B279B5998BEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB47127FD40F6782B279B5998BEE909@AS8PR10MB4712.EURPRD10.PROD.OUTLOOK.COM>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 11 Mar 2021 19:30:07 +0800
Message-ID: <CAL9mu0LMrtJ+cSdhyTNx-_rsTxZ1jq5Wk7P2R5rOH0OnCHneDA@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Alexandre.torgue@foss.st.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "afzal.mohd.ma@gmail.com" <afzal.mohd.ma@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/8] ARM: STM32: add art-pi(stm32h750xbh6)
	board support
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

Hi Alexandre,

Thanks for quickly responding.

On Thu, Mar 11, 2021 at 6:26 PM Alexandre TORGUE
<alexandre.torgue@st.com> wrote:
>
> Hi Dillon
>
> > -----Original Message-----
> > From: dillon min <dillon.minfei@gmail.com>
> > Sent: mercredi 10 mars 2021 12:48
> > To: Rob Herring <robh+dt@kernel.org>; Maxime Coquelin
> > <mcoquelin.stm32@gmail.com>; Alexandre TORGUE
> > <alexandre.torgue@st.com>; open list:OPEN FIRMWARE AND FLATTENED
> > DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; linux-stm32@st-md-
> > mailman.stormreply.com; Linux ARM <linux-arm-
> > kernel@lists.infradead.org>; Linux Kernel Mailing List <linux-
> > kernel@vger.kernel.org>; linux@armlinux.org.uk; Vladimir Murzin
> > <vladimir.murzin@arm.com>; afzal.mohd.ma@gmail.com
> > Subject: Re: [PATCH 0/8] ARM: STM32: add art-pi(stm32h750xbh6) board
> > support
> >
> > for the device tree part , still waiting review. just a gentle ping.
> > if Mr Alexandre torgue can take a look, would be great.
> >
>
> Sorry for the delay. For next versions can you send it to
> Alexandre.torgue@foss.st.com please
Okay, I will add your new e-mail address to next review mailing list.
>
> Thanks
> Alex
>
> > thanks,
> >
> > On Wed, Mar 3, 2021 at 4:05 PM <dillon.minfei@gmail.com> wrote:
> > >
> > > From: dillon min <dillon.minfei@gmail.com>
> > >
> > > This patchset intend to add art-pi board support, this board developed
> > > by rt-thread(https://www.rt-thread.org/).
> > >
> > > Board resources:
> > >
> > > 8MiB QSPI flash
> > > 16MiB SPI flash
> > > 32MiB SDRAM
> > > AP6212 wifi,bt,fm comb
> > >
> > > sw context:
> > > - as stm32h750 just has 128k bytes internal flash, so running a fw on
> > >   internal flash to download u-boot/kernel to qspi flash, boot
> > >   u-boot/kernel from qspi flash. this fw is based on rt-thread.
> > > - kernel can be xip on qspi flash or load to sdram
> > > - root filesystem is jffs2(created by buildroot), stored on spi flash
> > >
> > > to support the boad, add following changes.
> > > - fix r0-r3, r12 register restore failed after svc call,
> > > - add dts binding
> > > - update yaml doc
> > >
> > > dillon min (8):
> > >   ARM: ARMv7-M: Fix register restore corrupt after svc call
> > >   Documentation: arm: stm32: Add stm32h750 value line
> > >   dt-bindings: arm: stm32: Add compatible strings for ART-PI board
> > >   dt-bindings: pinctrl: stm32: Add stm32h750 pinctrl
> > >   ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h75x
> > >   ARM: dts: stm32: add stm32h750-pinctrl.dtsi
> > >   ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
> > >   ARM: stm32: add initial support for stm32h750
> > >
> > >  Documentation/arm/index.rst                        |   1 +
> > >  Documentation/arm/stm32/stm32h750-overview.rst     |  33 ++
> > >  .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
> > >  .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   1 +
> > >  arch/arm/boot/dts/Makefile                         |   1 +
> > >  arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 392
> > +++++++++++++++++++++
> > >  arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 307 +---------------
> > >  arch/arm/boot/dts/stm32h743.dtsi                   |  30 ++
> > >  arch/arm/boot/dts/stm32h750-pinctrl.dtsi           |  11 +
> > >  arch/arm/boot/dts/stm32h750.dtsi                   |   5 +
> > >  arch/arm/boot/dts/stm32h750i-art-pi.dts            | 227 ++++++++++++
> > >  arch/arm/mach-stm32/board-dt.c                     |   1 +
> > >  arch/arm/mm/proc-v7m.S                             |   5 +-
> > >  13 files changed, 716 insertions(+), 302 deletions(-)  create mode
> > > 100644 Documentation/arm/stm32/stm32h750-overview.rst
> > >  create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
> > >  create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi
> > >  create mode 100644 arch/arm/boot/dts/stm32h750.dtsi  create mode
> > > 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
> > >
> > > --
> > > 2.7.4
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
