Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3086443F7
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:03:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6ADFC65E6F;
	Tue,  6 Dec 2022 13:03:56 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27FE1C65E6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:03:56 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso7174923oth.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:03:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MXIFyP+UTIEk0Yojx26A5iXgnHl9m8JY0GBl53V7tbQ=;
 b=Nxx+2ZBYQaTc2XfCV4J0B31xMJ7md3rnVCtekDfBu/0TdsbGNkxE3VVo3sZI/b7dzL
 SjXE14rQk1aLajxGSPNnnCJwZA/x8aYh7PPWH41SwnEL+IehsBH7ID3CUlIsF15ZyTGv
 EaBWfdKNV33+M0duG6DfkdH4pxbI0B5UCBWEg8m3yeIiyjMIFi+AEhCs4Nv6+xFWzbxJ
 dwhACMKL/tUejf+ZlbQeUC1z9U84FAVQ5cJdg0WvmSHZx4oFozb9yZ6z6dOkjm2t5Zb9
 l9bc3sSgINiKK18BiVAbozJyQMzmIr8hWMrZZZLF/n4oth54MPDYnUacVr7bq5fUICIY
 Pn9g==
X-Gm-Message-State: ANoB5pnV2QqseYymb7IhM41Y7CUyo8jG4HIjYX2sAGeTlgVTDMu0QlSw
 NqnVnkapITu178Bs4P560g==
X-Google-Smtp-Source: AA0mqf7Q/7VtDzt3A993Wg1brZgvtLz+mD83kkYPL9YunOoWHl5PrH+2cBdscmR+RDa3oJj02LwLrA==
X-Received: by 2002:a9d:578c:0:b0:66e:66c7:9f71 with SMTP id
 q12-20020a9d578c000000b0066e66c79f71mr15134597oth.333.1670331834777; 
 Tue, 06 Dec 2022 05:03:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h3-20020a9d6403000000b0066de9dc966fsm8861582otl.65.2022.12.06.05.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:03:51 -0800 (PST)
Received: (nullmailer pid 227640 invoked by uid 1000);
 Tue, 06 Dec 2022 13:03:50 -0000
Date: Tue, 6 Dec 2022 07:03:50 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033182977.227580.3241593783297091470.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-7-krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jeff Chase <jnchase@google.com>, Joe Tessler <jrt@google.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 6/9] media: dt-bindings: samsung,
 s5p-cec: convert to DT schema
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


On Mon, 05 Dec 2022 16:18:42 +0100, Krzysztof Kozlowski wrote:
> Convert Samsung S5P HDMI CEC adapter bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/cec/samsung,s5p-cec.yaml   | 66 +++++++++++++++++++
>  .../devicetree/bindings/media/s5p-cec.txt     | 36 ----------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 67 insertions(+), 37 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/samsung,s5p-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/s5p-cec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
