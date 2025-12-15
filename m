Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1950ACBE580
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Dec 2025 15:41:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8ADAC35E2B;
	Mon, 15 Dec 2025 14:41:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FD3BC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 14:41:48 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa9so1275430f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765809707; x=1766414507;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MOcUNs+T7w7UnOFVcqXvYSgg4w1o3SYRSucYGzT5NG4=;
 b=cSF/09J2YVstJuICS9HmoRpHo0Xz75OlifdnImIcp07+k8ROAiWUMT9te+zAOCdzxN
 1WKTVMtRP4NVc32TR57E0wSjRL6UL350JyZRVy8wXvlP2KAWVyvY7Ur4mfS8F75QhoHU
 Xin+6AD4XIAz4pKmnIb861rxvGL/51EUaVVi05/JvuKltGnieB8TOEG4IW9DqjQycmOM
 MX6Hi2ODRJ1iuIBQjGh4V0Pcch1v6oQDU+v0Xm4ZKTPWcdk9Fkw0wya8JAGZf1lVvldF
 uZXCD2ZGLhLyB/UQ9shtuReDlkdOLz9uCZWslR7qT5xKQn+GtdRPyHoC/4nPoJBpclaE
 7E4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765809707; x=1766414507;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MOcUNs+T7w7UnOFVcqXvYSgg4w1o3SYRSucYGzT5NG4=;
 b=N0RVAeke7eTvXLn5GUY0UbQoXn8/++me8T6Gz55vgLKqAPlQhKTYu+eMWO/l56N1j5
 HNGvLDxdptc38mckVms4KSC0MGo/NK94v5MQ/Q3hps2gU2/absswODTFW6FuHdHXsD7O
 ezEemxUi8rDfGK1B/dGD+MXhqtHf4D5PQUrtgoiI/9udv2lDGY0CpcaFpS6p/Rgl4ZeR
 Sih4aRCpE43PkMyvresll5ikCPyunCNJI3EF+hpeNgE/GzEfgbw2IK+AbJV+YT8QWDI7
 Feo/SUtpP6xl+AuaLYf8Jp7xoqKNrLgw0aSYpu5wYol0cSiyL5SPyzN634fwbEdd0S4V
 ySrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlSxp6a+Pb//OBZHisMob/uVWFpambVUfSzlo5MiiHYVaJbKZIaPNCQXWwq7YVTABbz1XH/oaRAd4CYw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzq9kyE9oqWGpDl04yKt+eqc9QwA56bVrT28JnczrCBauGUwmhD
 I996BPnZwbKWrvwNuaW2Grn5V3gJ55G1OihwZJVi1fJOW1Nmajwrzw+0ey1l4uF5HFM=
X-Gm-Gg: AY/fxX7i8L/Dsh2uGgBeUZh/x+9/VlgfD28N+6YKtU6wiBiJ9JJlet42YmGCTr3ZAw/
 aUkLRaJg0DJaDfYVvojC+AD085Cf8R5668YtdLlXv1ozG4jzsUdPcodVGwP+6FMhaCp0iBCyyvJ
 kVkukqAx/ESPNa3um5NHqKD5IWpcNB/kH15+PIfoT0F3RZr5hhxG1YTvu1kht7TFn7F7B/jX+PC
 Htd49yngpbTVUldUt3nTZnu/+Az+lSHvK2vZr5fgVvy+WGC0r2pIjbVSRxlwfiic0n15fa63J8o
 RqH0tDJEwW3XIi2uOkffzbXJHaT2Qc/ZBQM0e951b/vUT6Tl/20W6INBfrw5lRC2ynoyz0q13Yw
 SHfJZSnWDM/IAyDKSDaUKE2u4OdiBWxgTpUTUusVQTO8OdGDZNzg9ULBP5AZGIOdOxlN20bMKBZ
 708zkaBz4pg0/C4O5x
X-Google-Smtp-Source: AGHT+IH7tV1xCOROP2jvu0xV490eqBk9+v5Ntm6XR34UvABXmZ0b23HM/6I4IQoJkUDLysFdkLNqfw==
X-Received: by 2002:a5d:64c7:0:b0:431:327:5dc8 with SMTP id
 ffacd0b85a97d-43103275eb4mr709797f8f.46.1765809707367; 
 Mon, 15 Dec 2025 06:41:47 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42ff626b591sm17343328f8f.15.2025.12.15.06.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 06:41:46 -0800 (PST)
