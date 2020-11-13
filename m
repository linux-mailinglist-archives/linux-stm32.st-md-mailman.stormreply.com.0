Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD12B1B20
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Nov 2020 13:27:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1E9FC56611;
	Fri, 13 Nov 2020 12:27:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89A1FC0692F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Nov 2020 12:27:35 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0ADCDGU4023151; Fri, 13 Nov 2020 13:27:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=HdXPcM6waAIGKpwJ/di7i2L0+52iFpv+3+uBIYa3/BI=;
 b=ikXe53F+o0lZqf9vVnN03So8MbK/Oo3x4YyRQ+C2KA0O8U3YyZFYOkICw/Vxh/P1l+mD
 v1YfDrwDKNLZkBqpnyDKVcy7gskrNVKSPvulSEBy2ECCzFexJYN16wJA7+ysg9ZDAAe+
 UM+p4oCMjLUAjxgwH+FhsIXCAZpX9i1gzeBChKwDSjEqI5GZoOdFDxGOeo1+zZM+bXj4
 CzKyHqRs2UsEjHKplSnRD2HPwY+Pgbu3w5yBjpyW9s9xtDaDrkgtnQsaPkQI6rtfTeg/
 5ZvDPXL66EhwIddoJhMPqEJvXsDrAexWlqe7i/F/m2W8NbRPTD4Nkf9tcH7j1JJDzlkK pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34nhx5k998-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Nov 2020 13:27:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7719B10002A;
 Fri, 13 Nov 2020 13:27:27 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67C2B254665;
 Fri, 13 Nov 2020 13:27:27 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 13 Nov 2020 13:27:26
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Lee Jones <lee.jones@linaro.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>
Date: Fri, 13 Nov 2020 13:27:25 +0100
Message-ID: <20201113122725.12971-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-13_10:2020-11-13,
 2020-11-13 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 1/1] mfd: stmfx: fix dev_err_probe call in
	stmfx_chip_init
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

ret may be 0 so, dev_err_probe should be called only when ret is an error
code.

Fixes: 41c9c06c491a ("mfd: stmfx: Simplify with dev_err_probe()")
Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
v2: address Lee's comment about error handling area
---
 drivers/mfd/stmfx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index 5e680bfdf5c9..988e2ba6dd0f 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -329,11 +329,11 @@ static int stmfx_chip_init(struct i2c_client *client)
 
 	stmfx->vdd = devm_regulator_get_optional(&client->dev, "vdd");
 	ret = PTR_ERR_OR_ZERO(stmfx->vdd);
-	if (ret == -ENODEV) {
-		stmfx->vdd = NULL;
-	} else {
-		return dev_err_probe(&client->dev, ret,
-				     "Failed to get VDD regulator\n");
+	if (ret) {
+		if (ret == -ENODEV)
+			stmfx->vdd = NULL;
+		else
+			return dev_err_probe(&client->dev, ret, "Failed to get VDD regulator\n");
 	}
 
 	if (stmfx->vdd) {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
