Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A006762080
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 19:49:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F230C6A61A;
	Tue, 25 Jul 2023 17:49:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2D30C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 17:49:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9178616E0;
 Tue, 25 Jul 2023 17:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89EBC433C9;
 Tue, 25 Jul 2023 17:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690307380;
 bh=RU1yt+0Cu3kvPsoECxJVmwUh0wZQeJo4rj4qI+5pd+0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=luJ/sojL/eju59UKvv7KPRUv5zpARMbC8f1KoW1mcTCaBI95NpBwjsFS+jjMlnEra
 UwRBdCUoOpeQ+PRT23Y9eKuLemPcL8WAUCKUwypqaKayAms4+JmGoK7UpHX8glvsqL
 WcsQ5CafV2BdB6y5os43l4smEcGY8FPjbW0ZYz7uYTYdwzTmoReIhsKN7y/IaCuWHd
 8qSOXqN6EeKAJ8r6RE1UO/5CxmHKtnm4hVP4txEBXkBTttne30yHuWBkHkKp6A9S5q
 HMCvrugtwMy1R9TziQ8J6Ie10YG/5nmHIJBy++pNRTbOPeVG/gsG31kFEfY1eZUmIN
 uGJVoAGjxh2PQ==
Received: (nullmailer pid 3497937 invoked by uid 1000);
 Tue, 25 Jul 2023 17:49:25 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
In-Reply-To: <20230725164104.273965-3-gatien.chevallier@foss.st.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-3-gatien.chevallier@foss.st.com>
Message-Id: <169030736432.3497864.4682647411146090051.robh@kernel.org>
Date: Tue, 25 Jul 2023 11:49:25 -0600
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org,
	catalin.marinas@arm.com, edumazet@google.com,
	Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
	linux-phy@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	herbert@gondor.apana.org.au, hugues.fruchet@foss.st.com,
	lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	conor+dt@kernel.org, andi.shyti@kernel.org, will@kernel.org,
	richardcochran@gmail.com, robh+dt@kernel.org,
	linux-serial@vger.kernel.org, mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
	linux-i2c@v.st-md-mailman.stormreply.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	vkoul@kernel.org, linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	ger.kernel.org@stm-ict-prod-mailman-01.stormreply.prv,
	alsa-devel@alsa-project.org, davem@davemloft.net, jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 02/11] dt-bindings: bus: document RIFSC
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


On Tue, 25 Jul 2023 18:40:55 +0200, Gatien Chevallier wrote:
> Document RIFSC (RIF security controller). RIFSC is a firewall controller
> composed of different kinds of hardware resources.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.example.dtb: serial@400e0000: Unevaluated properties are not allowed ('feature-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230725164104.273965-3-gatien.chevallier@foss.st.com

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
