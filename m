Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1033C5B969B
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Sep 2022 10:48:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F60EC63326;
	Thu, 15 Sep 2022 08:48:50 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FD25C035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Sep 2022 01:51:38 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id f24so13649400plr.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Sep 2022 18:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=/WIYwNyx5Wu29EYSy/2Jrb2UOMIrmP6W19HsWBdfXxc=;
 b=WM5xtV3vceALBvE0lUoU4kpxV8MOOlvjjYHEozJeuKfrKLcGJIGIGrhYO6B+iq3K+n
 x6QkfRYxmfdZrtYOSmMPpGzsCcBCGHr8n++n8U7T1MHAeR5oJVoQjeOqQM1HcvKcixII
 rOXmZEna7jDPMbtcrMfH8Q+rAW+sV1MEm2kzzB9J3k4ivxtYV1GZh2plWT1IhL2q7REL
 B0KpMEFLtGeHeeg7k9A3P6lVaRyWqAPTuNXBrlRLbYdWi8K4A7g2iberUhz81cT4m68V
 xd/RxAIMb7vu0S9rj34yNNUL+3ZHXSn3HmTJcl1E9SB4/bA10zWlW7pHuSKiPD/Sj2sz
 06VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=/WIYwNyx5Wu29EYSy/2Jrb2UOMIrmP6W19HsWBdfXxc=;
 b=o9PB2EFMdgIEc3GYfhUpNx0zD5v251G6ZwiasT9IdTOMjNsArfQzzA8p6d8Mnuvghj
 b1tmne64H37opIkqWAidkuMN0CvbrF3Fkz1v0yK5rUYcY9wp1519t9C+r1Ne8Rlsaz6D
 T0o9+GqiHZmfWcjm/w/mgLE8zr1hV5zCnqH6TAtFbtRk3crK3NmTs+T0l4mfZCW7Faxz
 eU69ODCgsCc22RCjP587bGVOpg3LdUgTXVV1leRg3RMsf9aWslItC9APUe2YRpW1bdr0
 qKhvJi3vosf/h03XYUNJB4g9g4VNNdpbX5jZqqwKf0BG990COU9yOJYueNbySUw0NxnW
 GNrg==
X-Gm-Message-State: ACrzQf1bQvmfIs9mjltj6ioOoIx5DLDIkMuZz/fgamBtbZFkvQm7Xc0V
 SL+cdU1TjvD1cHBB1GRvRls=
X-Google-Smtp-Source: AMsMyM6g9yibw5BiATdzD4iYp2v8oqxw78nq7VZQH9hmv1lrA3BS03K/DL+KgFbpjre+EkNd3aVGrQ==
X-Received: by 2002:a17:90b:3c8a:b0:200:b874:804 with SMTP id
 pv10-20020a17090b3c8a00b00200b8740804mr2201323pjb.151.1663120296643; 
 Tue, 13 Sep 2022 18:51:36 -0700 (PDT)
Received: from localhost.localdomain ([104.28.240.137])
 by smtp.gmail.com with ESMTPSA id
 s129-20020a625e87000000b00537b1aa9191sm8778989pfb.178.2022.09.13.18.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 18:51:36 -0700 (PDT)
From: Qingfang DENG <dqfext@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 14 Sep 2022 09:51:20 +0800
Message-Id: <20220914015120.3023123-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 15 Sep 2022 08:48:49 +0000
Subject: [Linux-stm32] [PATCH net] net: stmmac: fix invalid usage of
	irq_set_affinity_hint
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

The cpumask should not be a local variable, since its pointer is saved
to irq_desc and may be accessed from procfs.
To fix it, store cpumask to the heap.

Fixes: 8deec94c6040 ("net: stmmac: set IRQ affinity hint for multi MSI vectors")
Signed-off-by: Qingfang DENG <dqfext@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 15 ++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index bdbf86cb102a..720e9f2a40d8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -77,6 +77,7 @@ struct stmmac_tx_queue {
 	dma_addr_t dma_tx_phy;
 	dma_addr_t tx_tail_addr;
 	u32 mss;
+	cpumask_t cpu_mask;
 };
 
 struct stmmac_rx_buffer {
@@ -114,6 +115,7 @@ struct stmmac_rx_queue {
 		unsigned int len;
 		unsigned int error;
 	} state;
+	cpumask_t cpu_mask;
 };
 
 struct stmmac_channel {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8418e795cc21..7b1c1be998e3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3469,7 +3469,6 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	enum request_irq_err irq_err;
-	cpumask_t cpu_mask;
 	int irq_idx = 0;
 	char *int_name;
 	int ret;
@@ -3580,9 +3579,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		cpumask_clear(&cpu_mask);
-		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
-		irq_set_affinity_hint(priv->rx_irq[i], &cpu_mask);
+		cpumask_set_cpu(i % num_online_cpus(),
+				&priv->dma_conf.rx_queue[i].cpu_mask);
+		irq_set_affinity_hint(priv->rx_irq[i],
+				      &priv->dma_conf.rx_queue[i].cpu_mask);
 	}
 
 	/* Request Tx MSI irq */
@@ -3605,9 +3605,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		cpumask_clear(&cpu_mask);
-		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
-		irq_set_affinity_hint(priv->tx_irq[i], &cpu_mask);
+		cpumask_set_cpu(i % num_online_cpus(),
+				&priv->dma_conf.tx_queue[i].cpu_mask);
+		irq_set_affinity_hint(priv->tx_irq[i],
+				      &priv->dma_conf.tx_queue[i].cpu_mask);
 	}
 
 	return 0;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
