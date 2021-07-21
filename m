Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB7A3D1134
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 16:22:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 594B7C5A4C0;
	Wed, 21 Jul 2021 14:22:46 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 161C8C597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 14:22:44 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id h4so3238490ljo.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxH3J+Eoh7kaNaXSHILbrEKptNqW5XNSkT/LEfhorfw=;
 b=np3T/tKhWSs3xDEU7MtFijZp9knPrBJjhodCGPOhu6WamYYnmI0gWgLGwLiNBVO5Cv
 PY1SoZQb+Yd3SboBPYmHKlddwz0Qh7RS4ABDPEFwe+7cPUmCuN7+IY5A/hWgkSBr2lMX
 j5/t1emiw10+TGpDl8R9AGk0R6trQrmcKoEZ7ZcoQsKlqecQZu+WjhXR8he0+NqXegso
 4j8UZUofI2jkgKlTt5CnguAr5JSdq8A7kgzUkaQ1+2bwoj3MHdKoPFbJYCkI2+zkhmPO
 2AKw2+7SY6NIuFDUZ8U29hXdJ4BRQcYUrQLeC7Kzmo837X3mqcFFVJNz9cBQFO4GYJWV
 hfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxH3J+Eoh7kaNaXSHILbrEKptNqW5XNSkT/LEfhorfw=;
 b=OSIBnKxKYgM9pQa7GCngtipDAchpAd2gJG12QhkNlCbf6bN4LsZiDZGax0yxPXU0YM
 9iFSDTNVX/1zlzjdZ5qvFaJ/8Fu4qgXfts6JfZAe3kbcVHfdjimA8/PSCjPZ6uGs/YXw
 RVHs5BF76IL190wMKltD5HOlroJwdNCDNW4kazZRa8D9rqSQxzTY1NA/RAhnHzOHmG1f
 ZizZBbVcyNOCOQ32LcwpSMzklAf/1T1Xed26L4XZPP7qxNLFcYfnRreVMElsn78W7Ped
 iCRSBfZZU9syxSqCY2zdsuBdJBi+gMhUhq9Jw7JeICCtgWkw4u2laO/fnooFc30sTwfg
 bh3w==
X-Gm-Message-State: AOAM531gVCODVTpgW46cKSBBOXCH8PNkhfb/jiT9vknm0nHqpRu73ln7
 tSWlEBVKnCgFy219P3zOI669cb2HZsuXHWWsAA3/sQ==
X-Google-Smtp-Source: ABdhPJxRKXD+U0XQM/F7sLwpZwFlzVAYL4bWalqIvOAZRJl36XOz1b+yigg+oOm5a+edqTSoFlwCiEItIcz7ltih25o=
X-Received: by 2002:a2e:9d15:: with SMTP id t21mr31738197lji.200.1626877364224; 
 Wed, 21 Jul 2021 07:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-2-git-send-email-dillon.minfei@gmail.com>
 <CACRpkdYerVu_LyNOJoxMTqhuNd9QBSFWTM7bfRnrsOyrxqE_kw@mail.gmail.com>
 <YPgsl5M6P86iJADt@ravnborg.org>
In-Reply-To: <YPgsl5M6P86iJADt@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Jul 2021 16:22:33 +0200
Message-ID: <CACRpkdb14g+cn1hKi+gF6oOLMSNLffvuuJbVqR95pmuCtgjHEA@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Dave Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: display: panel: Add
 ilitek ili9341 panel bindings
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

On Wed, Jul 21, 2021 at 4:18 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Linus,
> On Wed, Jul 21, 2021 at 04:00:35PM +0200, Linus Walleij wrote:
> > On Wed, Jul 21, 2021 at 9:41 AM <dillon.minfei@gmail.com> wrote:
> >
> > > From: Dillon Min <dillon.minfei@gmail.com>
> > >
> > > Add documentation for "ilitek,ili9341" panel.
> > >
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> will you take care to push the patches now you did the review?

Yes but uncertain about patch 2/3 which fixes a DTS file.

Normally that should go through the SoC tree. I'm fine with
applying 1 & 3 but don't want to cause excess errors in schema
validation so I'm a bit ambivalent.

I would prefer if patch 2 gets applied to the SoC tree and
propagate all the way to linux-next before applying patch 1 & 3
but I understand that will take some time.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
