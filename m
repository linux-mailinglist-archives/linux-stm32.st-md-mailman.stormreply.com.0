Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB599E255
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 11:09:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E0E2C7801A;
	Tue, 15 Oct 2024 09:09:59 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0973C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 09:09:51 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7ea78037b7eso2049273a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 02:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728983390; x=1729588190;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+rAVWSk33yzFNuxYAb2kshPjGwfRkyohC13H7ruK8yQ=;
 b=I7YCun4usLSQZzrgj5EjqW/2fXwslwRZXQxvOYineQdy/s6Lq80AM8pDFswB/zeOQ/
 jU4BW+cJof7InuR0Th7ueJ+KeI8lsmlj8HY6Ei3VtOsWWNGDDoBbTkn+mChsTxYGxYSV
 VeR06ggKET5BFaEv5BRQBgGfVunl26u+Kf4G4ArXkov5/MLCXWW+RuSguVujcS7SyI/B
 TcN3EbG3zN6Mhx3NsJ78CCS2vr3vUC2vAmcHjSlzgl0Ar16ZTyBgkVEgYabiTPxA8SnB
 67tkNQPzU35d3oa8nNzZdbYHID1vFM5ACc0gKROUTHQO6Wcotz4ixK1zgFc06gwiUdc1
 gSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728983390; x=1729588190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+rAVWSk33yzFNuxYAb2kshPjGwfRkyohC13H7ruK8yQ=;
 b=ZRhppmvLWFJ+8LlvAyOg844Ic66RoFmuU3YPVHqDVr6Aa5ZukJUpWk6BZzMIvW5aKK
 9kwCrAKwNQv+7TRh+2TRqSxS8PuUBa2nRSXWEmDco5/99cgotTdfYOwJ3L6q8klPQmCf
 tkYpv0cKSwqLkvL5IS8mKFxWtUg3TQDuMzGP75iZSTs4G05zMVPRc1GNjjzgYk/LTP2g
 4U/A/k54Qn/F8xHmrHCwDYtNHeSPLxAgQa8U2ms6tvDa+Nb7T2iW8sVN3zGd4f/kHFS9
 R1AkjRj0LFu6R7dQyhilOR+IK7uPoJjie1fGZqhWKs8NGLVKWvWD/xmMvwNi9SKkJgx5
 7jBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQBBRSJtNY3RDmz8wSFyvqYbngIAlLAH0Io1d26Ei2FKsd9psA/EhunYG+vZxw9re87BStKBBREaQRKQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx+MnTwk++/HYm0lV8UUWWMKwmeYIEZ5n54F0B83FH4y2YsE9Bc
 Il/VSqbQTSMSqDA3wWy2/Cl6fMGkYPR6Ee8Dvt7JuRAXGnZjV7zb
X-Google-Smtp-Source: AGHT+IH2FmmE/B412YTtjplQJI8buvMqqeNbFsv4Gh0T/efoJEx1gqHO/rnFjmNENHAao3BcqsnkXw==
X-Received: by 2002:a05:6a21:e591:b0:1d5:125f:feb0 with SMTP id
 adf61e73a8af0-1d8bcf14d2amr20182563637.18.1728983390268; 
 Tue, 15 Oct 2024 02:09:50 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20d17ec8f35sm7905095ad.0.2024.10.15.02.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 02:09:49 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 15 Oct 2024 17:09:21 +0800
Message-Id: <cover.1728980110.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Furong Xu <0x1207@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1 0/5] net: stmmac: Refactor FPE as
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

Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a

Furong Xu (5):
  net: stmmac: Introduce separate files for FPE implementation
  net: stmmac: Introduce stmmac_fpe_ops for gmac4 and xgmac
  net: stmmac: Rework marco definitions for gmac4 and xgmac
  net: stmmac: xgmac: Rename XGMAC_RQ to XGMAC_FPRQ
  net: stmmac: xgmac: Complete FPE support

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  12 -
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  | 150 ------
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  26 --
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   7 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  28 --
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  54 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  10 -
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 442 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  38 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 149 +-----
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   |   4 +-
 15 files changed, 527 insertions(+), 405 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
