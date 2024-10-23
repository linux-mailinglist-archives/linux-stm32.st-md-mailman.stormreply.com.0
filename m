Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B279ABFB8
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 09:06:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5EB7C6DD9F;
	Wed, 23 Oct 2024 07:06:20 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A06BC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 07:06:13 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20cdb889222so62655935ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 00:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729667172; x=1730271972;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TOq6S3BVd0FbwZK6IpEO8zNzUEsSPo37nCA15gz6oek=;
 b=jPJ3v48xxt+AZtliOxu2jAoy1zFN+e5v/aitu+M/13FEuYPcloqNXbkybmxKMAUNK3
 ullyfxOkqlOzaAGHm8FSxZHpoxTAxNNoKK5/wPq7M/v+XYXZkOUUlAqjNyZOa3NXOzcv
 Itha8Oxd+vfasx5N3csXQzlQGgNwQvDDJKpSb0wEVIwJ7DsYY5iqTrhbLtp/1yPU6AVR
 D2n7aoEUT32oYd9QW3PCS1o7vAYk3Qm+Y1SP8AebUbVhRNpD0HqIWrdX9K/p8psxs9sJ
 5PpK3lSrvI61OavNH/eP39VGGshYX5FsM66AeibyclrDtEot65f8t2fpThIRbXjXI+mN
 SS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729667172; x=1730271972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TOq6S3BVd0FbwZK6IpEO8zNzUEsSPo37nCA15gz6oek=;
 b=betTDMr/RrqNX9W/iCY1V5B0ljNUc5CZ7OuRxpGtIbi0BWHZv76jVZCuKeQNvL5+bc
 a7B0WDlmcwqtWBCJER5DzlnEJvCJEsMbk5V5WLjbyFK8817DuS+LeoWpHYRj5XttJlkR
 SFGZ4sweVMu6FFWUKMWIYZ357IMg6eQt3qNPiSKKqTgooWlrCEJrvAFokZu7CsRWK5mq
 ANgeL1okY8QOnaek8nEfE8jyNIHX11Psuf7tTXRiKYOGz1JuvhSIUyeqixfyFw6O6Woh
 rIl8DgU1Z+XEhTxjobqjNAg+w2y8mOLVfC/1oAm9DmGDaYL3nRZs3JT9cvyfymfZiIrZ
 1EWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr1eVltEslwoFheTCR5ez9t18V9kBPNkKCNimqNsKm7EGme5r8aXnmFA4BtQcLprLHwuTO5YHSYN2pIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzKk/52CIi79qpDn7tkMSR9Mm+IH0zzjrhzJdA465l0cfk8ptyi
 0YhpWU+gMLuTQGCXejnBRYQXLQRizfEZL280HjDSKkQwVfHdyE2m
X-Google-Smtp-Source: AGHT+IHtJtc5WgmLOXoeCHs9nm8BvD7NfbyF/CjJ2FcQHhVWjnivQcmV2HrRrmsuLKzntQZtwbUSeg==
X-Received: by 2002:a17:903:2447:b0:20c:ce1f:13bd with SMTP id
 d9443c01a7336-20fa9e2488dmr21746255ad.18.1729667171746; 
 Wed, 23 Oct 2024 00:06:11 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e7f0c167bsm51981745ad.140.2024.10.23.00.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 00:06:11 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 23 Oct 2024 15:05:20 +0800
Message-Id: <cover.1729663066.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v3 0/6] net: stmmac: Refactor FPE as
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
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 422 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  45 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 152 +------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 491 insertions(+), 403 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
