Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F6B9BBB7B
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20F09C7A830;
	Mon,  4 Nov 2024 17:18:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE355C78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 17:04:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9746B5C5955;
 Wed, 30 Oct 2024 17:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81B80C4CED0;
 Wed, 30 Oct 2024 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730307886;
 bh=oImkvsiptXasyFjY4nTXL4uZ1QbmjWs3Q+PjMH8+Jzo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=SJgImpQJ83vQXbf7zZMDT0xDI4yFm05JX6Pw1CqwTw6Lmy66ifIYDsHtnDOYD3KIo
 LV+NTjp5SqhE3FP8/xn26egKdEuYhyiULWi8br9vf0kRwbcjC+OqY4VI0+D+HbZBUk
 QH8Y8QZY87fOyY61lXoUYMJHKe0QnH2oLIJ1mtyxfb+XHCCb2aAyf5svdi6C6L/+b+
 WspvWHXGlds5k0kekBTJTJlZLSi7zjM9+sfuhHsnKjFLeNi6TyhZUyQGtvAvHiRi6X
 a/FPZ95nzWbV/hoVayIbCz6S1NFtA+uNF5uXgAASufBVLVX5flUyBjg8jjLynfpipc
 2un1wQ7b8hXow==
Date: Wed, 30 Oct 2024 12:04:44 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lothar Rubusch <l.rubusch@gmail.com>
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
Message-Id: <173030774932.1269076.14582772234717243392.robh@kernel.org>
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dinguyen@kernel.org, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 krzk+dt@kernel.org, s.trumtrar@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 00/23] Add Enclustra Arria10 and
	Cyclone5 SoMs
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


