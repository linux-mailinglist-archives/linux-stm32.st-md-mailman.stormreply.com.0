Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F2F9585A6
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 13:21:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED88AC6DD6B;
	Tue, 20 Aug 2024 11:21:55 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B489C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 11:21:55 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-201d5af11a4so49683125ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724152914; x=1724757714;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8g4Op27qwr2/uTcnTjiy2kZfiW5TvWb5gnrsh3SjPg=;
 b=iPJr17Nzo2KZVWc1X8j3MU7MqcpS/3+P5er+kXDQ2IfTkD4ooP4Tz2ziWGMndRmJjn
 m7G6FABWzQQ5NB1Ya9Im1Bxb6XfxLr2RvjiXLeaqEVzZ5MZxuyeoOuELV1gm97UUWRks
 vZ9sU4dbySauW++m04SwuQRzioXP1mdhdE1SMTnStAkVE/X1sl89esQ5b6qTFAa6SMcr
 kWspkANeBP+5kCY6BfMshdQhsivW5vX3gsyXUnj3Iq52w3YwmsvQwE3TqM1sraLk9dmL
 xLsA4CfZz00uZztk/hxCppmestoSRAwHhRja2bF5K5dPNX7QGNK8VePO49hE12TmZRfz
 OMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724152914; x=1724757714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8g4Op27qwr2/uTcnTjiy2kZfiW5TvWb5gnrsh3SjPg=;
 b=tbycKieGJq7zuDe0fh3o3mcut9FYHzNTcqnkNKnDgedAbkigH+DBOEqD44mC2T+5lg
 bVxMZOj0/FrN3VaC69rUtt6yIe4c9OfG6PdpAGd9apemA7s9dbazyCu9go6NQVhGVxEp
 f8j+xdbJkOxf2gxImCVWSdZ4QJ+kqp7rkcDTRxgVXM++yIPBDxSnkVROiEqnrkdgr0VU
 nqyURLE4YVrxWE6g9iSbky86EZtFA3e1ZJynPM56bY3y6SLhHq3hc+OWDgC/tXgBxG1N
 t0vsFaoEgUqqlSPw0rsMspm0fEyHAoadLcFcbkkDdVPUZTj8MlBsyJlRDxUHr46S6+j6
 XVIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3tGyRWK3ZslrsDYFjKUapgTd0BWvzUYjGj6sRvIXoC9yzSoMaBgHO+KYVLuXIOpVXz0VW7jfngWC/9VUEY/buegjyHKrvAHCtf1PeW6K0nKeYChG7KfWa
X-Gm-Message-State: AOJu0YyHlgAXaGns+fQf5rFeAmE+63ANnMomZn9uI+SU3N5eCy4YEKwD
 a6Of9N2eYigfWSz8oL37idFejayMqf2DP3Pbxk6ZRLpyjjnL1ej5
X-Google-Smtp-Source: AGHT+IFoakYw/z/6J97NlZxGYjThK4OBQnPRiS4KWgOFICCw1vB9echW2rbYnDYD5YFBvqlJnKRRLA==
X-Received: by 2002:a17:902:e885:b0:202:3174:9d44 with SMTP id
 d9443c01a7336-2023174a2fcmr102827975ad.20.1724152913439; 
 Tue, 20 Aug 2024 04:21:53 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f03756f6sm76465355ad.172.2024.08.20.04.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 04:21:53 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 20 Aug 2024 19:20:40 +0800
Message-Id: <c8c0b7d3315bea9149a70c7d3fa3fc0826e44dc5.1724152528.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724152528.git.0x1207@gmail.com>
References: <cover.1724152528.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v5 6/7] net: stmmac: support fp
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

0) tc qdisc add dev eth1 parent root handle 100 taprio \
        num_tc 4 \
        map 0 1 2 3 2 2 2 2 2 2 2 2 2 2 2 3 \
        queues 1@0 1@1 1@2 1@3 \
        base-time 1000000000 \
        sched-entry S 03 10000000 \
        sched-entry S 0e 10000000 \
        flags 0x2 fp P E E E

1) After some traffic tests, MAC merge layer statistics are all good.

Local device:
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
            "MACMergeFragCountTx": 17837,
            "MACMergeHoldCount": 18639
        }
    } ]

Remote device:
[ {
        "ifname": "end1",
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
            "MACMergeFrameAssOkCount": 17189,
            "MACMergeFragCountRx": 17837,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

Tested on DWMAC CORE 5.10a

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 08fda0ed5ff3..84b566351c5d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -931,9 +931,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			       struct tc_taprio_qopt_offload *qopt)
 {
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
+	struct netlink_ext_ack *extack = qopt->mqprio.extack;
 	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
-	bool fpe = false;
 	int i, ret = 0;
 	u64 ctr;
 
@@ -1018,16 +1018,12 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 		switch (qopt->entries[i].command) {
 		case TC_TAPRIO_CMD_SET_GATES:
-			if (fpe)
-				return -EINVAL;
 			break;
 		case TC_TAPRIO_CMD_SET_AND_HOLD:
 			gates |= BIT(0);
-			fpe = true;
 			break;
 		case TC_TAPRIO_CMD_SET_AND_RELEASE:
 			gates &= ~BIT(0);
-			fpe = true;
 			break;
 		default:
 			return -EOPNOTSUPP;
@@ -1058,11 +1054,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	if (fpe && !priv->dma_cap.fpesel) {
-		mutex_unlock(&priv->est_lock);
-		return -EOPNOTSUPP;
-	}
-
 	ret = stmmac_est_configure(priv, priv, priv->est,
 				   priv->plat->clk_ptp_rate);
 	mutex_unlock(&priv->est_lock);
@@ -1071,6 +1062,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		goto disable;
 	}
 
+	stmmac_fpe_set_preemptible_tcs(priv, priv->dev, extack,
+				       qopt->mqprio.preemptible_tcs);
+
 	netdev_info(priv->dev, "configured EST\n");
 
 	return 0;
@@ -1089,11 +1083,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	stmmac_fpe_configure(priv, priv->ioaddr,
-			     &priv->fpe_cfg,
-			     priv->plat->tx_queues_to_use,
-			     priv->plat->rx_queues_to_use,
-			     false, false);
+	stmmac_fpe_set_preemptible_tcs(priv, priv->dev, extack, 0);
+
 	netdev_info(priv->dev, "disabled FPE\n");
 
 	return ret;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
