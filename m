Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7D044814D
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Nov 2021 15:20:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF3BDC5E2D7;
	Mon,  8 Nov 2021 14:20:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E8D3C5E2CF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Nov 2021 14:19:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A8DUutN020855;
 Mon, 8 Nov 2021 15:19:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=VrqQgMNp9tr1pZ19tutyrQIrn+tFXxy8VdIf9oyA8xc=;
 b=PquK9IDc/ItsCmE3lRv70ZKCT5cZWQ3zkzyKzXN7aiKm6IrXbrM1Jj289JqODurrRxoy
 +6NAp4R7i4vSIxcAc7djGokmLVgLCQhjTfo2/SSBWxp1EL+qYK0mS+J/pfhJteUcZ1ZZ
 2Q1fGzG2IdBtZAX0aMkT1oxNld0l5LN1kDYSYvbrtiBlhBf35t74IXj35n207wpsp0za
 V9Ta6ZsTd8KUgpw0hgCqQdqa3W/25MUbc6O+PKOpGY5lpUFKJNykUOQx08e9hidpgLUA
 zdl5x4skiemZJXZ4icgvfs41qtQfz/G9EHeppX2zUritLf0KSNmKF8jmrkykDnf+WAs7 KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c74uk8b9j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 15:19:45 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2671B100034;
 Mon,  8 Nov 2021 15:19:45 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 202B121BF6B;
 Mon,  8 Nov 2021 15:19:45 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 8 Nov 2021 15:19:44
 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 8 Nov 2021 15:19:29 +0100
Message-ID: <20211108141937.13016-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
References: <20211108141937.13016-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
Cc: julien.massot@iot.bzh, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 04/12] ARM: configs: Configs that had
	RPMSG_CHAR now gets RPMSG_CTRL
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

In the patch "rpmsg: Move the rpmsg control device from rpmsg_char
to rpmsg_ctrl", we split the rpmsg_char driver in two.
By default give everyone who had the old driver enabled the rpmsg_ctrl
driver too.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 26353cbfa968..58b69e6c618f 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -241,6 +241,7 @@ CONFIG_QCOM_Q6V5_PAS=y
 CONFIG_QCOM_Q6V5_PIL=y
 CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
+CONFIG_RPMSG_CTRL=y
 CONFIG_RPMSG_QCOM_GLINK_SMEM=y
 CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_COMMAND_DB=y
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
