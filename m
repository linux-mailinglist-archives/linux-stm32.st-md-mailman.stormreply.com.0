Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6659582D0
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 11:38:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B71C1C6DD66;
	Tue, 20 Aug 2024 09:38:58 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2335FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 09:38:51 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2d41b082ab8so1653877a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724146730; x=1724751530;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0WVdsLsmxYwgymE6I6XPZ0VOeJxb8k0ES72cD/kLQY8=;
 b=RLbxbLmlv0O8jYJN7e0PYdXL3ix+Pvn+lQeR/DUB6jbSD0+3FhCsZ9GrApNA/3cBT0
 eZeY4Qafgfv0Ic9geXSZmzK2noEPgD0nMBKmNrdoyJZY39RiDoMnPXpOYjl2SJQi6w2x
 vVuG80ByXeEI+MXjznXgHiwBeC9Z+YWqDLiL/Qd3pRibgBlN7iIDekV/7oOKuXgiUfKS
 jueePuVG/ot80VrgD63cBef5Yo/TXL9l/cZh6dVPYejiHKfMxUXKXZLRRsFx1ssPXPm9
 664OWOPPdGuW/+kX13zpQv/RIUIfxzuDphc/61HNjdlBcmMHMRe4Bus7ZPWipWbWKOQO
 lrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724146730; x=1724751530;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0WVdsLsmxYwgymE6I6XPZ0VOeJxb8k0ES72cD/kLQY8=;
 b=DwkL3Nsh9JJTR3WDIo4fSvT8/7czdgX4/aUp3ahIT/fL3kD4iURyDeMX3qSJLXthoZ
 IpW/ZLKlGSLgwQDS2Mu6qSBMczVCx0HiHmRsydyO4l4S4BCqgnM9KW0TEXgU3CD8PwQ+
 rR+6b1WmshWaQsJLCN5ds0PX6XeK+VkCPh1PlEM2hwbXHEKz6SO/1wQGo6uWc6Y2xGVL
 7g8dbpU0mSLzUHvfnvzxibkdW5xi5+MKoKO8oxclXQV1UEq+hvgSR+1ln1U6NwEbdFsl
 uFiKm6fMcxqNwvOtOnVfreK6/g6Vcc5zxbvDYlKBIEbBLxO0/SgvsnM1JeFgKaTUaccp
 byjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEksvnq5nAd2SG+boZ/2uRntmUVYbePJeaxpDQIAl6RD/rFoz3vYVytZF92m8T2HvgBYHUEDGXVKOATvzyOdR76KhZDS3RVwNtEidJ+Dx98KKr0yJQPQ83
X-Gm-Message-State: AOJu0YzbtUFLssMxe8KUIT+j8ul/W4rVYtGafHG//qBxw2iY/jfSyKZy
 JssD88Q8uonNvLfeDw76UiAO7frKbF0VMcM+p3xP70yjLSUmMOVG
X-Google-Smtp-Source: AGHT+IHF9I9s+Fxk8vbHg0K2cB/yaA+g12OqwqsSEsnVkiEks2c7wO1DOmBk/9tSNMmJicERd3O47A==
X-Received: by 2002:a17:90a:ff91:b0:2d3:d728:6ebb with SMTP id
 98e67ed59e1d1-2d3dfc36bffmr12330038a91.5.1724146729285; 
 Tue, 20 Aug 2024 02:38:49 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d45246061dsm3230608a91.8.2024.08.20.02.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:38:48 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 20 Aug 2024 17:38:28 +0800
Message-Id: <cover.1724145786.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 0/7] net: stmmac: FPE via ethtool
	+ tc
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

Move the Frame Preemption(FPE) over to the new standard API which uses
ethtool-mm/tc-mqprio/tc-taprio.

Changes in v4:
  1. reorder FPE-related declarations and definitions into clean groups
  2. move mm_lock to stmmac_fpe_cfg.lock
  3. protect user configurations across NIC up/down
  4. block stmmac_set_mm() when fpe_task is in progress to finish
  5. convert to ethtool_dev_mm_supported() to check FPE capability in
  tc-mqprio/tc-taprio
  6. silence FPE workqueue start/stop logs

Changes in v3:
  1. avoid races among ISR, workqueue, link update and
  register configuration.
  2. update FPE verification retry logic, so it retries
  and fails as expected.

Changes in v2:
  1. refactor FPE verification processe
  2. suspend/resume and kselftest-ethtool_mm, all test cases passed
  3. handle TC:TXQ remapping for DWMAC CORE4+

Furong Xu (7):
  net: stmmac: move stmmac_fpe_cfg to stmmac_priv data
  net: stmmac: drop stmmac_fpe_handshake
  net: stmmac: refactor FPE verification process
  net: stmmac: configure FPE via ethtool-mm
  net: stmmac: support fp parameter of tc-mqprio
  net: stmmac: support fp parameter of tc-taprio
  net: stmmac: silence FPE kernel logs

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  96 +++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  11 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  27 ++-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 110 +++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 214 +++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 124 +++++++---
 include/linux/stmmac.h                        |  28 ---
 10 files changed, 463 insertions(+), 181 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
