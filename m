Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D69930813
	for <lists+linux-stm32@lfdr.de>; Sun, 14 Jul 2024 01:37:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40E01C6DD94;
	Sat, 13 Jul 2024 23:37:41 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5B6FC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 13 Jul 2024 23:37:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F3791CE0ABA;
 Sat, 13 Jul 2024 23:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101D6C32781;
 Sat, 13 Jul 2024 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720913851;
 bh=1MKxAWYwekOaP2fx1r0IX5frF/qFcCGEptjnVO3Gg9s=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CZVK73jCSuzWb30m9mu0yZbd8+rqCqBXF8zwLg36U2uuXLUckq2rh0Fg19VyhdmdM
 qGm264HTLM9JjcMrD8M8ZCKVeJFFycPtBnPsQPNoWxdy4SnOxnnOL2fc3hZQhjJFMY
 +T8LqZSu9bF5YfNoPEbPmINfW3Ntdo6t09gCmEfCDExxpxxLHKbBiBcpl2hQvA0G/e
 1ynZicnLJWjk5Ye8gV+nd/Up/nWY7878TrArmmSr8dtTVJSLayq21TqPt20TL1MzrC
 6jPR5JCTjmzE1xhT85vaezu3AcWRch2pvgX6Y6fq8au+mKKziET+bR6MgINxxsZVhK
 LpqxOqCBrULTg==
Date: Sat, 13 Jul 2024 17:37:29 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <drew@pdp7.com>
In-Reply-To: <20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
 <20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com>
Message-Id: <172091384997.169230.1017177117936828717.robh@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 2/4] dt-bindings: net: add
 T-HEAD dwmac support
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


On Sat, 13 Jul 2024 15:35:11 -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Link: https://lore.kernel.org/r/20230827091710.1483-3-jszhang@kernel.org
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: change apb registers from syscon to second reg of gmac node]
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
>  .../devicetree/bindings/net/thead,dwmac.yaml       | 81 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg: {'minItems': 2, 'maxItems': 2, 'items': [{'description': 'DesignWare GMAC IP core registers'}, {'description': 'GMAC APB registers'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'DesignWare GMAC IP core registers'}, {'description': 'GMAC APB registers'}] is too long
	[{'description': 'DesignWare GMAC IP core registers'}, {'description': 'GMAC APB registers'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'dwmac'}, {'const': 'apb'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'dwmac'}, {'const': 'apb'}] is too long
	[{'const': 'dwmac'}, {'const': 'apb'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not of type 'integer'
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not of type 'integer'
	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,pbl' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com

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
