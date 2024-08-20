Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC7895859D
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 13:21:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F747C6DD66;
	Tue, 20 Aug 2024 11:21:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69FF5CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 11:21:22 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-20223b5c1c0so19068785ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724152881; x=1724757681;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zbDMo5MbDihkl8ZyjdgPltbmTW4XyoUcFA+9KEyX+yo=;
 b=G35k+xtMRYfzZGDzf4tE1SgpZrpT058UeHUu/CEXfCmqiUPFmoj1wTn3aJqeapwZyy
 UECuQSaRUnet8cJSog5j1DB6LLJdbFtjMYU5xVMwMGRcEnRHLpKW+1hpzSWAjWS9qTrB
 DdbW+DIDcREdvsTljZzgjlgKvVURIopLckbA9mX4IaGoq3AOiBQIlzn39EJnz5cq0POM
 FrAY55YXdU3oDXFZ7nP4dgk3MpRnO1i0EKLk3SdreqUnBYWYmiIyDUHjnUGjKsMHYgvB
 uJx7hpT36hwXMd/rsksSVzTzep1VaijrP01ANtWXp8eOBzqjOqOglY1PkZKIh34yo8Qk
 Wdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724152881; x=1724757681;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zbDMo5MbDihkl8ZyjdgPltbmTW4XyoUcFA+9KEyX+yo=;
 b=dnl3tO24ptNaPNGeCrLmysk/p2f8CitU5jBRsnxlZfnlIwy9z8BFF2e7Si+bF1EMn3
 50Fomp0IElfma25PK1tOzHpbTnbW6McdSiq52WTqUXhmL1lpBRKIb8hvU1ij2YUkN6pu
 JxdVpkbppLZpy1arc3pA2dBgdZvLFtDi9cq2ivSLIRRSdspDL/qf1oAbk0qH1MK5vccr
 Oae9SC/XoL1/rmcoyS3Gr95b0adhszORqQpA270BdIKE0FtT2CbC2wC/vVP0cKQ8RiAF
 Kblg4v0qeU/7mQ0mPOJ1EgP9pk06vRaXOh8SwPbeokqLLrFU9gNajH6iehb5F3Mxy1XN
 99VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKdBHHcsN3xiN71HUg1a/+pEmdSrNoIWfgzL2mud0k7XqwnkKl+R0Jj29MRU2LWbwCW2u+8v3Isdm/ag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwvzJhryVxuC3s/H9xnOKG9Bxv/kVZEgD4V8hd0N+yFpq3ZP/dt
 /xAp9yn1CrZqn0H2j4LSv7HWe0xuPypK/x2Tm753+GuM2tAzX9uA
X-Google-Smtp-Source: AGHT+IGJyPKgTlfpaaVO2Q89NFOvgDCYB02I5tKaJmY5LED7+9l9qf1xzzx6B/7gPkW4vruDFFPBYg==
X-Received: by 2002:a17:903:2303:b0:1fd:93d2:fba4 with SMTP id
 d9443c01a7336-20203f321efmr127662545ad.48.1724152880582; 
 Tue, 20 Aug 2024 04:21:20 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f03756f6sm76465355ad.172.2024.08.20.04.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 04:21:19 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 20 Aug 2024 19:20:34 +0800
Message-Id: <cover.1724152528.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 0/7] net: stmmac: FPE via ethtool
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

Changes in v5:
  1. fix typo in commit message
  2. drop FPE capability check in tc-mqprio/tc-taprio

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
  1. refactor FPE verification process
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
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 120 ++++++----
 include/linux/stmmac.h                        |  28 ---
 10 files changed, 455 insertions(+), 185 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
