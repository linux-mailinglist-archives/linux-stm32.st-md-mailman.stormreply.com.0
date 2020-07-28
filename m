Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1621B230318
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jul 2020 08:38:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A85FCC36B2B;
	Tue, 28 Jul 2020 06:38:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3729C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 06:38:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S6R63F020671; Tue, 28 Jul 2020 08:38:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=WDXIytTCyT7kRrNyoWH+p3ffKvT3zxR0417p2t+OjUA=;
 b=GAqzi9pjNwv7+TjE7xEXQKl/RrDJQPjcu8dojxSO1WXzn55Y7Q4C7hYoob2vIUgL63RE
 dojYHNC7YKASt7huOnbb5UnMXXH0SDf3Px7QBibj+tjlws+fDMQiVyR4fjLEcvPvxvsX
 YOFCX5yTc7K57jDHZMlsu5EkNU4P09kfBjgUBcklBdokaYs28tjuKtClPdVdEbz6PKTn
 YLSvOAdhPFpQO9E/RNmo3nf2bLxg+CDaSm4TeQ4kBD+RggCRoy8mUJq81iaUeyBh8FtL
 2ldLKwXhMySI27h/hKQO2/vhN2qOV1k7zgUT1nRatQEHAjMgsWTUrG6Bo20uLlQgHxz3 lQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32g9v9cu7k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 08:38:34 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9B41B10002A;
 Tue, 28 Jul 2020 08:38:33 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8BD73210F99;
 Tue, 28 Jul 2020 08:38:33 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jul 2020 08:38:33
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <hugues.fruchet@st.com>, <mchehab@kernel.org>
Date: Tue, 28 Jul 2020 08:37:58 +0200
Message-ID: <1595918278-9724-3-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: linux-kernel@vger.kernel.org, yannick.fertre@st.com, alain.volmat@st.com,
 hans.verkuil@cisco.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] media: stm32-dcmi: fix probe error path &
	module remove
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

This commit add missing vb2_queue_release calls with the
probe error path and module remove.
Missing v4l2_async_notifier_unregister is also added within
the probe error path

Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index 5e60d4c6eeeb..57830ee691be 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -2004,7 +2004,7 @@ static int dcmi_probe(struct platform_device *pdev)
 
 	ret = dcmi_graph_init(dcmi);
 	if (ret < 0)
-		goto err_media_entity_cleanup;
+		goto err_vb2_queue_release;
 
 	/* Reset device */
 	ret = reset_control_assert(dcmi->rstc);
@@ -2030,7 +2030,10 @@ static int dcmi_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup:
+	v4l2_async_notifier_unregister(&dcmi->notifier);
 	v4l2_async_notifier_cleanup(&dcmi->notifier);
+err_vb2_queue_release:
+	vb2_queue_release(q);
 err_media_entity_cleanup:
 	media_entity_cleanup(&dcmi->vdev->entity);
 err_device_release:
@@ -2052,6 +2055,7 @@ static int dcmi_remove(struct platform_device *pdev)
 
 	v4l2_async_notifier_unregister(&dcmi->notifier);
 	v4l2_async_notifier_cleanup(&dcmi->notifier);
+	vb2_queue_release(&dcmi->queue);
 	media_entity_cleanup(&dcmi->vdev->entity);
 	v4l2_device_unregister(&dcmi->v4l2_dev);
 	media_device_cleanup(&dcmi->mdev);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
