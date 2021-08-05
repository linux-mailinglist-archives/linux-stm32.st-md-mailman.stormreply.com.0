Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B17A3E1267
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 12:16:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41320C597BC;
	Thu,  5 Aug 2021 10:16:58 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93417C57189
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 10:16:55 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so13558644pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 03:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uxYTdS6bgnfx+2Ini0fwp3kDF4xi+vc1vXsFnljggKE=;
 b=JtEg/md2Yb41+lcJXe0vA8ZSpStUi8dmGPgMckSn8GNINukwB+ruPr97a/iHlXfhPz
 tAalqCJiLpoS195wRcmC8yJvRMyKPo/YkNrM9NUBQ2qlfOc32ztPM7YldPLNnk3r+PeA
 jdJ1aVLKQrfpCupHt43bipmklPq+GVI+oImgws/r3M096q3leCRSbAFXiiW5+twDCZ5a
 C5vHVCdnP1TIvdOukQbc6Mi22tGiMGQ2oTQe3tyyEN92JHvwC4mFFCg/DNPGApK+EZmt
 0x+2mcC8l2PXBFQ9R22X/soj19riBMzXr/o7Vz5pLl1imicG2uHNDO4TwmW2gvW7T3+Y
 ybbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uxYTdS6bgnfx+2Ini0fwp3kDF4xi+vc1vXsFnljggKE=;
 b=qaMnJWcTiqki3PeQqIzesWIYxELHsbPW3zCsJP8HAedvENo1U47L1ciueIaZywGXay
 /IJh0ctiEsX9DL/yDeXz6d/nPBQ4wnuusbLIfUgGpIkrBdBXkPEyoBEH24O6UkV/+nCc
 Ghu0xP8mJ3Nwy4xXRHUr8Al4S2Vp27MVfff8FS+jjC1ypjOhc8tSGiPpvhccox8OW4X1
 vZkRh8Fwyv65FR7zCREptmkgoaA3fqdvY4FqwtBwqW7LaZLoslObSN0E0RPkZcwOqXH5
 CGyDKbJfL5keCLKf7bsHcxNUltr4fnz1wsaJ7+T5sJEl/MA3iGyrr6wRvaNzhDQwAljD
 yAdA==
X-Gm-Message-State: AOAM532jWEFsT0huS0mKSk+83/nO9DIPlN8Dx4EWTTdEkQ/yjAP8joZ3
 Ny2GhM0gO9jCjmLfRJhtuWn45Uvyc0nfMrOF0OQ=
X-Google-Smtp-Source: ABdhPJzQdp79YDSUT7pRlIuSy1Usr2PJofPj14rvaki1F07Zhcat3klZF8hM1ON/1nirWpPekkeKplXaq4gQ26K/OTY=
X-Received: by 2002:a17:90b:33c5:: with SMTP id
 lk5mr14831776pjb.129.1628158614242; 
 Thu, 05 Aug 2021 03:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 5 Aug 2021 13:16:14 +0300
Message-ID: <CAHp75Vc5fJM-UiBiosAiTraq=6P0AFefmw1rmtFcvyWVb6rfLA@mail.gmail.com>
To: dillon.minfei@gmail.com
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
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
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

On Sat, Jul 24, 2021 at 6:46 AM <dillon.minfei@gmail.com> wrote:
>
> From: Dillon Min <dillon.minfei@gmail.com>
>
> Since the st,sf-tc240t-9370-t dts binding already exist in stm32f429-disco.dts
> but, the panel driver didn't get accepted from mainline. it's time to submit
> patch fot it.
>
> This driver can support two different interface by different dts bindings:
> - spi+dpi, use spi to configure register, dpi for graphic data.
>   st,sf-tc240t-9370-t
> - only spi, just like tiny/ili9341.c (actually, this part is copy from tiny)
>   adafruit,yx240qv29

...

> I was submited the first patch last year, you can find it at [1].

submitted

> this patch has one major difference from that one, which is replace the low
> level communication way, from spi_sync() to mipi_dbi_{command,
> command_stackbuf}() interface, referred from Linus's patch [2].

Can you shed a light on the road map here.
I have the SPI panel (tiny) based on the ILI9341 and I'm using
actually mi0283qt driver. With yours we will have 3 (three!) drivers
for the same chip. I really do not want this. Without road map on the
prospective of these all drivers, NAK.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
