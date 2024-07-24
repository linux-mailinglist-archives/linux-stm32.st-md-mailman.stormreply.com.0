Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C593B53A
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jul 2024 18:44:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED3EBC712A1;
	Wed, 24 Jul 2024 16:44:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0E08C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jul 2024 16:43:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8CF1560E74;
 Wed, 24 Jul 2024 16:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C00C32781;
 Wed, 24 Jul 2024 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721839433;
 bh=5JmJLMt7znCx017pyPoIq7UZLeqlEodflBEYHrF8fZE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bxZHiUvgdMDRZyD+uEK7AGz9ydWj6piRkVdNTEMzXbUgH6a9S8WhJK2WlTH/UAQT+
 i1O5hFChGTrC1kpcn7tU65mAQuQEPTMJkdMls38ULic5J9qhKqHmxETrZb9o2m5JGB
 8rsnE9PHCFOljmgiF+JvLIds1sd/s1QgyA/uMat7+ATCfZ6Muc9WTrcxJtYVR4uNe1
 S2MmpN+xVRZnM+beliSZALPZo010JzwpZ06hj+9ZVH+KYQ+Q5E+0xbEXD0x0D0iMC/
 biOORFTmwTJyQ6jD1ZiD73Yyr6i/Q2TDRKnI7UqhshKwXnzPqlzCvkBp3XWMOuiZNd
 IhDYJMcXZfPPQ==
Date: Wed, 24 Jul 2024 11:43:51 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20240724153639.803263-5-olivier.moysan@foss.st.com>
References: <20240724153639.803263-1-olivier.moysan@foss.st.com>
 <20240724153639.803263-5-olivier.moysan@foss.st.com>
Message-Id: <172183943127.3135721.14675824897973213166.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 4/9] dt-bindings: iio: dfsdm: move to
 backend framework
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


On Wed, 24 Jul 2024 17:36:32 +0200, Olivier Moysan wrote:
> Change the DFSDM binding to use the new IIO backend framework,
> along with the adoption of IIO generic channels.
> This binding change allows to add scaling support to the DFSDM.
> 
> Keep the legacy binding as deprecated for backward compatibility.
> 
> The io-backends property is supported only in generic IIO channel
> binding.
> 
> - Channel description with the generic binding (Audio and Analog):
> 
>   Properties superseded by generic properties:
>     st,adc-channels: becomes "reg" property in channel node
>     st,adc-channel-names: becomes "label" property in channel node
>   Properties moved to channel child node:
>     st,adc-channel-types: becomes st,adc-channel-type
>     st,adc-channel-clk-src, st,adc-alt-channel
> 
> - Analog binding:
> 
>   DFSDM filter channel is configured as an IIO backend consumer.
>   Add io-backends property in channel child nodes.
> 
>   DFSDM is no more configured as a channel consumer from SD modulator.
>   Use of io-channels in DFSDM node is deprecated.
> 
> - Audio binding:
> 
>   DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>   No change compare to legacy.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 124 +++++++++++++++---
>  1 file changed, 108 insertions(+), 16 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml:421:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240724153639.803263-5-olivier.moysan@foss.st.com

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
