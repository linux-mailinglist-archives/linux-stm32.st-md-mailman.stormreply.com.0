Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 177897B560F
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 17:10:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB09FC6B473;
	Mon,  2 Oct 2023 15:10:46 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8125CC6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 15:10:45 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-40572aeb673so137596615e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696259445; x=1696864245;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6gyQNJ2XnyFpWZfsSOVQ7NTvT9jbamCtiO1RkGRSocs=;
 b=EODzJOf9BYtfQ1xGU3N/fqqkt6WhV7FzQkoFbj6WuCSk89I8lKVFqaAVaruuC5pkc3
 dtxptQRYkYjUtid3IRAU8E6cagK+SE9PGQP/e8glA6+bQujUrOwWghdcf8LDkWDDgDGr
 oTxMqrY9xjPtbHZkuRIi7h944bHixhquqghgxyMi9u49tJ79a1H8GEQmGAmt4h8yEedY
 cC6c0njzw0SMkhov5AZ3gW4nz3mxojhiAofCclUrVQ+ajtMbSUM27JxBw8ObhR65Qyxz
 xOIm+QDN9PMn0H2JgvgkOw4w1ghVqZEE5JxNI8LlT8k8lxCiLuPq/PEMq/v3k8axQb4L
 QH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696259445; x=1696864245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6gyQNJ2XnyFpWZfsSOVQ7NTvT9jbamCtiO1RkGRSocs=;
 b=ZnNXz5s5XcN+4o89Hdxmw1m7mTyrXkebQofR/RrpJPds9AkvZQKO0wE0zPSnO31gHj
 azhcOZclqq/KyjXBwbEN6Ow6kYIu6SnjgJZ54EKPtP+AezgiVtyRMESXSB/2XmqGj82K
 A/6Cpptkr3ZRN1MbL4sZEBFiisJ5YOF8aW122cm7eMLNQMbEIm2opWcWQgYFoeG8och+
 97PYyjIbW85hDHRjk0L5MUzxbBeIgxdzTiMwEVGsG906FgVIied65lfR+C5NqBybVxST
 sD0kVFfK+ztoYSnI1BcR+ItIYa0UPjY8p4oTI9AhR4+zPRcNDm2Yg3B97iY0HZE4DXEw
 /kCw==
X-Gm-Message-State: AOJu0YyiRBSNU67qr1/t59J07lhWdk41nfJgzZoRK8Euqjw4n5bOZBET
 IvSBOGjG97cTx7+H8ZADXJA=
X-Google-Smtp-Source: AGHT+IHc5YiZnwUBsMAS0VclvrmwyD0ekRYikQ7eali40Cd+T9SQe91Rx4Z4tqTKa7Zvq69Zs0IYGQ==
X-Received: by 2002:a7b:c397:0:b0:3fe:3004:1ffd with SMTP id
 s23-20020a7bc397000000b003fe30041ffdmr10304452wmj.4.1696259444747; 
 Mon, 02 Oct 2023 08:10:44 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 t15-20020a1c770f000000b00406408dc788sm7421565wmi.44.2023.10.02.08.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 08:10:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Chris Snook <chris.snook@gmail.com>,
 Raju Rangoju <rajur@chelsio.com>, Jeroen de Borst <jeroendb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>,
 Douglas Miller <dougmill@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Haren Myneni <haren@linux.ibm.com>, Rick Lindsley <ricklind@linux.ibm.com>,
 Dany Madden <danymadden@us.ibm.com>,
 Thomas Falcon <tlfalcon@linux.ibm.com>, Tariq Toukan <tariqt@nvidia.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Intel Corporation <linuxwwan@intel.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Liu Haijun <haijun.liu@mediatek.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei Fang <wei.fang@nxp.com>,
 Alex Elder <elder@linaro.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Junfeng Guo <junfeng.guo@intel.com>, Ziwei Xiao <ziweixiao@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rushil Gupta <rushilg@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yuri Karpov <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>,
 Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lee Jones <lee@kernel.org>, Dawei Li <set_pte_at@outlook.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Date: Mon,  2 Oct 2023 17:10:23 +0200
Message-Id: <20231002151023.4054-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231002151023.4054-1-ansuelsmth@gmail.com>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next PATCH 4/4] netdev: use napi_schedule bool
	instead of napi_schedule_prep/__napi_schedule
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

Replace if condition of napi_schedule_prep/__napi_schedule and use bool
from napi_schedule directly where possible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
 drivers/net/ethernet/toshiba/tc35815.c       | 4 +---
 drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 02aa6fd8ebc2..a9014d7932db 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_struct *napi, int budget)
 
 static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
 {
-	if (!napi_schedule_prep(&adapter->napi))
+	if (!napi_schedule(&adapter->napi))
 		/* It is possible in case even the RX/TX ints are disabled via IMR
 		 * register the ISR bits are set anyway (but do not produce IRQ).
 		 * To handle such situation the napi functions used to check is
@@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
 		 */
 		return 0;
 
-	__napi_schedule(&adapter->napi);
-
 	/*
 	 * Disable RX/TX ints via IMR register if it is
 	 * allowed. NAPI handler must reenable them in same
diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 14cf6ecf6d0d..a8b8a0e13f9a 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -1436,9 +1436,7 @@ static irqreturn_t tc35815_interrupt(int irq, void *dev_id)
 	if (!(dmactl & DMA_IntMask)) {
 		/* disable interrupts */
 		tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
-		if (napi_schedule_prep(&lp->napi))
-			__napi_schedule(&lp->napi);
-		else {
+		if (!napi_schedule(&lp->napi)) {
 			printk(KERN_ERR "%s: interrupt taken in poll\n",
 			       dev->name);
 			BUG();
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
index 23b5a0adcbd6..146bc7bd14fb 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
@@ -1660,9 +1660,7 @@ irqreturn_t iwl_pcie_irq_rx_msix_handler(int irq, void *dev_id)
 	IWL_DEBUG_ISR(trans, "[%d] Got interrupt\n", entry->entry);
 
 	local_bh_disable();
-	if (napi_schedule_prep(&rxq->napi))
-		__napi_schedule(&rxq->napi);
-	else
+	if (!napi_schedule(&rxq->napi))
 		iwl_pcie_clear_irq(trans, entry->entry);
 	local_bh_enable();
 
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
