Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E657138CD4
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2020 09:30:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C765C36B1F;
	Mon, 13 Jan 2020 08:30:02 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE067C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2020 08:29:57 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A952A40693;
 Mon, 13 Jan 2020 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1578904196; bh=lnen1K/tDz2A9H4GTK3qRrNyC5Q/weucAfwOJ6GT9sA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=clEq1r8oek9sMcx4y4GWw2nvzm4pDA2xKI0dHcH+lLkFdR9Vu2ybfQoCMYSEUSO49
 JG5lgntRkBaE8i5MD2AEDdg/81tLzYnS5juswROc6Kd5/F0cS1DQ5w9G3KtHQXfEHh
 C8nFxn18lNnJOIsEoIJjqv1Xj8aZBVev55/tANuBKVRJGfMQIM08WON48RRRBjyaKz
 KCXV8xq+55z5MDKjjyIT2Edf/Flbb+cFFFuXe23low/7XvITk14Nb8VTmrNd19ItjA
 9Ieth5V1aiR0fsm5R4W3xsm/B4yKjxaF7Xxzd19voqrk9InnPXg7026Nrr6eQJhLPJ
 4I3PoP8fi21Gg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 77B36A007B;
 Mon, 13 Jan 2020 08:29:54 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Mon, 13 Jan 2020 09:29:40 +0100
Message-Id: <1deed0e2bdfa071cebbdd0eaa20d7e397cea4e41.1578903874.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1578903874.git.Jose.Abreu@synopsys.com>
References: <cover.1578903874.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1578903874.git.Jose.Abreu@synopsys.com>
References: <cover.1578903874.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 6/6] net: stmmac: Add missing
	information in DebugFS capabilities file
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Adds more information regarding HW Capabilities in the corresponding
DebugFS file.

Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fcc1ffe0b11e..7c2645ee81b1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4341,6 +4341,10 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 		   priv->dma_cap.number_rx_queues);
 	seq_printf(seq, "\tNumber of Additional TX queues: %d\n",
 		   priv->dma_cap.number_tx_queues);
+	seq_printf(seq, "\tCurrent number of TX queues: %d\n",
+		   priv->plat->tx_queues_to_use);
+	seq_printf(seq, "\tCurrent number of RX queues: %d\n",
+		   priv->plat->rx_queues_to_use);
 	seq_printf(seq, "\tEnhanced descriptors: %s\n",
 		   (priv->dma_cap.enh_desc) ? "Y" : "N");
 	seq_printf(seq, "\tTX Fifo Size: %d\n", priv->dma_cap.tx_fifo_size);
@@ -4369,6 +4373,12 @@ static int stmmac_dma_cap_show(struct seq_file *seq, void *v)
 		   priv->dma_cap.l3l4fnum);
 	seq_printf(seq, "\tARP Offloading: %s\n",
 		   priv->dma_cap.arpoffsel ? "Y" : "N");
+	seq_printf(seq, "\tEnhancements to Scheduled Traffic (EST): %s\n",
+		   priv->dma_cap.estsel ? "Y" : "N");
+	seq_printf(seq, "\tFrame Preemption (FPE): %s\n",
+		   priv->dma_cap.fpesel ? "Y" : "N");
+	seq_printf(seq, "\tTime-Based Scheduling (TBS): %s\n",
+		   priv->dma_cap.tbssel ? "Y" : "N");
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(stmmac_dma_cap);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