On Tue, 29 Oct 2024 20:23:26 +0000, Lothar Rubusch wrote:
> Add device-tree support for the following SoMs:
> 
> - Mercury SA1 (cyclone5)
> - Mercury+ SA2 (cyclone5)
> - Mercury+ AA1 (arria10)
> 
> Further add device-tree support for the corresponding carrier boards:
> 
> - Mercury+ PE1
> - Mercury+ PE3
> - Mercury+ ST1
> 
> Finally, provide generic support for combinations of the above with
> one of the boot-modes
> - SD
> - eMMC
> - QSPI
> 
> Almost all of the above can be freely combined. Combinations are
> covered by the provided .dts files. This makes an already existing
> .dts file obsolete. Further minor fixes of the dtbs_checks are
> added separtely.
> 
> The current approach shall be partly useful also for corresponding
> bootloader integration using dts/upstream. That's also one of the
> reasons for the .dtsi split.
> 
> Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
> ---
> v3 -> v4:
> - add separate patch to match "snps,dwmac" compatible in corresponding
>   driver, required by binding check
> - replace non-standard node names in .dtsi files by node names recommended
>   by the device tree standard v0.4
> 
> v2 -> v3:
> - dropped the patch to add the socfpga clock bindings:
>   Documentation/devicetree/bindings/clock/altr,socfpga-a10.yaml
>   reason: refactoring the "altr,socfpga-" TXT files to .yaml files is a
>   different story involving several other files, thus can be part of a
>   future patch series, not related to the current upstreaming the
>   Enclustra DTS support, so dropped
> - adjust comments on boot mode selection
> - adjust titles to several bindings patches
> 
> v1 -> v2:
> - split bindings and DT adjustments/additions
> - add several fixes to the socfpga.dtsi and socfpga_arria10.dtsi where
>   bindings did not match
> - extend existing bindings by properties and nods from arria10 setup
> - implement the clock binding altr,socfpga-a10.yaml based on existing
>   text file, rudimentary datasheet study and requirements of the
>   particular DT setup
> ---
> Lothar Rubusch (23):
>   ARM: dts: socfpga: fix typo
>   ARM: dts: socfpga: align bus name with bindings
>   ARM: dts: socfpga: align dma name with binding
>   ARM: dts: socfpga: align fpga-region name
>   ARM: dts: socfpga: add label to clock manager
>   ARM: dts: socfpga: add missing cells properties
>   ARM: dts: socfpga: fix missing ranges
>   ARM: dts: socfpga: add clock-frequency property
>   ARM: dts: socfpga: add ranges property to sram
>   ARM: dts: socfpga: remove arria10 reset-names
>   net: stmmac: add support for dwmac 3.72a
>   dt-bindings: net: snps,dwmac: add support for Arria10
>   ARM: dts: socfpga: add Enclustra boot-mode dtsi
>   ARM: dts: socfpga: add Enclustra base-board dtsi
>   ARM: dts: socfpga: add Enclustra Mercury SA1
>   dt-bindings: altera: add Enclustra Mercury SA1
>   ARM: dts: socfpga: add Enclustra Mercury+ SA2
>   dt-bindings: altera: add binding for Mercury+ SA2
>   ARM: dts: socfpga: add Mercury AA1 combinations
>   dt-bindings: altera: add Mercury AA1 combinations
>   ARM: dts: socfpga: removal of generic PE1 dts
>   dt-bindings: altera: removal of generic PE1 dts
>   ARM: dts: socfpga: add Enclustra SoM dts files
> 
>  .../devicetree/bindings/arm/altera.yaml       |  24 ++-
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
>  arch/arm/boot/dts/intel/socfpga/Makefile      |  25 ++-
>  arch/arm/boot/dts/intel/socfpga/socfpga.dtsi  |   6 +-
>  .../dts/intel/socfpga/socfpga_arria10.dtsi    |  26 ++--
>  .../socfpga/socfpga_arria10_mercury_aa1.dtsi  | 141 ++++++++++++++---
>  .../socfpga_arria10_mercury_aa1_pe1_emmc.dts  |  16 ++
>  .../socfpga_arria10_mercury_aa1_pe1_qspi.dts  |  16 ++
>  .../socfpga_arria10_mercury_aa1_pe1_sdmmc.dts |  16 ++
>  .../socfpga_arria10_mercury_aa1_pe3_emmc.dts  |  16 ++
>  .../socfpga_arria10_mercury_aa1_pe3_qspi.dts  |  16 ++
>  .../socfpga_arria10_mercury_aa1_pe3_sdmmc.dts |  16 ++
>  .../socfpga_arria10_mercury_aa1_st1_emmc.dts  |  16 ++
>  .../socfpga_arria10_mercury_aa1_st1_qspi.dts  |  16 ++
>  .../socfpga_arria10_mercury_aa1_st1_sdmmc.dts |  16 ++
>  .../socfpga/socfpga_arria10_mercury_pe1.dts   |  55 -------
>  .../socfpga/socfpga_cyclone5_mercury_sa1.dtsi | 143 +++++++++++++++++
>  .../socfpga_cyclone5_mercury_sa1_pe1_emmc.dts |  16 ++
>  .../socfpga_cyclone5_mercury_sa1_pe1_qspi.dts |  16 ++
>  ...socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts |  16 ++
>  .../socfpga_cyclone5_mercury_sa1_pe3_emmc.dts |  16 ++
>  .../socfpga_cyclone5_mercury_sa1_pe3_qspi.dts |  16 ++
>  ...socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts |  16 ++
>  .../socfpga_cyclone5_mercury_sa1_st1_emmc.dts |  16 ++
>  .../socfpga_cyclone5_mercury_sa1_st1_qspi.dts |  16 ++
>  ...socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts |  16 ++
>  .../socfpga/socfpga_cyclone5_mercury_sa2.dtsi | 146 ++++++++++++++++++
>  .../socfpga_cyclone5_mercury_sa2_pe1_qspi.dts |  16 ++
>  ...socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts |  16 ++
>  .../socfpga_cyclone5_mercury_sa2_pe3_qspi.dts |  16 ++
>  ...socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts |  16 ++
>  .../socfpga_cyclone5_mercury_sa2_st1_qspi.dts |  16 ++
>  ...socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts |  16 ++
>  ...cfpga_enclustra_mercury_bootmode_emmc.dtsi |  12 ++
>  ...cfpga_enclustra_mercury_bootmode_qspi.dtsi |   8 +
>  ...fpga_enclustra_mercury_bootmode_sdmmc.dtsi |   8 +
>  .../socfpga_enclustra_mercury_pe1.dtsi        |  33 ++++
>  .../socfpga_enclustra_mercury_pe3.dtsi        |  55 +++++++
>  .../socfpga_enclustra_mercury_st1.dtsi        |  15 ++
>  .../ethernet/stmicro/stmmac/dwmac-generic.c   |   1 +
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
>  41 files changed, 992 insertions(+), 93 deletions(-)
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts
>  delete mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi
>  create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi
> 
> --
> 2.25.1
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


