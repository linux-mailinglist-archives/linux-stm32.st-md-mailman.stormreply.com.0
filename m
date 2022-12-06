Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 308926443D7
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:02:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF03FC65E6E;
	Tue,  6 Dec 2022 13:02:47 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35B02C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:02:46 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id
 t15-20020a4a96cf000000b0049f7e18db0dso2139839ooi.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A4xw/+ywJXT3DJB58fwNh/xTT90tKd1q3hEDbHNq8ZI=;
 b=tcInw0UFiIa6pvBpgAzFF0FrOwlnpQft4ECaUYpnNADgtKTSMCoEtHjXLHEmA4CZ35
 SerSHkhHyDOSnaznPnqns50HGgj1YDC78RTwn0fGvwb9FdjOG5mBRVD23YVarBilsRai
 HTbxXcBWbOQTZoN7I4gxOnWE7wkrE7HDON7GuHE4bPYzabxVKNQQIVXId7qR2YJ8Xhlh
 qFBziX9ec31SN0nVPRwslrEW4tyyXlUpl0TUMCiakMLB68t/tCzhANTruqbHSHR772tW
 /ZOXxs48YfJi7eTQ9Z4LrJyWsjL2hL0C71r5kUzgbX080V1Jo15kswCfCGSCeWTfs+o3
 XX9g==
X-Gm-Message-State: ANoB5pl2mX5rOXzT5zgSc9oEoHXOSQanweu5RVItWx+YwF4ToXjP9/00
 efViGPtUDkzXb5tnCMTnZA==
X-Google-Smtp-Source: AA0mqf43zncrSVF/3luC/HIGUW+nK43yAhxSLf/Tk1XAQeHQa4RnY5NNOQwlENA38AbtEYq7O7vwjw==
X-Received: by 2002:a4a:ad49:0:b0:49b:c0e:3d5f with SMTP id
 s9-20020a4aad49000000b0049b0c0e3d5fmr36865349oon.69.1670331764762; 
 Tue, 06 Dec 2022 05:02:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s11-20020a4ac10b000000b00499527def25sm1547158oop.47.2022.12.06.05.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:02:43 -0800 (PST)
Received: (nullmailer pid 225694 invoked by uid 1000);
 Tue, 06 Dec 2022 13:02:42 -0000
Date: Tue, 6 Dec 2022 07:02:42 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033176212.225636.18251903992063817307.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-4-krzysztof.kozlowski@linaro.org>
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
Subject: Re: [Linux-stm32] [PATCH v2 3/9] media: dt-bindings: cec: convert
 common CEC properties to DT schema
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


On Mon, 05 Dec 2022 16:18:39 +0100, Krzysztof Kozlowski wrote:
> Convert common HDMI CEC adapter bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  .../devicetree/bindings/media/cec.txt         |  8 ------
>  .../bindings/media/cec/cec-common.yaml        | 28 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 29 insertions(+), 9 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/cec.txt
>  create mode 100644 Documentation/devicetree/bindings/media/cec/cec-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
