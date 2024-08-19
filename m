Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE0395649A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 09:26:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A940CC71289;
	Mon, 19 Aug 2024 07:26:38 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50B5AC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 07:26:36 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2025031eb60so2666725ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 00:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724052395; x=1724657195;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aMG2j52tw1mgszoYcGKshXhchCJaL/s4L2M1KESDv+U=;
 b=hDNr/beqAqquOvF1NeoPeMuimKKtijJ2omW9e0qoawShOMmAKdHCi/R7HdoLxdgfeV
 IiRA2D0SCShwNKf0w0Mjn3Wi7l+bzYjqtwa3QS34/gSYoA1o9JkhkZG3Nx8c4AVYWBhD
 e8xYe0XIija70dcqSi2AcPgvvnRRjr6sH7ektJDODj2A0Xwh8KkVt0eF0SJvFVTvmOo4
 2029JkZiPlb0dFCi5rjIL6mJxSM0y/YiuFBvo9dBj9sE6RtN1oMP8EYOqrBOlgzXwwX0
 r8XidcttlQLlOLhcHoJSPp92OdW4JJFR3QqD82npBRGpZoe3oEiE5TY1C6WuifTpbc4b
 fHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724052395; x=1724657195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aMG2j52tw1mgszoYcGKshXhchCJaL/s4L2M1KESDv+U=;
 b=Wb/vqOoSMmfmpSsC1aVQi2IY/dEDbgBVppVjWJiyceXBk6Fd4mgFF3eZ2Guk8zIiTF
 lSxwO11rNNedFYAki/Pz9BQSa5nTht1ELeF0AY2sW3Krl+ps5ox8AHs06g+gpIseaE9c
 cd8dk7OjkH6ZUFZxmqkeQivzO32n1DflwJmGNFFENyHCyaO6h+uw0Qn8OIFhOfiK49IP
 l6PrvVkf3qT2L3rigFBCbMAo91j2osp0vt7Dz2617+8skmIk6J8IWUJvCA0PXiiKLt/1
 t9QLma30MmfqsbTIHMgCIrPfQu+xuidv3U2pDGU6yzWbP66aT/ArVpehRmtOcAI/u8VC
 8TYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfjATAFnnKcBo44wPz/A3Vw6TTq05ci/SDY9oiuuE5OGAVQUYh+myG1ahCaLXN1OwlT83ANLZo2lwsoSSY+ZFLctGVKo24LlNMCT/rS5udJcHk9UJ4wKrS
X-Gm-Message-State: AOJu0YyLOeYbV3Y6vZEooLgaZD0u+oLKBSP6gFzznIwMSbnCC5dLaTCJ
 5+iBetHntYMsqIkfgj8OzmM6W4QEUFZsWG2rwfFJc6SvNDeSyEw9
X-Google-Smtp-Source: AGHT+IEA3vuuj8hHvQm/FT75+3Cmov/g2QhDCgVu6DKTepAiVLdnHDZxmVIV9K1VMgQFzR5yfzj/JQ==
X-Received: by 2002:a17:902:f68d:b0:1fd:93d2:fb67 with SMTP id
 d9443c01a7336-20219696b8bmr66815325ad.52.1724052394666; 
 Mon, 19 Aug 2024 00:26:34 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-201f02faa5dsm58340855ad.2.2024.08.19.00.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 00:26:34 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Mon, 19 Aug 2024 15:25:19 +0800
Message-Id: <28f3b68dd0e0744e851a0b9d90fdee69792fbc0f.1724051326.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724051326.git.0x1207@gmail.com>
References: <cover.1724051326.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 linux-kernel@vger.kernel.org, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 6/7] net: stmmac: support fp
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
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index a967c6f01e4e..05b870b35947 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -933,7 +933,6 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	u32 size, wid = priv->dma_cap.estwid, dep = priv->dma_cap.estdep;
 	struct timespec64 time, current_time, qopt_time;
 	ktime_t current_time_ns;
-	bool fpe = false;
 	int i, ret = 0;
 	u64 ctr;
 
@@ -1018,16 +1017,12 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
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
@@ -1058,7 +1053,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	if (fpe && !priv->dma_cap.fpesel) {
+	if (qopt->mqprio.preemptible_tcs && !priv->dma_cap.fpesel) {
 		mutex_unlock(&priv->est_lock);
 		return -EOPNOTSUPP;
 	}
@@ -1071,6 +1066,9 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		goto disable;
 	}
 
+	stmmac_fpe_set_preemptible_tcs(priv, priv->dev, qopt->mqprio.extack,
+				       qopt->mqprio.preemptible_tcs);
+
 	netdev_info(priv->dev, "configured EST\n");
 
 	return 0;
@@ -1089,11 +1087,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	stmmac_fpe_configure(priv, priv->ioaddr,
-			     &priv->fpe_cfg,
-			     priv->plat->tx_queues_to_use,
-			     priv->plat->rx_queues_to_use,
-			     false, false);
+	stmmac_fpe_set_preemptible_tcs(priv, priv->dev, qopt->mqprio.extack, 0);
+
 	netdev_info(priv->dev, "disabled FPE\n");
 
 	return ret;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
