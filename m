Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C24BDCAF
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2019 13:06:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11255C35E01;
	Wed, 25 Sep 2019 11:06:13 +0000 (UTC)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B1AFC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2019 11:06:09 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PB4N9V047379;
 Wed, 25 Sep 2019 11:06:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=7AcvPUSXbf3zvRYSdYau2KWOrIhOXWajH29zkbdtniQ=;
 b=X1Ha/D2yvIzM8AW9I48fuemhHZXVmhaZ9eJEfJTPxNuHKwkdSfpgDmRfGJrKrLw+A+uu
 qn+VdJ2iVqYY4GfllktHnoYoFaZkqRLDZgDxAZKPVIj9Fpr1lAWzFvVajBjzjZtIVqHR
 lDk8uH1enxloRXLmg+8yGXrb/r9+2jP6R0LO9sDe5lJn2jO3Oea++N3BkKpuRPRJS0Lz
 ZkAUxN1TFHqvz9c6ysg2hbFn/C+3nOwWViwPv4DNShO8svl018UCwBY2AZAns3EksXYE
 Kl81fjhe8s9a60CyRTvj4b5V6faSpPeN3GSLAX51MQxWZPGqu1+aD0l1qyMBL0f3M7mn Ow== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2v5btq3x06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 11:06:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x8PB42oX049915;
 Wed, 25 Sep 2019 11:06:04 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 2v7vnxsm72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 11:06:04 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x8PB62Ep023806;
 Wed, 25 Sep 2019 11:06:02 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 25 Sep 2019 04:06:01 -0700
Date: Wed, 25 Sep 2019 14:05:54 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Mathieu Olivari <mathieu@codeaurora.org>
Message-ID: <20190925110554.GQ3264@mwanda>
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
 engine=8.0.1-1908290000 definitions=main-1909250113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9390
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1908290000
 definitions=main-1909250113
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH net] net: ethernet: stmmac: Fix signedness bug
 in ipq806x_gmac_of_parse()
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

The "gmac->phy_mode" variable is an enum and in this context GCC will
treat it as an unsigned int so the error handling will never be
triggered.

Fixes: b1c17215d718 ("stmmac: add ipq806x glue layer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 2c6d7c69c8f7..0d21082ceb93 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -191,7 +191,7 @@ static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac)
 	struct device *dev = &gmac->pdev->dev;
 
 	gmac->phy_mode = of_get_phy_mode(dev->of_node);
-	if (gmac->phy_mode < 0) {
+	if ((int)gmac->phy_mode < 0) {
 		dev_err(dev, "missing phy mode property\n");
 		return -EINVAL;
 	}
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
