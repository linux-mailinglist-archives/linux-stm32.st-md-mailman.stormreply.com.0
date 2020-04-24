Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B04891B7352
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 13:41:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66DC9C36B11;
	Fri, 24 Apr 2020 11:41:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59027C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 11:41:19 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OBWi4b029084; Fri, 24 Apr 2020 13:41:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=f15cWn5l7+qnePYQkKeXeKN4S4ucsruNAsfQ5NRJgnw=;
 b=J6iWt8Pyv/o+0QkN41DpefKdKHfaEICctClHv4A7K0E1jeD3OY6t7KuiCpqPXdQpHKTi
 kB0LtSxI4ZUBJ5mp1FJVcglFZRtbGFMtdCh5Y0vt7Iwu9T3izsZk13yUvjktYwSts4pv
 XZeXC4swut3fqjqkxE5Q60GIehyGJL2+w2X8qMehw0qFohRGhre+MShqtH+PdttmypEi
 mT8PQdxMWTslx4Vto/iXhx7ipAWXrHhuzsssoyCT4uWQGrpsvsm6611No7o7FJMDsQtj
 YNztTP2MAe+5pm166gIncvD4tcKAohbXc269wwqTOGLHn0yb2x6Ut6ZSGKijqc7vGDE9 0g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30freh30hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 13:41:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75E6210002A;
 Fri, 24 Apr 2020 13:41:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67D662B3DA0;
 Fri, 24 Apr 2020 13:41:05 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Apr 2020 13:41:04
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <rjw@rjwysocki.net>, <viresh.kumar@linaro.org>, <hugues.fruchet@st.com>,
 <mchehab@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <pavel@ucw.cz>, <len.brown@intel.com>
Date: Fri, 24 Apr 2020 13:40:58 +0200
Message-ID: <20200424114058.21199-4-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20200424114058.21199-1-benjamin.gaignard@st.com>
References: <20200424114058.21199-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_04:2020-04-23,
 2020-04-24 signatures=0
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [RFC 3/3] media: stm32-dcmi: Inform cpufreq governors
	about cpu load needs
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

When start streaming the CPU load could remain very low because almost
all the capture pipeline is done in hardware (i.e. without using the CPU)
and let believe to cpufreq governor that it could use lower frequencies.
If the governor decides to use a too low frequency that becomes a problem
when we need to acknowledge the interrupt during the blanking time.

To avoid this problem, DCMI driver informs the cpufreq governors by adding
a cpufreq minimum load QoS resquest.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 drivers/media/platform/stm32/stm32-dcmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
index b8931490b83b..774f2506b2f1 100644
--- a/drivers/media/platform/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/stm32/stm32-dcmi.c
@@ -24,6 +24,7 @@
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/pm_qos.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/videodev2.h>
@@ -173,6 +174,8 @@ struct stm32_dcmi {
 	struct media_device		mdev;
 	struct media_pad		vid_cap_pad;
 	struct media_pipeline		pipeline;
+
+	struct pm_qos_request		qos_request;
 };
 
 static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
@@ -827,6 +830,9 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	else
 		reg_set(dcmi->regs, DCMI_IER, IT_OVR | IT_ERR);
 
+	cpufreq_minload_qos_add_request(&dcmi->qos_request,
+					CPUFREQ_GOV_QOS_MIN_LOAD_MAX_VALUE);
+
 	return 0;
 
 err_pipeline_stop:
@@ -859,6 +865,8 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
 	struct dcmi_buf *buf, *node;
 
+	cpufreq_minload_qos_remove_request(&dcmi->qos_request);
+
 	dcmi_pipeline_stop(dcmi);
 
 	media_pipeline_stop(&dcmi->vdev->entity);
-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
