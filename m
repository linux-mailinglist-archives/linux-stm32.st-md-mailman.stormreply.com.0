Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722194D46A
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Aug 2024 18:18:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3D93C78021;
	Fri,  9 Aug 2024 16:18:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE746C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 16:18:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2F4DCCE168B;
 Fri,  9 Aug 2024 16:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA725C32782;
 Fri,  9 Aug 2024 16:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723220290;
 bh=ek/Kg6OmXUi6D5cWxC7C10DYiBHbw6OL9TD8XPV7y4Y=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=L9p0E7EeQlzvhjRAqoGpPdcihwHW1MjQbllDSkwN06TxsM8qdXsU6oSBQB9tXP/cJ
 yADOr0bk3A/w5CS4ytEl0pVafURAAnGy6zOvlnWf8hPhBHiuJYleEaHytbChUqrC9B
 smY3y3ezB64BiTbn8lBcvsjxyjgez2K8ANOqBorTJAS4uoVBXKsNQbje2c176iUbT6
 wxjvkme+t/94n448CAveKNbDTTIPJ04CYafRy5mU8vc0mD07nhhG+8SZf0IgPHbfpZ
 Ra2eBlsO5e959W0mhdWJGXYF5ZMTqAC0vktQbwOFxeyiFqIHmmeh9jU9rqdy79t52Y
 6bOG5kGvno5TA==
Date: Fri, 09 Aug 2024 10:18:08 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yannick Fertre <yannick.fertre@foss.st.com>
In-Reply-To: <20240809151314.221746-1-yannick.fertre@foss.st.com>
References: <20240809151314.221746-1-yannick.fertre@foss.st.com>
Message-Id: <172322028851.588157.5328364169708651531.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: display: st,
 stm32-ltdc: Document stm32mp25 compatible
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


On Fri, 09 Aug 2024 17:13:14 +0200, Yannick Fertre wrote:
> Add "st,stm32mp25-ltdc" compatible for SOC MP25. This new SOC introduce
> new clocks (bus, ref & lvds). Bus clock was separated from lcd clock.
> New sources are possible for lcd clock (lvds / ref).
> 
> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> ---
> Changes in v2: Rework clock property.
>  .../bindings/display/st,stm32-ltdc.yaml       | 51 +++++++++++++++----
>  1 file changed, 41 insertions(+), 10 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml: allOf:0:else:properties:clocks: {'maxItems': 1, 'items': [{'description': 'Lcd Clock'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml: allOf:0:then:properties:clocks: {'maxItems': 4, 'items': [{'description': 'Lcd Clock'}, {'description': 'Bus Clock'}, {'description': 'Reference Clock'}, {'description': 'Lvds Clock'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/st,stm32-ltdc.example.dtb: display-controller@40016800: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/display/st,stm32-ltdc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240809151314.221746-1-yannick.fertre@foss.st.com

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