Date: Mon, 15 Dec 2025 17:41:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Message-ID: <cover.1765806521.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linaro-s32@linaro.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH v2 0/4] s32g: Use a syscon for GPR
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

The s32g devices have a GPR register region which holds a number of
miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
anything from there and we just add a line to the device tree to
access that GMAC_0_CTRL_STS register:

                        reg = <0x4033c000 0x2000>, /* gmac IP */
                              <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */

We still have to maintain backwards compatibility to this format,
of course, but it would be better to access these through a syscon.
First of all, putting all the registers together is more organized
and shows how the hardware actually is implemented.  Secondly, in
some versions of this chipset those registers can only be accessed
via SCMI, if the registers aren't grouped together each driver will
have to create a whole lot of if then statements to access it via
IOMEM or via SCMI, where if we use a syscon interface we can write
a driver to handle that quite transparently without modifying each
individual driver which reads or writes to one of these registers.
That code is out of tree for now, but eventually we'll want to
support this.

Changed since v1:
* Add imx@lists.linux.dev to the CC list.
* Fix forward porting bug.  s/PHY_INTF_SEL_RGMII/S32_PHY_INTF_SEL_RGMII/
* Use the correct SoC names nxp,s32g2-gpr and nxp,s32g3-gpr instead of
  nxp,s32g-gpr which is the SoC family.
* Fix the phandle name by adding the vendor prefix
* Fix the documentation for the phandle
* Remove #address-cells and #size-cells from the syscon block

Here is the whole list of registers in the GPR region

Starting from 0x4007C000

0  Software-Triggered Faults (SW_NCF)
4  GMAC Control (GMAC_0_CTRL_STS)
28 CMU Status 1 (CMU_STATUS_REG1)
2C CMUs Status 2 (CMU_STATUS_REG2)
30 FCCU EOUT Override Clear (FCCU_EOUT_OVERRIDE_CLEAR_REG)
38 SRC POR Control (SRC_POR_CTRL_REG)
54 GPR21 (GPR21)
5C GPR23 (GPR23)
60 GPR24 Register (GPR24)
CC Debug Control (DEBUG_CONTROL)
F0 Timestamp Control (TIMESTAMP_CONTROL_REGISTER)
F4 FlexRay OS Tick Input Select (FLEXRAY_OS_TICK_INPUT_SELECT_REG)
FC GPR63 Register (GPR63)

Starting from 0x4007CA00

0  Coherency Enable for PFE Ports (PFE_COH_EN)
4  PFE EMAC Interface Mode (PFE_EMACX_INTF_SEL)
20 PFE EMACX Power Control (PFE_PWR_CTRL)
28 Error Injection on Cortex-M7 AHB and AXI Pipe (CM7_TCM_AHB_SLICE)
2C Error Injection AHBP Gasket Cortex-M7 (ERROR_INJECTION_AHBP_GASKET_CM7)
40 LLCE Subsystem Status (LLCE_STAT)
44 LLCE Power Control (LLCE_CTRL)
48 DDR Urgent Control (DDR_URGENT_CTRL)
4C FTM Global Load Control (FLXTIM_CTRL)
50 FTM LDOK Status (FLXTIM_STAT)
54 Top CMU Status (CMU_STAT)
58 Accelerator NoC No Pending Trans Status (NOC_NOPEND_TRANS)
90 SerDes RD/WD Toggle Control (PCIE_TOGGLE)
94 SerDes Toggle Done Status (PCIE_TOGGLEDONE_STAT)
E0 Generic Control 0 (GENCTRL0)
E4 Generic Control 1 (GENCTRL1)
F0 Generic Status 0 (GENSTAT0)
FC Cortex-M7 AXI Parity Error and AHBP Gasket Error Alarm (CM7_AXI_AHBP_GASKET_ERROR_ALARM)

Starting from 4007C800

4  GPR01 Register (GPR01)
30 GPR12 Register (GPR12)
58 GPR22 Register (GPR22)
70 GPR28 Register (GPR28)
74 GPR29 Register (GPR29)

Starting from 4007CB00

4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)

Dan Carpenter (4):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: mfd: syscon: Document the GPR syscon for the NXP S32 SoCs
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../devicetree/bindings/mfd/syscon.yaml       |  4 ++++
 .../bindings/net/nxp,s32-dwmac.yaml           | 10 ++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 5 files changed, 44 insertions(+), 5 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
