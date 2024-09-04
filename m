Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 855F596B66D
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Sep 2024 11:22:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B10DC78013;
	Wed,  4 Sep 2024 09:22:46 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C3B5C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Sep 2024 09:22:45 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id
 006d021491bc7-5d5b1e33fa8so3555996eaf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 04 Sep 2024 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725441764; x=1726046564;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f93INA09DMIOXaqhvfxTfomEqawOII5zBMQHUuwv7xk=;
 b=AvPpN+Nn9tMwe7EiZoPqekUF6Tau0p75zoe8yg1Eeoz9eq+UW3pTk8Ws23fIUqhsVP
 +DhUMLXXgHI3vCaGgYJEUrYsgNPkg3kR94lY3Bi3nFG56mg0bbZMWAd7CDhxBE9p+t42
 W0r+xnwT+Ix/YtItcNiN/42GbDUSl1jHtrjOFcUj7/FxL1t2APu7pfdUwlQvd5XkGAy2
 0DIsHFejit+HfVltei9+4evXiRNvZBMEPMXmzj8XAXyfP86Pb3skUJw+odQ1iCA8GHF1
 gHCEaaLxRV4y8yJGkw8cQJBNfe965kRE3biZHwCiLKESI5Mgrd6h/jhmcxMZH4v3wVRo
 0HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725441764; x=1726046564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f93INA09DMIOXaqhvfxTfomEqawOII5zBMQHUuwv7xk=;
 b=Qplue9jesbWP2k6AgBTEfXz6Wsmw5JY/jhUrysTHyLLGOUrSYBDMtmdArbw/iIg3ty
 NAn4H21Ea62WMolWF42xuVn6YOYP9u+ZNm7iBnOJFNJWBXTdXFFD0RCbi0W6yLEzRNjO
 Ir44o7JTT8YGTnXMnEXbCDgOCCOWKW44AJbCeKOO2jCRbT9JePrW/0Puuro17fKmJOVt
 qLeBzSkE/80lGlflOHI8Me1xvwbMm+FFzrwbALXj14gLKrEs1PdsKkekclQL2PhasrQK
 kbOKbj04tlmYdqNNGrVXSLb3cPMrZEhR+vG7K2oqZ3WECi8+mPDtO2gXKEaOl6fWpRrJ
 3lyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0ueX0ZipI8rqApB6EeGBv8VLZILUKRXBKsaxSlZEMTSGDrXT9wCT0Upk0WWxD3QtgbX3BBogjfSmG7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzfM+AhSOW++qXw1UAAjscyu9Ag/EwBh7sjMJVCHHpKz6Zc7FOQ
 Vwlxo/t3Lqf2VPqkQkgQDj3vp7xL0OGUFbErBRzPvlpnyL528Qw6
X-Google-Smtp-Source: AGHT+IHfYqlv3eIcYyWGBnu/IU/NNPsjKTuOUdU83UVXH4tEzccuzhL00qdC/ENlfqKhPKlAdB5TgQ==
X-Received: by 2002:a05:6870:b508:b0:277:d563:9b41 with SMTP id
 586e51a60fabf-27810b27c69mr6792025fac.9.1725441764098; 
 Wed, 04 Sep 2024 02:22:44 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7177859968csm1232048b3a.146.2024.09.04.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 02:22:43 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>
Date: Wed,  4 Sep 2024 17:21:21 +0800
Message-Id: <3bf0857f46b15980e60f3ec71acd0f80452863e4.1725441317.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725441317.git.0x1207@gmail.com>
References: <cover.1725441317.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org, linux@armlinux.org.uk,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 6/7] net: stmmac: support fp
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
 .../net/ethernet/stmicro/stmmac/stmmac_tc.c   | 23 +++++++------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 9ec2e6ab81aa..2bdb22e175bc 100644
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
@@ -1071,6 +1062,11 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		goto disable;
 	}
 
+	ret = stmmac_fpe_map_preemption_class(priv, priv->dev, extack,
+					      qopt->mqprio.preemptible_tcs);
+	if (ret)
+		goto disable;
+
 	netdev_info(priv->dev, "configured EST\n");
 
 	return 0;
@@ -1089,11 +1085,8 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 		mutex_unlock(&priv->est_lock);
 	}
 
-	stmmac_fpe_configure(priv, priv->ioaddr,
-			     &priv->fpe_cfg,
-			     priv->plat->tx_queues_to_use,
-			     priv->plat->rx_queues_to_use,
-			     false, false);
+	stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
+
 	netdev_info(priv->dev, "disabled FPE\n");
 
 	return ret;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
