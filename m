Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E268C9C93B
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Dec 2025 19:17:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1311BC58D7A;
	Tue,  2 Dec 2025 18:17:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6C88C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Dec 2025 18:17:08 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-42e2e5da5fcso1981989f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Dec 2025 10:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764699428; x=1765304228;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6b74+PpIp4g7MMqPdYt95ZSBDMLgOHp379BS/AlUf30=;
 b=oHUmyD6GtCAF/d6X/vFZz1dsxEx+qI70YrXQMTCXY4B+5KlXPAlQm3CVcnYvRIfAcN
 CI+/Zk7IYPIjejGIcgZyjT19WoQZZdEO6lITBY2Ba14rJDjb5jDJ6X6FZWO5FI1kNJJp
 2/p3Io3phF68oTj4rmL+EuvOiNOqdzjbMDd8ix4EjL9+rgcV0QNX1GeZQ6vMhchZhWk5
 aCZ3Aia3FO9631qmqu25Ie+px4TkzQwKLdsEnwQbw1+xdjlQDjQZTx5VzpDQAMK1wdFH
 mxFIB5MGDiMgUdZfN/CmS3UzKG08a2/8z3h6rq0nOjvSncFTSJKXxAlwZraOsNfBR/5G
 kshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764699428; x=1765304228;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6b74+PpIp4g7MMqPdYt95ZSBDMLgOHp379BS/AlUf30=;
 b=Su6n5240pfQnp+qcOOkD1nqq0kXaDh1pL3I7LOBH5denMNav7kxEq/jTAq1nrqHUGr
 eUsRuXqCSApvqHEqz6kPkJAUimna+a813c/Sl9vJL98PZTHCo5m1SMCobvTsKABX1kjC
 UxzmaTyvuX2wLA3mRbYaIWEwgvHunlZdttNiBAgpCaM/AO+OXFgKSwKd/XDA6T6Ev67P
 IbcDJK4uD5LXnb3/5d41U5SE8CxToHQxBZolFSi69/VTCRFHl5xIa4ZdoJoUXmLCRSlk
 aBGZh1iL2XXjlk5FYubhloBcLMNsilu2UnujTr/hdnc37u2YdZ5NemBOP+42I7ttTPvo
 iQ7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUsz5jHkVl2Rino0SRxshIUUHfhpn+1xHqIi20KH+y14lpE8XWgVnTmQ5AkQkf6ticfX5J7PfZJxewYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgTOnYyWLQWQD0QvzruT1okaiFI/+YyM/aPwtUmLX7FZbANCL0
 VhgUoTPryM2vRVZ1XK/NNnVRAtUUylXZatewx0/g7owCCSFIW93E/J0nOyu01WoNWEA=
X-Gm-Gg: ASbGncv7IKerNz9W1L+7TVfZfirF7bianovNX3VSSPAIJLUGl8ZrTuilSa4eixeOipq
 O9Sk6r+kP6Nculmfc3q3BYyH9HTo+OPaBIEtpiA4yS8OEfN4gFbn7waavaoM34kGD64DNZtXU8s
 nHp2uBqcH39AjT9s53yHZ4xJHySVMTodJStWZE8VjYG6ybQI/EsSSX4MW2B4NIU9Di0FzcRIE5s
 sSfGpVLdtVHeUcJE08ZwNidyHuXvzhFm6O6idniy0Ib07mUCeifJAjNjbK2R0agnRIjAvXIAcRC
 yeNNhbDXF4oecUQEMC7X97AJPd8CmZiaUSySFMDmp5DU0rJSBmuDLnQLoSHCKq6DNvZYHvmCXb1
 vtM2t0H2laKPLv4aO6HzO9bHsVQ/Qr3S/FYqZkAjZx8HinU9i/gdMT1n3jn9g/P106pLFfNs7yL
 9n7DGfGCLHXXP6aAvP
X-Google-Smtp-Source: AGHT+IGdPY6yqrBKJkkOOYWF6CM+7Jwdu1H0nVTCpwkcVSguUh9pxxkKdepb4CrjpvgK1/jyWOMffg==
X-Received: by 2002:a5d:5f82:0:b0:42b:3220:9412 with SMTP id
 ffacd0b85a97d-42e0f3491e2mr34996565f8f.28.1764699428016; 
 Tue, 02 Dec 2025 10:17:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-42e1ca1a3f1sm34529299f8f.28.2025.12.02.10.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Dec 2025 10:17:07 -0800 (PST)
Date: Tue, 2 Dec 2025 21:17:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Message-ID: <aS8tH3VD9uxl56ah@stanley.mountain>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
 <6275e666a7ef78bd4c758d3f7f6fb6f30407393e.1764592300.git.dan.carpenter@linaro.org>
 <aS4W0M+ZkQzuUjtT@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aS4W0M+ZkQzuUjtT@lizhi-Precision-Tower-5810>
Cc: s32@nxp.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Jan Petrous <jan.petrous@oss.nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, linaro-s32@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/4] net: stmmac: s32: use the syscon
 interface PHY_INTF_SEL_RGMII
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

On Mon, Dec 01, 2025 at 05:29:36PM -0500, Frank Li wrote:
> On Mon, Dec 01, 2025 at 04:08:20PM +0300, Dan Carpenter wrote:
> > On the s32 chipset the GMAC_0_CTRL_STS register is in GPR region.
> > Originally, accessing this register was done in a sort of ad-hoc way,
> > but we want to use the syscon interface to do it.
> 
> What's benefit by use syscon interface here? syscon have not much
> well consided funcitonal abstraction.
> 

The GPR has a bunch of random registers that aren't really related.
On these chips they're just regular MMIO registers, but in other
configurations you can only access them using SCMI.

It's better to group them together that's how they are in the hardware.
Otherwise we'd end up randomly adding a register address to the
ethernet device tree entry, but it's nicer to use a phandle to
reference the GPR.

The only register we're using now is the GMAC_0_CTRL_STS but here
is the list of registers in the GPR.

From 0x4007C000

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

Then from 0x4007CA00

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

From 4007C800

4  GPR01 Register (GPR01)
30 GPR12 Register (GPR12)
58 GPR22 Register (GPR22)
70 GPR28 Register (GPR28)
74 GPR29 Register (GPR29)

From 4007CB00

4 WKUP Pad Pullup/Pulldown Select (WKUP_PUS)

regards,
dan carpenter

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
