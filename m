Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E38599BBB64
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Nov 2024 18:18:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8787C78F73;
	Mon,  4 Nov 2024 17:18:37 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E57BC7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 20:23:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3807e72c468so244869f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 13:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730233432; x=1730838232;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fmaJ2cGgy9S2swZZo1UerLLaJvJoBIutdhI6IzAFbxA=;
 b=PoXCQlyBkvB/1nboQS+Hvpay3SQRRmhFx7WfLOWjixQ4P1E+2nebNcHhH2S53sK0LW
 gZaS4kirK+4IhI/5KZoR8qF09uHP5qDtPbZLZ24uAsqB6QRYZTjUeshXo/UVNNZslt97
 qUeLzJtqzljuBAne8BmXPdGUt1zxiPwqSLxRjIaZq4o0s5og5KzeVgZZbsmMcLi1AQzN
 tnkn3MmUeHzPw+ISmgs1nOZs33hSu7EqWlKWlo4wO3G1sGj0zzQLVLckSWkxypuXdzcT
 8E67HgOKVbdRyeQsRuYVWzv3cK3a1/16y4Dz0pKFpZZAPJVo5Nfjy5b2Flrcj5lGEVr8
 YWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233432; x=1730838232;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fmaJ2cGgy9S2swZZo1UerLLaJvJoBIutdhI6IzAFbxA=;
 b=KAfncm88yWiMY6syWZQu5ymhM8kPtQzPP4Zbr0PM50WmzVbajts7Zibd844XjxRKr6
 yVHTldz0Cj3y0ED27lgvH0uwt0SL6MqE0slfHbwnXEwBzPGPWmdmH+vz6aQf2zWp7/xV
 xHTMLojzrmyksI25jSVQs7Sy0hNsQWTmZvG3/346UcWa4bqrC43y+J5pHpHKzGURCBuY
 VePwru/qZv8lWvO5W4k6PeijNTksWtrfXBTtNki5ZuPOYe2G/HDgTynrrpsaG6L/cqKk
 IyEpJL1QBy0GOLxuWvVa2xNOomuSXfUFWGoFFQF5Fx0P72RkASrLw1mLavyT51sKKCV2
 Xbww==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0eWqb0jL1Of8lNHVHmUBgOCfmh+cvFC/t+lJnAeQ26JFz7zuoNPOOabIFdUrWFQ/C5FcT2ayR9Y5DoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzs6BTHyJQUEYvtMSSYv+0ZkIEsdbvr53JFInBrItVbSLKdeAQ2
 /IJdPkzvzKrcktBiuXSqPa/9oBbrR5tHhgPUo8AfGQhhzX9I2kru
X-Google-Smtp-Source: AGHT+IE4eVnaZPidUHeSY1WAuGOgaGW6tLvUl8un5Y9u46tplJhMw2SpOUD20rey7JdzrkLSVHdpYg==
X-Received: by 2002:a05:6000:156a:b0:37d:5313:ee45 with SMTP id
 ffacd0b85a97d-3806100755dmr4716128f8f.0.1730233431682; 
 Tue, 29 Oct 2024 13:23:51 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch.
 [84.72.156.211]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:23:51 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Date: Tue, 29 Oct 2024 20:23:26 +0000
Message-Id: <20241029202349.69442-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Nov 2024 17:18:35 +0000
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dinguyen@kernel.org,
 edumazet@google.com, joabreu@synopsys.com, l.rubusch@gmail.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, s.trumtrar@pengutronix.de,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 00/23] Add Enclustra Arria10 and Cyclone5
	SoMs
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

Add device-tree support for the following SoMs:

- Mercury SA1 (cyclone5)
- Mercury+ SA2 (cyclone5)
- Mercury+ AA1 (arria10)

Further add device-tree support for the corresponding carrier boards:

- Mercury+ PE1
- Mercury+ PE3
- Mercury+ ST1

Finally, provide generic support for combinations of the above with
one of the boot-modes
- SD
- eMMC
- QSPI

Almost all of the above can be freely combined. Combinations are
covered by the provided .dts files. This makes an already existing
.dts file obsolete. Further minor fixes of the dtbs_checks are
added separtely.

The current approach shall be partly useful also for corresponding
bootloader integration using dts/upstream. That's also one of the
reasons for the .dtsi split.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
v3 -> v4:
- add separate patch to match "snps,dwmac" compatible in corresponding
  driver, required by binding check
- replace non-standard node names in .dtsi files by node names recommended
  by the device tree standard v0.4

