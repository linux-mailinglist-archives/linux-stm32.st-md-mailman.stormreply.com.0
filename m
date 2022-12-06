Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 178BE6443ED
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:03:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D39B6C65E6F;
	Tue,  6 Dec 2022 13:03:27 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA20C65E6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:03:26 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id n205so16816563oib.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/rhl8A2LmGiFpiqJZUQMjFZh8zPPfjZ5d/GnnGY7hE=;
 b=C1K8LDgeubApxg49oJC20TQOuAttkaocPaafGWAX//dOkcHSdcdyB2BOPAso+NMSzy
 UjJIIR84Qiob4YOSnlasYzH689tbuXOilz2x8F+aqoCZAq2mXlk5AxvsGbL4YUb8JH0E
 IT3QKhzhUWv4itiDnPCWVTmf6K2yqG9DfVEK+8NR8zgupMpLnHNp9PDvbfRzG9+4KTCe
 mGeq0xWI+H2tlWBqlvIjMd98cQHgVVPUI7l4aWeyUGU9UZGEiA/NRDSr0kOcfY774xCz
 38oJdRPl2n8TCf7LYKdO7rkZs8/TWU6JaxcQ9JcurFluyKhls5VGxN05JmVpQbq67n3u
 Bkxw==
X-Gm-Message-State: ANoB5pmEer3v7asFSpUm/74oOqRCwQZo5zrGkm3UAmzR5QbRNcHKxR+h
 G5JCTM0YScW6u9VNGGlxUg==
X-Google-Smtp-Source: AA0mqf7Ot/umK5fnMfyAlv+iZ1LRDQEusBhDifCXxjp48bJ1W4lhwy7s7Mz6V/1NxN8Ex6D5o4LGSA==
X-Received: by 2002:a05:6808:1452:b0:35a:812c:3eae with SMTP id
 x18-20020a056808145200b0035a812c3eaemr42973469oiv.218.1670331805265; 
 Tue, 06 Dec 2022 05:03:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v10-20020a05687105ca00b00143776f70d3sm10638605oan.29.2022.12.06.05.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:03:24 -0800 (PST)
Received: (nullmailer pid 226920 invoked by uid 1000);
 Tue, 06 Dec 2022 13:03:22 -0000
Date: Tue, 6 Dec 2022 07:03:22 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033180245.226868.8088580036081648142.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-6-krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jeff Chase <jnchase@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Joe Tessler <jrt@google.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 5/9] media: dt-bindings: chrontel,
 ch7322: reference common CEC properties
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


On Mon, 05 Dec 2022 16:18:41 +0100, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.  The common CEC
> binding expects also node name to be 'cec'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Fix node name to cec.
> ---
>  .../bindings/media/i2c/chrontel,ch7322.yaml           | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
