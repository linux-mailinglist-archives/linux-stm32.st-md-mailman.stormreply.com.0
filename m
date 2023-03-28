Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 866226CB368
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 03:53:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33F39C6A5F2;
	Tue, 28 Mar 2023 01:53:33 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFEE7C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 01:53:31 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 o25-20020a9d4119000000b006a11eb19f8eso4414558ote.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 18:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679968410;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=NyEuKekF3ixV/ghMaaLEPqxVbnElSx+vXvln8EpC1Ds=;
 b=rDbqffMW+gw07/zmvktyhiNE3ZeouqBYjReCW39m2LjKhH1IsDyL7tezEsmbyuC/Iy
 s7l+wxRJ3TAphbEUqlbLHYHqrm4H6pGbUWNO8Y9fvgESmuU6jigRgdUn6xyHub4wuUKx
 saY75CIxdeylDyE+hF5GsNTTVtiHCebcinPJSz0ah6dgsYbZ6wlE00CKQGDKnPGUcWnt
 hPLpZRa2WNTNJj00x3pmA8FTIoYRTLfJ3LU5FbRyL5940YttMkr/MmFoI20uASK9kWw3
 aIiXc3NZslJhIZm+UXc1uBHmFo9I+YFBVnYFbwkB38v5+hkSBHCkRXl81q0nrC+CyIBd
 86nQ==
X-Gm-Message-State: AO0yUKWYKpUNlX7mJnEthI0215VECmiRAXGE7IMIzEtpFz2LaXKXjicp
 pm+BJm9TklJrTpVxYyV2lQ==
X-Google-Smtp-Source: AK7set+Ie7ktWPg++zt8jVvHXo1cAdbhkTlL7d3DAQDJwRSvs1eNXGTNVwfZwfNY7AhS2272o09lOA==
X-Received: by 2002:a9d:7441:0:b0:69c:639b:330e with SMTP id
 p1-20020a9d7441000000b0069c639b330emr6956689otk.3.1679968410464; 
 Mon, 27 Mar 2023 18:53:30 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i18-20020a056830011200b0069fa6ca584bsm6331858otp.40.2023.03.27.18.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 18:53:29 -0700 (PDT)
Received: (nullmailer pid 1306389 invoked by uid 1000);
 Tue, 28 Mar 2023 01:53:28 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230327201630.3874028-3-dario.binacchi@amarulasolutions.com>
References: <20230327201630.3874028-1-dario.binacchi@amarulasolutions.com>
 <20230327201630.3874028-3-dario.binacchi@amarulasolutions.com>
Message-Id: <167996718762.1276051.14765835681406438651.robh@kernel.org>
Date: Mon, 27 Mar 2023 20:53:28 -0500
Cc: devicetree@vger.kernel.org, michael@amarulasolutions.com,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-can@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [Linux-stm32] [PATCH v9 2/5] dt-bindings: net: can: add STM32
 bxcan DT bindings
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


On Mon, 27 Mar 2023 22:16:27 +0200, Dario Binacchi wrote:
> Add documentation of device tree bindings for the STM32 basic extended
> CAN (bxcan) controller.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> ---
> 
> Changes in v9:
> - Replace master/slave terms with primary/secondary.
> 
> Changes in v5:
> - Add Rob Herring's Reviewed-by tag.
> 
> Changes in v4:
> - Remove "st,stm32f4-bxcan-core" compatible. In this way the can nodes
>  (compatible "st,stm32f4-bxcan") are no longer children of a parent
>   node with compatible "st,stm32f4-bxcan-core".
> - Add the "st,gcan" property (global can memory) to can nodes which
>   references a "syscon" node containing the shared clock and memory
>   addresses.
> 
> Changes in v3:
> - Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
> - Add description to the parent of the two child nodes.
> - Move "patterProperties:" after "properties: in top level before "required".
> - Add "clocks" to the "required:" list of the child nodes.
> 
> Changes in v2:
> - Change the file name into 'st,stm32-bxcan-core.yaml'.
> - Rename compatibles:
>   - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
>   - st,stm32-bxcan -> st,stm32f4-bxcan
> - Rename master property to st,can-master.
> - Remove the status property from the example.
> - Put the node child properties as required.
> 
>  .../bindings/net/can/st,stm32-bxcan.yaml      | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml:27:11: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/net/can/st,stm32-bxcan.example.dts'
Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml:27:11: mapping values are not allowed here
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/can/st,stm32-bxcan.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml:27:11: mapping values are not allowed here
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml: ignoring, error parsing file
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230327201630.3874028-3-dario.binacchi@amarulasolutions.com

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
