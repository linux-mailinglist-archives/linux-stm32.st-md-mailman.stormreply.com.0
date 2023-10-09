Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 608537BE029
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 15:38:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A52DC6B44B;
	Mon,  9 Oct 2023 13:38:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0215FC6B44B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 13:38:07 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-406650da82bso41731815e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Oct 2023 06:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696858686; x=1697463486;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
 b=lnGGt/XS/Tfd6+1TRYvEW4BzYxiYW+dCf6vCKv3NM3I0Ag0V+TgLQtR3ANbywSjboE
 wCTv237vABMZE/ex95dxayN1iZ7rvtcQpdt/Bf+m0vyC0yuw4CQtqHmdWplXZB827Lj2
 fB17P5av6EdFMlj17hcXZl9cGnttjSJlD1IZsX9SZB3x0Tr1lbLNQmEjFFWt9NRycYSF
 VKvkKmhky9Lu4NysHEy3k++LsBYcVDis1lhoW2QtEzN/8udnKwWyEyVpY6UOJvR4kbwQ
 MSPRxWgOd2Bzr3csUYvLAGk5KfKHzdMExfaE9o0mGGsbn7SEPJP1T2xedsjM2tPKFN5r
 avnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696858686; x=1697463486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
 b=Y4pkIaENE+tQnwovmsabsVHmE2jLybiarHKEN0phAVnvlyBx/9g4rkvQXSn32W9W+Q
 7hmkeqpqqO0QQLGO2/9dN7Oi+Vn57bdWoAkZelqLIn3GjYdv+pkmb8Yjqx1I0dYhJ3zn
 d8elL1ARGOsywZK/QuCWhdrv+B6O4GNPwCMayTTz1gCpiv7Gy/+JDlYPXi5zmmMJtxfR
 K9NHSuqzsk9J1lNpC24YN63gip/HZbPtsClOsUafN9deX+mJaeXJHP0VvdNX4jIn92/0
 iYiT8BDutP3QQsz2IlRDo1dteDx4uXK388zNYUp3doY1ZqRQJjZ61NBO+xAg9O+AeOMv
 OkqA==
X-Gm-Message-State: AOJu0Yyj+YlflW+ahjsGfIgVZOkeKAKfuMYF8+pRdgcP4+3lnYP0VSs0
 J90BQzcZMHIGfk5ieRzQD4E=
X-Google-Smtp-Source: AGHT+IEMX7bz877y1sqkSBBwiuVDPwmUPP6Boy0DbKerTwIWpVX1/W8TSbdVp2MIATN2+AWYZ0P7bg==
X-Received: by 2002:a05:6000:128a:b0:31a:d9bc:47a2 with SMTP id
 f10-20020a056000128a00b0031ad9bc47a2mr15005335wrx.53.1696858686330; 
 Mon, 09 Oct 2023 06:38:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 06:38:06 -0700 (PDT)
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
Date: Mon,  9 Oct 2023 15:37:51 +0200
Message-Id: <20231009133754.9834-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next v3 2/5] netdev: make napi_schedule return
	bool on NAPI successful schedule
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

Change napi_schedule to return a bool on NAPI successful schedule.
This might be useful for some driver to do additional steps after a
NAPI has been scheduled.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
Changes v2:
- Add Suggested-by tag
- Add Reviewed-by tag
---
 include/linux/netdevice.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7e520c14eb8c..2bead8e2a14d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -490,11 +490,18 @@ bool napi_schedule_prep(struct napi_struct *n);
  *
  * Schedule NAPI poll routine to be called if it is not already
  * running.
+ * Return true if we schedule a NAPI or false if not.
+ * Refer to napi_schedule_prep() for additional reason on why
+ * a NAPI might not be scheduled.
  */
-static inline void napi_schedule(struct napi_struct *n)
+static inline bool napi_schedule(struct napi_struct *n)
 {
-	if (napi_schedule_prep(n))
+	if (napi_schedule_prep(n)) {
 		__napi_schedule(n);
+		return true;
+	}
+
+	return false;
 }
 
 /**
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
