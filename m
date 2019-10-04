Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E16BCB469
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2019 08:21:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D52F2C36B0B;
	Fri,  4 Oct 2019 06:21:36 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FC71C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2019 06:21:33 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id k24so1692772uag.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Oct 2019 23:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3VA6KMsG3nx06bNmB0dVu0SsT6kYQkCPRD3KsBbwQUM=;
 b=eAVNcSdYZdHu2Tydt5eci09qeF80XduBLbw81dp6aYCwZtLUjglNwse6Z5WwlUx6d3
 oR+GjfPOewBt/WGmeeV/AWjVXS3hd7dyK4dIDbq3pMAcoMPVAEa1wS4TVv7GLYQ8bumz
 912qcbHDJCdo/mzZ9KJ+RMb8f6+dEcPqc2nkeuToFTH26lG5Oi+jNf3bIYHSQtgqEAgn
 SPNUB+y/mE9C7Ej2c4rhQ/W+FSf0MY4vTSKFOJ5PdcLEP/MGeF5Xrbw9eMTLhIUCgtXT
 E6ySS9Fv1Se7h68KEeFyn4BHxggAOw8v+yzm51iuKcfW0yDiGUwzZTereWGDwctgJk1C
 4YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3VA6KMsG3nx06bNmB0dVu0SsT6kYQkCPRD3KsBbwQUM=;
 b=PWlnjsO79MekOuJPKZmaJaERQaaLj+TUdmMedNY3X1jqk81b+tkXUGjq4gz2jAP5p6
 T3ygkFLVJROyUUtGgk3Ari8josH0DELvL9Zc4m7Nn6gepZSs3NaxaikEFvMdhVdOnXqE
 Py3P41aNMiaIzd/6jD5wy7bihEXI/Nu6dWI85O098fwGEkG/TTbks7deDjVxfUGuLIP1
 IISvIJlXcPXBb15TCovJXnNQpftzGb7MeLi274x8YpBBdi70n1NwBoJXekcDkOZnl71B
 X5/NZul2OXYxjY7kowmdNfvWF9U7S0rZEc+7EDxcEAt5wLb91nEb9A1+WsyIv+Cx1nfg
 Z4+w==
X-Gm-Message-State: APjAAAUVkgOBrEjOv7VYlBqedrI2Ca2pJcTfdyL/KD5APjCiKOZIhbbB
 SDtbM5NQqItaBBa5Pqik5wWV9/hb1uZZR28tEbykNg==
X-Google-Smtp-Source: APXvYqxUAWDAKSyRlKUVwmcQP5taPZrKlBCqAfpilhJXELmM3ge2ED1Kpw7lsSdHFyM2x1yd0lHq32mU/+8FdWLL6YM=
X-Received: by 2002:ab0:6190:: with SMTP id h16mr5000205uan.129.1570170091738; 
 Thu, 03 Oct 2019 23:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190905122112.29672-1-ludovic.Barre@st.com>
 <20190905122112.29672-2-ludovic.Barre@st.com>
 <CAPDyKFpcb=dT0XBAGVL68t--xi5853Dzsgak-vbx5VcvxLZ4zA@mail.gmail.com>
In-Reply-To: <CAPDyKFpcb=dT0XBAGVL68t--xi5853Dzsgak-vbx5VcvxLZ4zA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Oct 2019 08:20:55 +0200
Message-ID: <CAPDyKFrRDHeVs6RpM=qTT1AogLnFWJLh2S4-wCcrYAON9XVKCA@mail.gmail.com>
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

