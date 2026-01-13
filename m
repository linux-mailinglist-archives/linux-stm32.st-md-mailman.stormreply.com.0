Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC48D1954E
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 15:13:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB7F2C8F283;
	Tue, 13 Jan 2026 14:13:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F31B7C8F282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 14:13:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-47d3ffa6720so70117295e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 06:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768313610; x=1768918410;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EpPYFuBpeHzrlOUi6OsVjYU9ydxR9fDDFonQuw5LFlU=;
 b=leNMAkZZPTmDcR8CywiyWEAinx5PRK4th9urleqnXnntqlGVLOFfihfmYh14JpOuqv
 YdN9RFPNtyG48pk61dqYgSBocGwtZBwQzE1MXUbDzNT2zk3F8IRK0xlPuRqpuALycvmJ
 9o4yilG+xuprje6iGhDc9z0h63Wpt6YUpLhtRYPxcPNBoMAPZa9JRaXUMxLA6TDHXao4
 WhtRMK3bYCnFnP+BixkGPmVBPfi7oI4iaE5GO32Xwpey7C2mRUBS7yW91XLVr3v9JSSW
 13vjNa7iUL4KqYuTBk9cefOrdLmtWfLPXBPsZ5ogE9qRsiM0IhyxGJc6gLoXlttJTB4N
 TSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768313610; x=1768918410;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EpPYFuBpeHzrlOUi6OsVjYU9ydxR9fDDFonQuw5LFlU=;
 b=T8gMQgJZRzGDYxpfs+ZSDciJbONCJUbBsklih+VC4TZ5cs/g8Fdpy9q/Xyw5X1G7gb
 ySu4eJwdBndSRvswHpi4hFRQ9bS+nLm7d/YyYdmNdD4YsF5YDcSF8qJPYXYcCXgjPQdn
 WaHEYi1gKaPlcLRKUkp9AG1BR2fwYeoJ0ntRp9Xmc3uD/snZs+Xx82tcfFfwkcbUBHHI
 tegI4zjiWdSDiL/WBwFpfZqWIEVH2Ogp5GKYu35YjIkwvs4ZoCMPF2i5sqTSrGiV6nJ+
 aDQeIp8Qt0ATSmuTpTefKysTPAdKxsInqQco+6/cZZiTuqT9Kxgeb9cHEIdjVgSEmUWv
 TkCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWC2UUvZPuH5juwUpeHhBXVwMET345KWJFOSrRyuqieff430PW+gcyGIyUVdtcMExUcGq8qckqa3uoqA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YztZ1ctusC0vg4pi4vUmHlt9N8LZiNOWAKBAQdyJW3wkSwRqTLk
 aTiTt96vis1TbLybINQv+fB1RWLVa+suypCDmmB/qQaHGqhXr9zJG4MXeAC8CSf/P+g=
X-Gm-Gg: AY/fxX6hbGyVK/MdnqwjjCKPBzau80VdUqZoszKiIcumBHH//jfjEqnqaSe9BGfR08b
 REhg0Sc76pPBXWscZkLtWmFEVtIQtv4hvAMHsuy1DtzEW3IF9YPOpLee/1PblJR7dqpo9LP0uNb
 9y+xWVlALp+vENjaIUr8UqqFh2gZuPMkwgdxTpxeymGgbPsapXxnF7MVY+NIRIjXCrn2YFaBhGX
 35LaM90wrBdMy+pZNiZff3xR0qkD1bxTtM/xp7HN4uSSSZaJLRC+KPzesYROz9KhxfeAp8SZ3M5
 58/0CLwYFtmGOqtQ5dWkJdWtGelZ74Al5xPrGR0RmhvfeldbCbLRyCoxACEphhSq7x7JecoWRkD
 c5K8w54xQEb4EyMhXVXYp3hV2KPbPI9rbwZhh9ZHekicXLDeRcf6m3BsKNIBhEbWBBXmKCIN1lz
 rWi42Pm5cMMr3T72ixJIg9xbnCi+Q=
X-Google-Smtp-Source: AGHT+IESteNDhCsp9djoyMeUvPvQ33cMYgxEEj70wmWesi8MDh/SKjav/Vxq6pmgAEpoaSXmrBuSJw==
X-Received: by 2002:a05:600c:1392:b0:46e:37fe:f0e6 with SMTP id
 5b1f17b1804b1-47d84b3b724mr277918305e9.30.1768313610033; 
 Tue, 13 Jan 2026 06:13:30 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee0b45b8fsm1590895e9.4.2026.01.13.06.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 06:13:29 -0800 (PST)
Date: Tue, 13 Jan 2026 17:13:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>, Frank Li <Frank.li@nxp.com>
Message-ID: <cover.1768311583.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Eric Dumazet <edumazet@google.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linaro-s32@linaro.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH v3 0/3] s32g: Use a syscon for GPR
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

Frank has pushed back on this a bit.  I think he objects to how
stmmac/dwmac-s32.c controlls the PHY by writing to a register instead
of through a driver.  Creating a syscon driver will make writing to
other drivers even easier.  In the end, we're going to need to write
to register eventually whether it's directly or through an abstraction
layer.  I feel like this is a good change and when we start dealing
with SCMI then it's an essential change.  I have fixed Krzysztof's
complaint about the poor documentation in the nxp,s32-dwmac.yaml
file.

The s32g devices have a GPR register region which holds a number of
miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
anything from there and we just add a line to the device tree to
access that GMAC_0_CTRL_STS register:

                        reg = <0x4033c000 0x2000>, /* gmac IP */
                              <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */

I have included the whole list of registers below.

We still have to maintain backwards compatibility to this format,
of course, but it would be better to access these registers through a
syscon.  Putting all the registers together is more organized and shows
how the hardware actually is implemented.

Secondly, in some versions of this chipset those registers can only be
accessed via SCMI.  It's relatively straight forward to handle this
by writing a syscon driver and registering it with of_syscon_register_regmap()
but it's complicated to deal with if the registers aren't grouped
together.

Changed since v2:
* Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
* "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
  for the NXP S32 SoCs" was applied so drop it.

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

Dan Carpenter (3):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../bindings/net/nxp,s32-dwmac.yaml           | 12 ++++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 4 files changed, 42 insertions(+), 5 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
