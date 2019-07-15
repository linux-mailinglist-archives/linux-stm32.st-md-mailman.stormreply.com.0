Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A365569916
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 18:31:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 509AEC584A0
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 16:31:54 +0000 (UTC)
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92561C57DCD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 16:31:52 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id u3so11800655vsh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l9coYjSe3XSNr091GZSS9724rWMOjYgkm8g/YPUGrBk=;
 b=NYNAvMcRho+50ikquItIbaA8xyQqZTsW5KuU71/3Q+SoqDVsAy0+FM2d2PDcePt7/n
 11RZxGJC6mTRC4h6FGCGzw5ghhxx3RwnG0GjedgAFNGGoDc3a9QiHq+8ObcMmIqDsmmR
 J3Vsoi/0eyXbw2JYkw6d/qyG0Pcpoe3itkm/WnnZNuH1KiiwADvf3ntPy/+VrYE6PIw6
 uIF81NM9pWUyOV4tcN7jlhU8hIQWnXcFmd8zg9BnmqlN0/rWPA8H02F6iWBLylvyWZNz
 XJSLk/1VCaTu2yjDkpvSOUpRVRh2m0Rv0bmcg2VHCyu5QVYHl7BD6bBxYfh/jlUUzWJe
 HABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l9coYjSe3XSNr091GZSS9724rWMOjYgkm8g/YPUGrBk=;
 b=NdO+zHOP418prm5JLPnZ93MDQLADblFuNarYCmIZJNMDHho203x9Gar3he9IZYDl3w
 fdrbIKUWW3u3LIHfTM9dF/Z2D3dsK9wyhDMlfP9tFk58wNltQ/9w8Tzx4HVNMRY7tVAe
 Tst0Mmi1DMCFZit0S1exHi9xjFay/Xq0wcp82RnCR3drN4VI4nBGFFGbXiwWSQN8uwT5
 4c/YsvVH7Hf5nCS7LKt/5HZOUIFmBVKyKiXaGxUamAawbq6e0QHIhNXFWtA0IiLwl2jH
 GiXZFbvpHhg3NT1nBx5L/MunqGV72JtmCbk0GA/Apc7KCWzElkf7dU7Dy7TXGtB4PTTG
 pgow==
X-Gm-Message-State: APjAAAXCEFEISRJR1CXc5epFJSQ2X3UfCRBezP3fVlV8RdKQpEocgorK
 V8gmI5eghiHEpJsfK4gQuJWaOViPrWAWbKQBrgXUVw==
X-Google-Smtp-Source: APXvYqyUVL5RPnQWYVDvWMTPG8b/y4kpVO36hdyZcWBMkgiuUbpz8JwBx7OzH4gYy2hAxp1kCITo99T3NjrGPMBeorE=
X-Received: by 2002:a67:7a90:: with SMTP id
 v138mr16907417vsc.200.1563208311475; 
 Mon, 15 Jul 2019 09:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
 <1559577325-19266-2-git-send-email-ludovic.Barre@st.com>
In-Reply-To: <1559577325-19266-2-git-send-email-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Jul 2019 18:31:15 +0200
Message-ID: <CAPDyKFpJPbpTnfA2cynFURyxFY_YCm7MRXw3m2nQyU+z=ZWsFA@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V3 1/3] mmc: mmci: fix read status for
	busy detect
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

On Mon, 3 Jun 2019 at 17:55, Ludovic Barre <ludovic.Barre@st.com> wrote:
>
> From: Ludovic Barre <ludovic.barre@st.com>
>
> "busy_detect_flag" is used to read & clear busy value of mmci status.
> "busy_detect_mask" is used to manage busy irq of mmci mask.
> So to read mmci status the busy_detect_flag must be take account.
> if the variant does not support busy detect feature the flag is null
> and there is no impact.

By reading the changelog, it doesn't tell me the purpose of this
change. When going forward, please work harder on your changelogs.

Make sure to answer the questions, *why* is this change needed,
*what/how* does the change do.

>
> Not need to re-read the status register in mmci_cmd_irq, the
> status parameter can be used.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 356833a..5b5cc45 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1240,7 +1240,7 @@ mmci_cmd_irq(struct mmci_host *host, struct mmc_command *cmd,
>                  */
>                 if (!host->busy_status &&
>                     !(status & (MCI_CMDCRCFAIL|MCI_CMDTIMEOUT)) &&
> -                   (readl(base + MMCISTATUS) & host->variant->busy_detect_flag)) {
> +                   (status & host->variant->busy_detect_flag)) {

I suggested you to do this change through some of my earlier comments,
however I think it should be made as a stand alone change.

Anyway, when looking at the details in your series, I decided to try
to help out a bit, so I have prepared a couple of related patches for
cleaning up and clarifying the busy detection code/comments in mmci. I
have incorporated the above change, so let me post them asap.

>
>                         /* Clear the busy start IRQ */
>                         writel(host->variant->busy_detect_mask,
> @@ -1517,7 +1517,8 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>                  * to make sure that both start and end interrupts are always
>                  * cleared one after the other.
>                  */
> -               status &= readl(host->base + MMCIMASK0);
> +               status &= readl(host->base + MMCIMASK0) |
> +                       host->variant->busy_detect_flag;

As I told earlier in the review, this looks wrong to me.

It means that you will add the bit for the ->busy_detect_flag to the
status field we have just read from the MMCISTATUS register. That
means the busy status may be set when it shouldn't.

>                 if (host->variant->busy_detect)
>                         writel(status & ~host->variant->busy_detect_mask,
>                                host->base + MMCICLEAR);
> --
> 2.7.4
>

By looking at the other changes in the series, I assume @subject patch
is intended to prepare for the other changes on top. But it's not
really clear.

Anyway, in that regards, the below is my observations of what seems to
be important part, when supporting busy detection for the stm32 sdmmc
variant (except the timeout things in patch2, which I intend to
comment separately on).

I figured, these are the involved register bits/masks:

MMCISTATUS:
MCI_STM32_BUSYD0 BIT(20)
MCI_STM32_BUSYD0END BIT(21)

MMCIMASK0:
MCI_STM32_BUSYD0ENDMASK BIT(21)

For the legacy ST variant, there is only one register bit in
MMCISTATUS that is used for indicating busy (MCI_ST_CARDBUSY BIT(24)).
There is no dedicated busy-end bit for the busy-end IRQ, which I
believe is the reason to why the current code also is bit messy.

It seems like the stm32 sdmmc variant have a separate status bit for
the busy-end IRQ, correct?

If I understand correctly by looking at patch3, you don't use the
dedicated busy-end status bit (MCI_STM32_BUSYD0END), right? Then why
not?

Thoughts?

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
