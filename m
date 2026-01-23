Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BZOOS7Rc2kCywAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 20:51:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE097A504
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 20:51:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27517C8F264;
	Fri, 23 Jan 2026 19:51:10 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F6E9C030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 19:51:09 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4801bc328easo29631965e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 11:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769197868; x=1769802668;
 darn=st-md-mailman.stormreply.com; 
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8jNsJjXS8M5t/mEUZRdZlxrFzfCZpFMkBqFJLBshMIk=;
 b=EdcDDxeg60ZUA6yLN3ES36WuFQHe6duzicT2vb71lvq43mOfiD+tkcuinvOTEBr/e6
 TLfREVY4b3NC08TJeSo0KO5XabHwLUYbvv9gEab4gdvOhaaqUzul+H2docyr5FAcYWEF
 Eh6pJLru0jFdnCqiMV92lC+sdYMAROiWv1sWeFO38t/cxEqzc4RdZcCOBEeS5bK13sWQ
 hyZiXSeSWc51w5Bw/wcplwBLikDrqBPny+db2hxylQw57XbD51YLrfzzdkUIqS+i/D6D
 HOlnwnJStYfe0G1i3esDBaU3eb2ZsbIvzCiJI9c0WmGs6gqwJnkumSj1IiKXYFRNHovs
 GrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769197868; x=1769802668;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8jNsJjXS8M5t/mEUZRdZlxrFzfCZpFMkBqFJLBshMIk=;
 b=E9ZYxrJ6E5xXodIPjSx+Rq/jMd5zrD3hfqy1OAcPQmfVXC7KGEDXk3UxLmxuTZJ//9
 CXoQnJ2akMTiG+8kHkvW/NgImTwVk9Lri8MVJNxEAvIBiLMu9zq1EMXQDA026BuFmeVT
 fbz426CL5MDHm4vFlLtOc9mwFPZ6+I1hMdQUSrSkqxA1/2QaK5QVuzOQI+RrJWNlzwSK
 Jr39pOvLGyQyFO06PaUvQLoPyQhhiM7/J2L2Jpo3Vt5kJvdtzRjlAO//Hl6wL7nHTF7N
 WK7IVyqp7AZM7kOU0zdde8QVupeK7Vi86oqpevdpeCLUSz3lYzgsU3pb9xSYSTYVFyA4
 tAyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDxY8KF+H+i4cT5wpPIWlYtpG1/0LvGd+xyvhd0GUZlHyCw66YxzVFzLFSpg2lRHylGM9HRYrSCJoR7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwlOfR7EFlhCe4cg5gZ0fMQUkDK6xzsHjMYZS87U9yG05DCkzLP
 jXgrtfrq8yAhw4x3BOKDDy6Yb6Ma+xo10iU4kvXgX/lfM96GgK8+2ahfZjNPOKw/8iI=
X-Gm-Gg: AZuq6aJKtj3lxr2rVSC4Cnw6N3bhk2vwsIhzmq6B8EAPTUN8Ao4wad9ULAJ9TuOqniS
 o+KJaYSGyMgSWugVE9lr8RhMU1IXburMlPO2U2b9pmIiu7055HGVTKPwecp4jT4pslQoCXTzS/t
 EMm8EfIL8NjYMmQI/VnVFzgvPwi0px1GrzHSpXhAgjop/NGaoSmYS47E24G4s+1eRshfXR0qYsU
 /11wni4kMk/hatcIGomX+iqrhB853+FfZADNr0q8ocKtJ1OsQhBPXbu+NzShuIOIeJ5U4E8W8ZA
 vLGV+7GpqsI9cDy8RhZGQb7+uTKePDfHc//Hay+3Jtn/NK8Zi+kqMug5zHBsKSFGfpH/pASdTFg
 7mPhiTnYBl8TZYHn+5zRfuxRqR+yg2eaKBGjyNOmEe8829MA9WajEgsh1TnHK071juCzmbbxJoz
 ltV72L7NUTTLmT/hP5
X-Received: by 2002:a05:600c:5494:b0:480:1e9e:f9d with SMTP id
 5b1f17b1804b1-4804c94810fmr65373435e9.8.1769197868314; 
 Fri, 23 Jan 2026 11:51:08 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804d8a5c32sm94300895e9.11.2026.01.23.11.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 11:51:07 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Message-ID: <cover.1769195864.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Eric Dumazet <edumazet@google.com>,
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
Subject: [Linux-stm32] [PATCH v4 0/3] s32g: Use a syscon for GPR
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linaro.org:s=google];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linaro.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chester62515@gmail.com,m:imx@lists.linux.dev,m:s32@nxp.com,m:Frank.li@nxp.com,m:edumazet@google.com,m:ghennadi.procopciuc@oss.nxp.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:linaro-s32@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:jan.petrous@oss.nxp.com,m:linux-arm-kernel@lists.infradead.org,m:mbrugger@suse.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:krzk+dt@kernel.org,m:shawnguo@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	RCPT_COUNT_TWELVE(0.00)[26];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.457];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,nxp.com,google.com,oss.nxp.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,linaro.org,vger.kernel.org,pengutronix.de,lists.infradead.org,suse.com,lunn.ch,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7FE097A504
X-Rspamd-Action: no action

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

Changes since v3:
* Fix the yaml file format
* Add netdev to the CC list on all emails so the CI triggers

Changes since v2:
* Improve the documentation in .../bindings/net/nxp,s32-dwmac.yaml
* "[PATCH v2 2/4] dt-bindings: mfd: syscon: Document the GPR syscon
  for the NXP S32 SoCs" was applied so drop it.

Changes since v1:
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
*** BLURB HERE ***

Dan Carpenter (3):
  net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
  dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
  dts: s32g: Add GPR syscon region

 .../bindings/net/nxp,s32-dwmac.yaml           | 13 +++++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  6 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  6 +++++
 .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 23 +++++++++++++++----
 4 files changed, 43 insertions(+), 5 deletions(-)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
