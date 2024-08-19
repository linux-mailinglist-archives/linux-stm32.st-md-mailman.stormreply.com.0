Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A57AF956490
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 09:26:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52257C6DD9D;
	Mon, 19 Aug 2024 07:26:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56F0FC6DD94
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 07:25:58 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-202146e93f6so23526705ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 00:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724052357; x=1724657157;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GMxRPL+T8UIjCQfC5kIWgTFU9+0G6pZaJzB9qUuJpIw=;
 b=RqZUZjkvnm4A1rgHhloWWs/lVdjZJnsC8g483jB2uUrPxSL8+j+cuYDa4NLqp00Mwv
 A3J4TkK4grxX2N9S4ux5l2rnX8wCAyHSNs49HUorLStXQAa5ohWSzqtABCYPdSo3D5ul
 FKTaQuHdcEIGehhRV8YKgOlnlBT5NYXtuY7se05Ul3UtGKJqTbwZ6k5ZtBxdYG4VA06Q
 qXr6X3mFvtLkbuYsanrz+X1/gIvpQmpMMIW+lhZQvJfCYYm4nYu9z0yjC8eDAH8EOBfA
 O+S21PBWikcZOH0nQvkfofYpkT44J/1dWpJHDrvyVKTRb7gIDJpn5CU01yIXgvFuUtMh
 eVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724052357; x=1724657157;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMxRPL+T8UIjCQfC5kIWgTFU9+0G6pZaJzB9qUuJpIw=;
 b=ko+dzjdRTE3m9fDPh84/1bSsAJxC4ifOJJpBVlGqolKjj4qk8qsdng1NVrZnpuqK63
 Wtmpg8KzvEKTK2f9sDhhgnTZkoU+z9bWrDrLiJBqiok5RlveHrzSdYPCafnmRwzSCL1f
 e2sRMcvP4t8SMLCtStmnNqI/IAM4uIjUpWAHOC1UBkmTl+oGaiVzm8dv8cIwaaJIpGQJ
 kwekizT9tUHlbO+IXMPnknb16YjzyFbGO4VmH4OkoOJ4NF3b2ujiwOlRJccnepOHttda
 IHKVamuv1nuzRGvmQomr1/eqctLOm/mpl2TzD7mLiGGbXbQvqvB8ayD+OfHa3iB2wx0J
 emvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8YTLRL8KXmVUPTqzSJxtIkPapHGErHJAJ8RnRGW6O/cAQZ7dL4c6Dp0b055MIVSbNrB3ZW8b4mxAkb9Y5jeN2JcA0RULKGQj9tzJ6bDv1XYCMciVYKTag
X-Gm-Message-State: AOJu0YxmWbmzsQF+f7AEcUwewQ59sqYleTqrOa4ho8aYmalY/TnS703J
 Ggkfpqw1+kSvy8uTZ41nPf4mICb/Mp9PxtgeOY6TmY5I7BWfRvCJ
X-Google-Smtp-Source: AGHT+IFs9U2vy6o8hrcgBG0WljZK09J5u0ZU7PDrc/0pefVklhHx0XndlbBF0rFOTVbCQeZRG7NQag==
X-Received: by 2002:a17:903:2303:b0:1ff:4967:66a with SMTP id
 d9443c01a7336-20203e88843mr117933405ad.14.1724052356689; 
 Mon, 19 Aug 2024 00:25:56 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f02faa5dsm58340855ad.2.2024.08.19.00.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 00:25:56 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon, 19 Aug 2024 15:25:13 +0800
Message-Id: <cover.1724051326.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/7] net: stmmac: FPE via ethtool
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
  net: stmmac: refactor FPE verification processe
  net: stmmac: configure FPE via ethtool-mm
  net: stmmac: support fp parameter of tc-mqprio
  net: stmmac: support fp parameter of tc-taprio
  net: stmmac: silence FPE kernel logs

 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  96 ++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  11 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  20 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  25 +++
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  | 107 ++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 192 +++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 115 +++++++----
 include/linux/stmmac.h                        |  28 ---
 10 files changed, 430 insertions(+), 178 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
