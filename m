Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C000B9D301
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2019 17:39:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E7F1C35E01;
	Mon, 26 Aug 2019 15:39:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFC5BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 15:39:30 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QFPrAb018373; Mon, 26 Aug 2019 17:39:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=G1q9jXeOe+jObYadbTKDBN2nCaQ4doShrwDMtgHwCfo=;
 b=kgo2lgzxQKE25bsuS4y4FQwg+AF0ctGg/uEnPyfmNh9pUqZkRZcv3f7fE1QoBOG1jX+v
 93oONfwSE0K5hgnpW8ChGifG4bSX8cQ1b9GYhb6Fl56rViAmXT0ZRknFPxKsQAkB4Cmr
 xpsRK2P0Ugi3JSEa0CRWsBo1gBFZSk+R/EPaN7vkM8xrFOC2x7EW/KohqnHsZj09luyo
 mkpE4NGpaxspIAz4l24bRJGyqtkkhkD8yE3qcvbg6fnrrL795TQBX/Yni/hjI2XCKfGv
 6CUrvrlLZ9MDi3XXWyi1F6SyUOsnK33gWyJ3kdorzPCyfJx/yVg1SUhyjHlVgd86Erxi 8w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2uju0vmgkd-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 26 Aug 2019 17:39:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5FA49235;
 Mon, 26 Aug 2019 15:39:07 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas22.st.com [10.75.90.92])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2CD062BC1CE;
 Mon, 26 Aug 2019 17:38:52 +0200 (CEST)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by Safex1hubcas22.st.com
 (10.75.90.92) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 26 Aug
 2019 17:38:52 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 26 Aug 2019 17:38:51
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Mon, 26 Aug 2019 17:38:42 +0200
Message-ID: <1566833923-16718-2-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
References: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_08:, , signatures=0
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: remoteproc: stm32: add
	wakeup-source
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

Add the "wakeup-source" property: if the optional wdg interrupt is
defined, then this property may be defined too.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
index 5fa915a..ac54b5b 100644
--- a/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
+++ b/Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
@@ -21,6 +21,9 @@ Required properties:
 
 Optional properties:
 - interrupts:	Should contain the watchdog interrupt
+- wakeup-source: Flag indicating whether remoteproc can wake up the system by
+		the watchdog interrupt. Only meaningful if the "interrupts"
+		property is defined.
 - mboxes:	This property is required only if the rpmsg/virtio functionality
 		is used. List of phandle and mailbox channel specifiers:
 		- a channel (a) used to communicate through virtqueues with the
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
