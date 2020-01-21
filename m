Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95688143ACE
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2020 11:22:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D6ADC36B0C;
	Tue, 21 Jan 2020 10:22:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52948C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 10:22:44 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LAI5KJ023923; Tue, 21 Jan 2020 11:22:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=B3TTFS6TV+4qGCCLZoDEuyQWL8QSogcND8mYP28OXXo=;
 b=iz8vTKO+yoxfwOZAs+1AMYyzsilnTsGUYNvdN2QWDxGqyG1ept7I8vIbbRFZ8D7hm6jh
 8YNirqrauCV5gR5JF+iTPIYpKeSCCjbe5Q7Ujl5PAlLop7CFm7z8zuiEXmCAXVFQNl/v
 Qd2gbJSgDLNcG6t48c/dmQukDDSSZygZn5RwEYl9xW813lyHc52TB0WXi2AoH0KOfYux
 ZxuffcTYVIRLWEqGvPa1cacCBJl0yHRD7zF58mvqZ+GyhS6JTdDv8JDCsifb+sSnb7aJ
 SdrHXG4tcll79g6wtuHuMbU2EeVDFJOd2sFTraofZL+ChO2hpxG2ca7+okhHGqv12+Bc 4w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkrp26338-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jan 2020 11:22:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BC6D10002A;
 Tue, 21 Jan 2020 11:22:36 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2B6102B187E;
 Tue, 21 Jan 2020 11:22:36 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 21 Jan 2020 11:22:35 +0100
From: Yannick Fertre <yannick.fertre@st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 Yannick Fertre <yannick.fertre@st.com>, Etienne Carriere
 <etienne.carriere@st.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Philippe Cornu <philippe.cornu@st.com>
Date: Tue, 21 Jan 2020 11:22:32 +0100
Message-ID: <1579602152-7432-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-21,
 2020-01-21 signatures=0
Subject: [Linux-stm32] [PATCH] media: platform: stm32: defer probe for
	auxiliary clock
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

From: Etienne Carriere <etienne.carriere@st.com>

Change stm32-cec driver to defer probe when auxiliary clock
"hdmi-cec" is registered in the system not has not been probed yet.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
---
 drivers/media/platform/stm32/stm32-cec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/stm32/stm32-cec.c b/drivers/media/platform/stm32/stm32-cec.c
index 8a86b2c..543c9ec 100644
--- a/drivers/media/platform/stm32/stm32-cec.c
+++ b/drivers/media/platform/stm32/stm32-cec.c
@@ -302,10 +302,14 @@ static int stm32_cec_probe(struct platform_device *pdev)
 	}
 
 	cec->clk_hdmi_cec = devm_clk_get(&pdev->dev, "hdmi-cec");
+	if (IS_ERR(cec->clk_hdmi_cec) &&
+	    PTR_ERR(cec->clk_hdmi_cec) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
 	if (!IS_ERR(cec->clk_hdmi_cec)) {
 		ret = clk_prepare(cec->clk_hdmi_cec);
 		if (ret) {
-			dev_err(&pdev->dev, "Unable to prepare hdmi-cec clock\n");
+			dev_err(&pdev->dev, "Can't prepare hdmi-cec clock\n");
 			return ret;
 		}
 	}
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
