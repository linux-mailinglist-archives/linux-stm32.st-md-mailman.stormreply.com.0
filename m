Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5666B7A27AE
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Sep 2023 22:08:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B82AC6B47C;
	Fri, 15 Sep 2023 20:08:34 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E42AFC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 20:08:32 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1bc0d39b52cso21620195ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Sep 2023 13:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694808511; x=1695413311;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=isVDFfcbmknUPWknowT7LS08Cb3UMEcuJeNo2USTgKI=;
 b=JaQaYM+PVf8sEsBmzFQKHp8etS1srG0ES3PHxXevuCHp9jlP168FvV/Y5Nk0sWd3fN
 vuSSWBnSR4HqsIgapmpDx/1wwyGmXikDXYksZb6uvcOjLirkv0laUA7TzxlptU+UUlvk
 tEAbGs5atATFZ+WDeD/6o3juFQWwnx3W1Ft7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694808511; x=1695413311;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=isVDFfcbmknUPWknowT7LS08Cb3UMEcuJeNo2USTgKI=;
 b=JKZjKFZpwe9Ds12/m4oKOuH5Zwm0+hn6TUdCVvcmvpZna9t6rQAtEcpAmEFVZGv4RT
 v28aZLg1Box6XE8C7SCc6FjjvQAF8Z4UWVO9ciYrbp2oIYtYb/ZKUyaArkWYEdT4Xgd8
 Fb1E8DU/Iw5it5jcPuBDivGoeAtS6GZA0xfyugnlm2v6xL69nKs5IRijQx26nR8Yb6jE
 msa9CryuUHM6zoriEk8yBkuJiUm0RZOYvo3DJcQaOamHMpn285CM+uvsu4mtgN7uMZee
 7/OTn67NARBzZz0Q4QPZzEXQELECqmHh00KNT3GyVwsgzaYQuHh8qawVBbtcNVwF/HqK
 4dgQ==
X-Gm-Message-State: AOJu0YzY9KaD9dtqPrLly81PcNfUZ2oby22qQNPQWg28AnPRDGofCaqR
 uea7/j8xsJCshgFfiQec4kYDNg==
X-Google-Smtp-Source: AGHT+IFm1+jtAdP9L1K8FAr0YTZKF7Q+zfhuSjHQY9X6olemmW7O/o5ALrmJsBZbi3qT/JSSHdFxlQ==
X-Received: by 2002:a17:902:ce85:b0:1bc:5924:2da2 with SMTP id
 f5-20020a170902ce8500b001bc59242da2mr3104460plg.56.1694808511445; 
 Fri, 15 Sep 2023 13:08:31 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b001b896686c78sm3845010plm.66.2023.09.15.13.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 13:08:30 -0700 (PDT)
Date: Fri, 15 Sep 2023 13:08:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <202309151307.F3341BD5A@keescook>
References: <20230817235428.never.111-kees@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817235428.never.111-kees@kernel.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, asahi@lists.linux.dev,
 Jie Hai <haijie1@huawei.com>, Sven Peter <sven@svenpeter.dev>,
 linux-arm-msm@vger.kernel.org, Green Wan <green.wan@sifive.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Yu Kuai <yukuai3@huawei.com>,
 linux-tegra@vger.kernel.org, Jordy Zomer <jordy@pwning.systems>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/21] dmaengine: Annotate with
	__counted_by
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

Hi,

Just a ping on the series... how do these look to you, Vinod?

If you want I can carry them in my tree. Please let me know.

Thanks!

-Kees

On Thu, Aug 17, 2023 at 04:58:37PM -0700, Kees Cook wrote:
> Hi,
> 
> This annotates several structures with the coming __counted_by attribute
> for bounds checking of flexible arrays at run-time. For more details, see
> commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").
> 
> Thanks!
> 
> -Kees
> 
> Kees Cook (21):
>   dmaengine: apple-admac: Annotate struct admac_data with __counted_by
>   dmaengine: at_hdmac: Annotate struct at_desc with __counted_by
>   dmaengine: axi-dmac: Annotate struct axi_dmac_desc with __counted_by
>   dmaengine: fsl-edma: Annotate struct fsl_edma_desc with __counted_by
>   dmaengine: hisilicon: Annotate struct hisi_dma_dev with __counted_by
>   dmaengine: moxart-dma: Annotate struct moxart_desc with __counted_by
>   dmaengine: qcom: bam_dma: Annotate struct bam_async_desc with
>     __counted_by
>   dmaengine: sa11x0: Annotate struct sa11x0_dma_desc with __counted_by
>   dmaengine: sf-pdma: Annotate struct sf_pdma with __counted_by
>   dmaengine: sprd: Annotate struct sprd_dma_dev with __counted_by
>   dmaengine: st_fdma: Annotate struct st_fdma_desc with __counted_by
>   dmaengine: stm32-dma: Annotate struct stm32_dma_desc with __counted_by
>   dmaengine: stm32-mdma: Annotate struct stm32_mdma_desc with
>     __counted_by
>   dmaengine: stm32-mdma: Annotate struct stm32_mdma_device with
>     __counted_by
>   dmaengine: tegra: Annotate struct tegra_dma_desc with __counted_by
>   dmaengine: tegra210-adma: Annotate struct tegra_adma with __counted_by
>   dmaengine: ti: edma: Annotate struct edma_desc with __counted_by
>   dmaengine: ti: omap-dma: Annotate struct omap_desc with __counted_by
>   dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_desc with
>     __counted_by
>   dmaengine: uniphier-xdmac: Annotate struct uniphier_xdmac_device with
>     __counted_by
>   dmaengine: usb-dmac: Annotate struct usb_dmac_desc with __counted_by
> 
>  drivers/dma/apple-admac.c      |  2 +-
>  drivers/dma/at_hdmac.c         |  2 +-
>  drivers/dma/dma-axi-dmac.c     |  5 ++---
>  drivers/dma/fsl-edma-common.h  |  2 +-
>  drivers/dma/hisi_dma.c         |  2 +-
>  drivers/dma/moxart-dma.c       |  5 ++---
>  drivers/dma/qcom/bam_dma.c     |  2 +-
>  drivers/dma/sa11x0-dma.c       |  6 +++---
>  drivers/dma/sf-pdma/sf-pdma.h  |  2 +-
>  drivers/dma/sh/usb-dmac.c      |  2 +-
>  drivers/dma/sprd-dma.c         |  2 +-
>  drivers/dma/st_fdma.h          |  2 +-
>  drivers/dma/stm32-dma.c        | 11 ++++-------
>  drivers/dma/stm32-mdma.c       |  9 ++++-----
>  drivers/dma/tegra186-gpc-dma.c |  2 +-
>  drivers/dma/tegra210-adma.c    |  2 +-
>  drivers/dma/ti/edma.c          |  2 +-
>  drivers/dma/ti/omap-dma.c      |  5 ++---
>  drivers/dma/uniphier-xdmac.c   |  8 ++++----
>  19 files changed, 33 insertions(+), 40 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
