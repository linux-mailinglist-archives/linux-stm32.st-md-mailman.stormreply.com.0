Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854FCCB45B
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 08:13:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B492C36B0B;
	Fri,  4 Oct 2019 06:13:31 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A538AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 06:13:29 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id v10so3385228vsc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2019 23:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PlYxemLyGEw2z7tzBw1cpulBtK9wmECqFWdHMP2WOUo=;
 b=jpFnppB/F4Z075p99ZTBhY5zAVoG46Q7/SnMiOdezjKLrflNe6s8JRs6xRJvgERdrw
 aEPfEcfKl4SQwW7u6Sd4l/dI06qV4pDy0Eex8B0tXg5Wj+vZZRMG5TSX2TPXodlbxwvg
 FHYKaA+FLGIT3mYgPi8RK+U5O4Nfh0stmkbM2GE2BBYqkwNEtdbFy6JziNs14DBCeO+O
 CNaIPw72WB8BNEp/Ri6OcQxZ2zqEQv8r9mTDJXvg7wDrFOkY9JPrCe0AekBpyIOiap3+
 NZM03X0fyhLA3OrMANTCBZWOxOgEOadAl9Yy0ffZ+rThltRJtUIisJpKxoreADXRfq18
 qffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PlYxemLyGEw2z7tzBw1cpulBtK9wmECqFWdHMP2WOUo=;
 b=aq9VrIzFgT1lozA6wWjrz4KYFf4W2O0lp4+pzsWv7RhhdxIu/YZmuwx3f9lLN22Wkx
 /ByAewBhn1zTU4DGDxi5wcUMT9Fa5zi4FBBPxDAimk+PCi/T+h3M6oeSwsb4AHyCN9bD
 GWVjDpI089Gyh7l48XbDHWfFcx+X5LjqQqIrJ2EOITZoh4bZUeLaeuZeoMXY8rM1ngyv
 vMuf6sqGnt57bcMgoImEAuMOusFfcMkw/BUxdbJggL6A7jZ7blEOYh7PxflFad2YNBm+
 4j5AySvsyDDVyWWz1PEIxt620GxbF1kEwnBN+dPPJRtiYzVUaXyqSFx1ogUwwyRyWgEJ
 L+XQ==
X-Gm-Message-State: APjAAAVBC1ixttmPfGAcLTZQHuZjVP4N4Pcl0xxZtavpPIzicjYlEm9c
 DjgD0qXXAGmOhst1Yk0OMBN5xRZ/QlOAGQsUzeobtw==
X-Google-Smtp-Source: APXvYqwe4FiRLNALsADBsQ1M2wb6h4k6tCXwHwPsKcPofn8xLo+JhI+CH7xO3En2d3+P52nm5VQNA4f1xN+2Jgppu2Q=
X-Received: by 2002:a67:e414:: with SMTP id d20mr7072671vsf.191.1570169608232; 
 Thu, 03 Oct 2019 23:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190905122112.29672-1-ludovic.Barre@st.com>
 <20190905122112.29672-2-ludovic.Barre@st.com>
In-Reply-To: <20190905122112.29672-2-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Oct 2019 08:12:51 +0200
Message-ID: <CAPDyKFpcb=dT0XBAGVL68t--xi5853Dzsgak-vbx5VcvxLZ4zA@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V6 1/3] mmc: mmci: add hardware busy
	timeout feature
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

On Thu, 5 Sep 2019 at 14:21, Ludovic Barre <ludovic.Barre@st.com> wrote:
>
> From: Ludovic Barre <ludovic.barre@st.com>
>
> In some variants, the data timer starts and decrements
> when the DPSM enters in Wait_R or Busy state
> (while data transfer or MMC_RSP_BUSY), and generates a
> data timeout error if the counter reach 0.


>
> -Define max_busy_timeout (in ms) according to clock.
> -Set data timer register if the command has rsp_busy flag.
>  If busy_timeout is not defined by framework, the busy
>  length after Data Burst is defined as 1 second
>  (refer: 4.6.2.2 Write of sd specification part1 v6-0).

How about re-phrasing this as below:

-----
In the stm32_sdmmc variant, the datatimer is active not only during
data transfers with the DPSM, but also while waiting for the busyend
IRQs from commands having the MMC_RSP_BUSY flag set. This leads to an
incorrect IRQ being raised to signal MCI_DATATIMEOUT error, which
simply breaks the behaviour.

Address this by updating the datatimer value before sending a command
having the MMC_RSP_BUSY flag set. To inform the mmc core about the
maximum supported busy timeout, which also depends on the current
clock rate, set ->max_busy_timeout (in ms).
-----

Regarding the busy_timeout, the core should really assign it a value
for all commands having the RSP_BUSY flag set. However, I realize the
core needs to be improved to cover all these cases - and I am looking
at that, but not there yet.

I would also suggest to use a greater value than 1s, as that seems a
bit low for the "undefined" case. Perhaps use the max_busy_timeout,
which would be nice a simple or 10s, which I think is used by some
other drivers.

