Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570C1248EF
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2019 15:02:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24DB1C36B0C;
	Wed, 18 Dec 2019 14:02:01 +0000 (UTC)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D128CC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 14:01:57 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id g7so639778vkl.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2019 06:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iDDXhiVTyjttx83CIWs0F1XonSq49Z4FwKDL4AKSMZ0=;
 b=BQV2PwjmbtuoWSC6pu036LkQ2z7jmrFW6qlzts/aZDJynU93TGkLUhBp1tK0JsTFaT
 S2b+dwMSp+ypQMOMXdOs9LFVYT7fgaSnIF6v4Fdpd6rCw36hFZjNVJQq/ePUT36d7n1n
 D1ffm2D1fhMhbjnIctBnD8i0BiNqyl8E/ruo7fbsOjIVAw+HRNjyOX3tha/u9SsSNIk6
 IB11YGyhc9yROsqDogYMqWIf3e3tv6zde8cexBNY7mOtar629cjEidMYs9B3ROwqzBLd
 /nM+061/J2VcBtRQ7dKOpHAiXKfXghjHS7RiWirp6/pETZAB1yRLXPv0Fhv0nw2+IMsu
 UnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iDDXhiVTyjttx83CIWs0F1XonSq49Z4FwKDL4AKSMZ0=;
 b=RIuupwzH0cdodDkScrt8XV5yEtHRSWM6Xd2OcQmQQEWpHW0y3qvRzjPHludL23Snj8
 2VZHi5GoBQpSr67S1qUen67RCCVTg9QBCCe4V6QBCC5Vj08XqJiuTRorWhXC1dDnWqVZ
 +du8d43jxg3rMr2N3AkXb7CqOxNY3wiillbLoDKbJksnviDwZOiU4PKU2+gtiu27T3ed
 1j05ZIj34sjwphYXR+kSl3UA/+PWuToM673XDjzJPR2UWI5S6yhftJFxnA8AKcHhFseB
 Kvuy6ud+UVhDn+iEngo0EAqGD9dTaYReSGMYgMfW7masqnEDrU6pggCOLzsg8WfqKYXZ
 ExpA==
X-Gm-Message-State: APjAAAVo6P4j4zJ3m5ku1CV/KYQI2ARmbHleMoFGJ0raV2Fh9Ilkv6t9
 +llvw0UKHVPXzVk6n09rJsMI03qtp3TodwiZl824iw==
X-Google-Smtp-Source: APXvYqwKppPVSkF/tgQZTFhbMXTfr2S4Ix4tS00kAV6zskzWPozXs1ppIIQpeKIDB7d8k+f5RedW4PwJL7fcueb9+8I=
X-Received: by 2002:a1f:4541:: with SMTP id s62mr1807754vka.59.1576677716241; 
 Wed, 18 Dec 2019 06:01:56 -0800 (PST)
MIME-Version: 1.0
References: <20191211133934.16932-1-ludovic.Barre@st.com>
In-Reply-To: <20191211133934.16932-1-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Dec 2019 15:01:20 +0100
Message-ID: <CAPDyKFpoqEXO1JvjF=0hX97PiwP=2c1eWORsacb8QvZM=1Tvjw@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2] mmc: mmci: add threaded irq to abort
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

On Wed, 11 Dec 2019 at 14:40, Ludovic Barre <ludovic.Barre@st.com> wrote:
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

Applied for next, thanks!

I took the liberty of doing some minor updates (changelog/comment),
please have a look and let me know if there is something you want me
to change.

And again, apologize for the delays!

Kind regards
Uffe


> ---
> change V2:
>  -check IRQ_WAKE_THREAD only in mmci_cmd_irq error part,
>   to avoid this test in mmci_request_end.
>
> ---
>  drivers/mmc/host/mmci.c | 46 +++++++++++++++++++++++++++++++++++------
>  drivers/mmc/host/mmci.h |  1 +
>  2 files changed, 41 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 40e72c30ea84..2b91757e3e84 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1321,6 +1321,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>         } else if (host->variant->busy_timeout && busy_resp &&
>                    status & MCI_DATATIMEOUT) {
>                 cmd->error = -ETIMEDOUT;
> +               host->irq_action = IRQ_WAKE_THREAD;
>         } else {
>                 cmd->resp[0] = readl(base + MMCIRESPONSE0);
>                 cmd->resp[1] = readl(base + MMCIRESPONSE1);
> @@ -1339,7 +1340,10 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>                                 return;
>                         }
>                 }
> -               mmci_request_end(host, host->mrq);
> +
> +               if (host->irq_action != IRQ_WAKE_THREAD)
> +                       mmci_request_end(host, host->mrq);
> +
>         } else if (sbc) {
>                 mmci_start_command(host, host->mrq->cmd, 0);
>         } else if (!host->variant->datactrl_first &&
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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
