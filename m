Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB618BDC83
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2019 12:59:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 880F2C35E01;
	Wed, 25 Sep 2019 10:59:17 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBFF7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 10:59:15 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PAsUYf039702;
 Wed, 25 Sep 2019 10:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=eFOrIHl9xVbczYemnXyzLMfAw6sr/vt6rgHJPM6P58s=;
 b=auxL8fhajBRjppHoIWFneEyBzGfevCRNONFtVC5735zrtOttk31KY/ij4h70ssM0NnKp
 F0wUS+PccWjTHeqy1v57jBPhO60Sz9dFfPW3SzmB9o9VTNYJmRm8WVKsAWRFaMwcHZ4H
 2FYkaE28r5Ffv8UsWsZLkll6H5LyyNnLkxSkxwf+kec/98cZ2RaYr7xfMz/7SPgKR/ts
 GFiUvH3Na9nVf+xSb3yHj1XOIBkuqkK0AFGLlgZrbOfj+WelcR3wrQ3xWs8WdvM2gCcJ
 aN2AQb+UwXHSS67P7C36GqBHmL1WjLlRmd1ZV4u/XFFFahXqtiONncHDB6H3UYANZn6l dw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2v5btq3vw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 10:59:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PAx20k131692;
 Wed, 25 Sep 2019 10:59:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2v82tjpbns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 10:59:09 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8PAwVJ4019229;
 Wed, 25 Sep 2019 10:58:31 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 25 Sep 2019 03:58:30 -0700
Date: Wed, 25 Sep 2019 13:58:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Message-ID: <20190925105822.GH3264@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1908290000 definitions=main-1909250112
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909250112
Cc: Kevin Hilman <khilman@baylibre.com>, kernel-janitors@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net] net: stmmac: dwmac-meson8b: Fix
	signedness bug in probe
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

The "dwmac->phy_mode" is an enum and in this context GCC treats it as
an unsigned int so the error handling is never triggered.

Fixes: 566e82516253 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 9cda29e4b89d..306da8f6b7d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -339,7 +339,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = of_get_phy_mode(pdev->dev.of_node);
-	if (dwmac->phy_mode < 0) {
+	if ((int)dwmac->phy_mode < 0) {
 		dev_err(&pdev->dev, "missing phy-mode property\n");
 		ret = -EINVAL;
 		goto err_remove_config_dt;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
