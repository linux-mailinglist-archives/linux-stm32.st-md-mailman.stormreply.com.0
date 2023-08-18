Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C7780840
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Aug 2023 11:29:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2AE0C6B472;
	Fri, 18 Aug 2023 09:29:30 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D765EC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 09:29:29 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-522dd6b6438so842344a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Aug 2023 02:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692350969; x=1692955769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jTPWfjzgiS6MREC/CQy9YZ7a0Ba4pXdxJTPBP//ZxkQ=;
 b=ChP1wEg29yXYxpK7J9uqfILfPe/L9xBS0HNQPXH54y1zGDEvcdwljY5HVw15zrjTzx
 VpGb3h1ffXsIXv8NTndpsLQEcYlTmf6GA/8cPAvQ5OUfezNHFsG8dA4nQbmzYXZ+EEL/
 +E2hg2SAdUHITLhvITSusy2v1ZLvoO2kw3JiBht3/qHk2OjQyiKqn5GvDCtklD/qqqOS
 WHA7JqYdvqZ/Rjg0POkhOL40Q+5AYUtbCVBLV0PI/oamzCz/eMWcPzEw4/GQHHTTUYwt
 OWzP/mRyk+KkHBFUux84C272URdVjJQPiQUdj9yjv5T/igPb7VaLMxL8ciSwoEZ9ARB8
 hxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692350969; x=1692955769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jTPWfjzgiS6MREC/CQy9YZ7a0Ba4pXdxJTPBP//ZxkQ=;
 b=R58QrWgkrcay8elyM/CgSbqfprEQNUKmSZ68Qel5aFY2DH/NCjpAwHYkCzI7zMC50q
 o4CFlyMfCN3wQDbXPLXfZ5OjFZ3kepx9VIY8dPKYGZqGqR1zM0yC5Q9IcyLhK53jDK9m
 CGkV55su6en0SS7MzpwFwMFC76PsLBuB3y/PtocHCnHirKoVCPHKRqaLQm+OusCW6QpZ
 RQtHDXX2O3lEY6WHr+YFi2YO0m4u1aeUYNl0zJ9vDMi4FgyVoz66vSJ1VIzF/Nmu/+wi
 OncyN6jcQkXrbaGuypQTJAMZY/but3vxpaEf+ykV7lumWAKG1cYEjm9aSWYJD5yuKk+N
 yYpQ==
X-Gm-Message-State: AOJu0YwQa6ylYPwPsn7GLOcFL+qHAYlJmL/qwjkEw9T6ls5WmqCzdixR
 GrR+IHMmEXEkpNWwpsI03htR7A==
X-Google-Smtp-Source: AGHT+IHd1/56PSeqitQJGalEGxXcH26drQEeAdG2dzNVUp/FxWHNv/06+iWRebGIeZUvbnvpxSWWDA==
X-Received: by 2002:a05:6402:5154:b0:525:466c:5fda with SMTP id
 n20-20020a056402515400b00525466c5fdamr1836205edd.28.1692350969335; 
 Fri, 18 Aug 2023 02:29:29 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.195])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a056402149a00b005233deb30aesm857895edv.10.2023.08.18.02.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 02:29:28 -0700 (PDT)
Message-ID: <d1c285ff-5eef-4dae-dde0-8946162f19ac@linaro.org>
Date: Fri, 18 Aug 2023 10:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
To: Kees Cook <keescook@chromium.org>, Vinod Koul <vkoul@kernel.org>
References: <20230817235428.never.111-kees@kernel.org>
 <20230817235859.49846-2-keescook@chromium.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230817235859.49846-2-keescook@chromium.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Thierry Reding <thierry.reding@gmail.com>, linux-hardening@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lars-Peter Clausen <lars@metafoo.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 asahi@lists.linux.dev, Jie Hai <haijie1@huawei.com>,
 Sven Peter <sven@svenpeter.dev>, linux-arm-msm@vger.kernel.org,
 Green Wan <green.wan@sifive.com>, Nathan Chancellor <nathan@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Yu Kuai <yukuai3@huawei.com>,
 linux-tegra@vger.kernel.org, Jordy Zomer <jordy@pwning.systems>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 02/21] dmaengine: at_hdmac: Annotate
 struct at_desc with __counted_by
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



On 8/18/23 00:58, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct at_desc.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: dmaengine@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/dma/at_hdmac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
> index b2876f67471f..b66c7f416881 100644
> --- a/drivers/dma/at_hdmac.c
> +++ b/drivers/dma/at_hdmac.c
> @@ -239,7 +239,7 @@ struct at_desc {
>  	bool				memset_buffer;
>  	dma_addr_t			memset_paddr;
>  	int				*memset_vaddr;
> -	struct atdma_sg			sg[];
> +	struct atdma_sg			sg[] __counted_by(sglen);
>  };
>  
>  /*--  Channels  --------------------------------------------------------*/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
