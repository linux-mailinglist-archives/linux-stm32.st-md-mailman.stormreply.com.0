Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F792118809
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Dec 2019 13:31:20 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2C23C36B0B;
	Tue, 10 Dec 2019 12:31:19 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A173C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 12:31:18 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id 59so7107852uap.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Dec 2019 04:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cu4xcLC6fx43ALyB2PH7P6iHLVvlsMlK6QGD81ONfJA=;
 b=QayVJLfzwhxAFLgXNRzLMZdJ0IvLzxp4+fLYkgsafsn6S05wJNPxe1W2fAZYyUBGR8
 BcCeWqYv6slEWraMiYfCcPv4pF0tfY9IyHA+7AWdiyjqH31IZzLc5y/xNthjj+0mqejq
 /gjucQhq10JYIm5v0/LMFDew4Ilc+OXTn08xJPNEu664cWU63FxtQ7yCvrJrZZa8xDGP
 W9EiAP+c5SMOv4CIfQw/j0wZDvKbWs+qtoigdrFb6GjKOwnzrUG6gxYkrj4TJEB4DeJS
 YgnZ+BySLGuychJ02elTMZf7LBTg/2mNw+VpOcdbROX8BTpOTFbTDzDl1jY4Q1isKofp
 L0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cu4xcLC6fx43ALyB2PH7P6iHLVvlsMlK6QGD81ONfJA=;
 b=drvjnbxwjQv7IROi13dghxFYWay4w7XQyVxJL6s5h1dLC5mj0unELh0wqPKiHehLWb
 HHORQ4h8MKY0jvyv7IDdOt3ywcrYiq0vfKPbGJ4DObe8LtS47PHV+SvSG0bre3/Pokv4
 fjBG8Ijis2AJ5HrOjXtJ4GL7FWxwy+oawmQaqZaokCf0tOGmwfiwJrKeJmq04xbQ7Wse
 CYq9ts+ZKmerGlwLZsAPb4zOg8Z+jwgmaaovVn20dP0TVKV9DMhAWWKTi6ixanyiD8mU
 1ly25QVYW3kHkfn5op9Wwra0tDrkSYPo3KUS5u34RLFaCeDyB3yBYPuh7kjukPHsUoqv
 kmpw==
X-Gm-Message-State: APjAAAXbJzUdJwDaJPnv7XjFnWx8lEunKgjRCkydStpius0nu9s8ceSx
 Sc7YR6GkvvMIBS3enC5Fm7CsvfdRuHNnXVcDYZom5A==
X-Google-Smtp-Source: APXvYqyrTM1DC8Fmp+/CAB2noSeEwqc06KeL4uYpQ1xlDaNR2EbcD+cNIjYR1xbMle/tNoYu8/S+qEj9nJ91/lu54KE=
X-Received: by 2002:ab0:2759:: with SMTP id c25mr3460125uap.104.1575981077116; 
 Tue, 10 Dec 2019 04:31:17 -0800 (PST)
MIME-Version: 1.0
References: <20191113172514.19052-1-ludovic.Barre@st.com>
In-Reply-To: <20191113172514.19052-1-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2019 13:30:41 +0100
Message-ID: <CAPDyKFrZxOCkw9U05UZPRSGz2CqmhOq944z8MEVox8Y_UEYC4A@mail.gmail.com>
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
>
> Like a reset must be outside of critical section, this patch adds
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

It seems a bit unnecessary to check this every time mmci_request_end()
is called.

How about avoiding to call mmci_request_end() for the one specific
condition instead? See more below.

>         writel(0, host->base + MMCICOMMAND);
>
>         BUG_ON(host->data);
> @@ -1321,6 +1324,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>         } else if (host->variant->busy_timeout && busy_resp &&
>                    status & MCI_DATATIMEOUT) {
>                 cmd->error = -ETIMEDOUT;
> +               host->irq_action = IRQ_WAKE_THREAD;

You could check this flag a few lines below and if it's set to
IRQ_WAKE_THREAD, avoid to call mmci_request_end().

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

Otherwise this looks good, besides my other earlier comments, of course.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
