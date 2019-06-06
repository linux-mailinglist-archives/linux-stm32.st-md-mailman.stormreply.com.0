Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF96C3746A
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2019 14:41:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07C89C10CAB
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jun 2019 12:41:45 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2120C10CA9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jun 2019 12:41:43 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x56CNvve189323;
 Thu, 6 Jun 2019 12:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2018-07-02; bh=msmH1U56crPbNRzTsdy2al8tC5H9vw5+sq8L4C2RUK4=;
 b=CJ6xVfHkWbX33y5VWh0/BWBGQNvT7JHh3QbV3oeluLGYSgqO/q9sVDPNf6V+EkjAOPN0
 MccSfZKZWDrbq1OXVvhi53r+hWTL2lJZs81RBesSv2z8fK9Xt8cFQG/9BV7lUdkZdinf
 CyOHysAUR6gOPsYhfCr4A+FIW/vzkl8zudBuNHrC5K0GBaZHCvq4C4CZPuOTtBDHaIEt
 GvgWkFIkS5J9WUzp5rYGYAFDVAtN5zkvpc+FRNbNdHoluEtpyHw+DtdpsJvbBAdp6pWX
 DIOw0yb5dNU4BmCAUdmhL3LgmRLvDi022zwnu7GI5/s02O1YhxU+baXesjMNT85pI5oE 1g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 2suj0qr2x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jun 2019 12:41:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x56CeZxp165567;
 Thu, 6 Jun 2019 12:41:36 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2swnhaqv70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Jun 2019 12:41:36 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x56CfZP1023460;
 Thu, 6 Jun 2019 12:41:35 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 06 Jun 2019 05:41:34 -0700
Date: Thu, 6 Jun 2019 15:41:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lee Jones <lee.jones@linaro.org>, Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <20190606124127.GA17082@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccefbd0b-3397-a26e-95e7-059fcced9154@st.com>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906060090
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9279
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906060090
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2] mfd: stmfx: Uninitialized variable in
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
v2: white space changes

 drivers/mfd/stmfx.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index fe8efba2d45f..7c419c078688 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -204,12 +204,10 @@ static struct irq_chip stmfx_irq_chip = {
 static irqreturn_t stmfx_irq_handler(int irq, void *data)
 {
 	struct stmfx *stmfx = data;
-	unsigned long n, pending;
-	u32 ack;
-	int ret;
+	u32 pending, ack;
+	int n, ret;
 
-	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING,
-			  (u32 *)&pending);
+	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING, &pending);
 	if (ret)
 		return IRQ_NONE;
 
@@ -224,7 +222,7 @@ static irqreturn_t stmfx_irq_handler(int irq, void *data)
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
