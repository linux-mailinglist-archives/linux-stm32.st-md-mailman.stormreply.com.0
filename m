Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C17B5609
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 17:10:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91EF7C6B473;
	Mon,  2 Oct 2023 15:10:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 466DCC6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 15:10:36 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so19744745e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696259435; x=1696864235;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ow78hAE0yIyUemUyYOBz3q9ywNhxcPT95anou49aj54=;
 b=Tar/rUqrB36egZ2vYBMhFo3uL12AqtSiqVb9ziz8BaapzcAlxZhU8jqYSBer8TXooH
 LQLwZK+TAIABzy2xHL9DUfjx5winGEIWy4pdgld2SbM6LF6TkdMoIedhad8Xos+9xhMq
 kbQyCseaSpbqTn3A4jC+kB2k3d0aX3JitdxNw/JYX5dIe9ZRwizznufFDJhTiTBi2tMn
 Wp8qcDGhBV4yNpx870e+wp9uUe6Q18Nz0z1qq0eVX3JnitEMdnEH+9wlOqD8oR5tpgZU
 91mXCU36zHEjD0yHRk5tfLNdh83bowiYb6QYBKyjv1YTSloUJsXzICDtWAU4gDxPTBAB
 3WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696259435; x=1696864235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ow78hAE0yIyUemUyYOBz3q9ywNhxcPT95anou49aj54=;
 b=qh9PaFJvz7CCYN+Y8zk+le6KhDQpnKC7UvBNAyAnP7nONWnt98Km781ZShBoituO2H
 KI9tbq7Ib2bV/hLSLHb59CyDCoTZvS4LGx+psX8LRQjTemxy7EynOo3bjIJM119A3Bjy
 nJ8spzciTs+DVtM//GBJyKdrjSS/z5GwMTM/wHbpO+9Lmb+fmxJWINLmxnVsBSMEIb3P
 2aZyy3m0LKdho+umo5JxglqFihKkbOJD2PslvrY60yZTx1qB8qWvbGs4r/xehWsFjFCm
 h+Fn++2zyxalkkQ/2CA152fXKtU+d6ATLCs2GiF4Gy8YY3430H3VnGKXQ8J24ih7XYqk
 JEYQ==
X-Gm-Message-State: AOJu0Yw1SQ4ZAPLGQBohAkEMPWhmwC5oeUQAsElhVdPJ88s4azeu5rGM
 BMdq5kVvXv/jfWUXGuGEG2o=
X-Google-Smtp-Source: AGHT+IER54DFWa7vQIFTj6+iJgsPdY5/GDB29GHbGeIgWOfOFDfcvPSoorLgTOCTW0kTjVMyBnWZcA==
X-Received: by 2002:a05:600c:4991:b0:401:b92f:eec5 with SMTP id
 h17-20020a05600c499100b00401b92feec5mr10163374wmp.9.1696259434455; 
 Mon, 02 Oct 2023 08:10:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 t15-20020a1c770f000000b00406408dc788sm7421565wmi.44.2023.10.02.08.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 08:10:32 -0700 (PDT)
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
Date: Mon,  2 Oct 2023 17:10:20 +0200
Message-Id: <20231002151023.4054-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next PATCH 1/4] netdev: replace simple
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
index 341ee2f249fd..5613fd6a9f0a 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -930,8 +930,8 @@ static irqreturn_t w5100_interrupt(int irq, void *ndev_instance)
 
 		if (priv->ops->may_sleep)
 			queue_work(priv->xfer_wq, &priv->rx_work);
-		else if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		else
+			napi_schedule(&priv->napi)
 	}
 
 	return IRQ_HANDLED;
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
