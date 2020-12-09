Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D966F2D433E
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Dec 2020 14:31:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A06AC3FADB;
	Wed,  9 Dec 2020 13:31:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32F86C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Dec 2020 13:12:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B9DCjRj017959; Wed, 9 Dec 2020 14:12:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=IUHYaDEHX5PRFXMrkNQFuDTaW9nQZoDiyeva8tf60p0=;
 b=a+7fp0kzi4CsyKB5KpFWZdze8v6o7aP3063Qommg9cJj857rUbpHDT/nAcKrDQlhGPl7
 aGbdFCptyg7VZOPNjlf8MFQ7ya7aXoMqbtwCcsb3qbX1g7wtNQTRJm4tzafqQcqxGAtx
 T0V4E4sGuY6u4+YwvievdR7KJkUIVMyepvBRNXyZtz9LtzteFMVNNAsEXMkHkzZaiXLP
 ZLGt65K/MNa5qGlISrIsigk/Gt7wO1MZTjQ2NctuO6WJ6sF3Bua3S59+d2vxNEYZTe90
 XGlQKIj+g+JNuxtR68UEdBdtP0DNwPWMRTxphVHI6IWfKc4Y/hHR7F/WQR/F7OXJ8dg4 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35agwfmts7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 14:12:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 137BE100034;
 Wed,  9 Dec 2020 14:12:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02D4A255E63;
 Wed,  9 Dec 2020 14:12:45 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 9 Dec 2020 14:12:44
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 9 Dec 2020 14:12:14 +0100
Message-ID: <20201209131214.2382-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_11:2020-12-09,
 2020-12-09 signatures=0
X-Mailman-Approved-At: Wed, 09 Dec 2020 13:31:00 +0000
Cc: Etienne Carriere <etienne.carriere@st.com>, arnaud.pouliquen@foss.st.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: don't print an error on
	probe deferral
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

Change stm32 remoteproc driver to not generate an error message
when device probe operation is deferred for the reset controller.

Signed-off-by: Etienne Carriere <etienne.carriere@st.com>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/stm32_rproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a180aeae9675..25c916782991 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -614,7 +614,9 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
 
 	ddata->rst = devm_reset_control_get_by_index(dev, 0);
 	if (IS_ERR(ddata->rst)) {
-		dev_err(dev, "failed to get mcu reset\n");
+		if (PTR_ERR(ddata->rst) != -EPROBE_DEFER)
+			dev_err(dev, "failed to get mcu reset\n");
+
 		return PTR_ERR(ddata->rst);
 	}
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
