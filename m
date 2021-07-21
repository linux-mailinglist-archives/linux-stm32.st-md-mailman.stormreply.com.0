Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5A3D1070
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 16:02:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A249FC5A4C0;
	Wed, 21 Jul 2021 14:02:53 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6597AC597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 14:02:52 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id i5so3355001lfe.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+7Qp3N8i2ZqaUKiDMln9kfRvQQx8iZ4aXJx31dGT4ps=;
 b=k+zdBVlIlSQR1P9SUQm4rWxiuVKGt+Rdrj1zn8ykerQwuV2c1ohdgP/tbToleYU5pK
 k6tkA3Mffh6O0IrtAKFfYHwFBINE6YXJlCMzAycKnlMV7qsU8JoUvPTK5RHN4JsRuMWN
 nx9VIsMrsX8K39QuvUjj/Kf2qwdLWVwkPiBtrLkhsmIVin8FOcccA7I4rp3fRqeqOadM
 crhsm3N2Fj9J1rz1Pn0Yzid3rVP0rk8uousrwvM5nCE4hVwHDql8jShpAWYHQ3qPoYd3
 deHr+L3O/Ay9z5Hl+PQ9IMMgY0dpBiyHYDwVn6AyxH2f2nROXplKiAaKTpHL3jzElEg9
 jtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+7Qp3N8i2ZqaUKiDMln9kfRvQQx8iZ4aXJx31dGT4ps=;
 b=RNHHBvWwgd17rBStxsz2YG4uRO2BuOpXeGTxU3wa0rjwmzGBVgE5la9xnv3fX2WZi/
 tdMy/F2oe8We0SEYlfLKQnSLUaldym9K768Z1kj6DNjEtfaPG3NOGLbh+7iFfbA4QiSl
 CIQuLjj4jaqBlJduTGTo9CcBHkLVROLiGnnWEnh678T4u4eDUeiJk5EsSLqrHkOYtmWB
 c/bOAsEBKVsw+gUJijDtgjLcsFBOHGOhQBPeZWGHuWTcHFQ7srTuDlcpK5KKPliAkX2l
 1jx2/LPNszQtqb1vk3Zw++1Re/YGy5mD4PCDZilgH/TLpP/tegf/JQ+JQbP8kweE+V09
 87Uw==
X-Gm-Message-State: AOAM5326NoOnY9pscL5a9EmvZa+JMAmQz7EOAXxDw3VNQkV5M7mwrHUA
 t3hVD4cOyJLyom9PwsF/ZdGL1xkVYewQHav+rK2dCw==
X-Google-Smtp-Source: ABdhPJzixaew0F1GayfkVMS5XfHQR639oq4+GHeo0cd4p/TY/QddiF+whNLR6zx166zTDGONuB6zet+F22BbijBYcxs=
X-Received: by 2002:ac2:5e71:: with SMTP id a17mr25038632lfr.465.1626876169985; 
 Wed, 21 Jul 2021 07:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:02:39 +0200
Message-ID: <CACRpkdbkbbuHk2U8auXqzZbSs6eKnj2+0BySivHcuEvsY31kWg@mail.gmail.com>
To: dillon min <dillon.minfei@gmail.com>
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

On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:

> From: Dillon Min <dillon.minfei@gmail.com>
>
> This driver combine tiny/ili9341.c mipi_dbi_interface driver
> with mipi_dpi_interface driver, can support ili9341 with serial
> mode or parallel rgb interface mode by register configuration.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> ---
> changes in v2:
> - replace vcc regulator to three bulk regulators(vci, vddi, vddi-led)
>   according to linus suggestion, thanks.

This is a really nice driver.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
