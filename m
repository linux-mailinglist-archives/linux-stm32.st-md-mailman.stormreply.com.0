Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE8DAB6C42
	for <lists+linux-stm32@lfdr.de>; Wed, 14 May 2025 15:11:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 735A1C7A842;
	Wed, 14 May 2025 13:11:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7EECC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 May 2025 13:11:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5D8F61126;
 Wed, 14 May 2025 13:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AC4C4CEE9;
 Wed, 14 May 2025 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747228268;
 bh=LWbOw2PG6oxFMTHL9AQ6/3txcao1bW3c/BXDFtK7IE0=;
 h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
 b=rFTFJRO3fWWuWxA5WVG/97kGL1saLiNpHlW3krWanaIdC7Wm+zSQjzmmKA7ofntoD
 RSsTDlu1n2KshD9skw3CJOiatl8GTaeGL7pNTWGIlwLbf98TKB8Ilu5BNAxz3jaLNr
 o24zUi/QDJEo28ULPGbTOxNSRluGpfi69eq6Qt2f2T7D46JJqXaO9h+lFM0bpX1B1+
 ulRBprSO1iTvrOHy5wCnvWbAI3or235r+MNiz7fJIXGlhj56QwXaiAS0kqv6iwGcjW
 CKBNcRY5zJii+fO2lwFeVvkvS++UZoG38o/EcMRpdiLDm1EX0X41BGGEp0nv+BQJVk
 CB6JhEFzsaqRQ==
Date: Wed, 14 May 2025 08:11:06 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20250514091530.3249364-1-christian.bruel@foss.st.com>
References: <20250514091530.3249364-1-christian.bruel@foss.st.com>
Message-Id: <174722778588.1826217.8453984370826167855.robh@kernel.org>
Cc: kw@linux.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 thippeswamy.havalige@amd.com, linux-kernel@vger.kernel.org, cassel@kernel.org,
 quic_schintav@quicinc.com, johan+linaro@kernel.org, mcoquelin.stm32@gmail.com,
 manivannan.sadhasivam@linaro.org, bhelgaas@google.com, krzk+dt@kernel.org,
 shradha.t@samsung.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 0/9] Add STM32MP25 PCIe drivers
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


