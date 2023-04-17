Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D666E49D2
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 15:24:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE136C6A5FA;
	Mon, 17 Apr 2023 13:24:05 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEC74C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 13:24:03 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-54fe82d8bf5so103092647b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 06:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681737843; x=1684329843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wJNyJPIUSDACJNhaYaxkNKlMJ6+KOJnTklHWTfRcUSc=;
 b=JazabgTFJ+Kl/tyHV0m4uvxo0dgvefjHFgd4Qm3zlxF67Ul+05N+zsE3lVeOiwWSQM
 /vFeRZ9w9+3liGCV/t5MSS8Pgq//i6FkxagdTxYzhnS6AxWxE7tey7HZ/AfEyp4siZkb
 kovypUxnbHJFC1HGeF8kZbQD57K/YWaxg8VIdEHaGoaqtX7StctEYDqAH86A9+OuN+kv
 0ULe0cWHoCvpg+TLVHkhMh3Yn9g85u6Y7p6w+qUw5TxQfeVZaKF3SewPkk7Kdgt0oeYq
 odHfHPgS/NVQDAWoPzTNl8E88F3r2ybQpLkWsnoBXEkC+Jk++p2kWP41zHXYQREXnCb7
 /LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681737843; x=1684329843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wJNyJPIUSDACJNhaYaxkNKlMJ6+KOJnTklHWTfRcUSc=;
 b=jAlgCsj4nSJNgfkD7h1ErN844pzd9Q9bi5ZquqwYgTXn2mlazZebzWpwDAuAdpYSSp
 piA0Yw716TwcrKUjEzy4LjY9GMU6IW01njUohzZNyH7dEYnlSDjJO/bg2hAZQ1zXIqXH
 gHa+rHGi732FYEFGl1kQqybscCmmbozBwqwL8454H30QDJEWTjm7iIbfWqPDKesHeJHC
 ygy5GdE+2YSSIjdsmg7g8GepGTSgMMrfD22ho8DVaDQ95w1km9mnbkJphpX1ytH2Bza9
 jJM8FZKmITw9Wkx/eoWDGgwT3Xq7NEmgzqXJWr8p1oQrAw4K/A88yxPyWuIoejA/EB7K
 ld7w==
X-Gm-Message-State: AAQBX9dtH9Ua/mQq4bkZK7yWJHpfjh1sJV47FPE3fQyzSfyQH1fyhrR5
 fgingR6tZuyuTs5JSDlDHJRPF/9ZixKKbMhUc2fHFA==
X-Google-Smtp-Source: AKy350akHhPmT1SpV4BNvSOxnEib1lHDILTXdM8MTdKIigFYFej6SdgGNMuPOotcFSth7yw6bGwLlc1XsXt87XMgGdE=
X-Received: by 2002:a81:ad45:0:b0:546:63a:6e23 with SMTP id
 l5-20020a81ad45000000b00546063a6e23mr9408216ywk.0.1681737842732; Mon, 17 Apr
 2023 06:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-pl180-busydetect-fix-v2-0-eeb10323b546@linaro.org>
 <20230405-pl180-busydetect-fix-v2-4-eeb10323b546@linaro.org>
In-Reply-To: <20230405-pl180-busydetect-fix-v2-4-eeb10323b546@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Apr 2023 15:23:26 +0200
Message-ID: <CAPDyKFpoboq68_ysEJXCWLV8k77+ULGpF6AzcnjvUqO96r5FHw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mmc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Stefan Hansson <newbyte@disroot.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 04/12] mmc: mmci: Break out error check
	in busy detect
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
> The busy detect callback for Ux500 checks for an error
> in the status in the first if() clause. The only practical
> reason is that if an error occurs, the if()-clause is not
> executed, and the code falls through to the last
> if()-clause if (host->busy_status) which will clear and
> disable the irq. Make this explicit instead: it is easier
> to read.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - No changes
> ---
>  drivers/mmc/host/mmci.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index e742dedaca1a..7d42625f2356 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -665,6 +665,15 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>  {
>         void __iomem *base = host->base;
>
> +       if (status & err_msk) {
> +               /* Stop any ongoing busy detection if an error occurs */
> +               writel(host->variant->busy_detect_mask, base + MMCICLEAR);
> +               writel(readl(base + MMCIMASK0) &
> +                      ~host->variant->busy_detect_mask, base + MMCIMASK0);
> +               host->busy_status = 0;
> +               return true;

I agree that this makes the code more explicit, but unfortunately it
also means duplicating the code from the bottom of this function.

Can you instead add a helper function and call it from here and from
the part at the bottom?

> +       }
> +
>         /*
>          * Before unmasking for the busy end IRQ, confirm that the
>          * command was sent successfully. To keep track of having a
> @@ -678,7 +687,7 @@ static bool ux500_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>          * while, to allow it to be set, but tests indicates that it
>          * isn't needed.
>          */
> -       if (!host->busy_status && !(status & err_msk)) {
> +       if (!host->busy_status) {
>                 status = readl(base + MMCISTATUS);
>                 if (status & host->variant->busy_detect_flag) {
>                         writel(readl(base + MMCIMASK0) |
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
