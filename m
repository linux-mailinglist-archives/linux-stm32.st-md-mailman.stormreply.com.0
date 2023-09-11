Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0959179A7D0
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Sep 2023 14:04:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C5AA2C6B470;
	Mon, 11 Sep 2023 12:04:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54D9FC6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Sep 2023 12:04:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38B9Sw8U029064; Mon, 11 Sep 2023 14:04:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=Qy502fS11BZGcGDP1IGPY0i0y+SNnsTHJY1/5zxvtm0=; b=2y
 Lw0QWAUlUyYsG7CJg7AgjewY0S63AgTuDoPvJ4t0mXTqzK+oTOhNe3YxNT3tp5tp
 jnkTQjx6vh5GkNhMu5ZAdDpitwCF8xkhwRaM19YiTEFnz//Yq+eNqpiXSgO6Clvt
 VvMlRHLDIrp5WyRp5Hb0K4ylFVLdy2HFhhmZFsmnSLVnqSLeWbuZ/nU+5IbGrJrB
 5aYwk01OdNk02dbeEys6hKj+SqqyY8TcxJg1pB73KS5s3QF4svWQuW1zouE4SFDL
 9DaVRGQEZ0LTeVRSozQwqnZwtOhugmGljkRacX7nj2Ryntee/De67b6IwkvZnw3D
 jFJbc7uZFV+gPAr7SJMQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t0e4fr6mm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Sep 2023 14:04:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7DD2310005A;
 Mon, 11 Sep 2023 14:04:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 716DA252259;
 Mon, 11 Sep 2023 14:04:34 +0200 (CEST)
Received: from localhost (10.201.20.32) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 14:04:34 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 11 Sep 2023 14:02:01 +0200
Message-ID: <20230911120203.774632-9-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
References: <20230911120203.774632-1-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 08/10] hwrng: stm32 - support RNG
	configuration locking mechanism
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

If "st,rng-lock-conf" DT binding property is set for a stm32-rng node,
the RNG configuration will be locked until next hardware block reset
or platform reset.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/char/hw_random/stm32-rng.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
index 819f062f454d..4a602d666dad 100644
--- a/drivers/char/hw_random/stm32-rng.c
+++ b/drivers/char/hw_random/stm32-rng.c
@@ -62,6 +62,7 @@ struct stm32_rng_private {
 	struct reset_control *rst;
 	const struct stm32_rng_data *data;
 	bool ced;
+	bool lock_conf;
 };
 
 /*
@@ -301,6 +302,9 @@ static int stm32_rng_init(struct hwrng *rng)
 
 		reg &= ~RNG_CR_CONDRST;
 		reg |= RNG_CR_RNGEN;
+		if (priv->lock_conf)
+			reg |= RNG_CR_CONFLOCK;
+
 		writel_relaxed(reg, priv->base + RNG_CR);
 
 		err = readl_relaxed_poll_timeout_atomic(priv->base + RNG_CR, reg,
@@ -439,6 +443,7 @@ static int stm32_rng_probe(struct platform_device *ofdev)
 	}
 
 	priv->ced = of_property_read_bool(np, "clock-error-detect");
+	priv->lock_conf = of_property_read_bool(np, "st,rng-lock-conf");
 
 	priv->data = of_device_get_match_data(dev);
 	if (!priv->data)
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
