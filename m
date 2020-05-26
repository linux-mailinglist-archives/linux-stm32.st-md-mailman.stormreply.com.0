Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F93E1E0743
	for <lists+linux-stm32@lfdr.de>; Mon, 25 May 2020 08:48:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E931FC36B24;
	Mon, 25 May 2020 06:48:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B2B6C36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 16:12:09 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1BF0207F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590163927;
 bh=R59cUYW3Ha3KLw5PXqkDBOkdnIWleGz6gNM8BKfqTcM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AO9qkDijy+/QpvQyUdhvvalRuM2tpx+02TzDKtqMO0gH7z18Eb1snh0XE5vE8KWrj
 hbYVjCB3SX3KcbmHbY1F7G54LL4xE+Zk13jknSAtLE5ippU2g/0smTj181D93mOCsX
 2sHWml+cfTgYa0I7Pu1qClwihXESGfrohrTGYRQ0=
Received: by mail-io1-f54.google.com with SMTP id r2so1571818ioo.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 May 2020 09:12:07 -0700 (PDT)
X-Gm-Message-State: AOAM530oOmwLwq24coc0whyY47YiloM9p+e/6IacHg/Et22+tCS/TimQ
 y+jzOzM3yd3h3xUlzHPn/NWtB4i06RxLC2dQR10=
X-Google-Smtp-Source: ABdhPJzhZAuWLzvk5xzi4pfi5gTZ4zMh21usi2qU/LWlmyJTwrCc0zjV85RtQcDY04Up7BcXqbFxIz7SIY1JqFm1Y/Q=
X-Received: by 2002:a5d:9b8a:: with SMTP id r10mr3759689iom.171.1590163927170; 
 Fri, 22 May 2020 09:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200512141113.18972-1-nicolas.toromanoff@st.com>
 <20200512141113.18972-6-nicolas.toromanoff@st.com>
In-Reply-To: <20200512141113.18972-6-nicolas.toromanoff@st.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 22 May 2020 18:11:56 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGs6UgkKb5+tH2B-+26=tbjHq3UUY2gxfcRfMb1nGVuFA@mail.gmail.com>
Message-ID: <CAMj1kXGs6UgkKb5+tH2B-+26=tbjHq3UUY2gxfcRfMb1nGVuFA@mail.gmail.com>
To: Nicolas Toromanoff <nicolas.toromanoff@st.com>
X-Mailman-Approved-At: Mon, 25 May 2020 06:48:01 +0000
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [Linux-stm32] [PATCH 5/5] crypto: stm32/crc: protect from
	concurrent accesses
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

On Tue, 12 May 2020 at 16:13, Nicolas Toromanoff
<nicolas.toromanoff@st.com> wrote:
>
> Protect STM32 CRC device from concurrent accesses.
>
> As we create a spinlocked section that increase with buffer size,
> we provide a module parameter to release the pressure by splitting
> critical section in chunks.
>
> Size of each chunk is defined in burst_size module parameter.
> By default burst_size=0, i.e. don't split incoming buffer.
>
> Signed-off-by: Nicolas Toromanoff <nicolas.toromanoff@st.com>

Would you mind explaining the usage model here? It looks like you are
sharing a CRC hardware accelerator with a synchronous interface
between different users by using spinlocks? You are aware that this
will tie up the waiting CPUs completely during this time, right? So it
would be much better to use a mutex here. Or perhaps it would make
more sense to fall back to a s/w based CRC routine if the h/w is tied
up working for another task?

Using spinlocks for this is really not acceptable.



