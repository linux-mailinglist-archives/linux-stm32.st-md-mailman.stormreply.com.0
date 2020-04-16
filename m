Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E59031ACD16
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2020 18:14:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B0104C36B0C;
	Thu, 16 Apr 2020 16:14:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A175BC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2020 16:14:26 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03GGDEcC005340; Thu, 16 Apr 2020 18:14:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=x/YFvpKguyxR4K0R9rEA/U7cUeNFm3Fzc4388HJ8uh8=;
 b=IPix+z6bgetGW5L+Zp0JYcGILP6KJi7xFb+o9q4/8rfLr9NUaRWMAhtlYrpio5SHaDIs
 6C01weLAHT4VP7NuIHu4tNaLnWxqWMizwWaQcvlg0Ut5Pcfm2IHUD8NtLO4vxtM+XVQa
 +F9TePZ+nEsnwnlbsCJqljZPecVNnDrF4pbOvhafYGku7TQgpm9LLpC00xCwXNafG8ZH
 QMOIpWGIIvvSOAsyQVMxwFnfA+WUbal3aEPBvtEjYGvbijvXrykG+KjbtGFVURgtEaky
 nx8VPaPda3jBC2Gnri8jE7D1nLvarrTjwr66b25eGrIWluCYydIepRG/xKOyVAJsIMS+ GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30dn6t3ncs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Apr 2020 18:14:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6041310002A;
 Thu, 16 Apr 2020 18:14:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5361A2B2D2A;
 Thu, 16 Apr 2020 18:14:24 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 16 Apr 2020 18:14:23
 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen
 <ohad@wizery.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 16 Apr 2020 18:13:25 +0200
Message-ID: <20200416161331.7606-13-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416161331.7606-1-arnaud.pouliquen@st.com>
References: <20200416161331.7606-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-16_06:2020-04-14,
 2020-04-16 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RFC 12/18] remoteproc: Support of pre-registered
	virtio device
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

Management of the virtio device declared in the devicetree as
a sub device of the remoteproc.
Instead of creating a new platform device, we parse first the
rvdevs list to look for a pre-registered rvdev with an index, that
matches with the vdev instance of the resource table.
If no pre-registered vdev is found a new platform device is created.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 51 +++++++++++++++++-----------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index ecb36f64b1a0..9238aa292644 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -383,8 +383,8 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 {
 	struct device *dev = &rproc->dev;
 	struct rproc_vdev_data vdev_data;
+	struct rproc_vdev *rvdev = NULL, *tmp_rvdev;
 	struct platform_device *pdev;
-	int ret;
 
 	/* make sure resource isn't truncated */
 	if (struct_size(rsc, vring, rsc->num_of_vrings) + rsc->config_len >
@@ -399,27 +399,40 @@ static int rproc_handle_vdev(struct rproc *rproc, struct fw_rsc_vdev *rsc,
 		return -EINVAL;
 	}
 
-	vdev_data.rsc_offset = offset;
-	vdev_data.rsc = rsc;
-	vdev_data.id  = rsc->id;
-	vdev_data.index  = rproc->nb_vdev;
+	/* Try to find a pre-registered rproc virtio device  */
+	list_for_each_entry(tmp_rvdev, &rproc->rvdevs, node) {
+		if (tmp_rvdev->index == rproc->nb_vdev) {
+			rvdev = tmp_rvdev;
+			break;
+		}
+	}
 
-	dev_dbg(dev, "%s: rsc_offset = %d rsc = %p id = %d\n",
-		__func__, vdev_data.rsc_offset, vdev_data.rsc, vdev_data.id);
+	if (rvdev) {
+		/* assign the resource offset */
+		rvdev->rsc_offset = offset;
+		rvdev->rsc = rsc;
+		rvdev->id = rsc->id;
 
-	pdev = platform_device_register_data(dev, "rproc-virtio",
-					     rproc->nb_vdev, &vdev_data,
-					     sizeof(vdev_data));
-	ret = PTR_ERR_OR_ZERO(pdev);
-	if (ret) {
-		dev_err(rproc->dev.parent,
-			"failed to create rproc-virtio device\n");
-		return ret;
+	} else {
+		/* no rproc vdev found, register one */
+		vdev_data.rsc_offset = offset;
+		vdev_data.rsc = rsc;
+		vdev_data.id  = rsc->id;
+		vdev_data.index  = rproc->nb_vdev;
+
+		pdev = platform_device_register_data(dev, "rproc-virtio",
+						     rproc->nb_vdev, &vdev_data,
+						     sizeof(vdev_data));
+		if (PTR_ERR_OR_ZERO(pdev)) {
+			dev_err(rproc->dev.parent,
+				"failed to create rproc-virtio device\n");
+			return PTR_ERR_OR_ZERO(pdev);
+		}
+		/* register a component associated to the virtio platform */
+		component_match_add_release(&pdev->dev, &rproc->match,
+					    rproc_release_of, rproc_compare_of,
+					    &pdev->dev);
 	}
-	/* register a component associated to the virtio platform */
-	component_match_add_release(&pdev->dev, &rproc->match,
-				    rproc_release_of, rproc_compare_of,
-				    &pdev->dev);
 	rproc->nb_vdev++;
 
 	return  0;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
