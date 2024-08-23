Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAA595CAE9
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 12:50:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23624C71289;
	Fri, 23 Aug 2024 10:50:34 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1025C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 10:50:26 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1fec34f94abso17568735ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 03:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724410225; x=1725015025;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TeTUUU2VJ4eR8fsXtsB0pqfptdqJDznJpOdQQ9te0Uc=;
 b=D4Elr6zmKCT30zk7xLo6FXbc8J+sgOXMJbEkp9AxKuG07AeC0pz2th6e5f1p0iyRB2
 Pzffd4uGeBeYLryAtwEXjU8xkIe3/g098bhni38MEuj3AqdX3pFX++71n/5P+ZpYaclB
 tPRxeUn6GlqyT+Gn4wc9sFpRvOpkFmi2enN8Z8vdcvCa3hGnxxLUI5Icvz8RSAZZnHwS
 MqUi9yHJFc6bK5HNxn+huiwjVQaIPUy76U7PdN8TkVELZaY/JgohHOQgZZ4EfFtn8EgX
 sG3I+qDzIri0mpirnQ+zpZJ2Lf9Rzd8wIrXytOMClktPie0Tr54upbfqQFLAAOEm39Y+
 bL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724410225; x=1725015025;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TeTUUU2VJ4eR8fsXtsB0pqfptdqJDznJpOdQQ9te0Uc=;
 b=daEwZE506X+YZqsPPoSupBX0ova4hT4B0y1mO/GhMxsqKKpnVdKzbKgK5SRSTr9RK9
 UdpNYXGmWClvI/L77FyGZlXA6ugv3OE77T5aFUTVbDyvCrUcAWNzhmFSp1ic5UdB8kOq
 O0q1Xz5pD7rUpOFRwRWbP/zpVCFxdZ0Rpdzcj52DXartHpO6TFe9AZYAj9RtJT+MmxWC
 L8t4SABL7qm47JFvNjRoY/1Hsd2HFd3R86vIsvpRWZZKo2oKvbz6Zs5bGe7QxF5F0Hty
 /tQ0iS1JZ6434QT61vULLzd0B4MU9lHHEaaIDdHDwZGVYAqxYFOi/qEs5HVZgm9FO0SV
 vFtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUf/QeVBHe91mgIpQ+A6clkbnddp4VoFMaB28xikc2OZkNklDI/pf3K209D9l9ugalI+O/Dt9+khYEy5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyywojAcLmdQpctknrbcrTpiDvVOMBE6RbY0HpgWlb0+yQMya3d
 dBw4wNY/lvz3MvGDr3KSidqMukidxX70ZnWHChgOvemq8xHVirww
X-Google-Smtp-Source: AGHT+IGJqWNwBZLbYT6vbePx8jWvkWRzrJYFIR3+4t2mkMpl1f2w1a8JNdXAYDwQYUAn9q5m5QJJuQ==
X-Received: by 2002:a17:90a:b00b:b0:2c9:6278:27c9 with SMTP id
 98e67ed59e1d1-2d646d5dc70mr1749587a91.38.1724410225029; 
 Fri, 23 Aug 2024 03:50:25 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d5eb8d235esm6074344a91.6.2024.08.23.03.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2024 03:50:24 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri, 23 Aug 2024 18:50:07 +0800
Message-Id: <cover.1724409007.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/7] net: stmmac: FPE via ethtool
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

Changes in v6:
  1. new FPE verification process based on Vladimir Oltean's proposal
  2. embed ethtool_mm_state into stmmac_fpe_cfg
  3. convert some bit ops to u32_replace_bits
  4. register name and function name update to be more descriptive
  5. split up stmmac_tc_ops of dwmac4+ and dwxgmac, they have different
  implementations about mqprio
  6. some code style fixes

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
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  92 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  12 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  30 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  85 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 274 ++++++++----------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 130 ++++++---
 include/linux/stmmac.h                        |  28 --
 11 files changed, 452 insertions(+), 237 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
