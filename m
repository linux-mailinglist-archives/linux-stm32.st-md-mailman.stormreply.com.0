Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA36012F9
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 17:50:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D808C65042;
	Mon, 17 Oct 2022 15:50:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F219EC65040
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 15:50:48 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29HF6Z4J017497;
 Mon, 17 Oct 2022 17:50:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=1dhJBOe2QEKMxFJRVTYoEK+8j5HO9AbVW9D0uLmIH90=;
 b=Mlrhgpb2d2m+9U0VpV1rf9gzsREe9S2m8yogPEOIdjfHF1n5R/DHvUli+tITMa7e459x
 WBofqSpU+COm8KI2Ui9b1HKKdg/3UjxAvC6EAYWDE1/uxsBgePEp++Sj3QSlIw0tt/X7
 N3uVQoOgLBhUQ+EPaYK6B7vUZ1kKiRGXZZAG2uxBkI1NWsllreAgc+rdT0dOOtHw+jBm
 pEwbb7Kl+UUv/fr2FucBOw0wFF4AK59qKEbL49aZ0KKbsJzPlLadkVcjPRkWTZAGMWfT
 +ah/2Ii+Mwm6Gj1yxPlTcjFbnO3FIGaggMH1Vyq3mCVMqFS0n1F9kDP0t74wGTak0ZIz 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k7j0cxabx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 17:50:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5EA78100039;
 Mon, 17 Oct 2022 17:50:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A36423C6A0;
 Mon, 17 Oct 2022 17:50:42 +0200 (CEST)
Received: from localhost (10.75.127.123) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 17 Oct
 2022 17:50:39 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 17 Oct 2022 17:49:57 +0200
Message-ID: <20221017174953.v2.3.Iaff264d5b87f54b7c5fe3a408b4d1662d1fdfd2a@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017154957.277120-1-patrick.delaunay@foss.st.com>
References: <20221017154957.277120-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_13,2022-10-17_02,2022-06-22_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 3/3] nvmem: stm32: add nvmem type attribute
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

Inform NVMEM framework of type attribute for stm32-romem as NVMEM_TYPE_OTP
so userspace is able to know how the data is stored in BSEC.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

(no changes since v1)

 drivers/nvmem/stm32-romem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
index bb8aa72ba2f9..6de565639d5f 100644
--- a/drivers/nvmem/stm32-romem.c
+++ b/drivers/nvmem/stm32-romem.c
@@ -160,6 +160,7 @@ static int stm32_romem_probe(struct platform_device *pdev)
 	priv->cfg.dev = dev;
 	priv->cfg.priv = priv;
 	priv->cfg.owner = THIS_MODULE;
+	priv->cfg.type = NVMEM_TYPE_OTP;
 
 	priv->lower = 0;
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
