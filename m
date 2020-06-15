Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 123D81F944D
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 12:07:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2EB3C36B11;
	Mon, 15 Jun 2020 10:07:29 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B987C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 10:07:27 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id j19so10548770ilk.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 03:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hg8K4xTSSuNaBtkl8lh9GNzZaKJC219hVqXlhKOASyc=;
 b=tgUlV/Hv+7gZqovKdUdduJ5DosmZ6W3ZgvLcam1sO+NfBlQkeL/R6Ll1hPEE2lvKe1
 Q9Q8r9+UwTYuIzIICqSKXIRi1m83v3jpiLa9EK6FSl2CzvfLDwdp/D/QlP1lrzqnUk5M
 K1M4ONzrcHZlTTZLMf4fM0XKl5fPHTxUOnuCB80lW/7POoQNRMcbiea5BnbvaGlGg+i9
 U9qeD0ozbnZcyiYa8rnMcJe6oNU0+1g0YzAWmgMjm3AQANEKH7o2We9t5YAKaSDrTMgT
 LKHBnER4Pqe4WQyyrf5LmbFUyrfoeNO6VQ422e0u9I6Uwl4PX1SjzVwCj0dIrZoL57q1
 ApHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hg8K4xTSSuNaBtkl8lh9GNzZaKJC219hVqXlhKOASyc=;
 b=iM/j3eWfXw8AkO/wBpGgEJ03xHXr9aUiRRVH3bw32VyYuV/bso/aiEXSebAXsR7EnJ
 rc+u2TApRqIM/RhMwNekzxOw47G50XplnvH29TxcSw4IdKQIIofNjRurYys3SUif7PPD
 TFeEqprudNu3BXqQAHa8E+6R88zyMqCMWrh+t8W5EynRvVPXPQQqqq8MUKEmojHtwpKF
 PfG/CYXNZDmlNRvpois0pS5wrVPyY/VP3dBOKUc86TomyqojQRKlC7sOln0bp3/vEHQL
 hQNkcUBuZzkWGASmUsxVA2EPiRFm0I0rddLePeJHtr/jbiW85QackFRJgFlCVK+vrLJd
 bI7A==
X-Gm-Message-State: AOAM532SbxcotbpOsq6ZGj9aAoSBp0nOdSWeora4mclkE66RemFvjDYZ
 ziwJP/WEVEarQzn90iUEI2guzCxqtftOqMgVBnc=
X-Google-Smtp-Source: ABdhPJwTRoOir1kIpAowgJbUvDY6mcvoOvZBCRgHGJW796+SC2pR32+7lvI/4r+L3ywnisFym7QRUoEMdKMTueb6e/w=
X-Received: by 2002:a92:b69b:: with SMTP id m27mr25709568ill.271.1592215646234; 
 Mon, 15 Jun 2020 03:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <1591709203-12106-1-git-send-email-dillon.minfei@gmail.com>
 <618d3fea-aa9f-dbf6-04a1-e9db621a6cd5@st.com>
In-Reply-To: <618d3fea-aa9f-dbf6-04a1-e9db621a6cd5@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 15 Jun 2020 18:06:50 +0800
Message-ID: <CAL9mu0JsCOrnt=ROr-0_GByKeb6yeq5YwygzS+S9i=SMjgL6kQ@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 pierre-yves.mordret@st.com, Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 p.zabel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v4 0/4] Enable stmpe811 touch screen on
	stm32f429-disco board
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

On Mon, Jun 15, 2020 at 5:08 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Hi Dillon
>
> On 6/9/20 3:26 PM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patchset is intend to enable stmpe811 touch screen on stm32f429-disco
> > board with three dts and one i2c driver changes.
> >
> > has been validated by ts_print tool
> >
> > Changes log:
> > V4: indroduce 'IIC_LAST_BYTE_POS' to compatible with xipkernel boot
> >
> > V3: just add change log in [PATCH V3 3/4] below ---
> >
> > V2: remove id, blocks, irq-trigger from stmpe811 dts
> >
> > V1:
> > ARM: dts: stm32: add I2C3 support on STM32F429 SoC
> > ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
> > ARM: dts: stm32: enable stmpe811 on stm32429-disco board
> > i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
> >
> > dillon min (4):
> >    ARM: dts: stm32: add I2C3 support on STM32F429 SoC
> >    ARM: dts: stm32: Add pin map for I2C3 controller on stm32f4
> >    ARM: dts: stm32: enable stmpe811 on stm32429-disco board
> >    i2c: stm32f4: Fix stmpe811 get xyz data timeout issue
> >
> >   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 +++++++++
> >   arch/arm/boot/dts/stm32f429-disco.dts  | 47 ++++++++++++++++++++++++++++++++++
> >   arch/arm/boot/dts/stm32f429.dtsi       | 12 +++++++++
> >   drivers/i2c/busses/i2c-stm32f4.c       | 12 ++++++---
> >   4 files changed, 80 insertions(+), 3 deletions(-)
> >
>
> DT patches applied on stm32-next. I changed node ordering in patch 3.
Okay, thanks.

Regards,
Dillon,
>
> Thanks
> Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
