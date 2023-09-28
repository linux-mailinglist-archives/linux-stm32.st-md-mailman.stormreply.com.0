Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B267C7B28EC
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Sep 2023 01:42:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C468C6B476;
	Thu, 28 Sep 2023 23:42:14 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D4FDC6B474
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 23:42:12 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-57b574c6374so5771970eaf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695944532; x=1696549332;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3RV2WVrYFvmUIy/kF4sgLaI/igSwAmnqnqr5+CNVDt8=;
 b=gTxDZmL666z+pHJqdRT0eghHOpIUo59TToKDjLeUHJENnzkQ5lwYEdjXcH/wkTdxoN
 qlWN3xrccJm0df+QK393JbtH+HEsjb4uo5MVdQy+nmQM2khVZq7KbBlkGudz4YBygbMe
 6PnhE7XPOMfwEbnke/FYinqfAj7PE9Klsvcbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695944532; x=1696549332;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3RV2WVrYFvmUIy/kF4sgLaI/igSwAmnqnqr5+CNVDt8=;
 b=IGAXmiV7T5KHYzVwcawUvKH+7LePsw8KeygC0MuVy+2TRu7EXja4SUzs3RQesNsIfe
 uyew9H2/EN2ev3Mh6Jn7MTzDqnQbpkLd2YmEt+1TdcWc7PEqA9nUNwP9UDFrKuL1zgKW
 dKaSDj9cjSFr+QEqfmqP+ywJt+nx7dQS6CEpY5WVKJ/JQo7UZUT/EJXUf8DpEdQ7pGND
 nsjXxgO9xcQ2Z8WabAwtlcA08TC1d+HEY0RNGbB1BB88fCgNT515pdBqQcmYBlAX1Hxi
 2lUxkMaeWfIOo7qh23iPYPWCKWbaZ3VGJTpInaMEdvAySMndz+mf2mAsmMOJubtIQjn6
 84OA==
X-Gm-Message-State: AOJu0YzJ/heS4NtSgYYD5rozOcKwCp6S/1YZ/HgFkvpVAVy2UXK8hGgM
 uXW0vtE9qWkiWUli7HGazD9KZQ==
X-Google-Smtp-Source: AGHT+IHBsCldxysDZTajanQY+g4dIkq4a5ohe3XveIhxwgWt0zJyzNyJaoBdNbO8ZXRuiDiGJefhMw==
X-Received: by 2002:a05:6358:2808:b0:13e:ea2a:40aa with SMTP id
 k8-20020a056358280800b0013eea2a40aamr1895209rwb.8.1695944531707; 
 Thu, 28 Sep 2023 16:42:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241]) by smtp.gmail.com with ESMTPSA id
 t6-20020a639546000000b0057a868900a9sm13316234pgn.67.2023.09.28.16.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 16:42:10 -0700 (PDT)
Date: Thu, 28 Sep 2023 16:42:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <202309281641.47911CC@keescook>
References: <20230817235428.never.111-kees@kernel.org>
 <169590216841.152265.1942803099201042070.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169590216841.152265.1942803099201042070.b4-ty@kernel.org>
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

On Thu, Sep 28, 2023 at 05:26:08PM +0530, Vinod Koul wrote:
> 
> On Thu, 17 Aug 2023 16:58:37 -0700, Kees Cook wrote:
> > This annotates several structures with the coming __counted_by attribute
> > for bounds checking of flexible arrays at run-time. For more details, see
> > commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").
> > 
> > Thanks!
> > 
> > -Kees
> > 
> > [...]
> 
> Applied, thanks!

Thanks! I've dropped them from my tree. :)

Also, I found 1 more, which I'll send separately.

-Kees

-- 
Kees Cook
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
