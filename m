Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3439E1EAF1
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 11:32:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE814C35E07
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2019 09:31:59 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1415C35E06
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 09:31:57 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9Oka8107637;
 Wed, 15 May 2019 09:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=hSu1AVv1i5MwGTlZX96Y2ojOopFKVDPdwp7odcEtjSU=;
 b=QxKz7pdrvgFAsizbgDOzDRwgYaxCVVOCZKxT6V2UQ5YrwlWM7dnYddmmQKgH52xwsiyF
 yDDDPg8rcWPTiSRhLHcrfOWh85hHiUa09rekpc6c9sHJ+lkRMXfYq2DRBrwFMBzJMrmL
 Y2vBL5aZCUseBkHAt9O1AGsDRf/hOnHL54ANFoej5iUdPo31j0lRklAWgJNzt1/0BJVx
 hIQ4pDwXPVxYnhQIfgbbYz4wOAEwQhednYjrmtjracQG/RdLKozlYNDNg4j8yZlrn9/Q
 xt3n+qqTSnvriClxUItv5X4b1emGDhmSzilE3u2FbxHgB4z21FJsZStgbjbbsBpuaqNC QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2sdq1qkgaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 09:31:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4F9Vdrw093333;
 Wed, 15 May 2019 09:31:52 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2sdnqk433v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 May 2019 09:31:52 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4F9VoVH001813;
 Wed, 15 May 2019 09:31:50 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 15 May 2019 02:31:49 -0700
Date: Wed, 15 May 2019 12:31:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lee Jones <lee.jones@linaro.org>, Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190515093141.GA3409@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905150061
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9257
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905150061
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] mfd: stmfx: Uninitialized variable in
	stmfx_irq_handler()
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

The problem is that on 64bit systems then we don't clear the higher
bits of the "pending" variable.  So when we do:

	ack = pending & ~BIT(STMFX_REG_IRQ_SRC_EN_GPIO);
	if (ack) {

the if (ack) condition relies on uninitialized data.  The fix it that
I've changed "pending" from an unsigned long to a u32.  I changed "n" as
well, because that's a number in the 0-10 range and it fits easily
inside an int.  We do need to add a cast to "pending" when we use it in
the for_each_set_bit() loop, but that doesn't cause a proble, it's
fine.

Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mfd/stmfx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index fe8efba2d45f..fee75b5d098e 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -204,12 +204,12 @@ static struct irq_chip stmfx_irq_chip = {
 static irqreturn_t stmfx_irq_handler(int irq, void *data)
 {
 	struct stmfx *stmfx = data;
-	unsigned long n, pending;
+	u32 pending;
 	u32 ack;
+	int n;
 	int ret;
 
-	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING,
-			  (u32 *)&pending);
+	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING, &pending);
 	if (ret)
 		return IRQ_NONE;
 
@@ -224,7 +224,7 @@ static irqreturn_t stmfx_irq_handler(int irq, void *data)
 			return IRQ_NONE;
 	}
 
-	for_each_set_bit(n, &pending, STMFX_REG_IRQ_SRC_MAX)
+	for_each_set_bit(n, (unsigned long *)&pending, STMFX_REG_IRQ_SRC_MAX)
 		handle_nested_irq(irq_find_mapping(stmfx->irq_domain, n));
 
 	return IRQ_HANDLED;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
