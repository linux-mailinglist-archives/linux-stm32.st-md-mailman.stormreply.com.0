Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B19569ADF2E
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 10:32:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90DEDC78F63;
	Thu, 24 Oct 2024 08:32:07 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0674C78038
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 08:32:06 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2e56df894d4so524471a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 01:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729758725; x=1730363525;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TDj2W1cEB0I3jNJZkoU/AfaGHAZZ+DZNAW15dg9eAkc=;
 b=iGbWToEsINFW/3Y56bvA+KJIclZKMsJ1iUgfWSmJx3h/qE15nNBysCXBjUicERSxtG
 n4UPIiuc5+6ILtdE8zufHuSC4aRrkntHxFPL2i1HpFfpnROZLe1jOA5CTfVpIsUM8+XG
 OoPWvDGZEAh3dYKQT+Q6lEhEl1Nij/Sx8ZWQ+aqiDsOXgwmoXNgh/J/t0DzckdZU3edA
 wsZi0UUF9IqUTrYhltg5SeNx3XFsUSpTaSMYt5SxJJDvhJmCqlaJcQDpqw6OQF35tUsr
 8/oUuDi7thCTn45ibu05Nb8Nz8+XQVwX5vZL8TVtyW3eZ3S4m7Jc4fw3mCqoFIvsoKxi
 rjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729758725; x=1730363525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TDj2W1cEB0I3jNJZkoU/AfaGHAZZ+DZNAW15dg9eAkc=;
 b=XcHgadKsprmp99SRa7VgVPqvukqRiMK3+Dire6uGhXaVVX/aJTr9sqlMz80VwQXR3Y
 Y9B+xhso94jT8xIZr/fyGrxJ+H9LGTtQ5sLcly0uRu5k4vVIgRaAkZ+XUJiDvP+83y3P
 HD2I6eFB+fX3s6Vin363WHVYdPVbJQXrFHS7vQ/iPwDZFJ/ebQn+ucIE2ygCctDdfhpv
 cLeVkUU/kxBJDhadohLk8qzMwdWjt7BvFD24sLnnZUcRIpI1BpmQ9lsh+UCf+/fx6JCt
 F18JlcULbwsOFTWufxp8flB7uDzuYWymBsySMQrRLjyPulbUJSUIITEFqp2/o0Q4mpjJ
 CMHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOp+KZ9PyCpGb9lkWb8ZriOvkSzE19JMCT9chJqed9QZ9v7gfEzMXgcq8BrNM8dMg5hhZ2bskUymQzZg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyUuX9VzGVmepwfbnFHnrn0Vz87mxt0pVXxJa2K3kTqWipS/OQ2
 4cs/WyMY/Ud7v44w5iXNmweukAx+p4h8O+nn5wTnApzzf+WAsUB5
X-Google-Smtp-Source: AGHT+IG6vbAWvEZkyrLEBAt6yAw8DnNP0HXpy3nSTdKEniwkKtcm4fM/Jmd+UmyvW9+VJxVf1itXOA==
X-Received: by 2002:a17:90a:cf93:b0:2e2:abab:c45b with SMTP id
 98e67ed59e1d1-2e76b605b0amr5267789a91.21.1729758724940; 
 Thu, 24 Oct 2024 01:32:04 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2e77e5a4ec4sm868773a91.54.2024.10.24.01.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 01:32:04 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 24 Oct 2024 16:31:19 +0800
Message-Id: <12beaf54b466600fb4fd6a068fbd3ed204ab33fe.1729757625.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729757625.git.0x1207@gmail.com>
References: <cover.1729757625.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v4 4/6] net: stmmac: xgmac: Rename
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
index f934c0510968..c9c2e0b00a0c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -363,7 +363,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
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
