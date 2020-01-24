Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B814859F
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 14:10:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 275C4C36B0C;
	Fri, 24 Jan 2020 13:10:25 +0000 (UTC)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68F26C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 13:10:24 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g23so1146451vsr.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FgJ5lZH4Mb1Tzk/p5bRIKhcE7A+Y7euEYLcO1OpV4S8=;
 b=gjmgAgx3XOChzsVHsvnM5jQSiMZ4Fjx3NBVYIq2/dT3CH9ql1U7aAdqnR14513DZFT
 YCH8qYlXsmEWt6b1r3I4OAxTH8Hk8zQT0770sSu4j1UryQK2excH9kVrqUJQL+Z1HVuK
 ZRxv2qonE2OXIHbhU41udwALpiap6wfaL6E6mUiUMX8FBzbhBbFqVUz1IoqdD941o+rp
 g96vbjsxuLg7zYqFDMRrMQNHFyolL5jDENiFUrPIEwhM5Nf/gGAkkwqtpERmRCxKTNFs
 CWPzTUUwNYmAnFwuZlb3CQgCKwG4t4dH3hX7laxkMyuEdwEesH6wFkZTpIMSXWIkXhHz
 dkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FgJ5lZH4Mb1Tzk/p5bRIKhcE7A+Y7euEYLcO1OpV4S8=;
 b=Ze6POEpMR1PsnievZ497snrTvyXSRgyklDKg2LHOA8ZGlVym8SvYWek1Xd4uKYfWsJ
 T1E9/4l6Iz/G2NrYHFrZx+QBzKyrpHcyccxGunOkGCnjwwyhEpoCQHQ62pTuNzOVRqNv
 Z0hLkrVmb6BqppBJd2uSAYFawqduVbs1qNnkDbzC0mh33Rt2I2M9R98HhQYfP48ynZtW
 aiRE3Xx0Tf18/ZIoBik81Lc6WU4w8k8jP+q9TByJlDR9WZJelQ9MVL8SqwaucRGaxBq2
 P5kQHXr7T0MhLwKr8eJymr6u6zMxvLuOAocjM5Fk8325cNQMABg5xBznKvKVoCfRHYJW
 lJ0A==
X-Gm-Message-State: APjAAAWU+swHJ7EUND55JeN7ncetmxwKStTS9xjDlWzZASP56Vi0wQLs
 OI+c16SCEjxkcnMXbiVxXWdJBFk/wQwTBJBkwm3mtw==
X-Google-Smtp-Source: APXvYqwTSyMti1aLrHxV4T1GbulSVX2llyodm3KWM+MmIFpyCh3UiqUM4MYq/lAoQMj2ylGIpLcWxal/hp0XVXJXDjA=
X-Received: by 2002:a67:de15:: with SMTP id q21mr2060825vsk.165.1579871422965; 
 Fri, 24 Jan 2020 05:10:22 -0800 (PST)
MIME-Version: 1.0
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-4-ludovic.barre@st.com>
In-Reply-To: <20200110134823.14882-4-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 Jan 2020 14:09:46 +0100
Message-ID: <CAPDyKFpBgRGbRjOKHygknUMvGt9AKke+svoSG+So4B7hdZ8AMw@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 3/9] mmc: mmci: add a reference at
	mmc_host_ops in mmci struct
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

On Fri, 10 Jan 2020 at 14:49, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> This patch adds mmc_host_ops pointer in mmci struct.
> The variant init function may need to add a mmc_host_ops,
> for example to add the execute_tuning support if this feature
> is available.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 1 +
>  drivers/mmc/host/mmci.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 7b13d66cbb21..00b473f57047 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1923,6 +1923,7 @@ static int mmci_probe(struct amba_device *dev,
>
>         host = mmc_priv(mmc);
>         host->mmc = mmc;
> +       host->mmc_ops = &mmci_ops;

Nitpick:

Can you please also move the assignment "mmc->ops = &mmci_ops;" to
this place as well, as I think these belongs together.

>
>         /*
>          * Some variant (STM32) doesn't have opendrain bit, nevertheless
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index ea6a0b5779d4..55acc0971a44 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -407,6 +407,7 @@ struct mmci_host {
>         u32                     mask1_reg;
>         u8                      vqmmc_enabled:1;
>         struct mmci_platform_data *plat;
> +       struct mmc_host_ops     *mmc_ops;
>         struct mmci_host_ops    *ops;
>         struct variant_data     *variant;
>         struct pinctrl          *pinctrl;
> --
> 2.17.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
