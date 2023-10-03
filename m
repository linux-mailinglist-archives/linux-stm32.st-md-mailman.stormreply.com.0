Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B817B7112
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 20:36:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C25E4C6B478;
	Tue,  3 Oct 2023 18:36:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 454EDC6C82F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 18:36:46 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-405524e6768so12625225e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 11:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696358206; x=1696963006;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6gyQNJ2XnyFpWZfsSOVQ7NTvT9jbamCtiO1RkGRSocs=;
 b=KPTKGUkh1hEr85BKnIAtwJNjNjx9TCGBQlVV04qmF4y8vtrktMRqhEbGWk5iZw0GLg
 zZPQrZ6u/aI3BryHnI2+14mGYfQfwZiYPeugZUgMwc9/UF7lGSjCUdpMNPua88jpwuS+
 BdUdBuUG0VHsCwW+7ba6QnacdUsrudvqyNPevP2JL6BjmVkEOfSk9TMkT+G8PsPQhUvc
 ts4qIRPyKidiNFCdeTnaZO5RNVv8x5NbWA/eIl3+e56khHIYap/QAH/rFDrdMwD9DpWc
 7AQVs4vTy1FPwae88EPV+h+Oawp1TItk+5nZ3Q3FAu1Q07onzif5mhOl/bjqObOcwUFO
 zQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696358206; x=1696963006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6gyQNJ2XnyFpWZfsSOVQ7NTvT9jbamCtiO1RkGRSocs=;
 b=v88uZDcJ5ZsShFlIotnAIHYphnJAb+EJ/TfnmRyFnF5lh0FBEQ4Y+jetpF6Hzz+/Ni
 7KZI+aF/8eZ28UnpBqg5l6VCSRNWh8EmLb5iT9x7ohWSNu3WK3ucuqb/oINRduH2wfA4
 cMraoym+ixrlZZQ5aoTOwP+2aoeqUe137ZmuE8Z0IEN+Se6735GwO9KqVtYalKGIcBp5
 4zw4knBSY0AmzAHz8Zpq0njynYPuEGOiclPDR/sWKXPUh3+HRXsN7kXthi7d3fS0jYrg
 BsNeV5yzsh2r5jVrKebDojSQfkHwla026T+C5MU0kJHpMcZMY7XL4gCfPT6ef4MQ2yrg
 /Pvg==
X-Gm-Message-State: AOJu0YwGL4f7H1oAB05mtqaYBBAZW91a+Jb+r2BXuFzy4oxnovoS4OOL
 m4o5roaxjGmscpNEbv6d4kU=
X-Google-Smtp-Source: AGHT+IEYiqmB3FHX80gX8tQMzI8kEwWFIYbZ3oxXBoRCokmvLgveVRe6BiL4NPRW0r5qNgswYRjDHQ==
X-Received: by 2002:a05:600c:22ce:b0:405:4c3a:796f with SMTP id
 14-20020a05600c22ce00b004054c3a796fmr308411wmg.2.1696358205305; 
 Tue, 03 Oct 2023 11:36:45 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 k15-20020a7bc40f000000b004013797efb6sm10147400wmi.9.2023.10.03.11.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 11:36:45 -0700 (PDT)
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
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nick Child <nnac123@linux.ibm.com>, Haren Myneni <haren@linux.ibm.com>,
 Rick Lindsley <ricklind@linux.ibm.com>,
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
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Ziwei Xiao <ziweixiao@google.com>,
 Rushil Gupta <rushilg@google.com>, Coco Li <lixiaoyan@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Junfeng Guo <junfeng.guo@intel.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Wei Fang <wei.fang@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yuri Karpov <YKarpov@ispras.ru>, Zhengchao Shao <shaozhengchao@huawei.com>,
 Andrew Lunn <andrew@lunn.ch>, Zheng Zengkai <zhengzengkai@huawei.com>,
 Lee Jones <lee@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Dawei Li <set_pte_at@outlook.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Date: Tue,  3 Oct 2023 16:51:50 +0200
Message-Id: <20231003145150.2498-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003145150.2498-1-ansuelsmth@gmail.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next PATCH v2 4/4] netdev: use napi_schedule
	bool instead of napi_schedule_prep/__napi_schedule
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