v2 -> v3:
- dropped the patch to add the socfpga clock bindings:
  Documentation/devicetree/bindings/clock/altr,socfpga-a10.yaml
  reason: refactoring the "altr,socfpga-" TXT files to .yaml files is a
  different story involving several other files, thus can be part of a
  future patch series, not related to the current upstreaming the
  Enclustra DTS support, so dropped
- adjust comments on boot mode selection
- adjust titles to several bindings patches

v1 -> v2:
- split bindings and DT adjustments/additions
- add several fixes to the socfpga.dtsi and socfpga_arria10.dtsi where
  bindings did not match
- extend existing bindings by properties and nods from arria10 setup
- implement the clock binding altr,socfpga-a10.yaml based on existing
  text file, rudimentary datasheet study and requirements of the
  particular DT setup
---
Lothar Rubusch (23):
  ARM: dts: socfpga: fix typo
  ARM: dts: socfpga: align bus name with bindings
  ARM: dts: socfpga: align dma name with binding
  ARM: dts: socfpga: align fpga-region name
  ARM: dts: socfpga: add label to clock manager
  ARM: dts: socfpga: add missing cells properties
  ARM: dts: socfpga: fix missing ranges
  ARM: dts: socfpga: add clock-frequency property
  ARM: dts: socfpga: add ranges property to sram
  ARM: dts: socfpga: remove arria10 reset-names
  net: stmmac: add support for dwmac 3.72a
  dt-bindings: net: snps,dwmac: add support for Arria10
  ARM: dts: socfpga: add Enclustra boot-mode dtsi
  ARM: dts: socfpga: add Enclustra base-board dtsi
  ARM: dts: socfpga: add Enclustra Mercury SA1
  dt-bindings: altera: add Enclustra Mercury SA1
  ARM: dts: socfpga: add Enclustra Mercury+ SA2
  dt-bindings: altera: add binding for Mercury+ SA2
  ARM: dts: socfpga: add Mercury AA1 combinations
  dt-bindings: altera: add Mercury AA1 combinations
  ARM: dts: socfpga: removal of generic PE1 dts
  dt-bindings: altera: removal of generic PE1 dts
  ARM: dts: socfpga: add Enclustra SoM dts files

 .../devicetree/bindings/arm/altera.yaml       |  24 ++-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |  25 ++-
 arch/arm/boot/dts/intel/socfpga/socfpga.dtsi  |   6 +-
 .../dts/intel/socfpga/socfpga_arria10.dtsi    |  26 ++--
 .../socfpga/socfpga_arria10_mercury_aa1.dtsi  | 141 ++++++++++++++---
 .../socfpga_arria10_mercury_aa1_pe1_emmc.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe1_qspi.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe1_sdmmc.dts |  16 ++
 .../socfpga_arria10_mercury_aa1_pe3_emmc.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe3_qspi.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_pe3_sdmmc.dts |  16 ++
 .../socfpga_arria10_mercury_aa1_st1_emmc.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_st1_qspi.dts  |  16 ++
 .../socfpga_arria10_mercury_aa1_st1_sdmmc.dts |  16 ++
 .../socfpga/socfpga_arria10_mercury_pe1.dts   |  55 -------
 .../socfpga/socfpga_cyclone5_mercury_sa1.dtsi | 143 +++++++++++++++++
 .../socfpga_cyclone5_mercury_sa1_pe1_emmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_pe1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_pe3_emmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_pe3_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_st1_emmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa1_st1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts |  16 ++
 .../socfpga/socfpga_cyclone5_mercury_sa2.dtsi | 146 ++++++++++++++++++
 .../socfpga_cyclone5_mercury_sa2_pe1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa2_pe3_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts |  16 ++
 .../socfpga_cyclone5_mercury_sa2_st1_qspi.dts |  16 ++
 ...socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts |  16 ++
 ...cfpga_enclustra_mercury_bootmode_emmc.dtsi |  12 ++
 ...cfpga_enclustra_mercury_bootmode_qspi.dtsi |   8 +
 ...fpga_enclustra_mercury_bootmode_sdmmc.dtsi |   8 +
 .../socfpga_enclustra_mercury_pe1.dtsi        |  33 ++++
 .../socfpga_enclustra_mercury_pe3.dtsi        |  55 +++++++
 .../socfpga_enclustra_mercury_st1.dtsi        |  15 ++
 .../ethernet/stmicro/stmmac/dwmac-generic.c   |   1 +
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 41 files changed, 992 insertions(+), 93 deletions(-)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_aa1_st1_sdmmc.dts
 delete mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_arria10_mercury_pe1.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_emmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa1_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_pe3_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_qspi.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_mercury_sa2_st1_sdmmc.dts
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_emmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_qspi.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_bootmode_sdmmc.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe1.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_pe3.dtsi
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_enclustra_mercury_st1.dtsi

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