New warnings running 'make CHECK_DTBS=y intel/socfpga/socfpga_arria10_mercury_pe1.dtb intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb intel/socfpga/socfpg
 a_cyclone5_mercury_sa1_st1_qspi.dtb intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb' for 20241029202349.69442-1-l.rubusch@gmail.com:

make[4]: *** No rule to make target 'arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb'.
make[3]: *** [scripts/Makefile.build:478: arch/arm/boot/dts/intel/socfpga] Error 2
make[3]: Target 'arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb' not remade because of errors.
make[2]: *** [scripts/Makefile.build:478: arch/arm/boot/dts/intel] Error 2
make[2]: Target 'arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1412: intel/socfpga/socfpga_arria10_mercury_pe1.dtb] Error 2
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
	['enclustra,mercury-sa1-pe1', 'enclustra,mercury-aa1', 'altr,socfpga-arria10', 'altr,socfpga'] is too long
	'enclustra,mercury-sa1-pe1' is not one of ['altr,socfpga-arria5-socdk']
	'enclustra,mercury-sa1-pe1' is not one of ['altr,socfpga-arria10-socdk']
	'enclustra,mercury-sa1-pe1' is not one of ['enclustra,mercury-aa1-pe1', 'enclustra,mercury-aa1-pe3', 'enclustra,mercury-aa1-st1', 'google,chameleon-v3']
	'enclustra,mercury-sa1-pe1' is not one of ['altr,socfpga-cyclone5-socdk', 'denx,mcvevk', 'ebv,socrates', 'macnica,sodia', 'novtech,chameleon96', 'samtec,vining', 'terasic,de0-atlas', 'terasic,socfpga-cyclone5-sockit']
	'enclustra,mercury-sa1-pe1' is not one of ['enclustra,mercury-sa2-pe1', 'enclustra,mercury-sa2-pe3', 'enclustra,mercury-sa2-st1']
	'enclustra,mercury-sa1-pe1' is not one of ['altr,socfpga-stratix10-socdk', 'altr,socfpga-stratix10-swvp']
	'altr,socfpga-vt' was expected
	'altr,socfpga-arria5' was expected
	'altr,socfpga-arria10' was expected
	'altr,socfpga-cyclone5' was expected
	'enclustra,mercury-sa1' was expected
	'enclustra,mercury-sa2' was expected
	'altr,socfpga-stratix10' was expected
	'altr,socfpga' was expected
	from schema $id: http://devicetree.org/schemas/arm/altera.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emaca_clk@68: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emacb_clk@6c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_emac_ptp_clk@70: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_gpio_db_clk@74: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_sdmmc_clk@78: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr0_clk@7c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_s2f_usr1_clk@80: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_hmc_pll_ref_clk@84: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_periph_ref_clk@9c: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0: failed to match any schema with compatible: ['altr,socfpga-a10-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_mpu_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_noc_base_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emaca_clk@e8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emacb_clk@ec: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_emac_ptp_clk@f0: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_gpio_db_clk@f4: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_sdmmc_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr0_clk@fc: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_s2f_usr1_clk@100: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@c0/peri_hmc_pll_ref_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_free_clk@60: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/noc_free_clk@64: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_user1_free_clk@104: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_free_clk@f8: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sys_free_clk: failed to match any schema with compatible: ['altr,socfpga-a10-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/s2f_usr1_clk: failed to match any schema with compatible: ['altr,socfpga-a10-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/ethernet@ff800000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/ethernet@ff802000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/ethernet@ff804000: failed to match any schema with compatible: ['altr,socfpga-stmmac-a10-s10', 'snps,dwmac-3.72a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/fpga-mgr@ffd03000: failed to match any schema with compatible: ['altr,socfpga-a10-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/i2c@ffc02300/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-a10-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac-a10']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd06010: failed to match any schema with compatible: ['altr,socfpga-a10-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ff8c3000: failed to match any schema with compatible: ['altr,socfpga-a10-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/emac0-rx-ecc@ff8c0800: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/emac0-tx-ecc@ff8c0c00: failed to match any schema with compatible: ['altr,socfpga-eth-mac-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/sdmmca-ecc@ff8c2c00: failed to match any schema with compatible: ['altr,socfpga-sdmmc-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/dma-ecc@ff8c8000: failed to match any schema with compatible: ['altr,socfpga-dma-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/eccmgr/usb0-ecc@ff8c8800: failed to match any schema with compatible: ['altr,socfpga-usb-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb: /soc/sysmgr@ffd06000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 2147483648]]}
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: pmu@ff111000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: soc: sdramedac: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: soc: usbphy: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: soc: stmmac-axi-config: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: soc: fpga-region: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: clkmgr@ffd04000: 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: osc2: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: f2s_periph_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: f2s_sdram_ref_clk: 'clock-frequency' is a required property
	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mpuclk@48: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/mainclk@4c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/dbg_base_clk@50: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_qspi_clk@54: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/main_nand_sdmmc_clk@58: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/main_pll@40/cfg_h2f_usr0_clk@5c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac0_clk@88: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/emac1_clk@8c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_qsi_clk@90: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_nand_mmc_clk@94: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/per_base_clk@98: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/periph_pll@80/h2f_usr1_clk@9c: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0: failed to match any schema with compatible: ['altr,socfpga-pll-clock']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dqs_clk@c8: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_2x_dqs_clk@cc: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/ddr_dq_clk@d0: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdram_pll@c0/h2f_usr2_clk@d4: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_periph_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/mpu_l2_ram_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_main_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_main_clk: failed to match any schema with compatible: ['altr,socfpga-perip-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l3_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/l4_sp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_at_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_trace_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/dbg_timer_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/cfg_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/emac_1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/usb_mp_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/spi_m_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can0_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/can1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/gpio_db_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user1_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/sdmmc_clk_divided: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_x_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_ecc_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/nand_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/qspi_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_2x_dqs_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/ddr_dq_clk_gate: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/clkmgr@ffd04000/clocks/h2f_user2_clk: failed to match any schema with compatible: ['altr,socfpga-gate-clk']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: fpga_bridge@ff400000: $nodename:0: 'fpga_bridge@ff400000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: fpga_bridge@ff500000: $nodename:0: 'fpga_bridge@ff500000' does not match '^fpga-bridge(@.*|-([0-9]|[1-9][0-9]+))?$'
	from schema $id: http://devicetree.org/schemas/fpga/altr,socfpga-hps2fpga-bridge.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/fpgamgr@ff706000: failed to match any schema with compatible: ['altr,socfpga-fpga-mgr']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/ethernet@ff700000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/ethernet@ff702000: failed to match any schema with compatible: ['altr,socfpga-stmmac', 'snps,dwmac-3.70a', 'snps,dwmac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/i2c@ffc04000/clock-controller@70: failed to match any schema with compatible: ['silabs,si5338']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/eccmgr: failed to match any schema with compatible: ['altr,socfpga-ecc-manager']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/eccmgr/l2-ecc@ffd08140: failed to match any schema with compatible: ['altr,socfpga-l2-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/eccmgr/ocram-ecc@ffd08144: failed to match any schema with compatible: ['altr,socfpga-ocram-ecc']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: sram@ffff0000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: sram@ffff0000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: sram@ffff0000: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: spi@ff705000: resets: [[6, 37]] is too short
	from schema $id: http://devicetree.org/schemas/spi/cdns,qspi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: flash@0: Unevaluated properties are not allowed ('partition@raw', 'u-boot,dm-pre-reloc' were unexpected)
	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: flash@0: 'partition@raw' does not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/sdramedac: failed to match any schema with compatible: ['altr,sdram-edac']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: /soc/sysmgr@ffd08000: failed to match any schema with compatible: ['altr,sys-mgr', 'syscon']
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: timer0@ffc08000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: timer1@ffc09000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: timer2@ffd00000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb: timer3@ffd01000: 'reset-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
make: *** [Makefile:224: __sub-make] Error 2
make: Target 'intel/socfpga/socfpga_arria10_mercury_pe1.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dtb' not remade because of errors.
make: Target 'intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dtb' not remade because of errors.





_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
