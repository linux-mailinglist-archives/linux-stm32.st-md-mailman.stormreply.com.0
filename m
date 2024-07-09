Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0240B92B1FD
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 10:22:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B7F2C6DD9D;
	Tue,  9 Jul 2024 08:22:36 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 042DAC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 08:22:29 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5c690949977so274219eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 01:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720513348; x=1721118148;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7XDcGnxl+L+Up+OM7xPAJaHLrc0hSR9f/AUvnRoMTks=;
 b=I9Umik3oParVMX51nU0GPv5zEhbctCimiMpc0/GJpEzVmtnnjtVYP+BbML+oTw8iY7
 qPcBd82FX+XKNyya/5zcjaVyl9vWySuSQelQkHWu7lv+dMFZrdDiHTnP7qagJ2LkJ6GL
 /L2Hri8XLa+rXJ4n80spk9idGdNJEXJO+E/NrMsFMM4LcbVuZ1gvGCKi4siQV+6eV3X+
 hIFXACJsLOecYEe1jSeBOZmpMTVnXShkgJMvb3GfnNbGzS5xY7gmMQQCTP4oPYNMMBqa
 lpci5SwGTkZ3eme/BFmid52unwnxUtNTre34G+TzNVPkY0ePu3PKo4r3Qnl0yUHPO7X4
 te0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720513348; x=1721118148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7XDcGnxl+L+Up+OM7xPAJaHLrc0hSR9f/AUvnRoMTks=;
 b=GoKS42rAarzTBuqFZYReCMbis6I4YY+yVeaUigBkLrTrBot+6dX/QHCvhvHJQ+P3UU
 IZ6v/ZnXBiSFg6660YlaB/Ji/EwY/5bjXORCm94NmbTdRk7YMJWHvVm3FVDYDr2V2iDa
 E9plDiqaXLHExLxYF58g69Y+KbFoJIsGr/i0FFn7xuLJG92GF2w7vwFBOnjbe2NVYeEe
 j0bJikYtaZ3BuSPvfD7AnxZj6YwpmKXfJFwqcKstpWVc7bDtRKNHNhnbAeT6dLQ1d/jF
 u2JQ+miChg4hklLn4qIVK5wRyV6qtnuM9nVZWWCPEwuD8kgAkrDQt4vLEcHW6JDKdu/3
 UavA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP9zk3wOfyEJzuPb+liHfxNUmGvnKiBFnLvRPRgh+hmbceYscptmOdDx69BW1zc1Knong4jboAFzi5o8Spf+JGiXFVgNDKhxpOao19g4ZLFjQBnwP7Ck6I
X-Gm-Message-State: AOJu0YxU/a6KNjI3Xt5hrUP77RKD6Gz82+mCoEIA5PNMf3g7y1GaP6mg
 Q6v1FG8X1BPuqr0Z8nquy3x9u1OsOLJp8J0q0xQKja9Hn9XeIA5/
X-Google-Smtp-Source: AGHT+IFPsJC/yKbPpj0KK2U8xPVQYC1rgQUbrnuG7dcUGRNNy6Kjbw0VGZ2c7DelhGUEXHPww0fMHA==
X-Received: by 2002:a05:6358:c3a2:b0:1aa:a177:359b with SMTP id
 e5c5f4694b2df-1aade0810ddmr150867855d.15.1720513347606; 
 Tue, 09 Jul 2024 01:22:27 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2c99a92a430sm9588929a91.4.2024.07.09.01.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 01:22:27 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue,  9 Jul 2024 16:21:18 +0800
Message-Id: <cover.1720512888.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 0/7] net: stmmac: refactor FPE for
	gmac4 and xgmac
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
1) Offset address of MAC_FPE_CTRL_STS
2) FPRQ(Frame Preemption Residue Queue) field in MAC_RxQ_Ctrl1

Tested on DWMAC CORE 5.20a and DWXGMAC CORE 3.20a

Furong Xu (7):
  net: stmmac: xgmac: drop incomplete FPE implementation
  net: stmmac: gmac4: drop FPE implementation for refactoring
  net: stmmac: refactor Frame Preemption(FPE) implementation
  net: stmmac: gmac4: complete FPE support
  net: stmmac: xgmac: rename XGMAC_RQ to XGMAC_FPRQ
  net: stmmac: xgmac: complete FPE support
  net: stmmac: xgmac: enable Frame Preemption Interrupt by default

 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |   6 -
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c  |  66 ---------
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h  |  16 ---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |   9 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  27 ----
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |   7 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |  30 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 131 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  16 +++
 11 files changed, 177 insertions(+), 134 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
