Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9C9B2360
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2024 04:07:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74068C71292;
	Mon, 28 Oct 2024 03:07:56 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CE50C6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2024 03:07:48 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-20c7edf2872so35028945ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Oct 2024 20:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730084867; x=1730689667;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oyZ5oeJxWBOMpUrNuWphCAJQozS0spzFlvL2/Btoo5A=;
 b=HmebAazMKeG+TYc9x6DZrbGu+FOzlQd4kr6M6vJPRIyRmqwXXjCNadR89fxTtIuM6A
 3SEYEk63mN71fJBYsDQp8xaWzhR2LhLUgyY/g3cw9g1zE9wvqvLLpGCL9dVMjg9Nfeiu
 LCQnYjFL6av3XB0EWDupZfgW4x54xaSbNNme7x+XixJAkT+FfWzD17K4sydvX1pCTsqS
 BhKJnCuV/USYfE4PenAIB8COSBBR8YZqaMKcO92agDIuBkEmY+vNS9sNUIyVOMXH/urz
 NTIGZI5puXXF2mhhGU/ttGeD0tI7aFPw5l51x43Ya9bgNzWK0p1bmVxlpIzF5b9NzkYy
 zSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730084867; x=1730689667;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oyZ5oeJxWBOMpUrNuWphCAJQozS0spzFlvL2/Btoo5A=;
 b=oR2nPvLFXpTZJOJ0ADf9VCjgE6/Wn+9PaBxlSJwse+BcQQi7SYvUhdXUM28IRz2tos
 K3uf1cZY370JyLtORfDUmLB+Sol6BnKuDKYJmpCNbauMmDHm8NQ+U0IsLvVTVKxwgTtH
 X8ECDQrqjhf2iR+TQXS6mMcIvGxiJ3iGECm10Xt+xh2v2JRM80GbzR5cJRd7aob2CWxX
 RTJLA0qN5HAh7XHFA1aE2xNpEDp1CN85Mr79AM3PazVUdh2GuEKaLsaVziZnUrvLtyxK
 jRA33OD2b0ztdTctnWvrbgH6cpPVFCtTOFsQcxCo5gTyFYZBgknVUVyldAPFh+bHUks8
 A0nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+b5NA5SgT2cHuvrs4dkZV4kAWqYeqMMMAz6dcL/0WvlRiDqXGnr0ElhvNQno9FuTfaiWiKIVXzbJ35w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUc5FStxc6g4W+iyzKIzyc6b2+Ue9jiE+/ArelgHg9QJl12JEU
 Q3p32ZO0BXyA53jfA+jFIrf8bO10m8WdwmO0qegt8RRVx1AVOMsf
X-Google-Smtp-Source: AGHT+IGjTJH6FP5Q/Rq9jlV590Kh1CRuN6iXAYc28hlY0HjvVjt90JpayXD0vSxAoJRyO87DxJokiA==
X-Received: by 2002:a17:902:f64a:b0:20b:a73b:3f5 with SMTP id
 d9443c01a7336-210c59c6d8cmr111903495ad.14.1730084866834; 
 Sun, 27 Oct 2024 20:07:46 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-210bbf6d327sm41414155ad.67.2024.10.27.20.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 20:07:46 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 28 Oct 2024 11:07:23 +0800
Message-Id: <cover.1730084449.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v5 0/6] net: stmmac: Refactor FPE as
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