> -Add MCI_DATATIMEOUT error management in mmci_cmd_irq.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 42 ++++++++++++++++++++++++++++++++++++-----
>  drivers/mmc/host/mmci.h |  3 +++
>  2 files changed, 40 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index c37e70dbe250..c30319255dc2 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1075,6 +1075,7 @@ static void
>  mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>  {
>         void __iomem *base = host->base;
> +       unsigned long long clks;
>
>         dev_dbg(mmc_dev(host->mmc), "op %02x arg %08x flags %08x\n",
>             cmd->opcode, cmd->arg, cmd->flags);
> @@ -1097,6 +1098,16 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>                 else
>                         c |= host->variant->cmdreg_srsp;
>         }
> +
> +       if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
> +               if (!cmd->busy_timeout)
> +                       cmd->busy_timeout = 1000;
> +
> +               clks = (unsigned long long)cmd->busy_timeout * host->cclk;
> +               do_div(clks, MSEC_PER_SEC);
> +               writel_relaxed(clks, host->base + MMCIDATATIMER);
> +       }
> +
>         if (/*interrupt*/0)
>                 c |= MCI_CPSM_INTERRUPT;
>
> @@ -1201,6 +1212,7 @@ static void
>  mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>              unsigned int status)
>  {
> +       u32 err_msk = MCI_CMDCRCFAIL | MCI_CMDTIMEOUT;
>         void __iomem *base = host->base;
>         bool sbc, busy_resp;
>
> @@ -1215,8 +1227,11 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>          * handling. Note that we tag on any latent IRQs postponed
>          * due to waiting for busy status.
>          */
> -       if (!((status|host->busy_status) &
> -             (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT|MCI_CMDSENT|MCI_CMDRESPEND)))
> +       if (host->variant->busy_timeout && busy_resp)
> +               err_msk |= MCI_DATATIMEOUT;
> +
> +       if (!((status | host->busy_status) &
> +             (err_msk | MCI_CMDSENT | MCI_CMDRESPEND)))
>                 return;
>
>         /* Handle busy detection on DAT0 if the variant supports it. */
> @@ -1235,8 +1250,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>                  * while, to allow it to be set, but tests indicates that it
>                  * isn't needed.
>                  */
> -               if (!host->busy_status &&
> -                   !(status & (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT)) &&
> +               if (!host->busy_status && !(status & err_msk) &&
>                     (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
>
>                         writel(readl(base + MMCIMASK0) |
> @@ -1290,6 +1304,9 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>                 cmd->error = -ETIMEDOUT;
>         } else if (status & MCI_CMDCRCFAIL && cmd->flags & MMC_RSP_CRC) {
>                 cmd->error = -EILSEQ;
> +       } else if (host->variant->busy_timeout && busy_resp &&
> +                  status & MCI_DATATIMEOUT) {
> +               cmd->error = -ETIMEDOUT;

It's not really clear to me what happens with the busy detection
status bit (variant->busy_detect_flag), in case a MCI_DATATIMEOUT IRQ
is raised, while also having host->busy_status set (waiting for
busyend).

By looking at the code a few lines above this, we may do a "return;"
while waiting for the busyend IRQ even if MCI_DATATIMEOUT also is
raised, potentially losing that from being caught. Is that really
correct?

>         } else {
>                 cmd->resp[0] = readl(base + MMCIRESPONSE0);
>                 cmd->resp[1] = readl(base + MMCIRESPONSE1);
> @@ -1583,6 +1600,20 @@ static void mmci_request(struct mmc_host *mmc, struct mmc_request *mrq)
>         spin_unlock_irqrestore(&host->lock, flags);
>  }
>
> +static void mmci_set_max_busy_timeout(struct mmc_host *mmc)
> +{
> +       struct mmci_host *host = mmc_priv(mmc);
> +       u32 max_busy_timeout = 0;
> +
> +       if (!host->variant->busy_detect)
> +               return;
> +
> +       if (host->variant->busy_timeout && mmc->actual_clock)
> +               max_busy_timeout = ~0UL / (mmc->actual_clock / MSEC_PER_SEC);
> +
> +       mmc->max_busy_timeout = max_busy_timeout;
> +}
> +
>  static void mmci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
>         struct mmci_host *host = mmc_priv(mmc);
> @@ -1687,6 +1718,8 @@ static void mmci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>         else
>                 mmci_set_clkreg(host, ios->clock);
>
> +       mmci_set_max_busy_timeout(mmc);
> +
>         if (host->ops && host->ops->set_pwrreg)
>                 host->ops->set_pwrreg(host, pwr);
>         else
> @@ -1957,7 +1990,6 @@ static int mmci_probe(struct amba_device *dev,
>                         mmci_write_datactrlreg(host,
>                                                host->variant->busy_dpsm_flag);
>                 mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
> -               mmc->max_busy_timeout = 0;
>         }
>
>         /* Prepare a CMD12 - needed to clear the DPSM on some variants. */
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 833236ecb31e..d8b7f6774e8f 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -287,6 +287,8 @@ struct mmci_host;
>   * @signal_direction: input/out direction of bus signals can be indicated
>   * @pwrreg_clkgate: MMCIPOWER register must be used to gate the clock
>   * @busy_detect: true if the variant supports busy detection on DAT0.
> + * @busy_timeout: true if the variant starts data timer when the DPSM
> + *               enter in Wait_R or Busy state.
>   * @busy_dpsm_flag: bitmask enabling busy detection in the DPSM
>   * @busy_detect_flag: bitmask identifying the bit in the MMCISTATUS register
>   *                   indicating that the card is busy
> @@ -333,6 +335,7 @@ struct variant_data {
>         u8                      signal_direction:1;
>         u8                      pwrreg_clkgate:1;
>         u8                      busy_detect:1;
> +       u8                      busy_timeout:1;
>         u32                     busy_dpsm_flag;
>         u32                     busy_detect_flag;
>         u32                     busy_detect_mask;
> --
> 2.17.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
