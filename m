Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 925EF30A4C8
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Feb 2021 11:00:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CC98C57A42;
	Mon,  1 Feb 2021 10:00:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0C4BC57181
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Feb 2021 10:00:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1119af6o027363; Mon, 1 Feb 2021 11:00:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=z5G4W9jPr/xS9F/EphAkfT/kIOkM3M4degh8WCS71H8=;
 b=KvnfdO8l8Br/M/+fhVewAHl0feXSg0/GTpZFIPFDRFhN+ZNf7QkkUfB8DxkxM7PshFs7
 24VKf2LvcX5AfgepjuycTZ4uyUtvDbAnH4ChOn780CcPiICEQqsXeTDzV7uL1mfwXAZZ
 4Tzjjm0H9USv1qDEwyQFr08KTZaJMaXNL3tkYELGnBsGyfhOB6pHUpsPQ/8Ji43qW7q5
 HHackW5y4kb8xjVVj9CZywVVGeVUv070BmWGE8p+jy/shRPNMyAZQzOlOGfCpRelZQ2k
 8Z7cIc7N4eF3PNhtBViQhrF4DcEZ9IaNVOYBSssnXvwEYzlhPOPy0ZuP6XXie4WhmJ9a Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36e7x0j9y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Feb 2021 11:00:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 07A6A100038;
 Mon,  1 Feb 2021 11:00:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F128122D603;
 Mon,  1 Feb 2021 11:00:28 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 1 Feb 2021 11:00:28
 +0100
From: <patrice.chotard@foss.st.com>
To: <linux-kernel@vger.kernel.org>
Date: Mon, 1 Feb 2021 11:00:23 +0100
Message-ID: <20210201100023.10985-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210201100023.10985-1-patrice.chotard@foss.st.com>
References: <20210201100023.10985-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-01_04:2021-01-29,
 2021-02-01 signatures=0
Cc: alain.volmat@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/3] MAINTAINERS: Add Alain Volmat as STM32
	I2C/SMBUS maintainer
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

Add Alain Volmat as STM32 I2C/SMBUS driver co-maintainer.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: alain.volmat@foss.st.com
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98365c57ae37..f6d317449521 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16812,6 +16812,7 @@ F:	drivers/media/i2c/st-mipid02.c
 
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
+M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
