Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7C7FC98F
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 16:10:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19C5CC36B0B;
	Thu, 14 Nov 2019 15:10:01 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D23EC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 15:09:59 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id k15so4091001vsp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 07:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xnl8/R+wC38rXwVuF4Uv1hht9TdtUwdSGAq6WJK/Inw=;
 b=Dban84AkznJz4/Lo/AGf01Og1BxBmDR+H65oFtBjz52lqptwVFpC1gWv3V8jYPsBpI
 As6k5VcWLVCOIMCyBkzaCesd6pKtXjMeU6xbf4qcYJE1Qu/4yEHTYA3noX4RsOZSYgzQ
 STXXzW7X7w1gqLjdSnPUTzLpPcD3RkTvrBnCnijnCOcwaH2+t+zC6dkaffiGxkBH4la2
 bHVElB+VRghkDSDaKSct8oDhHUG9KHGEmEU6DPLHRuNhnio0uzkswhzJGchV1rDCZlAn
 J7THWdPWIjq42YLCCN+wFYb8fc/vV6/6nKM6UIBu6E+u8QHgnd4RPJyWyKV4TEYdkOhV
 jIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xnl8/R+wC38rXwVuF4Uv1hht9TdtUwdSGAq6WJK/Inw=;
 b=dYF2f9MYdwhX6D336VXDkEznMO1SceFFl8rFuYGLHyaHafsxwkow7IK3rKF3TLTYuF
 Lubz/6Ul/Il6LKEBjlEeCQcqtudENHOGSXRZ120v/NyO7uKHQsN7Kkynrxm8JQZYHRKx
 4MzlL/u4hFIAXCHCk++7VLgVWtSWGaxpiSXAPYUJj+6Hy9mXS4FRhVrH5QZCBglJ9tGm
 fvON3G5qmwfA8v7zC6QFz9MwX+Eod1mBinO8VucuAzIxUf0S6OQwC3jkkHfTuBNSAwq5
 Nu8xvvB9IbGjYDWiKN+hFL1bEeXpPFI9IqyIMG8zBniNhU5qd2Crof0iKYDtD/O9qdzX
 qhmw==
X-Gm-Message-State: APjAAAXPYtt76SI0KohsLN7SPuutoPJBWzC6mHXxErwI3JNgIdOwZrx7
 gGKA6KyCcFzfh9Nrxfkm1TfvJ31CRzmZukglsoETWA==
X-Google-Smtp-Source: APXvYqxtziN/hu01bi+v1OPZ/nveSSQBkA3nNdrugi9zOjFDw+spxc18pADtGTWNLmf/e/FtNr359aBj6yMsZNnsg90=
X-Received: by 2002:a67:2087:: with SMTP id g129mr5900116vsg.191.1573744198308; 
 Thu, 14 Nov 2019 07:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20191113172514.19052-1-ludovic.Barre@st.com>
In-Reply-To: <20191113172514.19052-1-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Nov 2019 16:09:22 +0100
Message-ID: <CAPDyKFooSJUn6UCE6QkFmJOCovm00ehz_nAPbiNQM3AcJT_bJQ@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/1] mmc: mmci: add threaded irq to abort
 DPSM of non-functional state
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

On Wed, 13 Nov 2019 at 18:25, Ludovic Barre <ludovic.Barre@st.com> wrote:
>
> From: Ludovic Barre <ludovic.barre@st.com>
>
> If datatimeout occurs on R1B request, the Data Path State Machine stays
> in busy and is non-functional. Only a reset aborts the DPSM.

Please clarify/extend this information to tell that this is for the
variant, that keeps DPSM enabled and uses the data timer while sending
a CMD12. Or something along those lines.

>
> Like a reset must be outside of critical section, this patch adds

/s/critical section/atomic context

