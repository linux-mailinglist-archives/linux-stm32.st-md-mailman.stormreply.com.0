Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1DC96B666
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 11:22:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05FDBC78013;
	Wed,  4 Sep 2024 09:22:18 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 167C7C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 09:22:11 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-70cec4aa1e4so4541951b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725441729; x=1726046529;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xdbrukLjPRrEeDE2KtUX1s95Lzj5JQAy01g2Kp/GPkM=;
 b=R6+qmu4Upjb5jDae9nMw+K1O3HFiuwLj0OpFwG1m0etREO2q0QdhV6zfxKzhmu1eyF
 egp8rXs3FiW0yULCkApcgS7ENU+33c8kH+hVTsvSRpmpFBk4r4JOe9MAaJIAl8BBxXlT
 IqErifxtlIT4xWx1OF2le2AISCxINLyK3Z3AB9rJseA3BvHlhSXQikQy+yPpKKK5453d
 zLRjDtruPzCLmT1sPeFPl1JlXk/kZWw3xI7Ki44zctEN1URGlHO4fyNTcEeAQVR+v6C4
 iwMLynVS6VvIxVtwlS+m+uVmVPq8FXXzZTx0bt++R6TPkzzjxE8kH7PkMXnUmvP0xnF5
 Xbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725441729; x=1726046529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xdbrukLjPRrEeDE2KtUX1s95Lzj5JQAy01g2Kp/GPkM=;
 b=mcYIJAwYb57pRaLHh+NHNp5q5joX98b4t/1yHLh3lFf9GqtiPf0Huu2EGp5EdrXQDq
 pyzxJbRFwvyx6GDPZoxhy5qWIlwFdjuZHPYg3CL0AF/p7UqF6uAHn0gD1AGbC8gIZ+dA
 2IXipHhwd+sbKRH8wLM1H+tiJUIt5BG4BPsA3SN1j1A6igJPrKzC3TkFsfKW3nDgX5Rv
 BX6JasEDceQ2oN7eHAOoRJl1A5Wk/ohEboE7p7hriA0tGJY8+TxgW4TAgiojfo9iin5p
 hYP8Rcu9hUbLsOoGaK/ncBuaC1FRFe1dR0/arCPQ1YdXdfbekXxXB+6gVfecpqB4iNrm
 s9Yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYBn4kklL3Gts77ok/Ht9bOzhbJsQjqeK+4/YRK6ptvyANZY+mB7S2HesLj1FJt0Wv8UKHR1O+/2QMKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2v1bx4AoX5ItOrUYW72x9RgtNS7Dz55KNcTxF0pSR1K9j/P2A
 wrPsgwTgfNKRIbCE2lHTnfBIY5ZbAdDwxWsQFcC1gM5H1aYYORXF
X-Google-Smtp-Source: AGHT+IHZoPSnLfOD0195kXHp8FwhTb/QlnwaX/dwZNMNqywXzjijSFZLEA80Dx6SgU0+jMbZWZ9AEQ==
X-Received: by 2002:a05:6a00:2789:b0:70a:f576:beeb with SMTP id
 d2e1a72fcca58-715dfc3a15emr24155318b3a.15.1725441729432; 
 Wed, 04 Sep 2024 02:22:09 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7177859968csm1232048b3a.146.2024.09.04.02.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:22:08 -0700 (PDT)
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
Date: Wed,  4 Sep 2024 17:21:15 +0800
Message-Id: <cover.1725441317.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 0/7] net: stmmac: FPE via ethtool
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
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  21 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  30 +-
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  91 ++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 275 ++++++++----------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 130 ++++++---
 include/linux/stmmac.h                        |  28 --
 11 files changed, 467 insertions(+), 239 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
