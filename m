Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDaGFKhci2mYUAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 17:28:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8337211D288
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 17:28:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04EA9C87EC4;
	Tue, 10 Feb 2026 16:28:23 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net
 (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3940BC87EC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 16:28:21 +0000 (UTC)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id
 202602101628208f417afbfb0002074e
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 17:28:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2RZd2m1rYBzhb6+CUkIcXbLtyHMbbg4kS3QJRa4t3tA=;
 b=iMabUuweSHnhFWaYI+3wNaaJ+BRwEI/KPAbztyzS8JD3v4ZYDbtjHJb/7NlKj3SleKSbmm
 Y1O23MoVjO5K4hU1Z8vfYIB3RMGHDf5bZfRw3hU6um2BPgwzTJAnBBAuLyx2vHy/bwIXXB90
 qEtq4I6mHYhiDlrPOtMMxhpRNsRSXW01A+pI7dvHtsQJH0gjGRZp3b/Bz1ItDd+MU5OL0BX3
 v11jJpgJXquLKC/JCLqvF6DMik9kIL126+fTQrtOzUHe0qO0mTpyVjomldQQPGbgGQP93jf2
 3AlMJ08R1RDQJGTuNWSQAohxPS6rFZ0dGyGyPB1yMC6dbUUywXlzLQfQ==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Tue, 10 Feb 2026 17:28:15 +0100
MIME-Version: 1.0
Message-Id: <20260210-flo-net-stmmac-default-affinity-core-v1-2-4e76612444e1@siemens.com>
References: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
In-Reply-To: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
Cc: netdev@vger.kernel.org, Florian Bezdeka <florian.bezdeka@siemens.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: Use
 cpumask_local_spread() for IRQ spreading
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[siemens.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[siemens.com:s=fm2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:boon.leong.ong@intel.com,m:weifeng.voon@intel.com,m:netdev@vger.kernel.org,m:florian.bezdeka@siemens.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,intel.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[florian.bezdeka@siemens.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[florian.bezdeka@siemens.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,siemens.com:mid,siemens.com:email]
X-Rspamd-Queue-Id: 8337211D288
X-Rspamd-Action: no action

The stmmac driver was previously implementing a self-made IRQ
spreading mechanism based on num_online_cpus(). By migrating to
cpumask_local_spread() the spreading gets NUMA aware.

In addition, most drivers seem to use cpumask_local_spread(),
aligning / harmonizing a bit more.

Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 41 +++++++++++++++++++----
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 012b0a477255df73b2e145b62e09eeb2133e827a..52b75df2b71239aab5b1d5138b78d6c5310b9c5b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -329,6 +329,8 @@ struct stmmac_priv {
 	int sfty_ue_irq;
 	int rx_irq[MTL_MAX_RX_QUEUES];
 	int tx_irq[MTL_MAX_TX_QUEUES];
+	cpumask_var_t rx_affinity[MTL_MAX_RX_QUEUES];
+	cpumask_var_t tx_affinity[MTL_MAX_TX_QUEUES];
 	/*irq name */
 	char int_name_mac[IFNAMSIZ + 9];
 	char int_name_wol[IFNAMSIZ + 9];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a379221b96a348e20f2afb0f44540cfba2f2477a..ddbfc0774143d0353c83988b2dfffa75132bd0ee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3739,6 +3739,8 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	enum request_irq_err irq_err;
 	int irq_idx = 0;
 	char *int_name;
+	int numa_node;
+	int cpu;
 	int ret;
 	int i;
 
@@ -3845,6 +3847,7 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 	}
 
 	/* Request Rx MSI irq */
+	numa_node = dev_to_node(&priv->dev->dev);
 	for (i = 0; i < priv->plat->rx_queues_to_use; i++) {
 		if (i >= MTL_MAX_RX_QUEUES)
 			break;
@@ -3864,8 +3867,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(priv->rx_irq[i],
-				      cpumask_of(i % num_online_cpus()));
+
+		cpu = cpumask_local_spread(i, numa_node);
+		cpumask_set_cpu(cpu, priv->rx_affinity[i]);
+		irq_set_affinity_hint(priv->rx_irq[i], priv->rx_affinity[i]);
 	}
 
 	/* Request Tx MSI irq */
@@ -3888,8 +3893,10 @@ static int stmmac_request_irq_multi_msi(struct net_device *dev)
 			irq_idx = i;
 			goto irq_error;
 		}
-		irq_set_affinity_hint(priv->tx_irq[i],
-				      cpumask_of(i % num_online_cpus()));
+
+		cpu = cpumask_local_spread(i, numa_node);
+		cpumask_set_cpu(cpu, priv->tx_affinity[i]);
+		irq_set_affinity_hint(priv->tx_irq[i], priv->tx_affinity[i]);
 	}
 
 	return 0;
@@ -7653,6 +7660,14 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
 
+static void stmmac_free_affinity(cpumask_var_t *m, unsigned int n)
+{
+	unsigned int i;
+
+	for (i = 0; i < n; i++)
+		free_cpumask_var(m[i]);
+}
+
 static int __stmmac_dvr_probe(struct device *device,
 			      struct plat_stmmacenet_data *plat_dat,
 			      struct stmmac_resources *res)
@@ -7699,10 +7714,21 @@ static int __stmmac_dvr_probe(struct device *device,
 	priv->sfty_irq = res->sfty_irq;
 	priv->sfty_ce_irq = res->sfty_ce_irq;
 	priv->sfty_ue_irq = res->sfty_ue_irq;
-	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
 		priv->rx_irq[i] = res->rx_irq[i];
-	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
+		if (!zalloc_cpumask_var(&priv->rx_affinity[i], GFP_KERNEL)) {
+			stmmac_free_affinity(priv->rx_affinity, i);
+			return -ENOMEM;
+		}
+	}
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
 		priv->tx_irq[i] = res->tx_irq[i];
+		if (!zalloc_cpumask_var(&priv->tx_affinity[i], GFP_KERNEL)) {
+			stmmac_free_affinity(priv->rx_affinity, MTL_MAX_RX_QUEUES);
+			stmmac_free_affinity(priv->tx_affinity, i);
+			return -ENOMEM;
+		}
+	}
 
 	if (!is_zero_ether_addr(res->mac))
 		eth_hw_addr_set(priv->dev, res->mac);
@@ -8023,6 +8049,9 @@ void stmmac_dvr_remove(struct device *dev)
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 
+	stmmac_free_affinity(priv->rx_affinity, MTL_MAX_RX_QUEUES);
+	stmmac_free_affinity(priv->tx_affinity, MTL_MAX_TX_QUEUES);
+
 	if (priv->plat->exit)
 		priv->plat->exit(dev, priv->plat->bsp_priv);
 }

-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