> threaded irq function to release state machine. In this case,
> the mmc_request_done is called at the end of threaded irq and
> skipped into irq handler.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 44 ++++++++++++++++++++++++++++++++++++-----
>  drivers/mmc/host/mmci.h |  1 +
>  2 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 40e72c30ea84..ec6e249c87ca 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -556,6 +556,9 @@ static void mmci_dma_error(struct mmci_host *host)
>  static void
>  mmci_request_end(struct mmci_host *host, struct mmc_request *mrq)
>  {
> +       if (host->irq_action == IRQ_WAKE_THREAD)
> +               return;
> +
>         writel(0, host->base + MMCICOMMAND);
>
>         BUG_ON(host->data);
> @@ -1321,6 +1324,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>         } else if (host->variant->busy_timeout && busy_resp &&
>                    status & MCI_DATATIMEOUT) {
>                 cmd->error = -ETIMEDOUT;
> +               host->irq_action = IRQ_WAKE_THREAD;
>         } else {
>                 cmd->resp[0] = readl(base + MMCIRESPONSE0);
>                 cmd->resp[1] = readl(base + MMCIRESPONSE1);
> @@ -1532,9 +1536,9 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>  {
>         struct mmci_host *host = dev_id;
>         u32 status;
> -       int ret = 0;
>
>         spin_lock(&host->lock);
> +       host->irq_action = IRQ_HANDLED;
>
>         do {
>                 status = readl(host->base + MMCISTATUS);
> @@ -1574,12 +1578,41 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>                 if (host->variant->busy_detect_flag)
>                         status &= ~host->variant->busy_detect_flag;
>
> -               ret = 1;
>         } while (status);
>
>         spin_unlock(&host->lock);
>
> -       return IRQ_RETVAL(ret);
> +       return host->irq_action;
> +}
> +
> +/*
> + * mmci_irq_threaded is call if the mmci host need to release state machines
> + * before to terminate the request.
> + * If datatimeout occurs on R1B request, the Data Path State Machine stays
> + * in busy and is non-functional. Only a reset can to abort the DPSM.
> + */
> +static irqreturn_t mmci_irq_threaded(int irq, void *dev_id)
> +{
> +       struct mmci_host *host = dev_id;
> +       unsigned long flags;
> +
> +       if (host->rst) {
> +               reset_control_assert(host->rst);
> +               udelay(2);
> +               reset_control_deassert(host->rst);
> +       }
> +
> +       spin_lock_irqsave(&host->lock, flags);
> +       writel(host->clk_reg, host->base + MMCICLOCK);
> +       writel(host->pwr_reg, host->base + MMCIPOWER);
> +       writel(MCI_IRQENABLE | host->variant->start_err,
> +              host->base + MMCIMASK0);
> +
> +       host->irq_action = IRQ_HANDLED;
> +       mmci_request_end(host, host->mrq);
> +       spin_unlock_irqrestore(&host->lock, flags);
> +
> +       return host->irq_action;
>  }
>
>  static void mmci_request(struct mmc_host *mmc, struct mmc_request *mrq)
> @@ -2071,8 +2104,9 @@ static int mmci_probe(struct amba_device *dev,
>                         goto clk_disable;
>         }
>
> -       ret = devm_request_irq(&dev->dev, dev->irq[0], mmci_irq, IRQF_SHARED,
> -                       DRIVER_NAME " (cmd)", host);
> +       ret = devm_request_threaded_irq(&dev->dev, dev->irq[0], mmci_irq,
> +                                       mmci_irq_threaded, IRQF_SHARED,
> +                                       DRIVER_NAME " (cmd)", host);

In general it's a good idea to move drivers into using a threaded IRQ handler.

However, the reason this hasn't been done for mmci before, is because
there are some legacy variants, that doesn't support HW flow control.

Unless I am mistaken, that means when the fifo gets full during data
transfers - it's too late to act. In other words, running the handler
in hard IRQ context, should increase the probability of not missing
the deadline.

If a threaded IRQ handler also is sufficient for these legacy
variants, only tests can tell.

An option, would be to use a threaded handler for those variants that
supports HW flow control. Not sure how messy the code would be with
this option, perhaps you can give this a try?


>         if (ret)
>                 goto clk_disable;
>
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 158e1231aa23..5e63c0596364 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -412,6 +412,7 @@ struct mmci_host {
>
>         struct timer_list       timer;
>         unsigned int            oldstat;
> +       u32                     irq_action;
>
>         /* pio stuff */
>         struct sg_mapping_iter  sg_miter;
> --
> 2.17.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
