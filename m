Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B139B9210
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 14:32:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CBD5C78035;
	Fri,  1 Nov 2024 13:32:30 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85A07C78013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 13:32:28 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7ee020ec76dso1690056a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 06:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730467947; x=1731072747;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7AYX/UegsJeayFQV7mwBWHowTbFu2IFH/WWSPA7go14=;
 b=ZdkY2Rxkfia2nhBzaA0EMzHK3TKthHTib2PKVsb4BeduWxb68RPQ3oSULUZS9Otxx0
 SR3vs+AZcay9tZT8S3KoZ+Uh75nMtOg3hR4AgOteyKWjXY8Epq0vJZGpNvF0iaCu8dAN
 kOXPfRbJKKm7EFNkZP51W8MqDE6ZJtG/wb/KX2Y8xLEtkimAxw4ESJVpDF5Nqba5GyHu
 v1HDCOzt3tvfAKnr9LWsQbEc36avRyNbEMcpGmjP+5oEOEVtIb8f8sGGSAF4YECHQjzG
 1tXpiA9ozmzvbt/7av/i16PNeNhbTWb8ATYZDJbiy8bP2gmcS4iAu9kbbLUcCuUMjhst
 U98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730467947; x=1731072747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AYX/UegsJeayFQV7mwBWHowTbFu2IFH/WWSPA7go14=;
 b=M/ugpoTGRUeGAGJs8At0S2FBmh6GPRk+E6eLk9LBXLi/Dq9UxQEb9/KE/D60sffg/l
 vlyRNuOgWi8rL05+climVwEU+9fuJUhOvVg68gytIzitB79Z/chDln6MjSyyXau2HbWG
 4YzMzAvGP27rFw2kx21nqZttgrYlD2yogMHPUkhAL4MCrXorDxh16Y1rNcYooGaYWRVS
 aVS62HHWNupXcmuAmoyVIMbO8C0MW1EbN7uAsV1GX4C4hKTZ/luF55mDuW7yXc6+gjI2
 ZBZ7OBp2RcXjkfmLHaqcN9p5zytI/mN1P9I0pTCMZT63MuWrGyjRjcwpmRkMu9qFIq+V
 Zhnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRdEPWl1S6dY8Uv1iNBlSllwfqwkmotKE3khAWmKg9Q3puvU3qcScjkKEyZnMtQWGDevAvy+psqHfdnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwDv7BOBDj8m/xR+ghr9yOCNMsfSfDPAExU5tch6S2Et3NnXmt0
 JYaP5oz8oj1LUVo0SnOYwYHffRuffVSof8a7Rcw6E3/oE4P0J7Qy
X-Google-Smtp-Source: AGHT+IG8CKrWDPB/2PbcjHGCaNFZgB8BK2WVp3xqAYoGbvg7ecSpi/WZf9vbDUIiX/52SjUlfNjCRg==
X-Received: by 2002:a17:90b:3848:b0:2e2:aef9:8f60 with SMTP id
 98e67ed59e1d1-2e8f0d531ffmr24629842a91.0.1730467946920; 
 Fri, 01 Nov 2024 06:32:26 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7ee452ac4ffsm2425552a12.25.2024.11.01.06.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 06:32:26 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Nov 2024 21:31:33 +0800
Message-Id: <611991edf9e9d6fac8b29c3fe952791b193ca179.1730449003.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730449003.git.0x1207@gmail.com>
References: <cover.1730449003.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v8 6/8] net: stmmac: xgmac: Rename
	XGMAC_RQ to XGMAC_FPRQ
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

Synopsys XGMAC Databook defines MAC_RxQ_Ctrl1 register:
RQ: Frame Preemption Residue Queue

XGMAC_FPRQ is more readable and more consistent with GMAC4.

Signed-off-by: Furong Xu <0x1207@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index efd47db05dbc..a04a79003692 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,7 +84,7 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
+#define XGMAC_FPRQ			GENMASK(7, 4)
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index ab717c9bba41..5ccdc6887b28 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -364,7 +364,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
 	.mac_fpe_reg = XGMAC_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = XGMAC_MTL_FPE_CTRL_STS,
 	.rxq_ctrl1_reg = XGMAC_RXQ_CTRL1,
-	.fprq_mask = XGMAC_RQ,
+	.fprq_mask = XGMAC_FPRQ,
 	.int_en_reg = XGMAC_INT_EN,
 	.int_en_bit = XGMAC_FPEIE,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
