Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E37C622C547
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 14:38:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93782C36B2E;
	Fri, 24 Jul 2020 12:38:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABC8C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 12:38:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OCbmn3030431; Fri, 24 Jul 2020 14:37:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hITZ0rNuNZdzv6aASsIGDY5KNIH8glBNT6+akNE1P8o=;
 b=oPV/csVAuyyFnhgTBy6hXaSEMDDcsjG3J5J3FWwkSMQ316F3cyZPhevOdYH+HLLFK6y0
 n3sQduS5LwI/ci0i80Fp8CtIJcgSqFHoZKt/fJhwreb0cyykZLfgM9FB7buZez0iytMA
 i7LCx1IxH8lBPQ+sNl0chC4OPfyPalub3/mirgtBx0Vt3+7VdLRWIKw62OOlNNXdRgNd
 mo6kaEf9FItLM6xsT9n5myJPMWlFkVnbAvrctuez43fccfOw1htF12QjbDNdI4jT6xnZ
 nTTVVQy40neJ+kd5MXSUc74O4C0quVdZAX8z2PY/7dzaHj9179tFpbNL659aeIBj26rl 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bsahgcgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 14:37:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 98A0910002A;
 Fri, 24 Jul 2020 14:37:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8ADD82AF334;
 Fri, 24 Jul 2020 14:37:55 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jul 2020 14:37:55
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Fri, 24 Jul 2020 14:37:48 +0200
Message-ID: <20200724123748.25369-5-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724123748.25369-1-amelie.delaunay@st.com>
References: <20200724123748.25369-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_04:2020-07-24,
 2020-07-24 signatures=0
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/4] usb: dwc2: fix error path with missing
	dwc2_drd_exit
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

In case of failure, role switch has to be unregistered. It is done by
dwc2_drd_exit.

Fixes: bc0f0d4a5853 ("usb: dwc2: override PHY input signals with usb role switch support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/usb/dwc2/platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index 68b56b43a45e..f4a0371c3e89 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -600,6 +600,8 @@ static int dwc2_driver_probe(struct platform_device *dev)
 	return 0;
 
 error_init:
+	dwc2_drd_exit(hsotg);
+
 	if (hsotg->params.activate_stm_id_vb_detection)
 		regulator_disable(hsotg->usb33d);
 error:
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
