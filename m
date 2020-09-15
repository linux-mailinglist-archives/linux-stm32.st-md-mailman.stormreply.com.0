Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B9E26A1BF
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Sep 2020 11:11:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31FA4C3FADF;
	Tue, 15 Sep 2020 09:11:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EC1FC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 09:11:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08F98H9f022258; Tue, 15 Sep 2020 11:11:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=a2n/VyvPL5cAo3F9MDe6vyiMgotrwIrVTK+SWyJLDSw=;
 b=KVJs7BeeDzxet4I8mZSqnmowPgBQk6tXj46ILQIpe4DZ8lC++wmMx/jOK3mbJLA6z5oq
 Hjzg7j/vJfJBm1PRQiaeVC2xvom049KRmzsHzHqqqCT9U50qfMlrM7nmB76i4wlZUSxm
 wQPzCjp9tir9Bjj8115ZYgPqasuUiVhq7Om5OyJTF5MM4sFuH3qukIVfJ5enkQrbXv3F
 zCiGbYWMsoV5BKQyRS/jS9pS6eqFco/h/g8D6BSVM297Ei2Ij/hWG0QXI/mYFc0BDBAQ
 Fvwr0PgCPdXs2gsCUNHXCie/5/S81VkYiYjR7onHGquXbAEnWaSQCdzSCxrfmIIFocJu vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33gn7gxnpv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Sep 2020 11:11:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CEEEB10002A;
 Tue, 15 Sep 2020 11:11:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FA592A447E;
 Tue, 15 Sep 2020 11:11:31 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Sep 2020 11:11:30
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@st.com>
Date: Tue, 15 Sep 2020 11:11:30 +0200
Message-ID: <1600161090-9899-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-15_05:2020-09-15,
 2020-09-15 signatures=0
Cc: linux-kernel@vger.kernel.org, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] i2c: stm32: fix slot id after
	introduction of host-notify support
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

Commit 68302245720a ("i2c: stm32f7: Add SMBus Host-Notify protocol support")
added a new slot specific for handling host-notify however failed
to update the previous slot ID leading to having the 7bit address
only slot with the wrong number.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index b401940c5580..0880f6a4cd44 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1355,7 +1355,7 @@ static int stm32f7_i2c_get_free_slave_id(struct stm32f7_i2c_dev *i2c_dev,
 	}
 
 	for (i = STM32F7_I2C_MAX_SLAVE - 1; i > 0; i--) {
-		if (i == 1 && (slave->flags & I2C_CLIENT_TEN))
+		if (i == 2 && (slave->flags & I2C_CLIENT_TEN))
 			continue;
 		if (!i2c_dev->slave[i]) {
 			*id = i;
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
