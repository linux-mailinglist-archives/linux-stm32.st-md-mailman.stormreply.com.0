Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CC77FAED
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Aug 2023 17:37:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2700C6B475;
	Thu, 17 Aug 2023 15:37:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E757C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Aug 2023 15:37:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1447565C88;
 Thu, 17 Aug 2023 15:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D9BC433C7;
 Thu, 17 Aug 2023 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692286647;
 bh=PPdaDsmbvOoUgBA9blhD/gAGWLwMHvPr4MIBG/oHTnU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=PK65OHBcR96E/S7r7/GbV5sJE8f40prJcTn4zD5UCeK/MxrcGpdkrquNdOZAVtZVD
 PQkkdfrORXaaTFXN9AnCOJKXj5kffm+U4xEThi7qMeY2NHsu+X3Bie1e9F/OW9tXUz
 kJxeUGyINARAlkwPm7TtGYFCIocQUIpMrTq8UgQBdVbkw0yfRSnhkYnmG4yFotmora
 Ha3IkJimfiri0xHQWfRlm+GD1w9xF5fgmMZx+ufKjCIuF60BLXWILH+vrdWdhZ7lHB
 78QYeRhhf4hr61DXhjx9iF7CUa9DSqdF0HYYlIqZYuV0mSewUUplW9qiky6gQ1f5sW
 0T12GKOooTNIA==
Received: (nullmailer pid 1107201 invoked by uid 1000);
 Thu, 17 Aug 2023 15:37:24 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
In-Reply-To: <20230816152926.4093-7-jszhang@kernel.org>
References: <20230816152926.4093-1-jszhang@kernel.org>
 <20230816152926.4093-7-jszhang@kernel.org>
Message-Id: <169228664449.1107185.1318874790899719478.robh@kernel.org>
Date: Thu, 17 Aug 2023 10:37:24 -0500
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 6/9] dt-bindings: net: snps,
 dwmac: add safety irq support
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


On Wed, 16 Aug 2023 23:29:23 +0800, Jisheng Zhang wrote:
> The snps dwmac IP support safety features, and those Safety Feature
> Correctible Error and Uncorrectible Error irqs may be separate irqs.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.example.dtb: ethernet@16030000: interrupt-names: ['macirq', 'eth_wake_irq', 'eth_lpi'] is too long
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.example.dtb: ethernet@16030000: Unevaluated properties are not allowed ('mdio', 'phy-handle', 'phy-mode', 'rx-fifo-depth', 'snps,axi-config', 'snps,en-tx-lpi-clockgating', 'snps,fixed-burst', 'snps,force_thresh_dma_mode', 'snps,multicast-filter-bins', 'snps,no-pbl-x8', 'snps,perfect-filter-entries', 'snps,rxpbl', 'snps,tso', 'snps,txpbl', 'stmmac-axi-config', 'tx-fifo-depth' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.example.dtb: ethernet@16030000: interrupt-names: ['macirq', 'eth_wake_irq', 'eth_lpi'] is too long
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/snps,dwmac.example.dtb: ethernet@e0800000: interrupt-names: ['macirq', 'eth_wake_irq', 'eth_lpi'] is too long
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230816152926.4093-7-jszhang@kernel.org

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
