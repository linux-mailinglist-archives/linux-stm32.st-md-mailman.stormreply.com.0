Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55B7B7106
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 20:36:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C8F5C6B478;
	Tue,  3 Oct 2023 18:36:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B2E3CC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Oct 2023 18:36:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-32615eaa312so1177569f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 03 Oct 2023 11:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696358197; x=1696962997;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tm9YMom9fHhN1d1zUQG0VRznBhXAxuVYa9i0nGcBxaE=;
 b=Z0TVxHJ5Ct5TJWpmdrL2tXiFL7Uc0J0ftPIzN7x4dO9BR99g3ldh/lxraKxT+MDRiw
 hvYgP4XkiBWFmGL+aFCFWjcfTtC0xQaAMcFiJvWJaRH1apdLOSPAAwtcLiB1efl1mG8j
 9ejkUzqd08KB53WD4ZvCWKCqmq1WuF6YnnqePBwYExnbF9QeecIP4LgqSkaSnYLmJJvp
 4Xfm3IDvgLcGGl8phNtD+HPpSHtMZklWZEDBSf5SqDz7mtPPIGIIxujKSzDuBUmg+T9u
 9SGlvjd/euNoXpog4NSVxWhmpSIhKsykbEZiwkmI+RdMC0DQ+hiXHpo65mb7EdT1xJId
 tbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696358197; x=1696962997;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tm9YMom9fHhN1d1zUQG0VRznBhXAxuVYa9i0nGcBxaE=;
 b=myWIYR6vKwWqd7td7CC3MsI52aC+Zxp3qSU6z8kcVTVeUjjtroBVA0QI1uSKJvUtCW
 vbiCoxzcH/zTOcwjYpRvNVvLK4rZAqRaDYl7SynJUGRJwISDVmyiQpj/5i3OX4TgaeQa
 UKkDERXTpVOXPMhOz9NtNnu1p6v2EQjygN9OCZTo/AnCmH2brW75SOC1qJSun1V/FdZi
 guXcXr0L7A8qsgGxamwyNll9tFrQwz+SRJa9ufMZgcR+X21U3k3Q35N+oxi3Zwndb0Ga
 sFfg9v/Tld78gjDC3p26b3dzCUre8Wl+jHZQi/ZVYtdcWL2Z+zHCbpM8MC3qAVJlC3ac
 0QGw==
X-Gm-Message-State: AOJu0YxzxcpABYaw6Q/EY++QmgVvI0Cuu19WZdVEXy4JVsiUPW1jIxMy
 Du1VWkcMlzgZjhCze1Y9uF4=
X-Google-Smtp-Source: AGHT+IHmCEBSKPg2KzPhN3vxGxKbm3vSVCgg07JJ6ZMfT1RcykDF7kKuvKIwIWmfSE0q+HzXTkP5ww==
X-Received: by 2002:a5d:460a:0:b0:320:447:3bcc with SMTP id
 t10-20020a5d460a000000b0032004473bccmr40025wrq.51.1696358196705; 
 Tue, 03 Oct 2023 11:36:36 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 k15-20020a7bc40f000000b004013797efb6sm10147400wmi.9.2023.10.03.11.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Oct 2023 11:36:36 -0700 (PDT)
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
Date: Tue,  3 Oct 2023 16:51:47 +0200
Message-Id: <20231003145150.2498-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next PATCH v2 1/4] netdev: replace simple
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
