Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D117BE031
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 15:38:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42295C6A61D;
	Mon,  9 Oct 2023 13:38:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AF0BC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 13:38:13 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-406618d080eso43527115e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Oct 2023 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696858692; x=1697463492;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EzAWHH01VVS9IgkvFldWVDddj9E+l4PxhyRk8MwG584=;
 b=OYnP8Z+q0S+DbK/rdMH+QWW/NgZaAwCorZ8uCAR3fmEDE7LXZxjikw3tcmaEgYYUUU
 i1eAFj/LSHBq3jMs25EQHp7qxG+sEPkDqyQKKb+l1W6RKQYS+nJqANJdBmeyllGyyECe
 aMdaY6nEL4J/r+7X1/ZrUageLppyZ9Kw9Xsd607LGFa/QEqyIITnC/lW1qO9bBIMTZ2z
 6cWQKe6xAeMSyv3MLU+TGds5jD/oJ+APOD6DiOqvfdQAihen7V8AHo4vfaWDBN2+roWd
 QD7/0DjeqrWZauiDQ7io368lPa0luapYw+ukO1/jHPtTgHdKDsczbVnwwBir9NRIDBKe
 9vPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696858692; x=1697463492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EzAWHH01VVS9IgkvFldWVDddj9E+l4PxhyRk8MwG584=;
 b=vW7/4bIRwhzD19LqDfVtBEg2/Hc3DTnHbEts29lmef2skQ2G5s/EQS9ImGXZpQoVGq
 nEC9HwqF2KQguSkWzmzhcLDm6/7ReJY3STdrWuJMdpGrwRnG2qKe/GZh9bC9+g2mEXCI
 iSkIjJG4YygCZIu8J7+xm6MpGZufVdW6GbDFA+QUU1RKkqQJJxLHNHGEz6aNuWTmO/HG
 xJf9Fv2jl/OMv8+vRVfS2ZY89q9+CrdC74jMvCOKHvumT4sUNLlwHV3kAkyblwt93dS/
 X2+vme/tBJKtxdRUpbrdoOcG5ZI5NDaoOFJ3nnmyw9YepqYl8ol4Zy6DN4qYti9kr6SZ
 /RZg==
X-Gm-Message-State: AOJu0YxjLqLy1DwPm9vUO1g1JRpYpwlVrkJFlADUTH6t02aT0mk9c857
 v4uBIm2MMyU+dIwwfnn2qUk=
X-Google-Smtp-Source: AGHT+IHsAsFvK5zcfvpEHNpBjlrUZf2mmc5SciLA+pPQWufHQKhdvJk6OO5q7vOl9k3p/vj4f/tuWw==
X-Received: by 2002:adf:e9d0:0:b0:31f:f432:b541 with SMTP id
 l16-20020adfe9d0000000b0031ff432b541mr13440190wrn.69.1696858692458; 
 Mon, 09 Oct 2023 06:38:12 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 06:38:11 -0700 (PDT)
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
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Alex Elder <elder@linaro.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Simon Horman <horms@kernel.org>, Rob Herring <robh@kernel.org>,
 Bailey Forrest <bcf@google.com>, Junfeng Guo <junfeng.guo@intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ziwei Xiao <ziweixiao@google.com>, Rushil Gupta <rushilg@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yuri Karpov <YKarpov@ispras.ru>, Andrew Lunn <andrew@lunn.ch>,
 Zheng Zengkai <zhengzengkai@huawei.com>, Dawei Li <set_pte_at@outlook.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 Benjamin Berg <benjamin.berg@intel.com>, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Date: Mon,  9 Oct 2023 15:37:53 +0200
Message-Id: <20231009133754.9834-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next v3 4/5] net: tc35815: rework network
	interface interrupt logic
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

Rework network interface logic. Before this change, the code flow was:
1. Disable interrupt
2. Try to schedule a NAPI
3. Check if it was possible (NAPI is not already scheduled)
4. emit BUG() if we receive interrupt while a NAPI is scheduled

If some application busy poll or set gro_flush_timeout low enough, it's
possible to reach the BUG() condition. Given that the condition may
happen and it wouldn't be a bug, rework the logic to permit such case
and prevent stall with interrupt never enabled again.

Disable the interrupt only if the NAPI can be scheduled (aka it's not
already scheduled) and drop the printk and BUG() call. With these
change, in the event of a NAPI already scheduled, the interrupt is
simply ignored with nothing done.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/toshiba/tc35815.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 14cf6ecf6d0d..6e3758dfbdbd 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -1434,14 +1434,10 @@ static irqreturn_t tc35815_interrupt(int irq, void *dev_id)
 	u32 dmactl = tc_readl(&tr->DMA_Ctl);
 
 	if (!(dmactl & DMA_IntMask)) {
-		/* disable interrupts */
-		tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
-		if (napi_schedule_prep(&lp->napi))
+		if (napi_schedule_prep(&lp->napi)) {
+			/* disable interrupts */
+			tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
 			__napi_schedule(&lp->napi);
-		else {
-			printk(KERN_ERR "%s: interrupt taken in poll\n",
-			       dev->name);
-			BUG();
 		}
 		(void)tc_readl(&tr->Int_Src);	/* flush */
 		return IRQ_HANDLED;
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
