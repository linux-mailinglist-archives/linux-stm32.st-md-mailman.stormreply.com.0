Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AE47635E3
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 14:13:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75E0BC6B45B;
	Wed, 26 Jul 2023 12:13:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 91713C6B459
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 12:13:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 27D8661A66;
 Wed, 26 Jul 2023 12:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73356C433C8;
 Wed, 26 Jul 2023 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690373578;
 bh=Ke8AONnAOWupVgvu9a1rrtccA5xWjVMePJQxM8Ht3Kc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gYrqFr8wvj2MJmmwmwf8M6I8rekTV9+bxmW2rqLD55Qm7Z/X+3fqo2oPfopkxdlCi
 n241AQBCMxM7eFrih3i3Sbv5AKj0bq28ozziIAExFd7E/RXMMNS1aKn+yJARtnBmU4
 FfN14X79faCpLGre6x+vnvwoxjIsG/L/ooLw+V13rcjVx7tIPmq/1O2zG9aawBpzTf
 uhcvPI4MEqZ0fNFaHRBAISQWggi8tN88wV4MzFoUqwVN0pOsQ3BgyiTak4/MrtL+0t
 6GpQd+/9rUTZVGi45edSMIe9j4qSBoulHPW7gK71wysfs2CSJoMHtELswVidt7IBP2
 x+DypAIC/tqTg==
Received: (nullmailer pid 1182938 invoked by uid 1000);
 Wed, 26 Jul 2023 12:12:54 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
In-Reply-To: <20230726083810.232100-2-gatien.chevallier@foss.st.com>
References: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
 <20230726083810.232100-2-gatien.chevallier@foss.st.com>
Message-Id: <169037357425.1182922.8121576517266921442.robh@kernel.org>
Date: Wed, 26 Jul 2023 06:12:54 -0600
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 catalin.marinas@arm.com, edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, herbert@gondor.apana.org.au,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org,
 ulf.hansson@linaro.org, pabeni@redhat.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 will@kernel.org, richardcochran@gmail.com, robh+dt@kernel.org,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [IGNORE][PATCH v3 01/11] dt-bindings: Document
 common device controller bindings
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


On Wed, 26 Jul 2023 10:38:00 +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>  .../feature-domain-controller.yaml            | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml: title: 'Generic Domain Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230726083810.232100-2-gatien.chevallier@foss.st.com

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
