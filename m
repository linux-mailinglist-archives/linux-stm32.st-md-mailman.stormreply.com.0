Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4919B9206
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 14:31:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2145CC78013;
	Fri,  1 Nov 2024 13:31:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04824C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 13:31:54 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-71e4e481692so1743853b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 06:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730467912; x=1731072712;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6BgmcTk7XmHujA/4u0if1oSw4JEAcJOllZBBdLUDRLQ=;
 b=LDP/x8YjEaBNKq7PsQDAilq2hpo7/jtrRF1wXyzw5xn3w1LqtPr4n+VUEyxdjv3URY
 /dwtSPANKAIFG/3gpDAz07e5KzZwIg+THFSq6fi2GTgyWgfYrKElsYaSCNoVeRLOh221
 B7p+iV8Q1TZ5w61QNVToVY+ub3ebsvIGiv9lJhuFt0lfjKfFA1kPT27EOgCCIq9CRXRb
 NNGY0OVskbQSFnkGe4b1OkP7tBxbSgVj58Ts4iUcFitRd4WxLliITCRUtNswNo90rs4/
 La+VGl5//1Gj1EWoAouP6V5eVW6uvQTludehVKrEgt+LaM5NEWpfTf8DMv+LEGpyEIgk
 eJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730467912; x=1731072712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BgmcTk7XmHujA/4u0if1oSw4JEAcJOllZBBdLUDRLQ=;
 b=SQ28pOBbJ0F/R3hj0KIbGPYRDcmUuIJOei4UshlMDWUb0Bk7JOMVIToODDC8oG+dTG
 wdomWPLOpOBT/gFM4Eh8ciQXXToCfum4c0bFblk2uaHcnpc5MoUjdcyf90qxGc6gHmdk
 PI9YjlfR13dYsySGnDRHWeIJQ3BTg8mVLqGS0qv0Kbt3ybCLyqnwxUvaDazz4SyS+XXW
 1IRto2nmdEAqDAyQvqcFuDf8csUOx6xqN6WREhzfcVlbm9nu0Qh4iTlSsmzafWfZeKru
 AjrBu95osORM1wGKZ+P82s53DHUydwERYQqkckWrRVAyX7Znh07dd9DjNdQmYQEtCxp0
 L8dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdB1QD0Cpj9/LSoC6qVMZ/Z4pl67/R4G5PjtQpgIyhnMX+SXayE0SvwiA91bvCOblnZL/qa/xMSGwH8g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKkr0YKz8wePiAFgYFWO5pZKJZQWdCUt44crFKWhLp1CEc3vAW
 0an8IXcpn/TChEnkDK6Dq6uDPwuHBbtr5lb9Smmk/+5TiHcnulXQ
X-Google-Smtp-Source: AGHT+IHAE55EK0dfqKcLPAtM/F6+ejlhfkIjKBOG/4/JPVFxXfsjxql6Db9+CeYkz1C9x1U4n7tJZQ==
X-Received: by 2002:a17:90b:3844:b0:2e2:a8e0:85e9 with SMTP id
 98e67ed59e1d1-2e94c2e43bamr4641436a91.18.1730467912286; 
 Fri, 01 Nov 2024 06:31:52 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:31:51 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Nov 2024 21:31:27 +0800
Message-Id: <cover.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v8 0/8] net: stmmac: Refactor FPE as
	a separate module
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

Refactor FPE implementation by moving common code for DWMAC4 and
DWXGMAC into a separate FPE module.

FPE implementation for DWMAC4 and DWXGMAC differs only for:
1) Offset address of MAC_FPE_CTRL_STS and MTL_FPE_CTRL_STS
2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1
3) Bit offset of Frame Preemption Interrupt Enable

Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a

Changes in v8:
  1. Reorder functions in their natural calling order
  2. Unexport stmmac_fpe_configure() and make it static
  3. Swap 3rd patch and 4th patch in V7

  V7:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=905021&state=%2A&archive=both

Changes in v7:
  1. Split stmmac_fpe_supported() changes into a separate patch
  2. Unexport stmmac_fpe_send_mpacket() and make it static
  3. Convert to netdev_get_num_tc()
  4. Commit message update for the 3rd patch

  V6:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=904502&state=%2A&archive=both

Changes in v6:
  1. Introduce stmmac_fpe_supported() to improve compatibility
  2. Remove redundant fpesel check
  3. Remove redundant parameters of stmmac_fpe_configure()

  V5:
    https://patchwork.kernel.org/project/netdevbpf/list/?series=903628&state=%2A&archive=both

Changes in v5:
  1. Fix build errors reported by kernel test robot:
  https://lore.kernel.org/oe-kbuild-all/202410260025.sME33DwY-lkp@intel.com/

Changes in v4:
  1. Update FPE IRQ handling
  2. Check fpesel bit and stmmac_fpe_reg pointer to guarantee that driver
  does not crash on a certain platform that FPE is to be implemented

Changes in v3:
  1. Drop stmmac_fpe_ops and refactor FPE functions to generic version to
  avoid function pointers
  2. Drop the _SHIFT macro definitions

Changes in v2:
  1. Split patches to easily review
  2. Use struct as function param to keep param list short
  3. Typo fixes in commit message and title

Furong Xu (8):
  net: stmmac: Introduce separate files for FPE implementation
  net: stmmac: Rework macro definitions for gmac4 and xgmac
  net: stmmac: Introduce stmmac_fpe_supported()
  net: stmmac: Refactor FPE functions to generic version
  net: stmmac: Get the TC number of net_device by netdev_get_num_tc()
  net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
  net: stmmac: xgmac: Complete FPE support
  net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |   1 -
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 150 -------
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  26 --
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   6 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  31 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  11 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   8 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 413 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  33 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 165 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 476 insertions(+), 412 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
