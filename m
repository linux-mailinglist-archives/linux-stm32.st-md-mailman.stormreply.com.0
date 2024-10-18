Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7C39A3594
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 08:39:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D65DC78035;
	Fri, 18 Oct 2024 06:39:53 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 614CEC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 06:39:45 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20c803787abso13836625ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729233584; x=1729838384;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uT/jCt5QcwTbFSYi05lc89RT3DwAspW1JXtMxybafaY=;
 b=XeW9ejK7l8efAMhrNxH/NNnTy0To2tGQOBDd7Io1aDbLhSHA+I/lXfw+1ct5LuaGII
 iwuahYEiY3FG76bkxBaK1U1OkwJxtoLm85oR4x+xAWY68aaywdVYoGJQhsust3hglQ81
 secnnqtkwzPCqVOtPAV+HA8BblJSZ/w0/Ego5QZLjSeVGPGbeklF2SufrPqR+yhb1xbz
 O5Qc1kjhVVPkdYE5hV1DWFlBwCaJkfUgbVP960aVSnzfiwCJha6hC2VJgqlNkUCGhADq
 27/mBPUQTG2NVp9u7HJmjQwhhgiJD/FRDbk9z5gvU60x7LWGsgqXqGDR84Avi0s36Aan
 f3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729233584; x=1729838384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uT/jCt5QcwTbFSYi05lc89RT3DwAspW1JXtMxybafaY=;
 b=N9E8kQi760ltjjR6m7RM48VJgYR0oEVRzB+ucSoWlQrMAW1xTXCVr8YtBVcZ8feZyJ
 lt/7PHUjIzmf1vwfZqX1g3OYEhRHiJzgqZhA3XNnlR5pr8UyRgLeF+zBMNAcq3VKEJQu
 JpdoR7OjTyhnzxXlaagpOgJ3zReQ4NXYAAVJW4Hv4ZAV8GS5wEOCMGXH188/TTpHbVzd
 NsLdrzbOJ187byqo5+iXJ5kvjUvSJpTNv0LfwJpvoKxV/Y3Sh6CtT1u466C/3j/OHAMb
 LaQjd6VBBWnfTsN60Dpo3H61AYD4tjv9woZm9v2bnxDW3j3aABXv9WsbN1DZuw7IkuYB
 aDvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxwzXjN2vYWTiZPHkuIAa7l1AFdznN1Jf0keiUsglSW4Exykkxqv5JqiATPO/jc/iD7E3H3w8hzGNUSQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxwdRs+88iyHEPIOze12ghUjNkeaqGp+U4xJtVgGEF/3nkMDIti
 NTQi4sNvGcCMbiM7zH8iQTDm5SHxhNh9EQ3lUmHRQonymAxGFTCZ
X-Google-Smtp-Source: AGHT+IFu4YCLEVDs8s7LlrZTMXp3Lx2+ATgY2Oc7tnIYbAbFTja+uBUgxR0QGwxjWrDfj8BFV3AdZw==
X-Received: by 2002:a17:902:e749:b0:20e:567c:9d87 with SMTP id
 d9443c01a7336-20e567c9ddbmr31892085ad.20.1729233583765; 
 Thu, 17 Oct 2024 23:39:43 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e5a74766fsm6285455ad.73.2024.10.17.23.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 23:39:43 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 14:39:06 +0800
Message-Id: <cover.1729233020.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 0/8] net: stmmac: Refactor FPE as
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

Changes in v2:
  1. Split patches to easily review
  2. Use struct as function param to keep param list short
  3. Typo fixes in commit message and title

Furong Xu (8):
  net: stmmac: Introduce separate files for FPE implementation
  net: stmmac: Introduce stmmac_fpe_ops for gmac4 and xgmac
  net: stmmac: Rework macro definitions for gmac4 and xgmac
  net: stmmac: Refactor stmmac_fpe_ops functions for reuse
  net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
  net: stmmac: xgmac: Switch to common_fpe_configure()
  net: stmmac: xgmac: Complete FPE support
  net: stmmac: xgmac: Enable FPE for tc-mqprio/tc-taprio

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  12 -
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 150 ------
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  26 -
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   7 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  28 --
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  54 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  10 -
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 464 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  38 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 149 +-----
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 549 insertions(+), 405 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
