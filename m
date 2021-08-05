Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C83E12D9
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 12:43:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D710C597BC;
	Thu,  5 Aug 2021 10:42:59 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB50FC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 10:42:56 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id j18so4585881ile.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 03:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5CC+qqYzxNbX02yW8rXrZN1nsewW7OQh6pCCNQCnBFA=;
 b=LEd7dmKXHX4KDfaael/nb3KzkXU/tGl4vxxbobYo40113u3FNcYgtEepeQjEKRaStJ
 x0IHVyDg/65VM4KYpkmM6y2vfO++w3bW3EOwwhU1FR5UL2kWHhrZCiClZ3n3uhJQuvZX
 vQpqup26DbCBcqcOPK4SCCd8OqTD/QXvHEpBXqmuh/SFvuJqVIR0c1jFQvdurOOoiruw
 0Tnn6t4RXNPJ3MrCM3D1KZSKrI1QpDu7yavU/v/LGLewPAI+t6Zog3kCb60lx8x90+up
 KHgPke6ByhzFZuWpFkPlY6j9fIVI7knjtHTkZ0bC1V0v1IIotZMxXHIEwkHvOkjdGJ5p
 K89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5CC+qqYzxNbX02yW8rXrZN1nsewW7OQh6pCCNQCnBFA=;
 b=DK7enasbn432A1qBJPob2Z2eUQYnwY4yGDdhrVbdBz5k8oEBwwCC2Ik9fxYRTRiUNp
 5IbLoRjhMW2LSpuuBdIimdNCf5O2kLEg/9ex0VlUicMlE0wfWfVZt8H2meW9iv5Ck3dP
 eIpazjjVqHOF2CYfTKJ9xyfjsaVVSZddp2yLzkrQeKryHRoe8z/YaUKRSpTpTvNnbxPZ
 zX4ZG7gpfSz7Zc9wkDjEdjQi6gWFtq9bojksHFPhb6GwUSgQtTV9J7gPO72VdvE0HUI6
 0RFay4dmXWiHv7GUcRSBxzDLPQf1vE9y3W7gLHM7JXp25TCjqOQ3zICDmtgC/Scsb3Xq
 t1gg==
X-Gm-Message-State: AOAM530kTyZ4xNIEngbvDdAlSpFosZIpRm2VbK4TXs4TFtIbYnB5/03t
 NMu2asyOPLIe8vbNd2pCZYC8bptdWYjUOznMZ4A=
X-Google-Smtp-Source: ABdhPJwTqaerJZpRejApHmZ+A8EHtxdWMpoIrp7SBBXp/NRJpTNn+aMXl4SQ6RSi6J+yvY9u14nAqrih4a1io1Tid9g=
X-Received: by 2002:a05:6e02:1905:: with SMTP id
 w5mr57891ilu.270.1628160175852; 
 Thu, 05 Aug 2021 03:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
 <CAHp75Vc5fJM-UiBiosAiTraq=6P0AFefmw1rmtFcvyWVb6rfLA@mail.gmail.com>
In-Reply-To: <CAHp75Vc5fJM-UiBiosAiTraq=6P0AFefmw1rmtFcvyWVb6rfLA@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 5 Aug 2021 18:42:20 +0800
Message-ID: <CAL9mu0+_fTTS8rBv63-PQ0H1M=yg4EtZwYXqORNRhHL0U8_KxA@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, kbuild-all@lists.01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 0/3] Add ilitek ili9341 panel driver
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

Hi Andy

Thanks for your question.

On Thu, 5 Aug 2021 at 18:16, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jul 24, 2021 at 6:46 AM <dillon.minfei@gmail.com> wrote:
> >
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > Since the st,sf-tc240t-9370-t dts binding already exist in stm32f429-disco.dts
> > but, the panel driver didn't get accepted from mainline. it's time to submit
> > patch fot it.
> >
> > This driver can support two different interface by different dts bindings:
> > - spi+dpi, use spi to configure register, dpi for graphic data.
> >   st,sf-tc240t-9370-t
> > - only spi, just like tiny/ili9341.c (actually, this part is copy from tiny)
> >   adafruit,yx240qv29
>
> ...
>
> > I was submited the first patch last year, you can find it at [1].
>
> submitted

Thanks.

>
> > this patch has one major difference from that one, which is replace the low
> > level communication way, from spi_sync() to mipi_dbi_{command,
> > command_stackbuf}() interface, referred from Linus's patch [2].
>
> Can you shed a light on the road map here.

Personally, I'd like to merge tiny/mi0283qt.c, tiny/ili9341.c(already
done) into this driver later
(keep original author, copyright, dts compatible string).
then remove these two drivers under tiny, but it's up to Sam and
Laurent agreement.

For long term, just like Peter suggested, let all panel based on
ili9xxx with single-dbi or dbi & dpi interface to be supported by
single ilitek-ili9xxx.c, something like panel/panel-simple.c
 (panel/panel-ilitek-ili9322c, tiny/ili9225.c, tiny/ili9486.c,
tiny/mi0283qt.c, etc).
it's also needs maintainers permission.

> I have the SPI panel (tiny) based on the ILI9341 and I'm using
> actually mi0283qt driver. With yours we will have 3 (three!) drivers
> for the same chip. I really do not want this. Without road map on the
> prospective of these all drivers, NAK.

Yes, it will make users confused if there are three different drivers
for the same chip.
I'll continue to work on this driver.

Thanks again for point this out.

Best Regards
Dillon

>
> --
> With Best Regards,
> Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
