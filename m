Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB5F2A9B2E
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 18:50:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F4106C3FAD4;
	Fri,  6 Nov 2020 17:50:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D18C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 17:50:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6HmTgh004037; Fri, 6 Nov 2020 18:50:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eMPMn91cCHyM/mIF1zD+SFO1I52TNwQPU0lvOZDdToE=;
 b=0O4Jge/UIjwArzKM0JVlUhlUH2fxXAeEsWZ/yltz9MTsSYTFpAAsLtrDg5WdoAaQMkru
 OkOK7UK0R3L+9OB6aiNpgOJos37Wn0LlneVS3Acz3XA1pRVfLxnzPOHsSZCK1in3fkcw
 qaBmoSUorZLH8wyf974OfunbogdJ/BzF5uq45ziSn9U/0blx1S3KGzCrE8K+xkqcMMlj
 6YKylkhBXg9ycxHSdsWiWvQBtPN4c8aK69cxW+7mTPr5MSqBF7ehIk59p+Xc5IdqO29p
 0yTiYR3SFpJhRFkqcuv2eQtEUxcCcAGb1JrKjGihNHLsHOADmwMANFBpe7bs/w2ZaoeI eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34h00ewstr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 18:50:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7865D100034;
 Fri,  6 Nov 2020 18:50:34 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 67B612150EE;
 Fri,  6 Nov 2020 18:50:34 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG1NODE3.st.com (10.75.127.3)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 18:50:33
 +0100
From: Fabrice Gasnier <fabrice.gasnier@st.com>
To: <jic23@kernel.org>
Date: Fri, 6 Nov 2020 18:50:16 +0100
Message-ID: <1604685016-2434-1-git-send-email-fabrice.gasnier@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_06:2020-11-05,
 2020-11-06 signatures=0
Cc: linux-doc@vger.kernel.org, mchehab+huawei@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] docs: ABI: testing: iio: stm32: remove
	re-introduced unsupported ABI
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

Remove unsupported ABI that has been re-introduced due to a rebase hunk.
This ABI has been moved in the past in commit b299d00420e2
("IIO: stm32: Remove quadrature related functions from trigger driver")

This also fixes a couple of warnings seen with:
./scripts/get_abi.pl validate 2>&1|grep iio

Fixes: 34433332841d ("docs: ABI: testing: make the files compatible with ReST output")

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@st.com>
---
 .../ABI/testing/sysfs-bus-iio-timer-stm32          | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32 b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
index a10a4de..c4a4497 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
+++ b/Documentation/ABI/testing/sysfs-bus-iio-timer-stm32
@@ -109,30 +109,6 @@ Description:
 		When counting down the counter start from preset value
 		and fire event when reach 0.
 
-What:		/sys/bus/iio/devices/iio:deviceX/in_count_quadrature_mode_available
-KernelVersion:	4.12
-Contact:	benjamin.gaignard@st.com
-Description:
-		Reading returns the list possible quadrature modes.
-
-What:		/sys/bus/iio/devices/iio:deviceX/in_count0_quadrature_mode
-KernelVersion:	4.12
-Contact:	benjamin.gaignard@st.com
-Description:
-		Configure the device counter quadrature modes:
-
-		channel_A:
-			Encoder A input servers as the count input and B as
-			the UP/DOWN direction control input.
-
-		channel_B:
-			Encoder B input serves as the count input and A as
-			the UP/DOWN direction control input.
-
-		quadrature:
-			Encoder A and B inputs are mixed to get direction
-			and count with a scale of 0.25.
-
 What:		/sys/bus/iio/devices/iio:deviceX/in_count_enable_mode_available
 KernelVersion:	4.12
 Contact:	benjamin.gaignard@st.com
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
