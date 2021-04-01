Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B42351099
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Apr 2021 10:09:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97009C57B5B;
	Thu,  1 Apr 2021 08:09:07 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E67C2C5719E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Apr 2021 08:09:05 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id k25so1332246iob.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 Apr 2021 01:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A6uTioFFI2mA1umowAyrf1ZY8lbnSzFQamQEl/GqrWI=;
 b=UpP5x8QXz3WhOsg8VCxI3+IU0/3rOJbQkcf3W69B5yaf683v8wMVYtviN2bHj+3UU6
 Xh9JeVwRYA1QgigPAPYMEtLbf6WclAXVaCqjk7X5JHlKzjMoKoULtj4qV8EfjNl31pnB
 oUCf482TjXOrLrYD15r/AKY6a413rNDkw9H3Pu54exd6LxbrXN5MgyP2uk94pa7YkpBL
 91QrWwvKZ5kjjv8V4rJctvi6Fo7wtEgxoismtJKyi7gB7vn1mexXX6ydAVtRIuMYZRwE
 6SaF839TZheDd61r6e9eVd9k70z7DjM9OCl+1GCYYU15sjxRqBRlhvmIF2537quQMpWM
 0uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A6uTioFFI2mA1umowAyrf1ZY8lbnSzFQamQEl/GqrWI=;
 b=UbFloIf/W+UpIpLSPghepfXZTvlvPsctkLwr3vj+fE6v+ztZE8jQvp7hVK8NUhJxwk
 kZKXy2avyz7FuvwbShhwcsoESMQX+ziXdSZNAXLRpkuqdvO5fzA0io39059pgjIbBdLL
 Lq23pcmyRRJaiSleE2alJH+ap4U6fBhezKSIOJgg5terKCaT2Ewu54M00zFvFehTwvbc
 ncJFw8jK/UuCm9sfrODg5UrgUa9xtfeTto/1mDQN/9O5dD4fBaoS0EJmEJzPMA+dX7xI
 aOhXYlBU1wr3dVdpdtDUYfJmkr9L6SJckXOYvuhF3JPpwjz74UgkECuMt3JKEv6uo70n
 otEQ==
X-Gm-Message-State: AOAM532SBASkGeAIq2RdTswdFSKqMWpaY1+4CTYJ0fBwwj3ftfufUEkg
 XkEMopwpwtDmIOkkJbQfqrq0b2LuwDHQqK0E4x0=
X-Google-Smtp-Source: ABdhPJx5kfCrTs6nWJQLQmv9XjTXxSl0LIr3Mm/dlZbZ15m4vUZH8QtlFhc9ZWN8zC+yz/LAtzwjKvqpRrY+K5B05gA=
X-Received: by 2002:a05:6638:d47:: with SMTP id d7mr6750776jak.2.1617264544745; 
 Thu, 01 Apr 2021 01:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
 <50cee64f-a264-4073-bafa-1e6775608169@foss.st.com>
In-Reply-To: <50cee64f-a264-4073-bafa-1e6775608169@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 1 Apr 2021 16:08:28 +0800
Message-ID: <CAL9mu0KQWLkNc8HfrsmCu7qq72txiou6N_NRBxTdoN1_XHSpKA@mail.gmail.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: andrew@lunn.ch, linux-doc@vger.kernel.org, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 lkp@intel.com, rong.a.chen@intel.com, mchehab+huawei@kernel.org,
 linux@armlinux.org.uk, linux-serial@vger.kernel.org,
 Erwan LE RAY <erwan.leray@st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 gregkh@linuxfoundation.org, corbet@lwn.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, pali@kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 0/6] ARM: STM32: add
	art-pi(stm32h750xbh6) board support
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

