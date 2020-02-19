Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5430B164219
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Feb 2020 11:29:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A090C36B0B;
	Wed, 19 Feb 2020 10:29:31 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DBC8C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 10:29:29 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id f7so8647339uaa.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 02:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+JMXibqU7pdFIdII16L/Y2AeVX/CI11svigC46gf8uU=;
 b=zzniWRwZoycxdKWo3bTAbQWaVxpy5CQGzW+0nidtIr77EZWl/cCZx19vDOZhjWvZRe
 p4t9rQ1ONJU2pZbwkIfSnLHNBeSyGflqKTLg2X+xxPUp2/fP9F7zjv+4f2KkizcjUDH7
 84nBCzOIfyHlHBLIQRPB0LIaTvdf4cW1Ojn5641hnjyoRgjm2haN6JfhhoBmIGU4WHcS
 gGuh6IZhW6sAQc0Csy727H0aAwHSk1cEjCFo3UdvwUH/ldH71Cm8rueaexzFTRgEjASO
 LLuaDLyLelIt7eXTO+LLbenQ/4CZCDhNSkkA3ZlWI9T68Xhm5+3UiGC+3QHkZyUwVhHZ
 jkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+JMXibqU7pdFIdII16L/Y2AeVX/CI11svigC46gf8uU=;
 b=kK057y7xCBXxi8yBKumxrU4Oj7hd18kQWlOZ3OG9hYE9I27VvNnWh2tiAV5pBWrinu
 rolZiXDfI+sFhR+q/OgihgJNBJY3ho4qvzLeVsk8ERzXU9uaXlSQvPxJvjUkMQZKRvKF
 hTTuyUX5XknYpYNsDlXGQBl2r/GlDJDQSDw8Ezd2phgQeRJAT+ZrUFz+0w4m0+EwBa9s
 t48JGrWkgy22o8CpzRp4F7wHSPlqrsbsWJS+8/IbEAZCdVA/398/dFyATVC2HCztGFjY
 MV+sOGjf06WHgQmto8J2SpxN2IjU4iNFNoosGrDH/jwpNnpNrdTzsGJyuRLRjfjENq1j
 owkQ==
X-Gm-Message-State: APjAAAUFtNoEt1h1xveKZciPZz+kkGxXxJLp+X/2GLNvzpK1NgbEt8+9
 RtMsB+AT0oso+9ceJ2u0PCwzc42Fe/1/BMNF6GUGyA==
X-Google-Smtp-Source: APXvYqzltx18jQ/GN6j6y5PblztBh+anBxCtM5CqYz0EqlghKAvb6lvUng+oaF2oUU44zSaQHTDNiUkIX+LzpAamcAo=
X-Received: by 2002:a9f:3046:: with SMTP id i6mr12953039uab.15.1582108167823; 
 Wed, 19 Feb 2020 02:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20200128090636.13689-1-ludovic.barre@st.com>
In-Reply-To: <20200128090636.13689-1-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Feb 2020 11:28:51 +0100
Message-ID: <CAPDyKFr+7SvRasPPjFDA2kwG0ERS-Qp3FGbVbRGLrscz5N=L2g@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 0/9] mmc: mmci: sdmmc: add sdr104
	support
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

On Tue, 28 Jan 2020 at 10:06, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> To support the sdr104 mode, sdmmc variant needs:
> -Hardware delay block support for sdmmc variant
>  with tuning procedure
> -Voltage switch callbacks
> -sdmmc revision 2.0
>
> V2:
> -regroup host->mmc_ops & mmc->ops assignment
> -add timeout define
> -rename prep_volt_switch to pre_sig_volt_switch
> -rename volt_switch to post_sig_volt_switch
> -add 'why' comment for "mmc: mmci: add volt_switch callbacks"
>
> Ludovic Barre (9):
>   mmc: mmci: sdmmc: replace sg_dma_xxx macros
>   mmc: mmci: sdmmc: rename sdmmc_priv struct to sdmmc_idma
>   mmc: mmci: add a reference at mmc_host_ops in mmci struct
>   mmc: mmci: add private pointer for variant
>   dt-bindings: mmc: mmci: add delay block base register for sdmmc
>   mmc: mmci: sdmmc: add execute tuning with delay block
>   mmc: mmci: add volt_switch callbacks
>   mmc: mmci: sdmmc: add voltage switch functions
>   mmc: mmci: add sdmmc variant revision 2.0
>
>  .../devicetree/bindings/mmc/mmci.txt          |   2 +
>  drivers/mmc/host/mmci.c                       |  42 +++-
>  drivers/mmc/host/mmci.h                       |   8 +
>  drivers/mmc/host/mmci_stm32_sdmmc.c           | 204 +++++++++++++++++-
>  4 files changed, 248 insertions(+), 8 deletions(-)
>
> --
> 2.17.1
>

Applied for next, thanks!

I took the liberty to do minor amendments to some of the changelogs,
but in particular I have change some of prefixes for the commit
message headers into "mmc: mmci_sdmmc:".

Please tell, if there is anything that you want me to update.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
