Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7718C96CFF8
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 09:03:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24253C78018;
	Thu,  5 Sep 2024 07:03:07 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96593C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 07:02:59 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5e16cb56d4aso241898eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 00:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725519778; x=1726124578;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gGPyaa+1WDEMchRcuy5C5zdpNT7E1IN97l7V6rYpwAQ=;
 b=bMbHvzrEKqLIArWjpaOhdtHMW7qJ+F3gXUJQO0xT3Nb8caHLAAbZ+lPtHoXxOlJ2tp
 q5kjSm1SQpNfgb8Jmkn5t6eO1UE8eLB0gbQsg+jn1LDgrKU/9RIHsJ9tQys1wOs+UYUp
 pF3P8M/e194IMWpF+5jLWAiwZTnSs/iakZs0lO2ezXbeHUsaAYALdBXGOgZgaTV3wIJu
 tMNI2QXD2MpkGSS7D+5eRtPrYhhzBn3Kb+ye0N6m1FsKM7FH7u3Pka3V2YUn2DJlOpMr
 qT7aFNIi45fW3b7zLf+Oh/QzQ8/xr6d3Wpb8V2CIuUgml6Sz3xuNZuUqkj2LlVG8hudU
 GPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725519778; x=1726124578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gGPyaa+1WDEMchRcuy5C5zdpNT7E1IN97l7V6rYpwAQ=;
 b=ZGz1FH1UiQxmoMMrNU52ultSUMmCLJ78E0DcUvCpCvgjV42C5jGHWcFhG+gmi1r7gu
 H9yWEjPTBdzAEE9cd3mhISdtSuldnt1Qwb6T782KrnwIjqqoV6vQMRHE3/y2TQCLwteO
 e83IQs3gr7q7CchkfzKxCJbDcme84Pi2FVki4R+nvGd5cVh/E7P7D87e8NvntHWn6oCc
 nMT2MBEN0X9E/o6j2VUdTinkk6AoTW6xABs4JDRovcGCSMG6opaJXTNYL1zHhHRDRtRK
 XG8TD5q1geVKoopiaKvG+fkKR/LNTSyHzF6j7Cx8wXxjxokyqQk3Zg+CV3VqKgl+zG8P
 gdhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBk8IK/kYsAbWWvlOnvVrxlHatI7Sji7ElSBJ1MyG1YcnonswPifPXfbU6FnFqkZEvKQoC89XUVwakUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyxCESzdyUDSOGQwbMTNOS4q3FRaJRdqdkjova8qOJwlNe/BUtQ
 T+fUdv//coRLQmRLW/JlmG28JcENF5UivxY2Ngz6E0FcVSreACXz
X-Google-Smtp-Source: AGHT+IFEQpZl3ZnRXG3Y8a3KH8gtlt/4cKxL4Zrb6w6RD/CEHqKTJ40bzqvmaOsEUf2ErIgac3XQsw==
X-Received: by 2002:a05:6358:590f:b0:1b7:fc1f:5b95 with SMTP id
 e5c5f4694b2df-1b81240f229mr926884155d.14.1725519777913; 
 Thu, 05 Sep 2024 00:02:57 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71778595107sm2604897b3a.150.2024.09.05.00.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 00:02:57 -0700 (PDT)
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
Date: Thu,  5 Sep 2024 15:02:21 +0800
Message-Id: <cover.1725518135.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 0/7] net: stmmac: FPE via ethtool
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

Changes in v8:
  1. use timer_delete_sync() instead of deprecated del_timer_sync()
  2. check netif_running() to guarantee synchronization rules between
  mod_timer() and timer_delete_sync()
  3. split up stmmac_tc_ops of dwmac4, dwmac4+ and dwxgmac to give user
  more descriptive error message
  4. fix wrong indentation about switch-case
  5. delete more unbalanced logs

Changes in v7:
  1. code style fixes and clean up warnings reported by
  patchwork netdev checks, no functional change intended

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
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  96 +++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  12 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   6 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  22 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  30 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  91 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 276 ++++++++----------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 153 +++++++---
 include/linux/stmmac.h                        |  28 --
 11 files changed, 491 insertions(+), 242 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
