Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45C9B5B43
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 06:36:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39012C78020;
	Wed, 30 Oct 2024 05:36:46 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38D27C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 05:36:38 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-3e602a73ba1so3547226b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 22:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730266597; x=1730871397;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5JB/cGgUoF+EaDvRZAGIK3OwHiKrJHGT5IlWD3Oxlrk=;
 b=F6YAczGIqrE31cwjR6q6L+K82ptWbkL61MOYCE/MIC7WKO7HId6aeGhwbMl4vblkJs
 yXZAW1C59y/PQEjiJuEueXIDGkzv4IxQBpWKFO7Dg4FZE+qQlzgTAJJiXyC8FMSUknNg
 xhKSjGRZqLtLKkjpEHUcspsl2mY9MWfDeh+f30NyX9ooeXR8HEMgcFrgONnSWe58wRgu
 cUF3jb89JNfAxB1WqaXFgi0Mer3UjoJkKknThg/fvcZjK95AOHIFZU5ULRdU6B0Y06SD
 AGXlbZiVxwL2bFgptiUQ/1SGWeoQ+0fumZmsk2BBAdlWK/jsc/BPRRA9cWWxu9AKeXaR
 6HKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730266597; x=1730871397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5JB/cGgUoF+EaDvRZAGIK3OwHiKrJHGT5IlWD3Oxlrk=;
 b=blkovV3L07ivNUtZB4QQxUppXagrDtN9AhvhKkOUhUoK0lokDMIo8TKulAmu3uPp3L
 HtZn+3PsPoFUTejGHyn2yPZ6RwcHp3j06QlGdHiE/zaJGCXlAy+/JIuXwJ0hf2OUo4TV
 w5IXaWbwiIXr4v5B0TB7gvtTFN6mIrK+ezYiUX8HUedrjmAsByiQIETHZNUCNhmAqeUm
 ifbFfpIw4DiuQHsG+YvOZyyUjQHf7RyFsmVrl80oLS7qSSERnuXM8zhBoa8OR5a+lVjE
 V1AUSxFrbZFL40uNs7FfTnfmGsZUH/RON0CdZBzhtP9k9HEurnNP0BOGw4Nb2e0LBgYo
 Aa7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbhM7w2LCOeZgEN5P/8OqFZ3F1kZxANejQ737dS1P3gmyTS10zOt1HIHBRHjI8PSDWJa/zEAK4L48D+w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxE9bHpyBli0QXO5Qw+fmA6vZYZEzUu7dsGrGNtPhgdlsl8fnhg
 eO7LELA9b3q7eABTJ+25nFeLJ2Hwf82EQa/mDq71b23N3XC3I07Z
X-Google-Smtp-Source: AGHT+IH4FirAelcYwz6Otzk0LxXXB4G8PXfXbrPJ8o3q22jWDCJ8ZAFjpdGAFz8nJtPeZGloDI4FmA==
X-Received: by 2002:a05:6808:1918:b0:3e6:ad7:9a38 with SMTP id
 5614622812f47-3e63844158emr12362178b6e.24.1730266596775; 
 Tue, 29 Oct 2024 22:36:36 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7edc8661098sm8516595a12.8.2024.10.29.22.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 22:36:36 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 30 Oct 2024 13:36:09 +0800
Message-Id: <cover.1730263957.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v6 0/6] net: stmmac: Refactor FPE as
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
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   8 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 405 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  45 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 165 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 480 insertions(+), 412 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
