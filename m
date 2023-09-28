Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C97B2003
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 16:47:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F684C6B462;
	Thu, 28 Sep 2023 14:47:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09287C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 14:47:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A740061CCE;
 Thu, 28 Sep 2023 14:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D52C433CB;
 Thu, 28 Sep 2023 14:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695912442;
 bh=Yqv4ybBi58HnuL+bzF0z8/TsxzS8ktMKAJWJgCPHa+Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lJ4cBFtg7YmRBEZR8ALXzGUBVrqqOpbJxcQjtUT1DP0DisNwZ186VdPe6bub9LfdZ
 V0mf+YJ8aavSENSnoQtOw9GXAshtY/RTY0M82kiHXT5ppzE8//01JjL+JB/LJQHdgs
 xgiVBYjq9B7KiB0SpzfWwMUx3wvnyvtdSKAdBsr+c6ZHyGSVStAcXmVLeojQnzO6F7
 00ujCCgemOOPtG0dxZAJZBMObfJhJBHrfNUONyon8PwhIejB/pOamY8pFaqv3LCb+Z
 Fq3gtpVwlv74tXzf+pONprrZ+D9iG2YAGfqMyFfHeBHlVbKfKIaegHI49kvrJyOLVO
 JdpiW7S15zENg==
Received: (nullmailer pid 408738 invoked by uid 1000);
 Thu, 28 Sep 2023 14:47:11 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
In-Reply-To: <20230928122427.313271-3-christophe.roullier@foss.st.com>
References: <20230928122427.313271-1-christophe.roullier@foss.st.com>
 <20230928122427.313271-3-christophe.roullier@foss.st.com>
Message-Id: <169591240912.408297.5448136157647549306.robh@kernel.org>
Date: Thu, 28 Sep 2023 09:47:11 -0500
Cc: Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/12] dt-bindings: net: add new
 property st, ext-phyclk in documentation for stm32
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


On Thu, 28 Sep 2023 14:24:17 +0200, Christophe Roullier wrote:
> Add property st,ext-phyclk to manage cases when PHY have no cristal/quartz
> This property can be used with RMII phy without cristal 50Mhz and when we
> want to select RCC clock instead of ETH_REF_CLK
> Can be used also with RGMII phy with no cristal and we select RCC clock
> instead of ETH_CLK125
> This new property replace st,eth-clk-sel and st,eth-ref-clk-sel
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/stm32-dwmac.yaml:82:6: [warning] wrong indentation: expected 4 but found 5 (indentation)
./Documentation/devicetree/bindings/net/stm32-dwmac.yaml:83:7: [warning] wrong indentation: expected 7 but found 6 (indentation)
./Documentation/devicetree/bindings/net/stm32-dwmac.yaml:86:5: [error] syntax error: expected <block end>, but found '<block mapping start>' (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/net/stm32-dwmac.example.dts'
Documentation/devicetree/bindings/net/stm32-dwmac.yaml:86:5: did not find expected key
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/net/stm32-dwmac.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/net/stm32-dwmac.yaml:86:5: did not find expected key
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/stm32-dwmac.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230928122427.313271-3-christophe.roullier@foss.st.com

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
