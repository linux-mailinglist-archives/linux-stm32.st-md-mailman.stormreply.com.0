Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E971F9C877E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2024 11:27:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 978D3C78F9E;
	Thu, 14 Nov 2024 10:27:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9449C78F9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2024 10:27:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE5jwNC016652;
 Thu, 14 Nov 2024 11:27:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=7MbnE8ms6zYSIbpQhA3TMj
 1iM72Lewm6wm7M7VcisaY=; b=ZJukTb2OEWCMoCvRWZwh75QtRm1O0SCRqkwOzW
 9wFlBALJ3Zx4vYu+qf+vAh80ujPAak9qvnEr/4MmKVYQbrWrhkktFCPX7rdkQI9i
 ZQaXem7W53Gu4TWHS1J5feYoCYetyvKo0BZRiEbDPO74ax20dW1Fz1FE3vq1rhFP
 8Hd4YYSCAJgj+BqoA6oCAN6Gf6gRsf7HcSBg73JEJpY5WD1s6ruz+396KIWjIzzg
 meWbxokrGYOYZBDyOkSpc24hW3tKi95HEqk2iIM9eK50x0wiDSqfgtbACbbFcyva
 P8pyjR1pDxsIlXOduJG7szNapmeqpn2FyyF8/z9M3GKMdCAw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42syggxh32-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Nov 2024 11:27:06 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D9E5A4002D;
 Thu, 14 Nov 2024 11:26:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60E1F23F998;
 Thu, 14 Nov 2024 11:25:16 +0100 (CET)
Received: from localhost (10.252.20.241) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 14 Nov
 2024 11:25:16 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>
Date: Thu, 14 Nov 2024 11:24:59 +0100
Message-ID: <20241114102459.2497178-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.20.241]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [Linux-stm32] [PATCH] iio: adc: stm32-dfsdm: handle label as an
	optional property
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

The label property is defined as optional in the DFSDM binding.
Parse the label property only when it is defined in the device tree.

Fixes: 3208fa0cd919 ("iio: adc: stm32-dfsdm: adopt generic channels bindings")
Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 drivers/iio/adc/stm32-dfsdm-adc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 2037f73426d4..e304e3714020 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -691,11 +691,14 @@ static int stm32_dfsdm_generic_channel_parse_of(struct stm32_dfsdm *dfsdm,
 		return -EINVAL;
 	}
 
-	ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
-	if (ret < 0) {
-		dev_err(&indio_dev->dev,
-			" Error parsing 'label' for idx %d\n", ch->channel);
-		return ret;
+	if (fwnode_property_present(node, "label")) {
+		/* label is optional */
+		ret = fwnode_property_read_string(node, "label", &ch->datasheet_name);
+		if (ret < 0) {
+			dev_err(&indio_dev->dev,
+				" Error parsing 'label' for idx %d\n", ch->channel);
+			return ret;
+		}
 	}
 
 	df_ch =  &dfsdm->ch_list[ch->channel];
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
