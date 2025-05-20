Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 30709ABE39D
	for <lists+linux-stm32@lfdr.de>; Tue, 20 May 2025 21:25:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7CBFC7A822;
	Tue, 20 May 2025 19:25:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C401C7A823
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 19:25:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 186FC49DEE;
 Tue, 20 May 2025 19:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B60CAC4CEEF;
 Tue, 20 May 2025 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747769107;
 bh=wYtGxquDyb/uwRox/J1ebRNegYN8+f58D8Ohb3JJlS0=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=mq4MwtoLo5Wzyd5gbzrmxP+oV99rqMPjNFLimTHDS6kh+QWK3DB/s0UQU1SvFt2fl
 z9G3eV17jA4/SCAfvUQ0gSpKXkJ4IOALf+MPQqyeEUjXcgnMr+PBiiE+yFs4yKOVdm
 hjbPho3BuMrnPe+Y7HP2NefU2baF+2TYGc/n55HdbvJonXj/i3tSuCefsT8F3fZXAi
 /zx+ap7FTN5+FV0heRFKqSTgsoO/ZjJKIR0wsh8aQnxVFbqc53v0I6Ly9wlevXiw4Z
 hZcfEhDcYIeP2iuGFjrTw85RmvD0oMV28aiboXDYmQQP3ULxuU88QtkO3bykWaqlqj
 uGVn8MAz4sHHw==
Date: Tue, 20 May 2025 14:25:05 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com>
Message-Id: <174776907578.1216009.15135400439348545740.robh@kernel.org>
Cc: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] dt-bindings: stm32: add STM32MP21
 clocks and reset bindings
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


On Tue, 20 May 2025 17:28:37 +0200, Gabriel Fernandez wrote:
> Adds clock and reset binding entries for STM32MP21 SoC family.
> 
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp21-rcc.yaml           | 204 ++++++++++
>  include/dt-bindings/clock/st,stm32mp21-rcc.h       | 426 +++++++++++++++++++++
>  include/dt-bindings/reset/st,stm32mp21-rcc.h       | 138 +++++++
>  3 files changed, 768 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml: properties:access-controllers: {'description': 'phandle to the rifsc device to check access right.', 'items': [{'description': 'phandle to access controller'}], 'minItems': 1, 'maxItems': 1} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml: properties:access-controllers: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'phandle to access controller'}] is too short
	False schema does not allow 1
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250520-upstream_rcc_mp21-v2-1-3c776a6e5862@foss.st.com

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