On Wed, 14 May 2025 11:15:21 +0200, Christian Bruel wrote:
> Changes in v9:
>    - Describe atu and dbi2 shadowed registers in pcie_ep node
>    Address RC and EP drivers comments from Manivanna:
>    - Use dev_error_probe() for pm_runtime_enable() calls
>    - Reword Kconfig help message
>    - Move pm_runtime_get_noresume() before devm_pm_runtime_enable()
> 
> Changes in v8:
>    - Whitespace in comment
> 
> Changes in v7:
>    - Use device_init_wakeup to enable wakeup
>    - Fix comments (Bjorn)
> 
> Changes in v6:
>    - Call device_wakeup_enable() to fix WAKE# wakeup.
>    Address comments from Manivanna:
>    - Fix/Add Comments
>    - Fix DT indents
>    - Remove dw_pcie_ep_linkup() in EP start link
>    - Add PCIE_T_PVPERL_MS delay in RC PERST# deassert
> 
> Changes in v5:
>    Address driver comments from Manivanna:
>    - Use dw_pcie_{suspend/resume}_noirq instead of private ones.
>    - Move dw_pcie_host_init() to probe
>    - Add stm32_remove_pcie_port cleanup function
>    - Use of_node_put in stm32_pcie_parse_port
>    - Remove wakeup-source property
>    - Use generic dev_pm_set_dedicated_wake_irq to support wake# irq
> 
> Changes in v4:
>    Address bindings comments Rob Herring
>    - Remove phy property form common yaml
>    - Remove phy-name property
>    - Move wake_gpio and reset_gpio to the host root port
> 
> Changes in v3:
>    Address comments from Manivanna, Rob and Bjorn:
>    - Move host wakeup helper to dwc core (Mani)
>    - Drop num-lanes=<1> from bindings (Rob)
>    - Fix PCI address of I/O region (Mani)
>    - Moved PHY to a RC rootport subsection (Bjorn, Mani)
>    - Replaced dma-limit quirk by dma-ranges property (Bjorn)
>    - Moved out perst assert/deassert from start/stop link (Mani)
>    - Drop link_up test optim (Mani)
>    - DT and comments rephrasing (Bjorn)
>    - Add dts entries now that the combophy entries has landed
>    - Drop delaying Configuration Requests
> 
> Changes in v2:
>    - Fix st,stm32-pcie-common.yaml dt_binding_check
> 
> Changes in v1:
>    Address comments from Rob Herring and Bjorn Helgaas:
>    - Drop st,limit-mrrs and st,max-payload-size from this patchset
>    - Remove single reset and clocks binding names and misc yaml cleanups
>    - Split RC/EP common bindings to a separate schema file
>    - Use correct PCIE_T_PERST_CLK_US and PCIE_T_RRS_READY_MS defines
>    - Use .remove instead of .remove_new
>    - Fix bar reset sequence in EP driver
>    - Use cleanup blocks for error handling
>    - Cosmetic fixes
> 
> Christian Bruel (9):
>   dt-bindings: PCI: Add STM32MP25 PCIe Root Complex bindings
>   PCI: stm32: Add PCIe host support for STM32MP25
>   dt-bindings: PCI: Add STM32MP25 PCIe Endpoint bindings
>   PCI: stm32: Add PCIe Endpoint support for STM32MP25
>   MAINTAINERS: add entry for ST STM32MP25 PCIe drivers
>   arm64: dts: st: add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
>   arm64: dts: st: Add PCIe Root Complex mode on stm32mp251
>   arm64: dts: st: Add PCIe Endpoint mode on stm32mp251
>   arm64: dts: st: Enable PCIe on the stm32mp257f-ev1 board
> 
>  .../bindings/pci/st,stm32-pcie-common.yaml    |  33 ++
>  .../bindings/pci/st,stm32-pcie-ep.yaml        |  67 +++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 112 +++++
>  MAINTAINERS                                   |   7 +
>  arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  20 +
>  arch/arm64/boot/dts/st/stm32mp251.dtsi        |  57 +++
>  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    |  21 +
>  drivers/pci/controller/dwc/Kconfig            |  24 +
>  drivers/pci/controller/dwc/Makefile           |   2 +
>  drivers/pci/controller/dwc/pcie-stm32-ep.c    | 411 ++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-stm32.c       | 364 ++++++++++++++++
>  drivers/pci/controller/dwc/pcie-stm32.h       |  16 +
>  12 files changed, 1134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-ep.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32-ep.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.c
>  create mode 100644 drivers/pci/controller/dwc/pcie-stm32.h
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
 Base: tags/next-20250514 (best guess, 5/6 blobs matched)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/st/' for 20250514091530.3249364-1-christian.bruel@foss.st.com:

arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: pcie-ep@48400000 (st,stm32mp25-pcie-ep): reg: [[1212153856, 1048576], [1213202432, 1048576], [1215299584, 524288], [268435456, 134217728]] is too long
	from schema $id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: pcie-ep@48400000 (st,stm32mp25-pcie-ep): reg-names:1: 'addr_space' was expected
	from schema $id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: pcie-ep@48400000 (st,stm32mp25-pcie-ep): reg-names: ['dbi', 'dbi2', 'atu', 'addr_space'] is too long
	from schema $id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: pcie-ep@48400000 (st,stm32mp25-pcie-ep): reg: [[1212153856, 1048576], [1213202432, 1048576], [1215299584, 524288], [268435456, 134217728]] is too long
	from schema $id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: pcie-ep@48400000 (st,stm32mp25-pcie-ep): reg-names:1: 'addr_space' was expected
	from schema $id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#
arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: pcie-ep@48400000 (st,stm32mp25-pcie-ep): reg-names: ['dbi', 'dbi2', 'atu', 'addr_space'] is too long
	from schema $id: http://devicetree.org/schemas/pci/st,stm32-pcie-ep.yaml#





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
