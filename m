Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A60589ADF26
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 10:31:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BBABC78F63;
	Thu, 24 Oct 2024 08:31:42 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8F25C78038
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 08:31:41 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20c693b68f5so6323545ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729758700; x=1730363500;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1oNnTivFwASMm3bbLUePa/ONTbP9bazkJEQG70mDoE=;
 b=bIzl+gxzSHUd+I3VC7fxlxi+MmjyLuO3FV+3KVtFZ7wMNUa9RhUd+1fMctwP3tt1qd
 j/ZQ5ThMyLf+5kcphqY3HzBGFbnJ4fEwI285NJUzWf21SLnJqvmYbACxfHlFXifzQPsV
 WH4xY2RtnrrRFycomKcTNEtkMeQqLRlG4MS9W66ys4a5jJCp5N2WzN0cOknNP/iHNA5q
 32j7EEd51jfElzogSPhlk0AbUhsa+Weq0Po/iKKSb+7a2oRi/Bu3PdnEpCTB+iM794gy
 ek5Tt/LLaxQ3I+Zl/nUMktRNyAmtEzGMIci/q47risvI08W1NsaV/ZBpcbr/Ys1em9p5
 XJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729758700; x=1730363500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C1oNnTivFwASMm3bbLUePa/ONTbP9bazkJEQG70mDoE=;
 b=rALPEk5W5amqb3+7tDZVpgRTIlPr0WDm2gTfMEDnUuvHzLZUvDuvrEVtF9N/Lvumt5
 la3WocVHdHW1SFo1NOvPHXKOxF1QgkSf8GVIbThEMATXUWB1hJnt6IG2zWcGf4eY5jwJ
 53EKR9MbQwqa76rDvxKa6lghqwtClJtWloyXcVhfroFrVco66hu3zT7LzSsaGCUG4rzO
 ITZrrCWxm3Iqn58w1lnfppVUIaxOF6ZuaXX6x7N6yRRb2DMIljIsu491VgvL0ifekB8U
 q83cr+r3ZixXdIKkTZywh1G5oCGJLrNvIOORopieLaronXSOwLkk15OUeH6D8NRbp0lD
 PZfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo0wS/qaX0eV2VKcnkCYRWsXeh+CTYnE5AFH0YuqYgR+wv/gk+R1OpzqQY7Pojep6jwH+Fdh+4IypY0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzr3JDrnIpPU5kADEssVXdrkhbKLGy2rGt1d9EapI4GNYFIV7wV
 kbdiPlfQMh1ehTW8qz2h00nGP10v6UrJGjFX3BNE0dkZ0+1BVSe0
X-Google-Smtp-Source: AGHT+IE8sGDrZzabWRqjNx6ZIY3uaHY+X1npznrkLs6Jcu4tChUNH1+QbobLtPQARhooG89cxI/kWg==
X-Received: by 2002:a17:902:ccc9:b0:205:68a4:b2d8 with SMTP id
 d9443c01a7336-20fa9deb634mr66670025ad.11.1729758699949; 
 Thu, 24 Oct 2024 01:31:39 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2e77e5a4ec4sm868773a91.54.2024.10.24.01.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 01:31:39 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 16:31:15 +0800
Message-Id: <cover.1729757625.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v4 0/6] net: stmmac: Refactor FPE as
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

Furong Xu (6):
  net: stmmac: Introduce separate files for FPE implementation
  net: stmmac: Rework macro definitions for gmac4 and xgmac
  net: stmmac: Refactor FPE functions to generic version
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
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 412 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  44 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 157 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 481 insertions(+), 407 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
