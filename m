Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7734BA7A53E
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Apr 2025 16:35:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A578C78F85;
	Thu,  3 Apr 2025 14:35:39 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 169BBC78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Apr 2025 14:35:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 38436A432CE;
 Thu,  3 Apr 2025 14:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94184C4CEE5;
 Thu,  3 Apr 2025 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743690935;
 bh=zumkyYgD4rKRxbVuiS3xNK72xMEL7G46+2AXsQp2PTM=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=aAn1mFcb7H6bICJ3q77Y2KkevOwYQkQpfxxEt5dkNtIUmPbo8+rf6rI7/i+ZmrqDF
 GQ8qmloqZtKEvPdwmAqegoZY0Zq0HeCZLpt5N1ASKyZuot87W1m1zDrNEJx6Z7goZF
 q4av7dDSYKfMX2lxMqsrE0hWkVSSxRqUUJEyJAG9VawD4CqdMSfEKVUme+qptjwA9T
 J0fq5D6JhaAqT5vKWz1lT4taJ7njeZe59y/5WxfFYp/2F3kG4w6uzldaX69N1B6H6S
 S7l+qc3d+gV6K/a4AhvM+jt5esZlNKngtfnSZPoXZHWLsg70SWvGdq+JwB5uUfstm7
 oYJLRDmmHhfbQ==
Date: Thu, 03 Apr 2025 09:35:34 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250403122805.1574086-1-christian.bruel@foss.st.com>
References: <20250403122805.1574086-1-christian.bruel@foss.st.com>
Message-Id: <174369066487.2789685.6006460527429704975.robh@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, maz@kernel.org, tglx@linutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Add ST STM32MP2 GICv2 quirk for EOI
	split mode
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


On Thu, 03 Apr 2025 14:28:02 +0200, Christian Bruel wrote:
> When using GIC EOI split mode, GICC_DIR fails to deactivate the interrupt,
> leading to a WFI freeze. On ST MP2, GIC cpu interface is limitted to 4K,
> thus GICC_DIR register is reachable with a 0x10000 remapping
> 
> When using GIC EOI split mode, the GICC_DIR fails to deactivate the
> interrupt, causing core freeze on WFI. On the ST MP2, the GIC CPU interface
> is limited to 4K, so the GICC_DIR register can be accessed remapping the
> register to a 0x10000 offset.
> 
> Christian Bruel (3):
>   dt-bindings: interrupt-controller: arm,gic: Add
>     st,stm32mp2-cortex-a7-gic
>   irqchip/gic: Use 0x10000 offset to access GICC_DIR
>   arm64: dts: st: add st,stm32mp2-cortex-a7-gic in intc node in
>     stm32mp251.dtsi
> 
>  .../interrupt-controller/arm,gic.yaml         |  1 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        |  2 +-
>  drivers/irqchip/irq-gic.c                     | 47 ++++++++++++++++++-
>  3 files changed, 48 insertions(+), 2 deletions(-)
> 
> --
> 2.34.1
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250403 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250403122805.1574086-1-christian.bruel@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
		['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
		'nvidia,tegra210-agic' was expected
		'st,stm32mp2-cortex-a7-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic']
	'arm,gic-400' was expected
	'arm,arm1176jzf-devchip-gic' was expected
	'brcm,brahma-b15-gic' was expected
	'arm,arm11mp-gic' was expected
	'arm,cortex-a15-gic' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
	['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: interrupt-controller@4ac00000: compatible: 'oneOf' conditional failed, one must be fixed:
		['st,stm32mp2-cortex-a7-gic', 'arm,cortex-a7-gic'] is too long
		'nvidia,tegra210-agic' was expected
		'st,stm32mp2-cortex-a7-gic' is not one of ['nvidia,tegra186-agic', 'nvidia,tegra194-agic', 'nvidia,tegra234-agic']
	'arm,gic-400' was expected
	'arm,arm1176jzf-devchip-gic' was expected
	'brcm,brahma-b15-gic' was expected
	'arm,arm11mp-gic' was expected
	'arm,cortex-a15-gic' was expected
	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
