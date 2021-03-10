Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5BE333BC0
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 12:48:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDA70C57B53;
	Wed, 10 Mar 2021 11:48:28 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D2F5C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 11:48:23 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k2so17569506ioh.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 03:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=MgumKQ8A8vujpcGidnQ3C//AKqkYksiK7PMribHV3ho=;
 b=DYUnOI1xkybUKmjxUsxK/1caGOqEuExlhcOTDQXGlBsUyZc6CRZGuKVBBBULTOVD+P
 aXQM/f5OrhNjI1N8kqj4OVJJq6VRKWOacQ4wnVSC+WconVS3D06jcWFpgMWd4+fcGj7U
 YO3bCVtF/4IFiLXzdDU3KrFSxjQKz/uzYD+eOaA026la9A0q7zn7jCjnAgeeiS3eZDYr
 hTs3eD6uVyZLbk7pptQgtEJZhXd+shP7DyW466TFg7u5B8JREcn8RDDaIAuPUIm7urRj
 s+VBoOhVPPyNtvpqe+NQaeUCeZWUBFWtU18BF37s8A1fwwKdwCy+oP1jgFypQMNy6IYw
 Zr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=MgumKQ8A8vujpcGidnQ3C//AKqkYksiK7PMribHV3ho=;
 b=H3DtOBID1fgkRsFZvSrXyWMrSrtq3DHBzXHjWQAVpm1XwVHQgqBxMUA3HobqzMvmKN
 Ksz2vvLtBDVHklOUmT2MOrCylzNjEXFUEQiVxCouXQwyvh1kyOvdgho5/R3FdB49TFbR
 fPkE80T92R9MEZq11U1ZB5mZOaEsa0pfYZ4Z0gEBP6EhUrqPPn8ThmaTvSmDvYPILxft
 6Pvo3E7X5NulKZ8kJHT07Rhsmmok4GYve4lgFVnlmlCijCrFcT159L+ImQpNrhgjaa/I
 +MAtLmKcjavR3y1fmMyy5gg6VeRy25g23HRLNkxXvd7XYdv1p9zv/eljuYGZQFjEwIII
 zNhw==
X-Gm-Message-State: AOAM5318T/OAbNFUdi7vCzS0U9W3Z2VbvvtOcek15x6R4Yz0kc8UE0/B
 RZDSSqymwM3NrJbgsOB4wkVIs+aIKrpAYbTLOhg=
X-Google-Smtp-Source: ABdhPJyhYfR48luq7gEmplvCktrRBwsQTYvkmG1J4Fb6rJ6HGeOYQGGfk9FH8kWfX+Trko7XOFcRrXtMUeiW4aFdkd8=
X-Received: by 2002:a5e:cb4d:: with SMTP id h13mr2073997iok.68.1615376902761; 
 Wed, 10 Mar 2021 03:48:22 -0800 (PST)
MIME-Version: 1.0
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 10 Mar 2021 19:47:46 +0800
Message-ID: <CAL9mu0LwT7GqWQY1Dpw3zLnS+oX8KFq=Lrp6NSBJvSgcsxEQVQ@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@st.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux@armlinux.org.uk,
 Vladimir Murzin <vladimir.murzin@arm.com>, afzal.mohd.ma@gmail.com
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

for the device tree part , still waiting review. just a gentle ping.
if Mr Alexandre torgue can take a look, would be great.

thanks,

On Wed, Mar 3, 2021 at 4:05 PM <dillon.minfei@gmail.com> wrote:
>
> From: dillon min <dillon.minfei@gmail.com>
>
> This patchset intend to add art-pi board support, this board developed
> by rt-thread(https://www.rt-thread.org/).
>
> Board resources:
>
> 8MiB QSPI flash
> 16MiB SPI flash
> 32MiB SDRAM
> AP6212 wifi,bt,fm comb
>
> sw context:
> - as stm32h750 just has 128k bytes internal flash, so running a fw on
>   internal flash to download u-boot/kernel to qspi flash, boot
>   u-boot/kernel from qspi flash. this fw is based on rt-thread.
> - kernel can be xip on qspi flash or load to sdram
> - root filesystem is jffs2(created by buildroot), stored on spi flash
>
> to support the boad, add following changes.
> - fix r0-r3, r12 register restore failed after svc call,
> - add dts binding
> - update yaml doc
>
> dillon min (8):
>   ARM: ARMv7-M: Fix register restore corrupt after svc call
>   Documentation: arm: stm32: Add stm32h750 value line
>   dt-bindings: arm: stm32: Add compatible strings for ART-PI board
>   dt-bindings: pinctrl: stm32: Add stm32h750 pinctrl
>   ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h75x
>   ARM: dts: stm32: add stm32h750-pinctrl.dtsi
>   ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
>   ARM: stm32: add initial support for stm32h750
>
>  Documentation/arm/index.rst                        |   1 +
>  Documentation/arm/stm32/stm32h750-overview.rst     |  33 ++
>  .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
>  .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   1 +
>  arch/arm/boot/dts/Makefile                         |   1 +
>  arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 392 +++++++++++++++++++++
>  arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 307 +---------------
>  arch/arm/boot/dts/stm32h743.dtsi                   |  30 ++
>  arch/arm/boot/dts/stm32h750-pinctrl.dtsi           |  11 +
>  arch/arm/boot/dts/stm32h750.dtsi                   |   5 +
>  arch/arm/boot/dts/stm32h750i-art-pi.dts            | 227 ++++++++++++
>  arch/arm/mach-stm32/board-dt.c                     |   1 +
>  arch/arm/mm/proc-v7m.S                             |   5 +-
>  13 files changed, 716 insertions(+), 302 deletions(-)
>  create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
>  create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
>  create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts
>
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
