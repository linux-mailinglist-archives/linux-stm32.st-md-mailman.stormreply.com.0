Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E4C366CB1
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Apr 2021 15:24:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7D1AC58D5C;
	Wed, 21 Apr 2021 13:24:16 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 183E5CFAC55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Apr 2021 13:24:13 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LDM5v9024165; Wed, 21 Apr 2021 13:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=TNSaEpFWAP3byXDTGeCVcql+u1LPJQ67fY0dZbPZ+3U=;
 b=pCaRlRtos22T09/Q5LwqvQZF6WxEZPJeC8dcj1TKceMV6NaRukW2BfLwtNHpYo96slQ+
 hyDp/Xr7Y2+4RnevKoDUmG5KJA/3hgzq2esycxB9qnV4v4+S7n54yqXKyZNDkZCdK28X
 0lyMrUN+gaY5o0M+FQRKz6SShzyOekidPhbtfD7Re6S58xmQq34mIWPxeaTVIpkAFTQw
 Jk0iclJpXLtHO+ENIvIbQibZ1tETFpW9ZQW4QQtuqYZ6+afauRWUT/9RffFmR5RqBYVp
 crNYVOeMUKSeYWmmoBVFYSjLvSUQP7ozuFkT7JpdN1U1+TNC/jW/Q04MdQYyhhPcIsyW kg== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3818whgqum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:23:04 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13LDN3hO188471;
 Wed, 21 Apr 2021 13:23:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3809eu908r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:23:03 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LDMHMI186187;
 Wed, 21 Apr 2021 13:23:02 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3809eu9080-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:23:02 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 13LDMxwB025688;
 Wed, 21 Apr 2021 13:22:59 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 06:22:58 -0700
Date: Wed, 21 Apr 2021 16:22:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Tan Tee Min <tee.min.tan@intel.com>
Message-ID: <YIAnKtpJa/K+0efq@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: mNzPN1m0GniGNETV8bAzsQ4x43P4ytO0
X-Proofpoint-GUID: mNzPN1m0GniGNETV8bAzsQ4x43P4ytO0
Cc: Wong Vee Khee <vee.khee.wong@linux.intel.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, kernel-janitors@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next] stmmac: intel: unlock on error path
 in intel_crosststamp()
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

We recently added some new locking to this function but one error path
was overlooked.  We need to drop the lock before returning.

Fixes: f4da56529da6 ("net: stmmac: Add support for external trigger timestamping")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index ec140fc4a0f5..bd662aaf664a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -320,6 +320,7 @@ static int intel_crosststamp(ktime_t *device,
 		acr_value |= PTP_ACR_ATSEN3;
 		break;
 	default:
+		mutex_unlock(&priv->aux_ts_lock);
 		return -EINVAL;
 	}
 	writel(acr_value, ptpaddr + PTP_ACR);
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
