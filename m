Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 540699582D9
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 11:39:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E3AC6DD6B;
	Tue, 20 Aug 2024 09:39:30 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EE36C6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 09:39:29 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2d394313aceso4036885a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 02:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724146768; x=1724751568;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MBziSSli8cMhwVRS/XUpMid3dlyuuWsBGzCQhQohhLw=;
 b=dU6yGZtRk3eNpySO1R1LttQnZ2BWiijpxHFKHU0+z+x1TXLkugdL0uYIx9GwmAGN3u
 PbGm7noIbaW/Ys4lU6wBBw+Z8VXvDbdiWdaGZL2BW695qooZG7vnlUeHHVSCGcKCHNAD
 /aX4Mf6lVuDZs0ED72sQWKoN7zpL84Q+5WvSWLTalgb2Tn+PkZUFms6vGE81YDYQvnFV
 vfP/xciksqCi3Pb9PMatZdHCsl0qgtMpjXVBFcYQlDxQUyxH+mYo/Ow6CZVtDTBxZCc6
 SkMyfsuLrjWCyMqngO0Y75nmiEtWpNZZJFw6YkkDt34RHiX3nkMsBpw2BwilOIElcpy3
 p0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724146768; x=1724751568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MBziSSli8cMhwVRS/XUpMid3dlyuuWsBGzCQhQohhLw=;
 b=Pop3Z135wu+NWfIo3yehbJQAaFPSCEi36vx2z/+J6zAg2Du1ZIL1jcsflfj7DToG+Q
 SAd4sRuOjTz9gghyQNAfdXTVaLXLNOQQUbMbmd8nh7cmEFdFXltNbmERUTPK4lDYRzpD
 YHZdnmsMOUPIbpTPTKHFru+StjReLgdW9tVqFNMsbKXTj1wgzM0HZhqeexfTE8nw6NNe
 Qn79FdxkJK59qD4qplt8r9UV97uPyNDI26cXD8FOpTQgSP9jniujSSI8uISGWNRgXU/H
 nuIh7YVICNkmYMZneI7zmKhi1ZmmFOojPp/U11jldj3HZkMgNYYNdcnPGphKkfCnJ6bO
 EaMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbGazomwalgc8IO8tioauM3YF3Et/ytQfbvaRbzN05RRrnoEkgGwLm4ASy8pIm/7OGqQXNb2J0pgvUYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJhS0SUl8OznNNnZzYhVPTIk+W3aviXQjBSX2wkXmTrOS53ZmZ
 ca4/PGduJ6qqmTIPeP6fgzQryCBH8tiwHq3lOJV/xEvsjlrDptJ7
X-Google-Smtp-Source: AGHT+IGv2yZnBNN0ZbnLqzVXOK4cuhP5PFCjq22WGkpxCpnGjZAQC6MUuCRjeBTUVeo52ol6QEcEwg==
X-Received: by 2002:a17:90a:db8d:b0:2cb:5aaf:c12e with SMTP id
 98e67ed59e1d1-2d3e03e8cfbmr14850301a91.37.1724146767418; 
 Tue, 20 Aug 2024 02:39:27 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d45246061dsm3230608a91.8.2024.08.20.02.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 02:39:27 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Tue, 20 Aug 2024 17:38:34 +0800
Message-Id: <b3e9cba8331a65523a66e498179153361fac18bd.1724145786.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724145786.git.0x1207@gmail.com>
References: <cover.1724145786.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v4 6/7] net: stmmac: support fp
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
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index f8f09ef2d447..589fbe9de09b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -932,9 +932,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			       struct tc_taprio_qopt_offload *qopt)
 {
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
+	struct netlink_ext_ack *extack = qopt->mqprio.extack;
 	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
-	bool fpe = false;
 	int i, ret = 0;
 	u64 ctr;
 
@@ -1019,16 +1019,12 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
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
@@ -1059,7 +1055,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	if (fpe && !priv->dma_cap.fpesel) {
+	if (qopt->mqprio.preemptible_tcs && !ethtool_dev_mm_supported(priv->dev)) {
+		NL_SET_ERR_MSG_MOD(extack, "Device does not support preemption");
 		mutex_unlock(&priv->est_lock);
 		return -EOPNOTSUPP;
 	}
@@ -1072,6 +1069,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		goto disable;
 	}
 
+	stmmac_fpe_set_preemptible_tcs(priv, priv->dev, extack,
+				       qopt->mqprio.preemptible_tcs);
+
 	netdev_info(priv->dev, "configured EST\n");
 
 	return 0;
@@ -1090,11 +1090,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
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
