Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8EE34D138
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Mar 2021 15:36:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAC58C57B54;
	Mon, 29 Mar 2021 13:36:32 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99AC5C5719D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 13:36:30 +0000 (UTC)
IronPort-SDR: j8EXaZJLoCSxzbHBDDyjYQJR0K6dxP4E0Uz3Qf0Yn32IsXOmUEnvnTtHSfrRu/sAnHz/rmKQtM
 mPOJoGjATnWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="178678960"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="178678960"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:36:27 -0700
IronPort-SDR: +l9e/G6tHjwa1KuU/ooNwJpc6WXAW1rN2dalrWNZudQesddftnUyZxNu4rbH9wawqVDBTu4sbQ
 ugaEgoWhgP0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="411079330"
Received: from glass.png.intel.com ([10.158.65.59])
 by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2021 06:36:22 -0700
From: Ong Boon Leong <boon.leong.ong@intel.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>
Date: Mon, 29 Mar 2021 21:40:08 +0800
Message-Id: <20210329134013.9516-2-boon.leong.ong@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210329134013.9516-1-boon.leong.ong@intel.com>
References: <20210329134013.9516-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Cc: Song Liu <songliubraving@fb.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 KP Singh <kpsingh@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Yonghong Song <yhs@fb.com>,
 bpf@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/6] stmmac: intel: set IRQ affinity
	hint for multi MSI vectors
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

Intel mGBE has independent hardware IRQ resources for TX and RX DMA
operation. In preparation to support XDP TX, we add IRQ affinity hint
to group both RX and TX queue of the same queue ID to the same CPU.

Signed-off-by: Ong Boon Leong <boon.leong.ong@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 08b4852eed4c..53a24932a192 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -810,6 +810,7 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
 				   struct plat_stmmacenet_data *plat,
 				   struct stmmac_resources *res)
 {
+	cpumask_t cpu_mask;
 	int ret;
 	int i;
 
@@ -832,12 +833,18 @@ static int stmmac_config_multi_msi(struct pci_dev *pdev,
 	for (i = 0; i < plat->rx_queues_to_use; i++) {
 		res->rx_irq[i] = pci_irq_vector(pdev,
 						plat->msi_rx_base_vec + i * 2);
+		cpumask_clear(&cpu_mask);
+		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
+		irq_set_affinity_hint(res->rx_irq[i], &cpu_mask);
 	}
 
 	/* For TX MSI */
 	for (i = 0; i < plat->tx_queues_to_use; i++) {
 		res->tx_irq[i] = pci_irq_vector(pdev,
 						plat->msi_tx_base_vec + i * 2);
+		cpumask_clear(&cpu_mask);
+		cpumask_set_cpu(i % num_online_cpus(), &cpu_mask);
+		irq_set_affinity_hint(res->tx_irq[i], &cpu_mask);
 	}
 
 	if (plat->msi_mac_vec < STMMAC_MSI_VEC_MAX)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
