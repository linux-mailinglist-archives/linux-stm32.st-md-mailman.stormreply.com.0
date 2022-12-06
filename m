Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D443B6443D1
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:02:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94948C65E6C;
	Tue,  6 Dec 2022 13:02:02 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47C81C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:02:00 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 db10-20020a0568306b0a00b0066d43e80118so9208079otb.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:02:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxyzSpVUM6V4RTMjWwsFrePRYZPHGH5eY9Ph8J0tqOI=;
 b=At1U+Y614Q4vcvvpAwVJBHKNEvvcgopNPUF29G7z2TacNaL11cDVssecoT511eHtQR
 Lb0zt4oI1m6DdrgguM2EVa8+Er+UKLUEGGBmLzMiMeEWLe5OC/21UZnyve9HDWxAfrG8
 WkMcfafQIyVqShzSC5kvtqnBp9iCRFgyOKSKXEM6RnGo05Eu6nsV2NUL6g6R5xVhJJud
 GJeyBO2ASIAsVJQGmD1LCdcy5fNjRTI04k6ZgnNJrMjnC0yYx38QK+f4cNefuNWXUPTk
 m27dq/jcNZdcpN/QRNqu4bA9IMpBKC5Rp9aQZ9J1UGhIwHtlB5L5qDkSiN4TYlZ6TwRj
 IWXg==
X-Gm-Message-State: ANoB5pkr7mizJjKnM7Uoo17iZ6IewHqCY9bb4bt722aWhxCbQxcUsSTE
 X5aFD6jENYwrupktZs8dHg==
X-Google-Smtp-Source: AA0mqf5JtrErllTMHorfM6i5uxzu4uWCVJfdLClwhU/c9p+zrauUfEIH4B6EJ8k4ODNVyVX99wU39Q==
X-Received: by 2002:a9d:6c10:0:b0:661:94ac:a555 with SMTP id
 f16-20020a9d6c10000000b0066194aca555mr31883302otq.291.1670331718884; 
 Tue, 06 Dec 2022 05:01:58 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y35-20020a056870b02300b0013bc95650c8sm10618089oae.54.2022.12.06.05.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:01:58 -0800 (PST)
Received: (nullmailer pid 224573 invoked by uid 1000);
 Tue, 06 Dec 2022 13:01:57 -0000
Date: Tue, 6 Dec 2022 07:01:57 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033171648.224515.10474001869932196398.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-3-krzysztof.kozlowski@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v2 2/9] media: dt-bindings: st,
 stm32-cec: move to cec subfolder
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


On Mon, 05 Dec 2022 16:18:38 +0100, Krzysztof Kozlowski wrote:
> Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
> "bindings" in the title.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
