Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11281B1C7C0
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 16:40:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34622C36B12;
	Wed,  6 Aug 2025 14:40:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FC3DC36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 14:40:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A409245DDE;
 Wed,  6 Aug 2025 14:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7447BC4CEFC;
 Wed,  6 Aug 2025 14:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754491231;
 bh=EblJcM6UV2Fk655c6OrUU4cocp87gisfHSYUOgjEB6c=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=oDjRysBFpjCnpdQr+LR9E3FtM2mhSTCDF8AFOG3eWTzY4LMn55igeqzirY52s/2+z
 QvJ8OUxQXGCYRJTkcHE9TVMsXHFcIY3QDrVFPylIAcRl5bt8iWjir5EkxF5F9vZpan
 ZmCANTDMcpw37Gy+41p2g3zWm4CdRzEW5hRxDbZWRrXydSYmot6lukP3W+IRzgyx0I
 1vE3gIuC/9jujON+0CooH4zuC2OSGh2I6sMrWnJroyro7qvO0HSyya4gJIwEaixHb1
 O5svdpx/kMUvILsphnrNMe/D8Zxd8aZAJ+t0xQhaNUcHBugKPgFxL4YJ7oKQ7Fke2A
 NtB2edeP1lr7g==
Date: Wed, 06 Aug 2025 09:40:30 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
In-Reply-To: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
References: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
Message-Id: <175449112394.639563.13302025438302529927.robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add resets property to
 m_can nodes in the stm32mp153
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


On Wed, 06 Aug 2025 10:59:12 +0200, Marc Kleine-Budde wrote:
> On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
> shared reset in the RCC. Add the reset to both m_can nodes.
> 
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 1a32f7427eb3d1248bc64cd745b93f88cc838933

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de:

arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: can@4400e000 (bosch,m_can): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
