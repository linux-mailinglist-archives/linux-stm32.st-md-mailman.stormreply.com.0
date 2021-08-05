Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE033E10A5
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Aug 2021 10:56:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90269C597BC;
	Thu,  5 Aug 2021 08:56:02 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F34EC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Aug 2021 08:56:00 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id h18so4341415ilc.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Aug 2021 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gzmhApPj8HKqYSRf21gqLOYpahW4Hf0SxEjn45dssUM=;
 b=TOTf9psJWunXK13kHgtY8TiWSVBgt5Vzq7W3W8AQ6vfyunOVZEh0Qg4+gWIaULVC0g
 U3YhP0DGAJBbmfrkgJEG1F3KzQp2r86sDY8FA4NRqzJFZVplKdW1VXiss+CkUgIVFlHY
 1AScnG9bhXvzFieoJZX0UsqLYilrjUrI/OQe5yDln9R0bPAl+gjRmsFEH07AqF30YWzf
 ITB/9oa3eXMfGlktXJpWD/8UHgFfsPXBT3zWtvvJCNHBegdJVKz1bP3KPigPDera7nA5
 ViBZAMJxF0nDwi4qDAhUT12fx7jCiepxmlN3eWPhh+rNERgLcXgkD/ePxOYnQOfNRHWn
 nplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gzmhApPj8HKqYSRf21gqLOYpahW4Hf0SxEjn45dssUM=;
 b=PK7xtao4zl6JYL7g2b3wedxiTZJGMUoHouxfu2wL6e0am7JfZJVUg+pJw5KV4Ozd93
 X0FJl+l2UhN2oSR/i/nX59OFWWkeY76Av1lwJZ1m57GuIwFGZfeIM6plI4XeVnENNMp3
 Jz+vCA1hMTOi2kPsUhk0nG0Aynrqjm1AXO0TndsoaJn6ZImBehsyaiHmtHu3Z+h/0coH
 f8WQ2UM4X339HdKD9Z0nKV7xfKGNOH/lXGaW8kG3NG/UXmojUpLydOFrPooass7EPe1n
 L0qe5bTG7QZXw0jcgeiWW7CUWsCCUszHYTrA7aChFzHgrTTV50WHWThh0fZ9ywvA/czr
 TAkg==
X-Gm-Message-State: AOAM533ynZ9y9tvCR+WQfHs/IEdcG4Emid58kS9M0sd1RCgJ7iIxTOz5
 6ROB0XACHQv+EsrWHkx9Gaq0Gw7Pql/qJn8YJjM=
X-Google-Smtp-Source: ABdhPJwE6/hjmNRFCTdKVvlJC0gbv70mRmlYMEcT7G0uSTjPkThFyytPoqX7/kmL1I7cGXdcgbE94sArd3GVW8kQtzU=
X-Received: by 2002:a05:6e02:13b3:: with SMTP id
 h19mr244834ilo.218.1628153759089; 
 Thu, 05 Aug 2021 01:55:59 -0700 (PDT)
MIME-Version: 1.0
References: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1627098243-2742-1-git-send-email-dillon.minfei@gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 5 Aug 2021 16:55:23 +0800
Message-ID: <CAL9mu0+P4U+2tyA7CGCcP6riWXzKSpCWpNxKi3MvTt8Abiwtow@mail.gmail.com>
To: laurent.pinchart@ideasonboard.com, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Peter Robinson <pbrobinson@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi All

Just a gentle ping, thanks.

Best regards.
Dillon

On Sat, 24 Jul 2021 at 11:44, <dillon.minfei@gmail.com> wrote:
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
>
> I was submited the first patch last year, you can find it at [1].
> this patch has one major difference from that one, which is replace the low
> level communication way, from spi_sync() to mipi_dbi_{command,
> command_stackbuf}() interface, referred from Linus's patch [2].
>
> both the two dpi/dbi interface was tested on stm32f429-disco board, if anyone
> want to verify this patch, you need apply the clk patch for this board first,
> you can get it from [3].
>
> [1] "drm/panel: Add ilitek ili9341 panel driver"
> https://lore.kernel.org/lkml/1590378348-8115-7-git-send-email-dillon.minfei@gmail.com/
>
> [2] "drm/panel: s6e63m0: Switch to DBI abstraction for SPI"
> https://lore.kernel.org/dri-devel/20210611214243.669892-1-linus.walleij@linaro.org/
>
> [3]
> https://lore.kernel.org/lkml/1590378348-8115-6-git-send-email-dillon.minfei@gmail.com/
>
> v4:
> - fix m68k-allmodconfig build error which reported by lkp, thanks.
> - add Copyright 2018 David Lechner <david@lechnology.com>.
> v3 link:
> https://lore.kernel.org/lkml/1627013203-23099-1-git-send-email-dillon.minfei@gmail.com/
>
> v3:
> - add Fixes tags.
> - collect reviewed-by tags from linus and jagan.
> - replace DRM_ERROR() with dev_err() or drm_err().
> - remove kernel-doc markers from struct ili9341_config{}.
> - reorder include headers.
> - remove the struct device *dev from struct ili9341{}.
> - restructure the ili9341_probe() function, add two ili9341_{dbi,dpi)_probe()
>   to make it more readable according to jagan's suggestion, thanks.
>
> for the full drm driver exist in drm/panel need Sam and Laurent's feedback.
> so, not cover this part at this time, will be update later.
>
> v2 link:
> https://lore.kernel.org/lkml/1626853288-31223-1-git-send-email-dillon.minfei@gmail.com/
>
> v2:
> - replace vcc regulator to bulk regulators in driver, from linus suggestion.
> - fix dtbs_check warnings on ili9341 dts binding check.
> - add bulk regulation node in ilitek,ili9341.yaml.
> v1 link:
> https://lore.kernel.org/lkml/1626430843-23823-1-git-send-email-dillon.minfei@gmail.com/
>
> Dillon Min (3):
>   dt-bindings: display: panel: Add ilitek ili9341 panel bindings
>   ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding
>   drm/panel: Add ilitek ili9341 panel driver
>
>  .../bindings/display/panel/ilitek,ili9341.yaml     |  78 ++
>  arch/arm/boot/dts/stm32f429-disco.dts              |   2 +-
>  drivers/gpu/drm/panel/Kconfig                      |  12 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 792 +++++++++++++++++++++
>  5 files changed, 884 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
>  create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c
>
> --
> 1.9.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
