Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 166936F9C7A
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 00:26:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E830C6A5F7;
	Sun,  7 May 2023 22:26:00 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C360AC69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  7 May 2023 22:25:59 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6aaffc866c4so168430a34.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 07 May 2023 15:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683498358; x=1686090358;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VpWqNIlJw+7CO0eWEfIgZRQ39Q5s0pfacaQXx8477ls=;
 b=aEZJ8UrtRIcdfGGFWYKQ665ox7I9cwRxlfjvy2dug0YQW5pCONQwBIe0zH5VTooI8t
 3jHmiP6+wKOMFoRX4AAOmgw9RgQdUuqklvm3qxKVa2a3XgqxRpDBQbgUoA03bnPKa4Po
 GmM3sPZ1ieJf7ELcn+Nut7dT0so1C+ZxdisXMo1slVKeWFhpAMEh90tlwFXOhIxewLkm
 dlXeClgN49htMNafGwh+RKbdbEt9mz1UfsDPLSM7x/bVw3m8ACJqryfpIyLfuRipU5kC
 jcGo1J8fQr6u+mubFcy92LaNZEJV89+LWa6zmeXGG926mxkOC1k+sIU+HCOt3GA2/Whj
 8QhQ==
X-Gm-Message-State: AC+VfDw0TMiOgCw15PSF3zxmLiKis2ugLXGgkQu1knQaOoyLWJej6x0z
 sf9oFA2p8Bg7hbC+msT2wQ==
X-Google-Smtp-Source: ACHHUZ4fdihyY3NFB3jckF8J6LZVmJemoKIWNMGmuDyNK5vUTaBRQcXBFBdMOpnNbmwbzuVba8b4Kw==
X-Received: by 2002:a05:6830:1357:b0:6aa:f549:2472 with SMTP id
 r23-20020a056830135700b006aaf5492472mr2230260otq.14.1683498358476; 
 Sun, 07 May 2023 15:25:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k3-20020a9d7603000000b006a44338c8efsm3572194otl.44.2023.05.07.15.25.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 15:25:57 -0700 (PDT)
Received: (nullmailer pid 3623288 invoked by uid 1000);
 Sun, 07 May 2023 22:25:56 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
 <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
Message-Id: <168349835606.3623231.4270033272905089508.robh@kernel.org>
Date: Sun, 07 May 2023 17:25:56 -0500
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: gpio: Add STMPE YAML
	DT schema
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


On Sun, 07 May 2023 23:19:19 +0200, Linus Walleij wrote:
> This adds a schema for the STMPE GPIO that while it is used a
> lot in the kernel tree is anyway missing its bindings.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Use a compact hog node schema backed by the standard hog
>   schema.
> ChangeLog v1->v2:
> - New patch split off from the MFD patch.
> ---
>  .../devicetree/bindings/gpio/st,stmpe-gpio.yaml    | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml

doc reference errors (make refcheckdocs):
Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org

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
