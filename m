Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA8078063B
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 09:19:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42C1BC6B472;
	Fri, 18 Aug 2023 07:19:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F5ABC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 07:19:35 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4ff9121fd29so818677e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 00:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692343174; x=1692947974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3WLOotOOz6Whg1Mj8YD4tZ6eErSJfZzqhK5ewDoU7mk=;
 b=IajLjVccbpcsXfF6OU5/ko/nIqNPbKcFd6e2aT5W9pBlW3XQUm0m8EFelVlZe6qRYL
 hWfKGC6zkHirHD0Vk6UA4I7/2OUev/lpIE9w4wAGxOAcRDp9fy8tvwY3PaRb713hq5Gl
 Ys5PXLIU5EDvX9oI3MBIkzEaQc7cILrdOSuLwl1tEdn8tlxG3g2fibsJ/q6uhZAu2ku7
 aE18AjUnFuVL9CSUtFtOHehtPsngPwBUaJYyEiaOqsSEZyqN18nC2K89Z4vNHRSAU4rp
 RAR3IFqyKlGJRvP7D4qX+wkF2V7I7PY6OmNwO+F3SO9HC6Tuim6u5wHSzb3xNeRTA52I
 RWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692343174; x=1692947974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3WLOotOOz6Whg1Mj8YD4tZ6eErSJfZzqhK5ewDoU7mk=;
 b=fkqAfONiIQtxXIae+LO2dVMBR+l3EDxXYkNmnGAubQ95G8M/kG79FQwHP4uptpMbV6
 zuaJQ8KJycaAo0tscxsTQHIs8WkB/fmCo9va1Iz9s3OuijJX4Rf8mUvGTSKspQoRsjEK
 KA/6gtiOQZBeIBBrANYpKS97MYNG1PcMa7WZMXxwSV3tl/Tklc8qDddZZiWvYWlAwllY
 MeXyic4yEwOunZvK75fkn+uEgChl0zust63l/vKYKnlgz7WuHjDscqjuPwpNaYlsNBFt
 FZeUlXE8U2Sm/rgzsXqX78AC2j/vJtEDxENZmGTIULD37Dfv8Kjls/4qHplNNPencWX+
 hPwQ==
X-Gm-Message-State: AOJu0Yz+pyEEUPoOD3iBKDMHf5lzogC59ZW/Nyk6A0F7GG2hIpHc304w
 tohX1ihZcxBoDg9QGfBFZSkyU0uyT18+Je5LG48=
X-Google-Smtp-Source: AGHT+IEH6Jq48dkRZ4ezmCDNiEhdIsVUoXZNVTgzFF8vUlSHsXfot+cfT4CogWsvKA/tHn7Z/98bxJ7Qo34oYIi4M4s=
X-Received: by 2002:a05:6512:2202:b0:4fe:ef9:c8d0 with SMTP id
 h2-20020a056512220200b004fe0ef9c8d0mr1268562lfu.35.1692343174179; Fri, 18 Aug
 2023 00:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-10-keescook@chromium.org>
In-Reply-To: <20230817235859.49846-10-keescook@chromium.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Fri, 18 Aug 2023 15:18:57 +0800
Message-ID: <CAAfSe-s_XMzqMLsGpvZoeDBm8+ugJwTYoCDC7g0Yx4dJgsJ6wA@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lars-Peter Clausen <lars@metafoo.de>,
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
 Nick Desaulniers <ndesaulniers@google.com>,
 Zhou Wang <wangzhou1@hisilicon.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 10/21] dmaengine: sprd: Annotate struct
	sprd_dma_dev with __counted_by
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

On Fri, 18 Aug 2023 at 07:59, Kees Cook <keescook@chromium.org> wrote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct sprd_dma_dev.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/dma/sprd-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
> index 168aa0bd73a0..07871dcc4593 100644
> --- a/drivers/dma/sprd-dma.c
> +++ b/drivers/dma/sprd-dma.c
> @@ -212,7 +212,7 @@ struct sprd_dma_dev {
>         struct clk              *ashb_clk;
>         int                     irq;
>         u32                     total_chns;
> -       struct sprd_dma_chn     channels[];
> +       struct sprd_dma_chn     channels[] __counted_by(total_chns);
>  };
>
>  static void sprd_dma_free_desc(struct virt_dma_desc *vd);
> --
> 2.34.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
