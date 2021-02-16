Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CA031C6F4
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Feb 2021 08:49:51 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5244FC5718D;
	Tue, 16 Feb 2021 07:49:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4381BC32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Feb 2021 07:49:45 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11G7lrXU020586; Tue, 16 Feb 2021 08:49:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=I6TOgfKl+pMmb59kh6Aus4pqCDixCG4eRt9BnmNSryM=;
 b=k6/9N7zFYtt26k4kna1/ttslrw9zqSLB+UbwGeFiD5BZcGVVCl8uquGNFFfniFDGoWsN
 1CXIcE8e80yNG40Qofe2Ph/rNrELWd3/30c0KqpQ1teeKmyUSsdFdccni9G9mngzpNH4
 TEb2xvgctLXBQhQJMAlGwrC9NMuOFrUhFu2seQ2PMkmqK1o6k/5CmzR9iwCQEnCESDeE
 Pf67I+rFpqlIhb7fOj188QKYoeFTb0T0tKvGXtzAB45W1soqt98wLfv97JjZSQIip5P3
 bpmq3wAsXfzIm20hgpZwf2YoRiJw/ytLNBgF3yKra9CWjIAeChqNlC5xcXE03g1UuPiT mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36p547ekwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Feb 2021 08:49:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3B5C10002A;
 Tue, 16 Feb 2021 08:49:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8F6121CA8A;
 Tue, 16 Feb 2021 08:49:41 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Feb 2021 08:49:41
 +0100
From: <patrice.chotard@foss.st.com>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
Date: Tue, 16 Feb 2021 08:49:29 +0100
Message-ID: <20210216074929.29033-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216074929.29033-1-patrice.chotard@foss.st.com>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-15_16:2021-02-12,
 2021-02-15 signatures=0
Cc: alain.volmat@foss.st.com, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [RESEND PATCH 3/3] MAINTAINERS: Add Alain Volmat as
	STM32 I2C/SMBUS maintainer
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
index c6266d311061..7de268e4aec0 100644
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