On Thu, Apr 1, 2021 at 4:00 PM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dillon
>
> On 3/31/21 10:28 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patchset intend to add art-pi board support, this board developed
> > by rt-thread(https://www.rt-thread.org/).
> >
> > Board resources:
> > 8MiB QSPI flash
> > 16MiB SPI flash
> > 32MiB SDRAM
> > AP6212 wifi,bt,fm comb
> >
> > sw context:
> > - as stm32h750 just has 128k bytes internal flash, so running a fw on
> >    internal flash to download u-boot/kernel to qspi flash, boot
> >    u-boot/kernel from qspi flash. this fw is based on rt-thread.
> > - kernel can be xip on qspi flash or load to sdram
> > - root filesystem is jffs2(created by buildroot), stored on spi flash
> >
> > to support the boad, add following changes.
> > - fix r0-r3, r12 register restore failed after svc call,
> > - add dts binding
> > - update yaml doc
> >
>
> Thanks for adding this new STM32 MCU board. Series applied on
> stm32-next. As discussed I made some changes applying the series.

Thanks for your work, just check your stm32-next tree, commit message
is more clear than my version. thanks.
Finally, you keep the stm32h750.dtsi, it's fine with me, I'll update crypto node
to this file when i get time to test.

Thanks again.

Regards
Dillon
>
> Regards
> Alex
>
>
>
> > ---
> > changes in v9:
> > - move gpio{a..k} entries from stm32h7-pinctrl.dtsi to stm32h743.dtsi
> > v8 link:
> > https://lore.kernel.org/lkml/1617094704-10040-1-git-send-email-dillon.minfei@gmail.com/
> >
> > changes in v8:
> > - drop '[PATCH v7 3/6] ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to
> >    support stm32h750' - stm32h743-pinctrl.dtsi file
> > - move compatible string "st,stm32h743-pinctrl" from stm32h7-pinctrl.dtsi
> >    to stm32h743.dtsi
> > - update stm32h743i-{dico/eval}.dtsi to include stm32h7-pinctrl.dtsi
> > - move file stm32h743.dtsi submit position to [PATCH V8 3/6]
> > v7 link:
> > https://lore.kernel.org/lkml/1617071338-9436-1-git-send-email-dillon.minfei@gmail.com/
> >
> > changes in v7:
> > - remove changes in
> >    Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
> >    Hi Rob Herring
> >    as you has already ack this patch, please ignore it. thanks
> >    history link:
> >    https://lore.kernel.org/lkml/1614758717-18223-4-git-send-email-dillon.minfei@gmail.com/
> >    https://lore.kernel.org/lkml/20210308195033.GA2855292@robh.at.kernel.org/
> > - remove "[PATCH v6 8/9] pinctrl: stm32: Add STM32H750 MCU pinctrl support"
> >    remove "[PATCH v6 5/9] ARM: dts: stm32: add stm32h750-pinctrl.dtsi"
> > - reference to stm32h743-pinctrl.dtsi in stm32h750i-art-pi.dts
> > v6 link:
> > https://lore.kernel.org/lkml/1616757302-7889-1-git-send-email-dillon.minfei@gmail.com/
> >
> > changes in v6:
> > - add gpiox{gpio-ranges, ngpios} in stm32h7-pinctrl.dtsi
> > - add status="disabled" in stm32h743.dtsi
> >
> > changes in v5:
> > - accroding to rob's suggestion, replace false with 'type: object'
> >    of 'additionalProperties'.
> > - add Tested-by: Valentin Caron <valentin.caron@foss.st.com>
> >
> > changes in v4:
> > - use unevaluatedProperties: false to fix dtbs_check warrnings instead of
> >    add 'bluetooth' in st,stm32-uart.yaml
> >
> > changes in v3:
> > - fix dtbs_check warrning: (8002cbd78fd5 and 4bc21d3dd678)
> >    >> arch/arm/boot/dts/stm32h743i-eval.dt.yaml: soc: pin-controller:
> >       {'type': 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells':
> >       [[1]], 'ranges': [[0,
> >
> >    >> arch/arm/boot/dts/stm32h743i-eval.dt.yaml: soc: 'i2c@40005C00',
> >       'i2c@58001C00' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$',
> >       '^[^@]+$', 'pinctrl-[0-9]+'
> >    >> arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800:
> >       'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'
> >
> > changes in v2:
> > - reorganize the pinctrl device tree about
> >    stm32h7-pinctrl/stm32h743/750-pinctrl
> >    stm32h7-pinctrl.dtsi --> stm32h743-pinctrl.dtsi --> stm32h743i-disco.dts
> >                           |                          |-> stm32h743i-eval.dts
> >                           |-> stm32h750-pinctrl.dtsi --> stm32h750i-art-pi.dts
> >    same to the stm32f7/f4's pinctrl style
> > - fix author name/copyright mistake
> > - add compatible string st,stm32h750-pinctrl to pinctl-stm32h743.c as they
> >    have same pin alternate functions, update Kconfig description
> > - make item in stm32h750i-art-pi.dts sort by letter
> >
> > *** BLURB HERE ***
> >
> > dillon min (6):
> >    Documentation: arm: stm32: Add stm32h750 value line doc
> >    dt-bindings: arm: stm32: Add compatible strings for ART-PI board
> >    ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
> >    ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
> >    ARM: stm32: Add a new SOC - STM32H750
> >    dt-bindings: serial: stm32: Use 'type: object' instead of false for
> >      'additionalProperties'
> >
> >   Documentation/arm/index.rst                        |   1 +
> >   Documentation/arm/stm32/stm32h750-overview.rst     |  34 +++
> >   .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
> >   .../devicetree/bindings/serial/st,stm32-uart.yaml  |   3 +-
> >   arch/arm/boot/dts/Makefile                         |   1 +
> >   arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 275 ++++++++++++++++++
> >   arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 306 ---------------------
> >   arch/arm/boot/dts/stm32h743.dtsi                   | 176 +++++++++++-
> >   arch/arm/boot/dts/stm32h743i-disco.dts             |   2 +-
> >   arch/arm/boot/dts/stm32h743i-eval.dts              |   2 +-
> >   arch/arm/boot/dts/stm32h750.dtsi                   |   6 +
> >   arch/arm/boot/dts/stm32h750i-art-pi.dts            | 229 +++++++++++++++
> >   arch/arm/mach-stm32/board-dt.c                     |   1 +
> >   13 files changed, 729 insertions(+), 311 deletions(-)
> >   create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
> >   create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
> >   delete mode 100644 arch/arm/boot/dts/stm32h743-pinctrl.dtsi
> >   create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
> >   create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
