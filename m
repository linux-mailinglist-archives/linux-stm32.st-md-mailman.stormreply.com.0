Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9693D11AA
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 16:53:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D9C8C5A4C0;
	Wed, 21 Jul 2021 14:53:58 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 542B6C597BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 14:53:56 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id w1so2510225ilg.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=39/icZ4895+m49O8ui8jK8s2YjESquae62yWMw3Ir4c=;
 b=Guo73mZ6yKHiZEmwWSRxAODeMC+83TtcsfX8BJAhI48v2UJRUUcF4upLXHb4Lrdb0L
 po+YJuoSUpi2NwBBE3sZFLrMxQriAhcPhsuh1k9Gq5omgHSlp66KafL9ziJNC79uDngy
 ZyKAutlVy3QInJurrVKEbXqCfox2pN99kwZFSqRzCSAwszGcpPsEZKaUNFZUE3srjo8j
 Cwh2xWPhdGSluOIWtQgDV4HpSDaDWW2Au3wN/ro0nsCwaGZAl+YgkP8afmA+HuRWIrC7
 7Kcnq1gSYbXqBKU4TQ0RG+YwrVrrhlGdWAtXigdm3hiyQiB7dCoyWF6bXUJDxrx0lHwZ
 efhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=39/icZ4895+m49O8ui8jK8s2YjESquae62yWMw3Ir4c=;
 b=qGpGy/axMAU5C8dEVAUtx6baCkRKDCTKvKj636a5DKuPmciJMVu/HJOobMBnrefMQ6
 1nxj5sKoMDVWf53T8gmRNOHwuE9Eax4WlighndDcIy5IZFcbHvf5u7iz9Fiq/MyN+tPc
 QIBezLJOApyfNQlUq/e/F4nzoadqRUBzbtdsso/3X1OVIPtjgzTy3LTW3ghA4L4XWfa0
 3Ht5R46dHPhtQg2cQg43ndlPjgTlslLQA6EZ2P7vXPC7OlRYmdpRtBX6QlGA1SzZLaG2
 gWenPiKHtYPEMWq25j8gme0XkAFalkrEQt4s2yzfWxbo7Sl/QH4XbjAL+6cR82IkPRsk
 OJJA==
X-Gm-Message-State: AOAM530sjJMSBGQ2/8WwYF/E09+xx09uxIwPKFrfpyGCJa3NQK+A91BM
 tSQJtfVTpG1Ah4fOP4bs0slzCwlnpBStdmzug+s=
X-Google-Smtp-Source: ABdhPJw1i62IODwqJG85RIGShGbX/nNmMKibJ4lq9B3eoCKP4Zhoh2+aEP3HFa6R+ujOCRWL8PdWXsy8PnQESunRSag=
X-Received: by 2002:a05:6e02:e82:: with SMTP id
 t2mr24437728ilj.218.1626879235022; 
 Wed, 21 Jul 2021 07:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-3-git-send-email-dillon.minfei@gmail.com>
In-Reply-To: <1626853288-31223-3-git-send-email-dillon.minfei@gmail.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Wed, 21 Jul 2021 22:53:19 +0800
Message-ID: <CAL9mu0J=Z5je9GJP8karYL=aaeMyQF5pCP7pU-c4QAr7eApUmg@mail.gmail.com>
To: thierry.reding@gmail.com, Sam Ravnborg <sam@ravnborg.org>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Doug Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] ARM: dts: stm32: fix dtbs_check
 warning on ili9341 dts binding
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

Hi Alex,

I suppose you will going to review this patch,
I forgot to add the Fixes tag in v2, just add it.
I will submit v3 to add this tag in case necessary.

Thanks, Best Regards.
Dillon

On Wed, 21 Jul 2021 at 15:41, <dillon.minfei@gmail.com> wrote:
>
> From: Dillon Min <dillon.minfei@gmail.com>
>
> Since the compatible string defined from ilitek,ili9341.yaml is
> "st,sf-tc240t-9370-t", "ilitek,ili9341"
>
> so, append "ilitek,ili9341" to avoid below dtbs_check warning.
>
> arch/arm/boot/dts/stm32f429-disco.dt.yaml: display@1: compatible:
> ['st,sf-tc240t-9370-t'] is too short
>

It's should be a Fixes tag here.

Fixes: a726e2f000ec ("ARM: dts: stm32: enable ltdc binding with
ili9341, gyro l3gd20 on stm32429-disco board")

> Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/arm/boot/dts/stm32f429-disco.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
> index 075ac57d0bf4..6435e099c632 100644
> --- a/arch/arm/boot/dts/stm32f429-disco.dts
> +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> @@ -192,7 +192,7 @@
>
>         display: display@1{
>                 /* Connect panel-ilitek-9341 to ltdc */
> -               compatible = "st,sf-tc240t-9370-t";
> +               compatible = "st,sf-tc240t-9370-t", "ilitek,ili9341";
>                 reg = <1>;
>                 spi-3wire;
>                 spi-max-frequency = <10000000>;
> --
> 2.7.4
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
