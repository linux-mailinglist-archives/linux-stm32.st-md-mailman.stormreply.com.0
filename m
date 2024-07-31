Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F199942C40
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Jul 2024 12:44:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24DCFC6DD66;
	Wed, 31 Jul 2024 10:44:21 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0FC42C6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 10:44:20 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-70949118d26so3193035a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Jul 2024 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722422659; x=1723027459;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RikSfSLSzK3NY5MUlBg8b34sVeLezToR4ZzwAPjg5Sw=;
 b=VBFBosZwqUg9ER1H8ckyZcyQytV8bYFCV5nrP0BMZlkZ36o1ne/ocnD7Db4T4XKcJk
 uWhLL5GJFGnBEKgom+Ho6wALw5/NTtD4n29b7wrNR3c3gRWb3/aZ4BJKPovwKUbpRujM
 V0CiiDDsRAzlTVUL4MWpc+sO3PpYmeuAmnB7R/hFGH6jqIbYRDg4KPsx4ZR/yqRO0HcD
 vQXhJbjgGBxJQUrYUnb6XW1q0B0NqM7Tp6zzZyHT4xf5zyxO/sr77LhEENZyaREcIIw4
 PfxP3bJSWGWqdwMEq3ENNqmqgCN7fs0axoLq7QFD0UsjH3vyrFYqXqu0sFeHjY8fV88f
 jt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722422659; x=1723027459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RikSfSLSzK3NY5MUlBg8b34sVeLezToR4ZzwAPjg5Sw=;
 b=j5eEs2YPKvEKN+owdXFAODkNbmPz5q2mUMqTvU1Za5B87NcjFrJUw2PZOruj32rj0S
 jdNAdGUWNHgdkBa1NAzONTv4MAK42z9Te+tJH1Ktp5GNqppZBob2T5hitZmdmp49AQa5
 fBcwnM9XaGrwEjDlrFgF5Mr57Y1GaQEPSAXqY2vNQd1yd4KLtLr/SCjQNEMsOY/MZdXe
 E2gSSwrOgzA8x3LdLpBL/gA7H/+uvHfZqmHQkyx8EExsM6CAtN1T+cWCosLwE94s9jyf
 sWEBvuOq/GCat0NBPcocQiD4bzqzposCkiJLSdaC8b2ubRpK+V07TpsPH8wg+R14EF4f
 LP+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmw6TDaxCRIGZAZ4mNBDZGH4wg808iuS0kBTY0V2OijPCzH8N2zWkH1snGB0L+oY2jkuAYKsNR2QfwWhkEurux0dgu7pfry/CVY2Wte3/Lm/50rv3wv8BV
X-Gm-Message-State: AOJu0YzVOPstAGHz7AEZXED7VR+BYB1R9MAGUoexyRFY/47UdGRY46gR
 9QhjJEYYG2M46RpvbmxJEBFf6Ax3hf/xzauHRrI7Ksk0xEAOtvolOwspCQ==
X-Google-Smtp-Source: AGHT+IE2jiVapYwFvA5Ymfuzc66v1gbK3DosbYWq6PakXzXkcZhsXP+tkGA7JHLN1NMmna4+AcYEmA==
X-Received: by 2002:a05:6358:d3aa:b0:1af:1b40:5357 with SMTP id
 e5c5f4694b2df-1af1b405467mr466369255d.24.1722422658533; 
 Wed, 31 Jul 2024 03:44:18 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-7a9f816da59sm8791375a12.29.2024.07.31.03.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 03:44:17 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Wed, 31 Jul 2024 18:43:14 +0800
Message-Id: <4603a4f68616ce41aca97bac2f55e5d51c865f53.1722421644.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722421644.git.0x1207@gmail.com>
References: <cover.1722421644.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 3/5] net: stmmac: support fp
	parameter of tc-taprio
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

tc-taprio can select whether traffic classes are express or preemptible.

After some traffic tests, MAC merge layer statistics are all good.

Local device:
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": true,
        "tx-enabled": true,
        "tx-active": true,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": true,
        "verify-time": 100,
        "max-verify-time": 128,
        "verify-status": "SUCCEEDED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 1398,
            "MACMergeHoldCount": 15783
        }
    } ]

Remote device:
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": true,
        "tx-enabled": true,
        "tx-active": true,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": true,
        "verify-time": 100,
        "max-verify-time": 128,
        "verify-status": "SUCCEEDED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 1388,
            "MACMergeFragCountRx": 1398,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

Tested on DWMAC CORE 5.10a

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 34 ++-----------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 494fe2f68300..eeb5eb453b98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -943,7 +943,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
-	bool fpe = false;
 	int i, ret = 0;
 	u64 ctr;
 
@@ -1028,16 +1027,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 		switch (qopt->entries[i].command) {
 		case TC_TAPRIO_CMD_SET_GATES:
-			if (fpe)
-				return -EINVAL;
-			break;
-		case TC_TAPRIO_CMD_SET_AND_HOLD:
-			gates |= BIT(0);
-			fpe = true;
-			break;
-		case TC_TAPRIO_CMD_SET_AND_RELEASE:
-			gates &= ~BIT(0);
-			fpe = true;
 			break;
 		default:
 			return -EOPNOTSUPP;
@@ -1068,16 +1057,11 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	if (fpe && !priv->dma_cap.fpesel) {
+	if (qopt->mqprio.preemptible_tcs && !priv->dma_cap.fpesel) {
 		mutex_unlock(&priv->est_lock);
 		return -EOPNOTSUPP;
 	}
 
-	/* Actual FPE register configuration will be done after FPE handshake
-	 * is success.
-	 */
-	priv->plat->fpe_cfg->enable = fpe;
-
 	ret = stmmac_est_configure(priv, priv, priv->est,
 				   priv->plat->clk_ptp_rate);
 	mutex_unlock(&priv->est_lock);
@@ -1088,10 +1072,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	netdev_info(priv->dev, "configured EST\n");
 
-	if (fpe) {
-		stmmac_fpe_handshake(priv, true);
-		netdev_info(priv->dev, "start FPE handshake\n");
-	}
+	stmmac_fpe_set_preemptible_tcs(priv, priv->ioaddr, qopt->mqprio.preemptible_tcs);
 
 	return 0;
 
@@ -1109,16 +1090,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	priv->plat->fpe_cfg->enable = false;
-	stmmac_fpe_configure(priv, priv->ioaddr,
-			     priv->plat->fpe_cfg,
-			     priv->plat->tx_queues_to_use,
-			     priv->plat->rx_queues_to_use,
-			     false);
-	netdev_info(priv->dev, "disabled FPE\n");
-
-	stmmac_fpe_handshake(priv, false);
-	netdev_info(priv->dev, "stop FPE handshake\n");
+	stmmac_fpe_set_preemptible_tcs(priv, priv->ioaddr, 0);
 
 	return ret;
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
