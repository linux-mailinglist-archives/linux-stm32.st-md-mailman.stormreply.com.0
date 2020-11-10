Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E562AD397
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Nov 2020 11:23:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A58D7C3089F;
	Tue, 10 Nov 2020 10:23:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDF42C36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Nov 2020 10:23:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AAAGjkk020555; Tue, 10 Nov 2020 11:23:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=SAM8FttZW2H48y7jY4eJofzOj8s3m04uqqIn5J4eMFo=;
 b=bWl3YNSQmNUYdsaO78M2VW3QAyxcV3260FNvtX7gm72OOOyqmDfXVcqQlae6bI6/tIdO
 ds3Mqcu3Ck9WhNClwD03g+5p4Ld0ybpSqbwyCUOq9svLzd8B+JsBccCWkiD/wgL9iw5M
 EhRRuAcVgroB6KjRC5aosbRs1tdGECyuFrYqViDD0Ja4rY9QOTrPz5aHqj3njU8wu3Wb
 Gy8Nu/moTGQxYJt6d5wLKM7L7BTMX8bG2vAT9qMaJM+tWj/G2Gofiv3w66UZXbAcbXiH
 ivhhWn8wocXLJ/V935DtdsP96O2+lA1u87YwqD9ArE+Rt+hpJlnAN1v62MYUhW54ZaKg 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nkbmygsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Nov 2020 11:23:14 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0346100034;
 Tue, 10 Nov 2020 11:23:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B06E823EDB0;
 Tue, 10 Nov 2020 11:23:13 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 10 Nov 2020 11:23:13
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Etienne Carriere <etienne.carriere@st.com>
Date: Tue, 10 Nov 2020 11:23:05 +0100
Message-ID: <20201110102305.27205-2-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201110102305.27205-1-amelie.delaunay@st.com>
References: <20201110102305.27205-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-10_04:2020-11-05,
 2020-11-10 signatures=0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] phy: stm32: defer probe for reset
	controller
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

Change stm32-usbphyc driver to defer its probe when the expected reset
control has its probe operation deferred.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/phy/st/phy-stm32-usbphyc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/phy/st/phy-stm32-usbphyc.c b/drivers/phy/st/phy-stm32-usbphyc.c
index fe3085eec201..f3f582a3ccdb 100644
--- a/drivers/phy/st/phy-stm32-usbphyc.c
+++ b/drivers/phy/st/phy-stm32-usbphyc.c
@@ -342,6 +342,10 @@ static int stm32_usbphyc_probe(struct platform_device *pdev)
 		reset_control_assert(usbphyc->rst);
 		udelay(2);
 		reset_control_deassert(usbphyc->rst);
+	} else {
+		ret = PTR_ERR(usbphyc->rst);
+		if (ret == -EPROBE_DEFER)
+			goto clk_disable;
 	}
 
 	usbphyc->switch_setup = -EINVAL;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
