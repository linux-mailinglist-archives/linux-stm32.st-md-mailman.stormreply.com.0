Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E508B401A
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Apr 2024 21:23:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59BB1C7128C;
	Fri, 26 Apr 2024 19:23:05 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B16AC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Apr 2024 19:23:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3C01BCE1B30;
 Fri, 26 Apr 2024 19:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7ECC113CD;
 Fri, 26 Apr 2024 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714159380;
 bh=OVSV+SEbfc1zfz8pX7msAmdgQGOL8Hi8WJYW9BAU2nE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=FuXXwib59Ax8JB6ZoL3eNtEqvuZOmWn8LSE502+HTxnWty4srsSsbymxgckesNsc5
 EJVSYuzSMp4X144+as44CQavQyCxyCtaoyX5l7YTFA/9lEGA48ML4ohyshbUOQkAE7
 o8NAJtUAtfpCFlnpRwawwpBiUJc5ku/V6WmIsVSoU4fsdzLHEULYulqfDpSu5ICRTD
 yJJIRyJN6w/4vxb1AhJNzbkHP5Iq4CHQUImy0z/+qYNwCYa3QGeY19e7YC3pyB2UrQ
 5nX/zHDoAV1BUZxUIj1gKEtBOVBE38hgoE+YqRzpEJShq+2bm2kD7qkhkZJdUNhLy/
 ik9D6unUNlMQw==
Date: Fri, 26 Apr 2024 14:22:58 -0500
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
In-Reply-To: <20240426203245.v2.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
References: <20240426183253.1360098-1-patrick.delaunay@foss.st.com>
 <20240426203245.v2.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid>
Message-Id: <171415937701.2720387.9777987349037944096.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Pascal Paillet <p.paillet@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: regulator: st,
 stm32mp1-pwr-reg: add compatible for STM32MP13
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


On Fri, 26 Apr 2024 20:32:50 +0200, Patrick Delaunay wrote:
> Add new compatible "st,stm32mp13-pwr-reg" for STM32MP13 SoC family.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> Changes in v2:
> - update for Rob review, only add compatible for STM32MP13 family
> 
>  .../devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml:15:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/st,stm32mp1-pwr-reg.yaml: properties:compatible:oneOf: [{'const': 'st,stm32mp1,pwr-reg'}, {'const': 'st,stm32mp13-pwr-reg'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240426203245.v2.1.Ia0a99d90acb512aa020a6e7a8cca8cc1b71f1759@changeid

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
