Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A086D92BE
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 11:31:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6B2DC6A61D;
	Thu,  6 Apr 2023 09:31:29 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7B69C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 09:31:28 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id f188so27017338ybb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 02:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680773487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nrbKJN6tNn5SoaDKodx2sPMgtPGrY3/0d4LglRnRjWw=;
 b=C3ZUWp5jv2p5k+fiz5+fnVwJBalRBkyRYyQSvDrPKCU/5iyYhOVyo/nvX9tTpcqlyE
 J9Mv7oygbSYXwW0fcQbO170abhdYtmzHNW/aB/1RlUSVxUQV6A/8FygoLBVJxCeKAwN4
 Q180JaJhTQaG+GLX2+dMq4VYtaEgx4eyPcY1HfWqYy272CSwvMsvfPV0L4gAAYTI1r7z
 bFyYTNS/ab4WKxxE1e87yxajVCh0GDXtgW+olE0nqWkPvS9E16mt7top8QvvEaMKK448
 sPjXjkeebQ9UG2qJqaAfsEQhNcTrNETtjhrtyZyv+CyTPZaiJ1IT3SZO7LxW+HufpjDs
 QYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680773487;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nrbKJN6tNn5SoaDKodx2sPMgtPGrY3/0d4LglRnRjWw=;
 b=ICVLOeNd6UfOsRZz8TWbNnvs3lLsVH5jAkAxphEFCqIjdOAi+SrrYdSJMw3oxoWK/Y
 Xt1DXYztqq95khHULkIUj+KOUCdM84Cl6YOhbt6HWDYHzkHHXQ+PT7uh8nCej8fd+cTz
 J+px1QGvIGDwmulHPLVQmfPYvQ5inN+LVi4kjvNFYeZDWjBPhX/UoX+aR/9F8CCj9t7+
 CbuK32vAiBb/FLGFiUT4x3tHRh5wVWAVg8inEciYv7+53DwWKiMj1e1vyWIWrRolPBmM
 rci3vAsct5Tj/ppXMQa19ujLKoqDVMhJ94MLSYLuO3qrdD+fILh/fo/OgxvOL0vOdtdE
 sEfw==
X-Gm-Message-State: AAQBX9dlTJyuBC5K6I9/r9DT/AsiEOOKYYW/OuSCZbJNYTwrbIMP/5ff
 54SAwZqrCBKtIEMy5qLy8PRMaLKAKhapHYHW+J7ieg==
X-Google-Smtp-Source: AKy350bGsQPdLchFWKf2g9la+14ELRiC01S4GZX480KVbABfXHVsgyLauNQM0/TQCGMeGEvUf98TjPYIaK3P6Qtic9c=
X-Received: by 2002:a25:d0c2:0:b0:b6e:361a:c86 with SMTP id
 h185-20020a25d0c2000000b00b6e361a0c86mr1385830ybg.3.1680773487671; Thu, 06
 Apr 2023 02:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
 <20230405-pl180-busydetect-fix-v1-1-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-1-28ac19a74e5e@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 6 Apr 2023 11:30:51 +0200
Message-ID: <CAPDyKFp1KDV+q9ApKfq7C4PoiJnMOsACKJvbEiZLhv06GJGB_w@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Hansson <newbyte@disroot.org>, linux-mmc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 01/13] mmc: mmci: Only call busy_complete
	if callback defined
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

On Wed, 5 Apr 2023 at 08:50, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> The code unconditionally calls host->ops->busy_complete()
> if we get a busy response and the variant supports busy
> detection (variant->busy_detect = true).
>
> However there are several STM32 variants that define
> variant->busy_detect to true but do not define any
> busy_complete() callback. This looks like a recepie for
> a NULL pointer exception.

This isn't correct, as things would have exploded by now. :-)

>
> Check that the callback is valid before calling it.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mmc/host/mmci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index b9e5dfe74e5c..bc150c0d5eed 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1381,7 +1381,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>                 return;
>
>         /* Handle busy detection on DAT0 if the variant supports it. */
> -       if (busy_resp && host->variant->busy_detect)
> +       if (busy_resp && host->variant->busy_detect && host->ops->busy_complete)
>                 if (!host->ops->busy_complete(host, status, err_msk))
>                         return;

All variants that have the .busy_detect flags set, need to assign the
->busy_complete() callback too.

To me it seems a bit silly, to check for a mandatory callback,
although if you prefer it, then I suggest we do it during ->probe()
instead.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
