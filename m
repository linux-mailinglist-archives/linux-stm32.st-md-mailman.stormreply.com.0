Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B95CA96E8CE
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Sep 2024 06:56:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C48AC6DD9A;
	Fri,  6 Sep 2024 04:56:48 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A68EC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Sep 2024 04:56:41 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5df9433ac0cso1070991eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725598600; x=1726203400;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ob3grukux8jAuJGDrQV1ST/lFWPUfHGs10KzV3SCsCg=;
 b=MR9nuai9/LOnMuJd5uUc41TxV3KuOmsULYmsztjwEc69krbB379eo4ooZh0ZKPHak+
 C/rHetiXT+Q5eh8B8O1fVIYvQFqaZ52iMtBig2S6EKz1T07qaRqDQkicqmJKznn13fnz
 cDbxWm3g8RnAzUlO6v4WFoKHK2xaQOEcKatu7iEJ7tfGuAitm6JxmMbLPDOVrL5NhihJ
 4WI86Eb9tMyOj+YVqcRfsV31P1rAiDikMBtCM4iTeWMMxwGUaMQ7mmdkgtSTnkkCGYGL
 iJd9dBBMeSe8E8MKVlBtKs7FltAwthU2zdVHIUCr6zSxAss2zbpshfeo9Q8kCxqj/1ub
 DtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725598600; x=1726203400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ob3grukux8jAuJGDrQV1ST/lFWPUfHGs10KzV3SCsCg=;
 b=n54ALBUVN//KHQIbNqsRr5mzcAdDdNQHxJafaPV1/JVzVm1NE+uVpr4t9eEgIMTQF0
 Rfnpg4nDPPwS5k2EdbvWhDSPi+31CNM9mLqLACLUh40RFTqZsvDVeG2nL7CT/MroTsUz
 72vxN/Ekc2hd9S4J26NWjDgdpK1Ti3/sxGFJyzkg/hw9VEgfsHktXKN7L+f6WycZKTE3
 626Lj1m8nGxEcLmFRDKzxmfyr8FU83++qVW+fGECLNTJI1B2/n1d0RWbyGhOa3qwFWCZ
 8pTIiQO7ewelOOiFvwdrjzxuxM/mn/YjphblXXafvjL/zxHiVSuF4BH2xhmxKMdxBBcz
 2qVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXguXx/IXNXtD7bB2vqXXetsEg0q4RI52+igPHqu9c5WngVo+qzfrSal1pas0KUhtnoo0bF0QexgeIhEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+b6oBlppFwrA+ThGHfbDi9OehrklbcqSfs9hgJpRneu4IBsjE
 UU0jH4jLt4PiTV4LCUpZhK5W71I9hKSHPCzMMmy0UbfK4DKbwCCG
X-Google-Smtp-Source: AGHT+IHer/O4jKLDfgNK47fqGGGDsM3FDOhwLhyyoIVhUdPzGfkP+qXtM/YrAO9Wg+uMGV5Q3zd+5Q==
X-Received: by 2002:a05:6870:330e:b0:277:f925:4f67 with SMTP id
 586e51a60fabf-27b82db385fmr1794920fac.4.1725598599821; 
 Thu, 05 Sep 2024 21:56:39 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-71791e54585sm1704002b3a.182.2024.09.05.21.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 21:56:39 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Fri,  6 Sep 2024 12:55:55 +0800
Message-Id: <cover.1725597121.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v9 0/7] net: stmmac: FPE via ethtool
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

Changes in v9:
  1. drop redundant netif_device_present() since ethnl_ops_begin()
  has its own netif_device_present() call
  2. open-code some variables of struct ethtool_mm_state directly
  in struct stmmac_fpe_cfg
  3. convert timer_delete_sync() to timer_shutdown_sync(), thus the
  timer will not be rearmed again
  4. fixed variable declarations in the middle of the scope

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
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  96 ++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  12 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   6 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  22 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  35 ++-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  96 +++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 269 ++++++++----------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 153 +++++++---
 include/linux/stmmac.h                        |  28 --
 11 files changed, 494 insertions(+), 242 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
