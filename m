Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 207686D93D1
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 12:18:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF9B4C6A61D;
	Thu,  6 Apr 2023 10:18:54 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 657A8C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 10:18:53 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id h198so1831281ybg.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680776332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pU74o8K5k/VR2MmyjAiwWF+BGAxTRRi712Y0xDR8RJg=;
 b=BuH5HiP2BOCjdEolw+aqgOB45v4qu9ln4+jP8/XNh9YR05aF6CkAGOwTdtGixL38Jt
 rURlmm5UUpGQgD2w/dnQAkVbiHy1BLaZB1r+TFYgXYZi7ICPsAlncw8/NdacvtQywarC
 H9YEGXsy2vbF63zs6jUxrvQW7U6ncCof8egc7YbjBStcQL1ncSckJSd9pqaHFHwGxCLr
 KrcrZfN4LRrgZ7BjCQf1HKbsaTqEIXoQuhPwEVmkm7DIO+tbVrQDECoX10a65KU8tQdu
 aidNy/JZb0hL1zV+YSoB+zvYxbCNgIj2Xp4S3z9Sjvm5aUU/HM9HvTSB7cidFevEDqWz
 jgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776332;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pU74o8K5k/VR2MmyjAiwWF+BGAxTRRi712Y0xDR8RJg=;
 b=B8oycVtK3j3geOBseT5H1JxFP58cyMG2aQo2P+JguhGqrze1ak1kH4XQmLw4JNZkLm
 rTdecs+UxFJDnY04GXuWm40yD7teCQgm+XZZ7HBAYVgf7wFvfiC5fb9bx4XbRdprLiBW
 rpujMkwGownIzSFhAJgyAqIm8N1/tJJ3zD5JzCJRrStqh+L2ypgShAZN/urT1jVSnPIN
 bGiC4YPaWV4zDCEuwR+vuH1JDXpRK/o9wmRoyYs7IYWKWXVPlxYIvyspcDu+p15jiuG/
 9Axeanjb71VuR78PrKLxU273ufs9DNxxbrKwB40bQTAy+TbER5MpKng7H02oE0UZJhjQ
 CAYg==
X-Gm-Message-State: AAQBX9eVT4D3DjaGCHjIfcBhIRXoaIPu7JBuBTqtXUS0ZI+EeLpmrXmB
 JsAHVuy4n0Ip0sWt2cy17fYFnrh460DSEspBpEl7gw==
X-Google-Smtp-Source: AKy350ZIUFJOrd7FcJmrHGvKBp5m29rWMOMSg9mdQoeGGTfG0GUrsNXZZ4k40R/H846LzJ21vVY0KtUYyz7S2eci/uY=
X-Received: by 2002:a25:7748:0:b0:b8b:f373:4c91 with SMTP id
 s69-20020a257748000000b00b8bf3734c91mr1425673ybc.3.1680776332161; Thu, 06 Apr
 2023 03:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v1-0-28ac19a74e5e@linaro.org>
 <20230405-pl180-busydetect-fix-v1-3-28ac19a74e5e@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v1-3-28ac19a74e5e@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 6 Apr 2023 12:18:16 +0200
Message-ID: <CAPDyKFq80tJ4z6yWW-1edpkxYd7TH81zgh=PTRXkD-46hEHgXg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stefan Hansson <newbyte@disroot.org>, linux-mmc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 03/13] mmc: mmci: Unwind big if() clause
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
> This does two things: firsr replace the hard-to-read long
> if-expression:
>
>   if (!host->busy_status && !(status & err_msk) &&
>       (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
>
> With the more readable:
>
>   if (!host->busy_status && !(status & err_msk)) {
>      status = readl(base + MMCISTATUS);
>      if (status & host->variant->busy_detect_flag) {

If I am reading the code below, this isn't what is being done. See more below.

>
> Second notice that the re-read MMCISTATUS register is now
> stored into the status variable, using logic OR because what
> if something else changed too?
>
> While we are at it, explain what the function is doing.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mmc/host/mmci.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 3e08b2e95550..3c1e11266fa9 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -654,6 +654,13 @@ static u32 ux500v2_get_dctrl_cfg(struct mmci_host *host)
>         return MCI_DPSM_ENABLE | (host->data->blksz << 16);
>  }
>
> +/*
> + * ux500_busy_complete() - this will wait until the busy status
> + * goes off, saving any status that occur in the meantime into
> + * host->busy_status until we know the card is not busy any more.
> + * The function returns true when the busy detection is ended
> + * and we should continue processing the command.
> + */
>  static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>  {
>         void __iomem *base = host->base;
> @@ -671,14 +678,17 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>          * while, to allow it to be set, but tests indicates that it
>          * isn't needed.
>          */
> -       if (!host->busy_status && !(status & err_msk) &&
> -           (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
> -               writel(readl(base + MMCIMASK0) |
> -                      host->variant->busy_detect_mask,
> -                      base + MMCIMASK0);
> -
> +       if (!host->busy_status && !(status & err_msk)) {
>                 host->busy_status = status & (MCI_CMDSENT | MCI_CMDRESPEND);

I wonder if this change is intentional. According to the commit
message, I assume not.

So, this may lead to that we end up giving host->busy_status a value,
even if the busy_detect_flag bit isn't set in the status register. In
other words, we could end up waiting for busy completion, while we
shouldn't.

> -               return false;
> +               status = readl(base + MMCISTATUS);
> +               if (status & host->variant->busy_detect_flag) {
> +                       writel(readl(base + MMCIMASK0) |
> +                              host->variant->busy_detect_mask,
> +                              base + MMCIMASK0);
> +
> +                       host->busy_status |= status & (MCI_CMDSENT | MCI_CMDRESPEND);
> +                       return false;
> +               }
>         }
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
