Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEE0D13913
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jan 2026 16:17:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14973C5A4CA;
	Mon, 12 Jan 2026 15:17:34 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35A71C57A51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jan 2026 15:17:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0425F60126;
 Mon, 12 Jan 2026 15:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF03DC19423;
 Mon, 12 Jan 2026 15:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768231051;
 bh=46+wZVHrek5/BXkbofjYmbHldxRKQ7UXKW+8FpuqYUQ=;
 h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
 b=R+xXKhxZjEXz8stVpspzab++bDbjze/00osf+Zag4dFPAdxWb/nwESAEzicrZfAgb
 /j811lEUc8d0bpWG2gHbXd016sE1zPJwn8KTX+tRcNO2P/phZzEUaWEfggYcAEE+LV
 IbdC50uEaJHhO7vp+L88qk7e5C0Lx7EnjB6Qf5dUQgOL0EEg5q2gdBmkhXzdvJPd5i
 9APFpipPJ3LlE9oVdBmoCmUuW8NL3odhx8eKQ8Dun01FXWmKtQTQork/2MuTtCcjqA
 AtgE7CnGi9tygghRXkHPwDfuX7H4a7Kg4MqB/8MwMhlfZ6u62+foZ2iY74LEPkSlXp
 OegJgz58K84mw==
From: Rob Herring <robh@kernel.org>
Date: Mon, 12 Jan 2026 09:17:31 -0600
MIME-Version: 1.0
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
In-Reply-To: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
Message-Id: <176822994422.7758.4716561827275702939.robh@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@linux.dev>,
 James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 coresight@lists.linaro.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 00/11] bus: add stm32 debug bus and
 coresight support for stm32mp1x platforms
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


On Fri, 09 Jan 2026 11:55:00 +0100, Gatien Chevallier wrote:
> Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
> can monitor the activity of the cores. Because of that, they can be
> used only if some features in the debug configuration are enabled.
> Else, errors or firewall exceptions can be observed. Similarly to
> the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
> debug-related peripherals access can be assessed at bus level to
> prevent these issues from happening.
> 
> The debug configuration can only be accessed by the secure world.
> That means that a service must be implemented in the secure world for
> the kernel to check the firewall configuration. On OpenSTLinux, it is
> done through a Debug access PTA in OP-TEE [1].
> To represent the debug peripherals present on a dedicated debug bus,
> create a debug bus node in the device tree and the associated driver
> that will interact with this PTA.
> 
> [1]: https://github.com/OP-TEE/optee_os/pull/7673
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Gatien Chevallier (11):
>       dt-bindings: document access-controllers property for coresight peripherals
>       dt-bindings: pinctrl: document access-controllers property for stm32 HDP
>       dt-bindings: bus: document the stm32 debug bus
>       bus: stm32_firewall: allow check on different firewall controllers
>       drivers: bus: add the stm32 debug bus driver
>       arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
>       arm: dts: stm32: enable the debug bus on stm32mp1x boards
>       arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
>       arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
>       arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
>       pinctrl: stm32: add firewall checks before probing the HDP driver
> 
>  .../devicetree/bindings/arm/arm,coresight-cti.yaml |   3 +
>  .../devicetree/bindings/arm/arm,coresight-etm.yaml |   3 +
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml |   3 +
>  .../bindings/arm/arm,coresight-tpiu.yaml           |   3 +
>  .../bindings/bus/st,stm32mp131-dbg-bus.yaml        |  86 +++++++
>  .../devicetree/bindings/pinctrl/st,stm32-hdp.yaml  |   4 +
>  MAINTAINERS                                        |   1 +
>  arch/arm/boot/dts/st/stm32mp131.dtsi               | 119 +++++++++
>  arch/arm/boot/dts/st/stm32mp135f-dk.dts            |  24 ++
>  arch/arm/boot/dts/st/stm32mp151.dtsi               | 173 +++++++++++++
>  arch/arm/boot/dts/st/stm32mp153.dtsi               |  68 +++++
>  arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  40 +++
>  arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi          |  40 +++
>  drivers/bus/Kconfig                                |  10 +
>  drivers/bus/Makefile                               |   1 +
>  drivers/bus/stm32_dbg_bus.c                        | 285 +++++++++++++++++++++
>  drivers/bus/stm32_firewall.c                       |   2 +-
>  drivers/pinctrl/stm32/pinctrl-stm32-hdp.c          |  41 +++
>  18 files changed, 905 insertions(+), 1 deletion(-)
> ---
> base-commit: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb
> change-id: 20260108-debug_bus-392666c7a3aa
> 
> Best regards,
> --
> Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> 
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
 Base: 9ace4753a5202b02191d54e9fdf7f9e3d02b85eb (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/st/' for 20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com:

arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
arch/arm/boot/dts/st/stm32mp157f-dk2.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml
arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[44, 15, 1]]
	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml
arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[45, 0, 1]]
	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml
arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[44, 15, 1]]
	from schema $id: http://devicetree.org/schemas/serial/serial.yaml
arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): False schema does not allow [[45, 0, 1]]
	from schema $id: http://devicetree.org/schemas/serial/serial.yaml
arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: funnel@50091000 (arm,coresight-dynamic-funnel): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-dynamic-funnel.yaml
arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: stm@500a0000 (arm,coresight-stm): Unevaluated properties are not allowed ('access-controllers' was unexpected)
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-stm.yaml





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
