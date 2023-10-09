Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134D7BE026
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 15:38:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FBE3C6A61D;
	Mon,  9 Oct 2023 13:38:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0B02C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 13:38:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-406618d0992so44273825e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Oct 2023 06:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696858684; x=1697463484;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=u6KCxFngvX9I/hwQrj7ymkXhwkpFmhe1Y7OW2VCan1I=;
 b=fGB+dwdUu7u+fsIjXg2AGYUuh0UkXJwbrOjhlIme7NH5GePYKA3HTzuFklqUWbMHtf
 xCX5c0GzInSNpq7V2466x9wm3iSLYNWvaRAm94+mFQUV1MkCWptMtWjS4Ggsy93V2Aks
 f3O8L3WUNayZ0nAQVSFvluc/4ta6kPWcJ/bsVJl8Y2crQ+8Bm8zdQnoMgsepuG0KYhJJ
 5ovAVqUt20cT41N8981z/0NpmKU6wYEXHaZcslYmghX205Yq6PJq3PrbmYX10Ixhwg6B
 Qz6o+apLmVCXKx7DF+Vfp+iC0I5ghqCPO4PLsxDVhZ3GzUbUEIepNrnkVUiz5/dYqQB8
 Qkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696858684; x=1697463484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6KCxFngvX9I/hwQrj7ymkXhwkpFmhe1Y7OW2VCan1I=;
 b=uA1vgs2rglBaEAlASPg8/BwG21ELzcpPF5rfSTQozwLBWdaPZe5p1A/g6dHyfH7SKy
 CEHWsd7xmtr2CeOSqniK/X4rZKykf0qhbGtwH8tXsMAPWVxu8UbdcJf1ed92M6MFoxVZ
 3AAPkbAnKtlD2Jqd+X46kMjccNs2ynthgRYhD5istkl1kxeuZCwWLYemhDLCwr/sKgM7
 whoXBUgAE+J2QVbZuQFmxErj9nGVNnz93Yhz/VwsmTlAdNrkG94IzttvLQ4eTvatfFy1
 DIfRbJSkn0NJ2YFPcpLiC2ijNPdeUL4jlzR4HF51t+1LLJU6ebls2pvkaljFDH6pzXYA
 tjEw==
X-Gm-Message-State: AOJu0Yzd5TK4azOiUUxRbpR7T0aG8q32fhRKgWCc2t1s5dEnWc9sEOpW
 KP9xGv0IgMqYi0modWkUkSM=
X-Google-Smtp-Source: AGHT+IEMzVE5102E/rR+PKbFb4Y1qJpv3S+lyAIEK40sgvEz//IRItxHur9Z7ZsOHs5xcO/iYCxqbg==
X-Received: by 2002:adf:f78d:0:b0:320:926:26d5 with SMTP id
 q13-20020adff78d000000b00320092626d5mr13881386wrp.30.1696858683739; 
 Mon, 09 Oct 2023 06:38:03 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 06:38:03 -0700 (PDT)
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
Date: Mon,  9 Oct 2023 15:37:50 +0200
Message-Id: <20231009133754.9834-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next v3 1/5] netdev: replace simple
	napi_schedule_prep/__napi_schedule to napi_schedule
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

Replace drivers that still use napi_schedule_prep/__napi_schedule
with napi_schedule helper as it does the same exact check and call.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
Changes v3:
- Add Reviewed-by tag
Changes v2:
- Add missing semicolon
---
 drivers/net/ethernet/ni/nixge.c     | 3 +--
 drivers/net/ethernet/wiznet/w5100.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 97f4798f4b42..f71a4f8bbb89 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -755,8 +755,7 @@ static irqreturn_t nixge_rx_irq(int irq, void *_ndev)
 		cr &= ~(XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
 		nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET, cr);
 
-		if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		napi_schedule(&priv->napi);
 		goto out;
 	}
 	if (!(status & XAXIDMA_IRQ_ALL_MASK)) {
diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
index 341ee2f249fd..b26fd15c25ae 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -930,8 +930,8 @@ static irqreturn_t w5100_interrupt(int irq, void *ndev_instance)
 
 		if (priv->ops->may_sleep)
 			queue_work(priv->xfer_wq, &priv->rx_work);
-		else if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		else
+			napi_schedule(&priv->napi);
 	}
 
 	return IRQ_HANDLED;
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