On Fri, 4 Oct 2019 at 08:12, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 5 Sep 2019 at 14:21, Ludovic Barre <ludovic.Barre@st.com> wrote:
> >
> > From: Ludovic Barre <ludovic.barre@st.com>
> >
> > In some variants, the data timer starts and decrements
> > when the DPSM enters in Wait_R or Busy state
> > (while data transfer or MMC_RSP_BUSY), and generates a
> > data timeout error if the counter reach 0.
>
>
> >
> > -Define max_busy_timeout (in ms) according to clock.
> > -Set data timer register if the command has rsp_busy flag.
> >  If busy_timeout is not defined by framework, the busy
> >  length after Data Burst is defined as 1 second
> >  (refer: 4.6.2.2 Write of sd specification part1 v6-0).
>
> How about re-phrasing this as below:
>
> -----
> In the stm32_sdmmc variant, the datatimer is active not only during
> data transfers with the DPSM, but also while waiting for the busyend
> IRQs from commands having the MMC_RSP_BUSY flag set. This leads to an
> incorrect IRQ being raised to signal MCI_DATATIMEOUT error, which
> simply breaks the behaviour.
>
> Address this by updating the datatimer value before sending a command
> having the MMC_RSP_BUSY flag set. To inform the mmc core about the
> maximum supported busy timeout, which also depends on the current
> clock rate, set ->max_busy_timeout (in ms).
> -----
>
> Regarding the busy_timeout, the core should really assign it a value
> for all commands having the RSP_BUSY flag set. However, I realize the
> core needs to be improved to cover all these cases - and I am looking
> at that, but not there yet.
>
> I would also suggest to use a greater value than 1s, as that seems a
> bit low for the "undefined" case. Perhaps use the max_busy_timeout,
> which would be nice a simple or 10s, which I think is used by some
> other drivers.
>
> > -Add MCI_DATATIMEOUT error management in mmci_cmd_irq.
> >
> > Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> > ---
> >  drivers/mmc/host/mmci.c | 42 ++++++++++++++++++++++++++++++++++++-----
> >  drivers/mmc/host/mmci.h |  3 +++
> >  2 files changed, 40 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> > index c37e70dbe250..c30319255dc2 100644
> > --- a/drivers/mmc/host/mmci.c
> > +++ b/drivers/mmc/host/mmci.c
> > @@ -1075,6 +1075,7 @@ static void
> >  mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
> >  {
> >         void __iomem *base = host->base;
> > +       unsigned long long clks;
> >
> >         dev_dbg(mmc_dev(host->mmc), "op %02x arg %08x flags %08x\n",
> >             cmd->opcode, cmd->arg, cmd->flags);
> > @@ -1097,6 +1098,16 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
> >                 else
> >                         c |= host->variant->cmdreg_srsp;
> >         }
> > +
> > +       if (host->variant->busy_timeout && cmd->flags & MMC_RSP_BUSY) {
> > +               if (!cmd->busy_timeout)
> > +                       cmd->busy_timeout = 1000;
> > +
> > +               clks = (unsigned long long)cmd->busy_timeout * host->cclk;
> > +               do_div(clks, MSEC_PER_SEC);
> > +               writel_relaxed(clks, host->base + MMCIDATATIMER);
> > +       }
> > +
> >         if (/*interrupt*/0)
> >                 c |= MCI_CPSM_INTERRUPT;
> >
> > @@ -1201,6 +1212,7 @@ static void
> >  mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
> >              unsigned int status)
> >  {
> > +       u32 err_msk = MCI_CMDCRCFAIL | MCI_CMDTIMEOUT;
> >         void __iomem *base = host->base;
> >         bool sbc, busy_resp;
> >
> > @@ -1215,8 +1227,11 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
> >          * handling. Note that we tag on any latent IRQs postponed
> >          * due to waiting for busy status.
> >          */
> > -       if (!((status|host->busy_status) &
> > -             (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT|MCI_CMDSENT|MCI_CMDRESPEND)))
> > +       if (host->variant->busy_timeout && busy_resp)
> > +               err_msk |= MCI_DATATIMEOUT;
> > +
> > +       if (!((status | host->busy_status) &
> > +             (err_msk | MCI_CMDSENT | MCI_CMDRESPEND)))
> >                 return;
> >
> >         /* Handle busy detection on DAT0 if the variant supports it. */
> > @@ -1235,8 +1250,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
> >                  * while, to allow it to be set, but tests indicates that it
> >                  * isn't needed.
> >                  */
> > -               if (!host->busy_status &&
> > -                   !(status & (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT)) &&
> > +               if (!host->busy_status && !(status & err_msk) &&
> >                     (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
> >
> >                         writel(readl(base + MMCIMASK0) |
> > @@ -1290,6 +1304,9 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
> >                 cmd->error = -ETIMEDOUT;
> >         } else if (status & MCI_CMDCRCFAIL && cmd->flags & MMC_RSP_CRC) {
> >                 cmd->error = -EILSEQ;
> > +       } else if (host->variant->busy_timeout && busy_resp &&
> > +                  status & MCI_DATATIMEOUT) {
> > +               cmd->error = -ETIMEDOUT;
>
> It's not really clear to me what happens with the busy detection
> status bit (variant->busy_detect_flag), in case a MCI_DATATIMEOUT IRQ
> is raised, while also having host->busy_status set (waiting for
> busyend).
>
> By looking at the code a few lines above this, we may do a "return;"
> while waiting for the busyend IRQ even if MCI_DATATIMEOUT also is
> raised, potentially losing that from being caught. Is that really
> correct?

A second thought. That "return;" is to manage the busyend IRQ being
raised of the first edge due to broken HW. So I guess, this isn't an
issue for stm32_sdmmc variant after all?

I have a look at the next patches in the series..

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
