Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 414813D11C6
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 17:00:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 789B5C5A4C0;
	Wed, 21 Jul 2021 15:00:47 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6785AC597BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 15:00:43 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id v26so2655909iom.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iknMDrhct0ZkRYz3sqrxjrU836dktL9pH5wh23AxUt4=;
 b=TsfXQ3/0ZMrx26poBBp3lYWPWdgkda1Yy/2M9fGsTyD6nz2gXnkV/0rlkMZkdh3VuO
 lxWucouuXWidWOx80Rt/5GLLUwaRwHNMZBXzpzK2ykJQQm5sDNO7yKD7LBr16eERrIw8
 0hXLp8/G6t1F4jksSPenOU86bK411zWs/siZ/GQfMnARygpvoAXOXUdj8+u6HPtNpnu8
 w/VoNZi4Fgbm4df0H0DuMHSRQt7tHqiR2mI17s1tTjQiazoIs/qa0+bmfomBKJRbJjPv
 Ir4w10M3wILiDK26fTI6QXCfT/U1FALXNTkhDMgE5QAoFAuD2r78gIdZqUOACcypH17z
 29og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iknMDrhct0ZkRYz3sqrxjrU836dktL9pH5wh23AxUt4=;
 b=Z2V2x2Rp5Ga7qY7euH5HpCHV/u7djHJN+c1PuZ6ayYrEKoVvH7ndUW+C+fqznuBDHC
 vkbEjIzbv+aT/qyWcXGdKEhu5BRn0unifRgt8MYqa4y7oAxtpTP6oO3qj7zrckNUx5Mc
 hsC0q3aknLwR2ov5UeRWJKWiASw1ibchevq7fpOh89maXxzZPumKaQddyOHYDUgsqm9f
 7otVM5aam3ipxoqUrz+PL3ZyoYWcU4PQeGpBi7sGlOdR+nYlzJIFmmfuGFt1xYHs37dT
 cu91ezhfKmFRJ8nXiDSycBJ9STzh8JOZGnN/QPT7oUXOQ+CqqSOVBmBcmwim4OYAbJF9
 zR4g==
X-Gm-Message-State: AOAM533Vfj4cBfDwfna7wvgT3VZtONlel66tW9hWSBhQnp/2VZ2qASEu
 VsqWkIsuA1mHexDs3nO5fBb3MApXr6ZtSaxLtNg=
X-Google-Smtp-Source: ABdhPJxkQLhypIjPoF3QHU2C29uQ6Xc/RLwToaslriF9WqJvR6ei9u4Cqs8YpRADZn5nCrA45yTZ6KJyTXddAZYaiEs=
X-Received: by 2002:a05:6638:33a6:: with SMTP id
 h38mr31612757jav.130.1626879642718; 
 Wed, 21 Jul 2021 08:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdbkbbuHk2U8auXqzZbSs6eKnj2+0BySivHcuEvsY31kWg@mail.gmail.com>
In-Reply-To: <CACRpkdbkbbuHk2U8auXqzZbSs6eKnj2+0BySivHcuEvsY31kWg@mail.gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 21 Jul 2021 23:00:06 +0800
Message-ID: <CAL9mu0KnzLk+jmUFFJvgZCvM=jwg1c_T6OpsC1Hb_u5Otkw-ZA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/panel: Add ilitek ili9341
	panel driver
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

On Wed, 21 Jul 2021 at 22:02, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:
>
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > This driver combine tiny/ili9341.c mipi_dbi_interface driver
> > with mipi_dpi_interface driver, can support ili9341 with serial
> > mode or parallel rgb interface mode by register configuration.
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> > changes in v2:
> > - replace vcc regulator to three bulk regulators(vci, vddi, vddi-led)
> >   according to linus suggestion, thanks.
>
> This is a really nice driver.

Thanks, all the code here is inspired by your recent patches.
Really appreciate your time to help me.

Thanks & Regards
Dillon

>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
