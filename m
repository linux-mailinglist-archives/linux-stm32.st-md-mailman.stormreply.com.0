Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9FE6E4BD9
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 16:49:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B11AC6A5FA;
	Mon, 17 Apr 2023 14:49:28 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AAD3DC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 14:49:26 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id t16so13231149ybi.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 07:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681742965; x=1684334965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WxXndlId4ohZGjntL7iThgXNUysxJnkyV1SPpbL6TWE=;
 b=LCs6AsAgq0GyOiYOlwAzNLdQYWSuGgLA342sdAlgcwBR69wAOF8eThbjdAk3r2VJbo
 cK4KdE7XfbbPA+jRn9YzNDfa8BKhEdi36WSLfxudFKYjR4IJgSBUOlQxQ+hudZOrl3CN
 LNZfuGANyOoy/9TNSltW0fjnqgpHR7Giyo2qS8gMfPfwCMFIEdqbU0MSt6XwtW5wo8sG
 W2+XN9yW+MldaypfbEwLmCxHy0qdLoHCVzlfROpVHlgAOamP62JbBoX3fA+SHwSXONgo
 eX4NUfh4S0LxvXV4BGgzB7ygrEvsEkasmtdWpYyXf8ueOes82pdq65RyNIXL7/hhIMFP
 c15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681742965; x=1684334965;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WxXndlId4ohZGjntL7iThgXNUysxJnkyV1SPpbL6TWE=;
 b=DW2uvsMrVZ19VuLYmYgUtVy1jtaVUlEqULMBFBA2rYy7E5b2QWh43KaNBvk++3fXjG
 kdy/wigOcQdu239NfOTQPNBn2b8WodkaDzSlK2eMuQg0cTvsV3V10Lv2sTL/rFS3UI+3
 Jj4zwdf+KuEN5OJXP9sL/LniKD84+/ZcB1p/1u1dE8YKvJFFSoQEVEQuxWr3apX4l8FK
 ypFUHsUjGarEow87PWnei4CjF1sdzv8YLbu7OlD12YMrWiZods2zRI01j6AMgEblpthA
 bFBcCl+BJwfCBejwDWpLB4XS9m6GNJgi7/dtqwlPWXkXRVrofCIHCXQ8sNesBnNtNX6r
 klGw==
X-Gm-Message-State: AAQBX9f32Clf5EN01ChXLJRrWR9gLmNhOUWi5B7MnOBHGvjSx/NODG0Z
 DyU0uag9ww17OYNvnkOW0PI5nyxpuoPUWNXMwU+Z7Q==
X-Google-Smtp-Source: AKy350aFddSft+67I+ym9T9ozH6nJhyR4qQOTiYtkLZNDUD1zROxZMSEdxVBKmLzQLcxvjWiIkuoynoRtN4wV+2UTXk=
X-Received: by 2002:a25:ca52:0:b0:b76:ceb2:661b with SMTP id
 a79-20020a25ca52000000b00b76ceb2661bmr9800406ybg.3.1681742965484; Mon, 17 Apr
 2023 07:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
 <20230405-pl180-busydetect-fix-v2-10-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-10-eeb10323b546@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Apr 2023 16:48:49 +0200
Message-ID: <CAPDyKFptLGySEz3ygoacQ00rk69DKP=1wrt1Hq-weSMASwkF7w@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 10/12] mmc: mmci: mmci_card_busy() from
	state machine
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
> If we have a .busy_complete() callback, then check if
> the state machine triggered from the busy detect interrupts
> is busy: then we are certainly busy.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Do this in a safer way that falls back to reading busy
>   status from the hardware if the state machine is NOT
>   busy.
> ---
>  drivers/mmc/host/mmci.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 9a7f441ec9d6..180a7b719347 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -339,6 +339,12 @@ static int mmci_card_busy(struct mmc_host *mmc)
>         unsigned long flags;
>         int busy = 0;
>
> +       /* If we are waiting for IRQs we are certainly busy */
> +       if (host->ops->busy_complete &&
> +           host->busy_state != MMCI_BUSY_IDLE &&
> +           host->busy_state != MMCI_BUSY_DONE)
> +               return 1;

This looks fishy to me.

If this is needed, that means that the mmc core is calling the
->card_busy() ops in the middle of a request that has not been
completed yet. This shouldn't happen - unless I am misunderstanding
some part of the internal new state machine.

> +
>         spin_lock_irqsave(&host->lock, flags);
>         if (readl(host->base + MMCISTATUS) & host->variant->busy_detect_flag)
>                 busy = 1;
>
> --
> 2.39.2
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
