Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1DE1B22A4
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 11:26:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A9B1C36B0C;
	Tue, 21 Apr 2020 09:26:13 +0000 (UTC)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35945C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 09:26:11 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id i185so3411340vki.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 02:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sutV1Oamoy4pwRt+VwqP9AtJQW6IanilRtSt3lz61TU=;
 b=i44fOYZUDMFqxzO+bLxz7mYEXUJOrpBd6UGd2O+okyMUpCDdFKYIA826sUc7iPf6we
 js7pHNoTwz0e4R+VDEEez61/nomAfRCsuE94AcZJ9S5rehCXy1mKu/shAWtzpt5XfI+r
 l2r9o/esXgf9BSBCXfnnvw6hbSFBgzLYaI5HilgMBU9YGUTsg5p6E8mn0f/ULpHUceV+
 grZbBZ4lBL1a3TWwDjxTT1wtbs2ryIpbqkXG4MOXWlfVjB0C5532Ob0xNjO+leG/B2jP
 C7PZF9bGVE3w+BOpv+3h7rP7Iv2Zp5h7xvJNVCEBTX3s7LvKyKbqlZBsoksAMNcbHIKb
 3+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sutV1Oamoy4pwRt+VwqP9AtJQW6IanilRtSt3lz61TU=;
 b=HoPyUL/RKTygxU/rxJqSHYjo0xr3f4syN+Sxa1/+CmRBgHSPTG+n/b3VjvHaS1dDMz
 gE54PXYj/BfdQ8lmdmE7jw3MRnh5XDEK8Yc6aE8gq3TPHo5bIkzp9Y6zJUuekOHF/nkf
 rDSN27IxTfqayQzTA52gnJeQ37xhYw6FlRmSUxyu1wnoZLUKudDEufMLBnclN3X1Jo4o
 jbKxCR57arK0t48B3THnNj8ocSznkmkui+hpt0VMpJtAATm6IC/lK9KVUVAk1+C2fs6o
 l0AQc3f/AKJCfUYLdJeip5sQNfetGxn11C5F2JcOZpB2wSS8I3UDeWG1HXGwXbtoSx2J
 rhyw==
X-Gm-Message-State: AGi0PubGWyqezproruDEVKrOl0IxXBgUWBNKN1Fl7jAGNGqgdItnyyX+
 msgwGl376px4ghCCLRDpR3jICvVD1ZxMN6B0pJVIpQ==
X-Google-Smtp-Source: APiQypKgJ3XD4p50nn/CNLH8KAToU17AAWt5xtoXI0IXMljJSdFyItYyZUEcdUyWP2PTkh+mgDLx1kzXR3Z25Pm/P1U=
X-Received: by 2002:a1f:a60b:: with SMTP id p11mr8434277vke.43.1587461169800; 
 Tue, 21 Apr 2020 02:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200420161831.5043-1-ludovic.barre@st.com>
In-Reply-To: <20200420161831.5043-1-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Apr 2020 11:25:33 +0200
Message-ID: <CAPDyKFqC3fdnQ9CMYhS-=5MiCET=r5Az2S5oFoA2v1gdDeGO3w@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci_sdmmc: fix power on issue due
	to pwr_reg initialization
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

On Mon, 20 Apr 2020 at 18:18, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> This patch fix a power-on issue, and avoid to retry the power sequence.
>
> In power off sequence: sdmmc must set pwr_reg in "power-cycle" state
> (value 0x2), to prevent the card from being supplied through the signal
> lines (all the lines are driven low).
>
> In power on sequence: when the power is stable, sdmmc must set pwr_reg
> in "power-off" state (value 0x0) to drive all signal to high before to
> set "power-on".

Just a question to gain further understanding.

Let's assume that the controller is a power-on state, because it's
been initialized by the boot loader. When the mmc core then starts the
power-on sequence (not doing a power-off first), would $subject patch
then cause the
MMCIPOWER to remain as is, or is it going to be overwritten?

I am a little worried that we may start to rely on boot loader
conditions, which isn't really what we want either...

>
> To avoid writing the same value to the power register several times, this
> register is cached by the pwr_reg variable. At probe pwr_reg is initialized
> to 0 by kzalloc of mmc_alloc_host.
>
> Like pwr_reg value is 0 at probing, the power on sequence fail because
> the "power-off" state is not writes (value 0x0) and the lines
> remain drive to low.
>
> This patch initializes "pwr_reg" variable with power register value.
> This it done in sdmmc variant init to not disturb default mmci behavior.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Besides the comment, the code and the approach seems reasonable to me.

Kind regards
Uffe

> ---
>
> This patch is the proposal from:
> https://patchwork.kernel.org/patch/11457987/
>
> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index d33e62bd6153..14f99d8aa3f0 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -519,6 +519,7 @@ void sdmmc_variant_init(struct mmci_host *host)
>         struct sdmmc_dlyb *dlyb;
>
>         host->ops = &sdmmc_variant_ops;
> +       host->pwr_reg = readl_relaxed(host->base + MMCIPOWER);
>
>         base_dlyb = devm_of_iomap(mmc_dev(host->mmc), np, 1, NULL);
>         if (IS_ERR(base_dlyb))
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
