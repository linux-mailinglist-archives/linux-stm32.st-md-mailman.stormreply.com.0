Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D6C6443CF
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Dec 2022 14:01:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 745CBC65E6C;
	Tue,  6 Dec 2022 13:01:42 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED01DC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Dec 2022 13:01:40 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 m6-20020a9d7e86000000b0066ec505ae93so3643627otp.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 05:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7Hbffxdj76xYFdF4l0QY3Nbhb00ty2h6F92vl5ePeM=;
 b=N47/cBVevKyXrvywDFCCxgxrNAHeJA0vS965e3PsPmLCPMhcAtxC9bfzJBpzNBtbQR
 q/R+8qwunNj/bU/0n5FxozHF9urXoAduZv792eh75F3m2dpG0XFakORORdIWqurcLg08
 c67h85QRD6ngWWHeFJIWqJDAIil6ciF9v5d4NnNIG2+tsdGrBnaXodctfKaqW9e+flPK
 3+i1NOH/M+Qs+ztAWlqY21QeZoO1rdtstpO66qit2Mj3R0CItHuXdrYmkBmzD22ztUsQ
 mVM59yWKM54hEfyLSBa+YHdSPd53jKJRSOk//DWdHYl39pBFPnd1na4CtIHbq8YoTfDx
 Ewsg==
X-Gm-Message-State: ANoB5pl6Vke7HN3e305XuD3Ig87jxx9YO6SU9u9ms1ptnIT2BfHHlH7r
 Q9T0npLzJci01hh/Putpgw==
X-Google-Smtp-Source: AA0mqf4k5ByXOavEm8wTJJndBCnqCb7kXMspArChR3P/1CC6EiJONndeKfl7Me39LQ6wRjgZBQUqlg==
X-Received: by 2002:a05:6830:110e:b0:661:c5ac:7324 with SMTP id
 w14-20020a056830110e00b00661c5ac7324mr44543682otq.179.1670331699671; 
 Tue, 06 Dec 2022 05:01:39 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g33-20020a9d2da4000000b00661af2f9a1asm9201988otb.49.2022.12.06.05.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 05:01:38 -0800 (PST)
Received: (nullmailer pid 224048 invoked by uid 1000);
 Tue, 06 Dec 2022 13:01:37 -0000
Date: Tue, 6 Dec 2022 07:01:37 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <167033169684.223985.8563268980146610337.robh@kernel.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
 <20221205151845.21618-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221205151845.21618-2-krzysztof.kozlowski@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jeff Chase <jnchase@google.com>,
 Joe Tessler <jrt@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [Linux-stm32] [PATCH v2 1/9] media: dt-bindings: amlogic,
 meson-gx-ao-cec: move to cec subfolder
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


On Mon, 05 Dec 2022 16:18:37 +0100, Krzysztof Kozlowski wrote:
> Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
> unneeded quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
>  MAINTAINERS                                                   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
