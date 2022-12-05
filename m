Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573F642B04
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 16:07:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09037C65E60;
	Mon,  5 Dec 2022 15:07:54 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D048C65067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 15:07:52 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-144b21f5e5fso1788162fac.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 07:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=un2tfy4ahNo9zjbkY7O4xE/RSkvkF3i02AWzGP/4rig=;
 b=TYQUTzlDcx09pxmksYXeTc01oZF9ob90KprHQEokzb+6UsxiXamVM0zQYCzBTivyxz
 UcMDtoy+OEuyu1Hsf65YDBC55G1opz8TflahFiIj6qnN2W62IUVS9Wa9ifKrQGGMtb8s
 gvs0sEQMY+qLHNocGXnJlSzSlhe8oflMlK9lAawP4XHV54tvwXB4mH9B95djNAxip/JZ
 uTZ1wX0/uD5m4UFx0PeO/ymsjgnmw0SCgxMa4UrojP7TbD/RXpQJcdqa/MqpWm/njOUP
 2SpdK8q4eBvFWx22C0rYip/7gBVXFEdCEalx20aWmW/4Os6QocB6sKVZsdHdYVDsMxze
 rQVw==
X-Gm-Message-State: ANoB5pllCppAmE7cGxy9ZD1YJl/xnrQi2Bny6X5ZRh7eWZ6tcOmomREI
 aQ7iNYtwF7VnIeXNOjTRIQ==
X-Google-Smtp-Source: AA0mqf4u4kzZ1ZBWoQtzp872W52LKIVRXUvm43N91ZDjaWGZJYwEgFGMaehPuBK+w9wgO1cB9V4ooA==
X-Received: by 2002:a05:6870:ee16:b0:144:a24c:e1cb with SMTP id
 ga22-20020a056870ee1600b00144a24ce1cbmr2227077oab.164.1670252870872; 
 Mon, 05 Dec 2022 07:07:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y30-20020a9d22a1000000b0066ea9650da8sm3195971ota.20.2022.12.05.07.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 07:07:50 -0800 (PST)
Received: (nullmailer pid 1794161 invoked by uid 1000);
 Mon, 05 Dec 2022 15:07:49 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
Message-Id: <167025248440.1785019.8058849269946787324.robh@kernel.org>
Date: Mon, 05 Dec 2022 09:07:49 -0600
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
Subject: Re: [Linux-stm32] [PATCH 5/9] media: dt-bindings: chrontel,
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


On Sun, 04 Dec 2022 19:29:04 +0100, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/media/i2c/chrontel,ch7322.yaml   | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.example.dtb: ch7322@75: $nodename:0: 'ch7322@75' does not match '^cec(@[0-9a-f]+|-[0-9]+)?$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.example.dtb: ch7322@75: Unevaluated properties are not allowed ('hdmi-phandle' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221204182908.138910-5-krzysztof.kozlowski@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
