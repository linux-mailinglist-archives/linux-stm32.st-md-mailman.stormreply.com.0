Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE42B49A2
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Nov 2020 16:42:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0366CC3FAD6;
	Mon, 16 Nov 2020 15:42:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03129C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Nov 2020 15:42:06 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AGFXOLI030034; Mon, 16 Nov 2020 16:42:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=n4Z6cOmuyWZ3+2oiSgb/gZnSp5m1Rsk8w+tHlYHMIRQ=;
 b=J81fDplMLAklcuf251YD0CY27i4Gl84JgtlMdsk4V6YE5+hvTNUwIzJLyx2XxVC89OvW
 F2wnkFZiw03QEybVDoptibop9geTpSaNKigY3T9E+zSPmFThaRgFdG/sfgrTnZMhgTcs
 701JaX2B2RT5EDHZLA+eOqQlhlKL+T41KjftMKcuLTknsdJeHSn6EcW2/EFkMy8HdVJI
 k9LdbK7DDeXd/X8Fmfc4UVY/WfHvzPHb0TAgUcsjk6IeQRqcGMetb+dYbU2YNBkJhucl
 k49qjmRNGE4PRn0Z85MQheHE03TpLVezJqf82sa1HVmv8JZiaLVY3+r6xvJabOFsOsJH mQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5k4uqg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 16:42:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 372B710002A;
 Mon, 16 Nov 2020 16:42:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29461264DCD;
 Mon, 16 Nov 2020 16:42:00 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 16 Nov 2020 16:41:59
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Lee Jones <lee.jones@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Mon, 16 Nov 2020 16:41:59 +0100
Message-ID: <20201116154159.4342-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_08:2020-11-13,
 2020-11-16 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/1] mfd: stmfx: remove .of_compatible from
	stmfx_cells for idd and ts
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

idd and ts features are not described in stmfx bindings. Remove the
.of_compatible field from relative mfd_cells to avoid having to add
corresponding disabled node in device trees using stmfx:
		stmfx_idd: idd {
			status = "disabled";
		};
		stmfx_ts: stmfx_ts {
			status = "disabled";
		};
Then, the warning "Failed to locate of_node [id: -1]" wont appear anymore.
.of_compatible could be added as soon as idd or ts bindings are described
and drivers available.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 drivers/mfd/stmfx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 988e2ba6dd0f..39b2fc952b7d 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -81,13 +81,11 @@ static struct mfd_cell stmfx_cells[] = {
 		.num_resources = ARRAY_SIZE(stmfx_pinctrl_resources),
 	},
 	{
-		.of_compatible = "st,stmfx-0300-idd",
 		.name = "stmfx-idd",
 		.resources = stmfx_idd_resources,
 		.num_resources = ARRAY_SIZE(stmfx_idd_resources),
 	},
 	{
-		.of_compatible = "st,stmfx-0300-ts",
 		.name = "stmfx-ts",
 		.resources = stmfx_ts_resources,
 		.num_resources = ARRAY_SIZE(stmfx_ts_resources),
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
