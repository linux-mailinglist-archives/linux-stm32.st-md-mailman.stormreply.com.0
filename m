Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DD19C6924
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2024 07:15:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2D5AC78F88;
	Wed, 13 Nov 2024 06:15:52 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED568C7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 06:15:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D43C7A4029C;
 Wed, 13 Nov 2024 06:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79179C4CECD;
 Wed, 13 Nov 2024 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731478543;
 bh=GjHWsGBW2+fujolM2tMANHwifuU0meTtmmBJ4b3ZT90=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=qmCQpJzd2ahwxFIOLRTrnGuJ+kFeMPsYIBS0aPzc4h3BS7MXPwxBhDuBL8P5XaAVZ
 ABagjtywQEbi2AV19TGV+hMZuv1BAQm/m7PQ3X0xMx8RZoKhIjSZgsZR2Y2kxJlviP
 awiL8oQ4Ow5oejzqmbTw1b1ZSiSncj/UAPO9/8WPAYy/NS0oPsBGMY3Vlgud8GBW1z
 crzmwWXyqMqr4FtgIhDnkpiNeBkVZiK2OgEqFbei6V0tj6sgIZOAKw4NGehTYpWXZi
 JFe8U+7qEtRnPbGFGznPKuQ12JJwPgCrsG4BE+fCaNz518ZMDIZ7pnY2xSV9Ri/qxX
 QumlFfgbrpnSw==
Date: Wed, 13 Nov 2024 00:15:41 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20241113051857.12732-2-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
 <20241113051857.12732-2-a0987203069@gmail.com>
Message-Id: <173147854152.3007386.10475661912425454611.robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, openbmc@lists.ozlabs.org,
 richardcochran@gmail.com, ychuang3@nuvoton.com, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, joabreu@synopsys.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, schung@nuvoton.com, kuba@kernel.org,
 krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: nuvoton: Add
 schema for MA35 family GMAC
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


On Wed, 13 Nov 2024 13:18:55 +0800, Joey Lu wrote:
> Create initial schema for Nuvoton MA35 family Gigabit MAC.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:compatible: [{'items': [{'enum': ['nuvoton,ma35d1-dwmac']}, {'const': 'snps,dwmac-3.70a'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too long
	[{'const': 'stmmaceth'}, {'const': 'ptp_ref'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too long
	[{'description': 'MAC clock'}, {'description': 'PTP clock'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-0/ethernet@40120000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']
Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.example.dtb: /example-1/ethernet@40130000: failed to match any schema with compatible: ['nuvoton,ma35d1-dwmac']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241113051857.12732-2-a0987203069@gmail.com

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
