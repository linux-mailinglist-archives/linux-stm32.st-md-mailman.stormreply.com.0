Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8D7B36E8
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Sep 2023 17:35:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70A39C6B479;
	Fri, 29 Sep 2023 15:35:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01D56C6B477
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Sep 2023 15:35:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 6D198B81FBD;
 Fri, 29 Sep 2023 15:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467DBC433C7;
 Fri, 29 Sep 2023 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696001741;
 bh=Vpxhihd/k1b+v8lMOi0CPh14iepxvm9nmqyMxT341uM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mUohr5GwY4KxfPp7cng5SPhzcshX8/sj0CmBdDbCz8fqwbhKPXDebLlBa2Juv057E
 jwSqjrWGp45ntGSONnNvLIICDEOlNaQZuxa5tbSCqpjK4GCmOeRnm58jYtLj6nw3jl
 T25k5mR5evmxPyINrndbG+XGppDAWCF8mGAse8m/bPkaUrWWVNCsSbTmAfL06eq1Yl
 gFsVkRaE1AAZPC6kxxCv4bJr9S64GajiwxcHKtCyg4W5vVVQPet7IIDbNxNEuu6wl0
 yx7/RWDX2kX7fIylD3+eFtTBZ7RvaZ2u2of9sypFtMiNvKuGKzDn5K8xZYwbyn9B7K
 p+KEh+G5xjObw==
Received: (nullmailer pid 3601359 invoked by uid 1000);
 Fri, 29 Sep 2023 15:35:24 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
In-Reply-To: <20230929142852.578394-4-gatien.chevallier@foss.st.com>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-4-gatien.chevallier@foss.st.com>
Message-Id: <169600172403.3601303.9668793596131154383.robh@kernel.org>
Date: Fri, 29 Sep 2023 10:35:24 -0500
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 catalin.marinas@arm.com, edumazet@google.com, linux-i2c@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andi.shyti@kernel.org, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 peng.fan@oss.nxp.com, richardcochran@gmail.com, linux-serial@vger.kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, ulf.hansson@linaro.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-crypto@vger.kernel.org, gregkh@linuxfoundation.org,
 dmaengine@vger.kernel.org, davem@davemloft.net, jic23@kernel.org,
 Oleksii_Moisieiev@epam.com
Subject: Re: [Linux-stm32] [PATCH v5 03/11] dt-bindings: bus: document RIFSC
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


On Fri, 29 Sep 2023 16:28:44 +0200, Gatien Chevallier wrote:
> Document RIFSC (RIF security controller). RIFSC is a firewall controller
> composed of different kinds of hardware resources.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V5:
> 	- Renamed feature-domain* to access-control*
> 
> Changes in V2:
> 	- Corrected errors highlighted by Rob's robot
> 	- No longer define the maxItems for the "feature-domains"
> 	  property
> 	- Fix example (node name, status)
> 	- Declare "feature-domain-names" as an optional
> 	  property for child nodes
> 	- Fix description of "feature-domains" property
> 
>  .../bindings/bus/st,stm32mp25-rifsc.yaml      | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml: access-controller: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml: access-control-provider: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.example.dtb: serial@400e0000: Unevaluated properties are not allowed ('access-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230929142852.578394-4-gatien.chevallier@foss.st.com

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
