Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FCC2DD59E
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Dec 2020 18:01:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66239C3FADF;
	Thu, 17 Dec 2020 17:01:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37B58C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Dec 2020 17:00:56 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BHGvWpM002507; Thu, 17 Dec 2020 18:00:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=T+pS0I5znHYfC4osHui4ytbDqcO9jybXlXCJRJV+/+s=;
 b=XzN16XHusFyG/PVBR+qIBEzfvG9Vjc42VQdaK7KxLADjQEovaGx1oE9oiGgSBU+79G62
 3G2j8pHSvGbQ6A16FOt0s+7NbqeXktOHBdqiiKAlpk9wvApHL0Sp4I7XjVKfo3bblDJn
 u1aRrQmpMWVewixHJ1/kQd0JrXj9gsWindSpPAGJXFr3RUf3Zp54VYPioSh4VJFgcgTw
 XYE2RYniwZMrvejHuIvYpJuBycW/C7c/v5bbKfG2Tk3hbSbRk/WTNyWsXLFC25/AWb4u
 7oeBeAlo1ZIFsV9ow+S+dNOp0ukp/HpTUdWGeaaELEV0fJo4DAyhuOKWBWb/WVz36gNs 5A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpwegwhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Dec 2020 18:00:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6272710002A;
 Thu, 17 Dec 2020 18:00:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 59BF325AAE1;
 Thu, 17 Dec 2020 18:00:55 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 17 Dec 2020 18:00:54
 +0100
From: <patrice.chotard@foss.st.com>
To: <linux-kernel@vger.kernel.org>
Date: Thu, 17 Dec 2020 18:00:44 +0100
Message-ID: <20201217170044.12061-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201217170044.12061-1-patrice.chotard@foss.st.com>
References: <20201217170044.12061-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-17_11:2020-12-15,
 2020-12-17 signatures=0
Cc: Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 2/2] MAINTAINERS: Remove Vincent Abriou for
	STM/STI DRM drivers.
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Remove Vincent Abriou's email as he has no more review activities on
STM/STI DRM drivers.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Vincent Abriou <vincent.abriou@st.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 685b72a22cee..010160a89a10 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5913,7 +5913,6 @@ F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
-M:	Vincent Abriou <vincent.abriou@st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -5924,7 +5923,6 @@ DRM DRIVERS FOR STM
 M:	Yannick Fertre <yannick.fertre@foss.st.com>
 M:	Philippe Cornu <philippe.cornu@foss.st.com>
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
-M:	Vincent Abriou <vincent.abriou@st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
