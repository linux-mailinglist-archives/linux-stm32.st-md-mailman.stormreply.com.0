Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 082FF8B1C28
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Apr 2024 09:49:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC198C7128B;
	Thu, 25 Apr 2024 07:49:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75F92C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Apr 2024 07:49:33 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P7j7Oa021437;
 Thu, 25 Apr 2024 09:49:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=9YeaHLmicVOdp2NeKB/6HJ2XK6JQdpKzOtj7T+m86tc=; b=OR
 NWl1Z046LC+8xqoipeUuw+iE+XQdOCihVMxjQ/eKdsXX3Muv2PvkqllFNeRuLQQy
 RX7/GuF10B/iGhxX+oagQWl6PdZDpyWJKUAg1Db274UL4Zz0Fhk/sKnbc+lH6gvh
 CFEmO+2nnCkd6qVq/tRzNe0XGhtSKtN3Q8316hAFL7SBnHFXT1NNVByBG3nYDZcR
 IePZWE6D/7lkJDFsuTUXGq74t+6gG5jL7Dxt1NMljwze549+dm2x+RCtB7L/BY23
 ShCQOusLavsyCA4nYVgSlo46KWfHJffk1WYFdLmfIoz9gM08NHFt+olhUClgzICE
 jf+NpbgHCUb4PWNQDxdA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm51wcpdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Apr 2024 09:49:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 853F640044;
 Thu, 25 Apr 2024 09:49:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 20777212FDC;
 Thu, 25 Apr 2024 09:48:54 +0200 (CEST)
Received: from localhost (10.48.86.112) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 09:48:53 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>
Date: Thu, 25 Apr 2024 09:48:33 +0200
Message-ID: <20240425094829.2.I04ec53442753147c35efad1307b6ec133f53b471@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
References: <20240425074835.760134-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_06,2024-04-25_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/3] regulator: stm32-pwr: add support of
	correct compatible
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

Remove the unexpected comma in the compatible "st,stm32mp1,pwr-reg",
and support the new compatible "st,stm32mp1-pwr-reg".
The old compatible is keept for compatibility with old device trees.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/regulator/stm32-pwr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/stm32-pwr.c b/drivers/regulator/stm32-pwr.c
index 85b0102fb9b1..f6a761167726 100644
--- a/drivers/regulator/stm32-pwr.c
+++ b/drivers/regulator/stm32-pwr.c
@@ -165,6 +165,7 @@ static int stm32_pwr_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id __maybe_unused stm32_pwr_of_match[] = {
+	{ .compatible = "st,stm32mp1-pwr-reg", },
 	{ .compatible = "st,stm32mp1,pwr-reg", },
 	{},
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