> ---
>  drivers/crypto/stm32/stm32-crc32.c | 47 ++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/crypto/stm32/stm32-crc32.c b/drivers/crypto/stm32/stm32-crc32.c
> index 413415c216ef..3ba41148c2a4 100644
> --- a/drivers/crypto/stm32/stm32-crc32.c
> +++ b/drivers/crypto/stm32/stm32-crc32.c
> @@ -35,11 +35,16 @@
>
>  #define CRC_AUTOSUSPEND_DELAY  50
>
> +static unsigned int burst_size;
> +module_param(burst_size, uint, 0644);
> +MODULE_PARM_DESC(burst_size, "Select burst byte size (0 unlimited)");
> +
>  struct stm32_crc {
>         struct list_head list;
>         struct device    *dev;
>         void __iomem     *regs;
>         struct clk       *clk;
> +       spinlock_t       lock;
>  };
>
>  struct stm32_crc_list {
> @@ -109,6 +114,7 @@ static int stm32_crc_init(struct shash_desc *desc)
>         struct stm32_crc_desc_ctx *ctx = shash_desc_ctx(desc);
>         struct stm32_crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
>         struct stm32_crc *crc;
> +       unsigned long flags;
>
>         crc = stm32_crc_get_next_crc();
>         if (!crc)
> @@ -116,6 +122,8 @@ static int stm32_crc_init(struct shash_desc *desc)
>
>         pm_runtime_get_sync(crc->dev);
>
> +       spin_lock_irqsave(&crc->lock, flags);
> +
>         /* Reset, set key, poly and configure in bit reverse mode */
>         writel_relaxed(bitrev32(mctx->key), crc->regs + CRC_INIT);
>         writel_relaxed(bitrev32(mctx->poly), crc->regs + CRC_POL);
> @@ -125,18 +133,21 @@ static int stm32_crc_init(struct shash_desc *desc)
>         /* Store partial result */
>         ctx->partial = readl_relaxed(crc->regs + CRC_DR);
>
> +       spin_unlock_irqrestore(&crc->lock, flags);
> +
>         pm_runtime_mark_last_busy(crc->dev);
>         pm_runtime_put_autosuspend(crc->dev);
>
>         return 0;
>  }
>
> -static int stm32_crc_update(struct shash_desc *desc, const u8 *d8,
> -                           unsigned int length)
> +static int burst_update(struct shash_desc *desc, const u8 *d8,
> +                       size_t length)
>  {
>         struct stm32_crc_desc_ctx *ctx = shash_desc_ctx(desc);
>         struct stm32_crc_ctx *mctx = crypto_shash_ctx(desc->tfm);
>         struct stm32_crc *crc;
> +       unsigned long flags;
>
>         crc = stm32_crc_get_next_crc();
>         if (!crc)
> @@ -144,6 +155,8 @@ static int stm32_crc_update(struct shash_desc *desc, const u8 *d8,
>
>         pm_runtime_get_sync(crc->dev);
>
> +       spin_lock_irqsave(&crc->lock, flags);
> +
>         /*
>          * Restore previously calculated CRC for this context as init value
>          * Restore polynomial configuration
> @@ -182,12 +195,40 @@ static int stm32_crc_update(struct shash_desc *desc, const u8 *d8,
>         /* Store partial result */
>         ctx->partial = readl_relaxed(crc->regs + CRC_DR);
>
> +       spin_unlock_irqrestore(&crc->lock, flags);
> +
>         pm_runtime_mark_last_busy(crc->dev);
>         pm_runtime_put_autosuspend(crc->dev);
>
>         return 0;
>  }
>
> +static int stm32_crc_update(struct shash_desc *desc, const u8 *d8,
> +                           unsigned int length)
> +{
> +       const unsigned int burst_sz = burst_size;
> +       unsigned int rem_sz;
> +       const u8 *cur;
> +       size_t size;
> +       int ret;
> +
> +       if (!burst_sz)
> +               return burst_update(desc, d8, length);
> +
> +       /* Digest first bytes not 32bit aligned at first pass in the loop */
> +       size = min(length,
> +                  burst_sz + (unsigned int)d8 - ALIGN_DOWN((unsigned int)d8,
> +                                                           sizeof(u32)));
> +       for (rem_sz = length, cur = d8; rem_sz;
> +            rem_sz -= size, cur += size, size = min(rem_sz, burst_sz)) {
> +               ret = burst_update(desc, cur, size);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +
>  static int stm32_crc_final(struct shash_desc *desc, u8 *out)
>  {
>         struct stm32_crc_desc_ctx *ctx = shash_desc_ctx(desc);
> @@ -300,6 +341,8 @@ static int stm32_crc_probe(struct platform_device *pdev)
>         pm_runtime_irq_safe(dev);
>         pm_runtime_enable(dev);
>
> +       spin_lock_init(&crc->lock);
> +
>         platform_set_drvdata(pdev, crc);
>
>         spin_lock(&crc_list.lock);
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
