Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 311856E495B
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 15:07:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A25B4C65E70;
	Mon, 17 Apr 2023 13:07:29 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A88E1C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 13:07:28 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-552ae3e2cbeso44459287b3.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681736847; x=1684328847;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kw+N4lmXgksiZObWsRam9O+AwFJ+q7vEUaa4tbsG2Ys=;
 b=PU2TeZwDN3uPSlXH+LcLVdrVZj1S5sbTqA4wpoggKCCF5+QoYb2X+9fqM0sVGfvpx+
 jpkIAMV4MiOT8PrgzQz8Bvulp33QCvzkxy4n67TyrItX7B7iRdVYuZ29gh7H0HFRg1kM
 6QDd5Ma3EVEvAQ9OUQsBNU12F4WdDBmnFxG71/1iffTW0n5IMqNKmACPZfK7R5PkaqWf
 kmV8Tew4uWVMWsN0NaChfgScLQPRHlNjMaRhhl/8iQy6pz0HxZ5PlU5VqmSiD8mz/pac
 2ar2+7JzqRilKNF3WTKlctGELMj6NxNDKUq87ru1Ew3Hc0Ys9Q7SeCLTbRctDb9X8Ero
 GQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681736847; x=1684328847;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kw+N4lmXgksiZObWsRam9O+AwFJ+q7vEUaa4tbsG2Ys=;
 b=LlEnS5dMbqR1/qHodE225k9RdJqKVgUdH+gnDXYgDfkfCdilqMIVXUrUPs5V2wwljI
 F/w58G9FkDJf6cERV6J8UB/haB5lp0nxGkHtTv92qXba1VO44LZnVm+ip26hPA0VxolY
 2IQgHwJQaBBipOiVIDDfYB8IRZ0InSDX5AXz2zqrcXdAn2SzBbqfGtMvcI1f65emtMQ+
 amH8ShIfmMAN+2x8Fky4CUhOo56kNQ4/AltZ26/Bs/RS10W9JI/zR4lC6ngMFlE75LHs
 iGKvRieVRqtg6o7rO8HKaWaJMY+tJOu/O6q7qVtYHMz+nyFmVObTxlNUeMyN7BRqEIRf
 G20g==
X-Gm-Message-State: AAQBX9egOl/N6ZU+pVb/r/5Zh5l0rplGcroykEi0t6sqB1d2xHWZdlM9
 nkzgaTMrs8CbGIKMCSzfLjgcRJFQsR1wFw30tV6TOw==
X-Google-Smtp-Source: AKy350ah5IOHfHIOmiogXHScEat1z0RQz/vrpZtML3zrmIwRssYWDJHmutNvFlZ+5p/8tM9Ot8saB7BioWtG0sFhul0=
X-Received: by 2002:a81:af0c:0:b0:54c:2889:7105 with SMTP id
 n12-20020a81af0c000000b0054c28897105mr9515199ywh.0.1681736847531; Mon, 17 Apr
 2023 06:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
 <20230405-pl180-busydetect-fix-v2-1-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-1-eeb10323b546@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Apr 2023 15:06:51 +0200
Message-ID: <CAPDyKFqESKrqA7u0zg+GBLad_tqzrt+wGfT-jEqvVGruv8oR0Q@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 01/12] mmc: mmci: Clear busy_status
	when starting command
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

On Sun, 9 Apr 2023 at 00:00, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> If we are starting a command which can generate a busy
> response, then clear the variable host->busy_status
> if the variant is using a ->busy_complete callback.
>
> We are lucky that the member is zero by default and
> hopefully always gets cleared in the ->busy_complete
> callback even on errors, but it's just fragile so
> make sure it is always initialized to zero.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Unconditionally clear host->busy_status if we get a
>   busy response.
> ---
>  drivers/mmc/host/mmci.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index b9e5dfe74e5c..9b48df842425 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1238,17 +1238,21 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>                         c |= host->variant->cmdreg_srsp;
>         }
>
> -       if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
> -               if (!cmd->busy_timeout)
> -                       cmd->busy_timeout = 10 * MSEC_PER_SEC;
> +       if (cmd->flags & MMC_RSP_BUSY) {
> +               host->busy_status = 0;

To be even more safe, I don't think we should check "cmd->flags &
MMC_RSP_BUSY". Let's just reset it always instead.

>
> -               if (cmd->busy_timeout > host->mmc->max_busy_timeout)
> -                       clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
> -               else
> -                       clks = (unsigned long long)cmd->busy_timeout * host->cclk;
> +               if (host->variant->busy_timeout) {
> +                       if (!cmd->busy_timeout)
> +                               cmd->busy_timeout = 10 * MSEC_PER_SEC;
>
> -               do_div(clks, MSEC_PER_SEC);
> -               writel_relaxed(clks, host->base + MMCIDATATIMER);
> +                       if (cmd->busy_timeout > host->mmc->max_busy_timeout)
> +                               clks = (unsigned long long)host->mmc->max_busy_timeout * host->cclk;
> +                       else
> +                               clks = (unsigned long long)cmd->busy_timeout * host->cclk;
> +
> +                       do_div(clks, MSEC_PER_SEC);
> +                       writel_relaxed(clks, host->base + MMCIDATATIMER);
> +               }
>         }
>
>         if (host->ops->pre_sig_volt_switch && cmd->opcode == SD_SWITCH_VOLTAGE)
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
