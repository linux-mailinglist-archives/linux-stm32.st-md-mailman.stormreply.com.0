Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 733DF942C45
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2024 12:44:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AA67C6DD96;
	Wed, 31 Jul 2024 10:44:40 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AD6AC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 10:44:39 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-26106ec9336so3079660fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722422678; x=1723027478;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fu1ouNnrG9bF+uAnA7GwZya1Ys3715c6hhI6EtcZ2RA=;
 b=RTy4kMl1jhxuNmm09wu2BewBaf7B3dR81/Zlj70kFUO8fWqk5X+2EjRotRAZloZFLY
 Z2nO/enXCtnV7b686PKpIKhr/H8kpc6GUuVw53ZO1tkYFTYR1w76cFq+OWgUJWRZfs0f
 80oMLayvdGc5ZW9RPbDJ/7zpFrccnX7Xj16wFBetAaBidxexLkm7oOlA8n0CamxBkY66
 m/vbq4gq9swucP7WhPOzkg7g3lJyiOCMdiULxF7X9pyHuae0MuYJTF6dXJuIatTYrln1
 kxcdNTs4RtPDZNZrOMCPPf7KclrJf5XpK3Ec4lJmXbZDFf0hdg14YagEeqCitsPOGm8c
 poqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722422678; x=1723027478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fu1ouNnrG9bF+uAnA7GwZya1Ys3715c6hhI6EtcZ2RA=;
 b=NzADjAFOHvW85mMxhuWNATpdaBTHu4iMoy/ZlyUiE6LSfb0vL4uuZ+ZU3fwLIFw6Bn
 6Wb1xCexegR9oSEyRbsxNqbggAEwnA/hXORATLL30sDZRaSZ7OHHKs7WNKSjZ6ySZG5/
 8JfYExriC2DgSmLskytH2Gj6Gzwokc6zw5FoIb4qt2FM2l0S2vPmA3poYiBMNG7bromr
 gpGvBh43NMwO0LUjuuYdlewM/vql9tS3wKv27aItF0RcdqBfEEnN/V8g+/sKQVkSGwvL
 XvFW5fqzEzXIz1n3c7NY++YhxBH9fK7IxZ3UMRV5G8ib4bPOhNnLliHWOTeiJ2o7WP/3
 iPnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBVWXB+Lsilu4n2f66rzKIWaOovd/3tWEhUuPek9qntUKmY0Xpz00mDcYTqoGd0ySqnX35EHm7LKT6cHX/ObX3BRfe+qraLQXLnGACzqqY4sV65KDO8TxS
X-Gm-Message-State: AOJu0YxDn+9/9vzUMVkZOmGb/dt9A2ujDMvla4rv/2PPxgKaZxfCROO6
 y/z7HTm8DiMBCcDIipSjrKl9wnQ56/izJ8w+kV0ujK2Di2FfMFFb
X-Google-Smtp-Source: AGHT+IEvFA1K3zu3i0XikbrUbT49e6jRM+kXTRxXXH210S3QRwo16GCTK94T7ErsdT4YoniWaIZ6jg==
X-Received: by 2002:a05:6870:e244:b0:25e:7a9:b603 with SMTP id
 586e51a60fabf-267d4ccf5a4mr14061153fac.5.1722422677818; 
 Wed, 31 Jul 2024 03:44:37 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7a9f816da59sm8791375a12.29.2024.07.31.03.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 03:44:37 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Wed, 31 Jul 2024 18:43:16 +0800
Message-Id: <370d89a46a15856856c601e1c8036cbb4bc7bb4e.1722421644.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722421644.git.0x1207@gmail.com>
References: <cover.1722421644.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 5/5] net: stmmac: silence FPE
	kernel logs
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

ethtool --show-mm can get real-time state of FPE.
Those kernel logs should keep quiet.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.c      | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
index 068859284691..3abacd863fe4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.c
@@ -605,22 +605,22 @@ int dwmac5_fpe_irq_status(void __iomem *ioaddr, struct net_device *dev)
 
 	if (value & TRSP) {
 		status |= FPE_EVENT_TRSP;
-		netdev_info(dev, "FPE: Respond mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is transmitted\n");
 	}
 
 	if (value & TVER) {
 		status |= FPE_EVENT_TVER;
-		netdev_info(dev, "FPE: Verify mPacket is transmitted\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is transmitted\n");
 	}
 
 	if (value & RRSP) {
 		status |= FPE_EVENT_RRSP;
-		netdev_info(dev, "FPE: Respond mPacket is received\n");
+		netdev_dbg(dev, "FPE: Respond mPacket is received\n");
 	}
 
 	if (value & RVER) {
 		status |= FPE_EVENT_RVER;
-		netdev_info(dev, "FPE: Verify mPacket is received\n");
+		netdev_dbg(dev, "FPE: Verify mPacket is received\n");
 	}
 
 	return status;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fba44bd1990a..5531c26cba34 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7392,19 +7392,19 @@ static void stmmac_fpe_lp_task(struct work_struct *work)
 		if (*lo_state == FPE_STATE_ENTERING_ON &&
 		    *lp_state == FPE_STATE_ENTERING_ON) {
 
-			netdev_info(priv->dev, "configured FPE\n");
+			netdev_dbg(priv->dev, "configured FPE\n");
 
 			*lo_state = FPE_STATE_ON;
 			*lp_state = FPE_STATE_ON;
-			netdev_info(priv->dev, "!!! BOTH FPE stations ON\n");
+			netdev_dbg(priv->dev, "!!! BOTH FPE stations ON\n");
 			break;
 		}
 
 		if ((*lo_state == FPE_STATE_CAPABLE ||
 		     *lo_state == FPE_STATE_ENTERING_ON) &&
 		     *lp_state != FPE_STATE_ON) {
-			netdev_info(priv->dev, SEND_VERIFY_MPAKCET_FMT,
-				    *lo_state, *lp_state);
+			netdev_dbg(priv->dev, SEND_VERIFY_MPAKCET_FMT,
+				   *lo_state, *lp_state);
 			stmmac_fpe_send_mpacket(priv, priv->ioaddr,
 						fpe_cfg,
 						MPACKET_VERIFY);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
