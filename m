Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5717B560B
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 17:10:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AF0C1C6B473;
	Mon,  2 Oct 2023 15:10:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59EAEC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 15:10:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-406609df1a6so27711235e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696259439; x=1696864239;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0xSoAm+ROAl+uYnsbqkuF+kzUuWhCjT5vlITwi8Kq2Y=;
 b=COSRXc9DxtdLPxaaMZxtgKpOh81V/YPnUqBUY+4kJ10xdkXOwcDaI00hljS3zSY16l
 59tEKYtTwAsZOO+CFgEhz61TNbq2P/t4MCxNyeIEQNOYdGSQPyBYM7BaB4YaNDsnWGau
 cTkE4IQTLh0eY5BnkdyjSlLZ2p2JjzUcMewfScy01cF9vs58Aty1KZaSFFS7x/L49oUx
 BiFpvmhUDb1870Mh2y7QHakUzTJOX/5Jl0r2NzUoasUnGERE0rSj6QowRSztCxgFTWXw
 6LWtHv5vKP3TcmUszaX/dOhnD9aOqtjoeCX7vt0rX8rTZNzpBaA10MtsU3L2QTRPQ7Sn
 CYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696259439; x=1696864239;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0xSoAm+ROAl+uYnsbqkuF+kzUuWhCjT5vlITwi8Kq2Y=;
 b=CbrY3EvZGmxVW8UmKzlJ4yFWCr9XVnvW11FSR4pP1/INfNITk1I3BR30GLHmkOMatV
 /caBL1Oms+xGBP3xPQR09gdzCuO7NNL3ovg74lRNcH6ybk95vlxXIu44U8f50hh8+4lN
 FZLLTyp3+9dybUlURpIT0nYhnymwfVIvyBZ+4DUBPJZyajaJA9TjEzvx5UGhrWdYMUBn
 GYjj06kMNj5hQ0lF543AlaYTb59WYMm5DM74nJSZqueY1Tbi0XYvRlwTfSI79voyy5PG
 xOrwoJYv4cjv9Ue73584zOjwlGNfF4qixFgalDnbQFCUMFr95d7sHCzE72KVDL+R8ljL
 S5Qw==
X-Gm-Message-State: AOJu0YzZckjIGmYefudveSMiZiZh0GWdxdtOufFiHGjX4Cbpq9V/IcpC
 BxNd6/JfPAtT8Z89pdqNWb4=
X-Google-Smtp-Source: AGHT+IEEZGlFjpx8lLo9tvllSBQ9uSdgJbt7Jo8+TnnbkK3MrDUsxRAVP26IXHgFIeF3CU+ec1ay4w==
X-Received: by 2002:a05:600c:5007:b0:405:315f:e676 with SMTP id
 n7-20020a05600c500700b00405315fe676mr10563085wmr.3.1696259438602; 
 Mon, 02 Oct 2023 08:10:38 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 t15-20020a1c770f000000b00406408dc788sm7421565wmi.44.2023.10.02.08.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 08:10:37 -0700 (PDT)
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
Date: Mon,  2 Oct 2023 17:10:21 +0200
Message-Id: <20231002151023.4054-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231002151023.4054-1-ansuelsmth@gmail.com>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Subject: [Linux-stm32] [net-next PATCH 2/4] netdev: make napi_schedule
	return bool on NAPI successful schedule
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

Change napi_schedule to return a bool on NAPI successful schedule. This
might be useful for some driver to do additional step after a NAPI ahs
been scheduled.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
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
