Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629C644409
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:05:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F2AFC65E6E;
	Tue,  6 Dec 2022 13:05:55 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DF31C65E6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:05:54 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 v19-20020a9d5a13000000b0066e82a3872dso7178159oth.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U7j3ufR+17LIatwXfzkS37AMrM5wspfABSKG5ziauPQ=;
 b=6acDb0vqsI+OGVV7vTZFQ+jdyUOAX5ry7N6C1/7qOb1Z7AYIjiWf6O+R7jSk8rvzG3
 duDQZ9K1hevrJIu46IgWOGf3VTrPFc2TwDPIntzInCTF2ycLFVCN1hBvPh45L6A396t1
 dfd7Jt4H+KAfqxX5qLJzPanElybgTJuQiGQF1X7qVj6b2l31q4t5cqDa3wsuRkyH2i8w
 CMBDa4DsueuZpfapji5SNEXy3H4+zpVDhCvcWrxkDbgEPST2VOennJeiVue/vcPUlaRY
 XPZLEaHcwIbOg1obZECDexjHBPczE0jxy+epKtlx7tEyRVTxVirlXkSNBhQFd293t0dc
 pt3A==
X-Gm-Message-State: ANoB5plk0RhyAddDjK3VhkSC+XMprQZuAFlqQCT2ux/50a0N/GkOoQcV
 WVkg5Kt15TIBYGx2RzY2zg==
X-Google-Smtp-Source: AA0mqf6fMNQa1MZRHTu4Mys3lQ0bmDkZi6wAqFtT3FMcdVbZJcgwFXkLbhyX3YOzWrZ33rTdzoJTUg==
X-Received: by 2002:a05:6830:698f:b0:66c:57d2:54fc with SMTP id
 cy15-20020a056830698f00b0066c57d254fcmr35241262otb.378.1670331952892; 
 Tue, 06 Dec 2022 05:05:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a10-20020a056870d60a00b001438fb3b0a0sm10568716oaq.44.2022.12.06.05.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:05:52 -0800 (PST)
Received: (nullmailer pid 230603 invoked by uid 1000);
 Tue, 06 Dec 2022 13:05:51 -0000
Date: Tue, 6 Dec 2022 07:05:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033195070.230546.1336389323664376235.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-10-krzysztof.kozlowski@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v2 9/9] media: dt-bindings: st,
 stih-cec: convert to DT schema
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


On Mon, 05 Dec 2022 16:18:45 +0100, Krzysztof Kozlowski wrote:
> Convert ST STIH4xx HDMI CEC bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/cec/st,stih-cec.yaml       | 66 +++++++++++++++++++
>  .../devicetree/bindings/media/stih-cec.txt    | 27 --------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 67 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/st,stih-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/stih-cec.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
