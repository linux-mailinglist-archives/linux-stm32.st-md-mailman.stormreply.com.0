Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 475B6151B33
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 14:26:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2C2BC36B0D;
	Tue,  4 Feb 2020 13:26:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14DECC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 13:26:27 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 014DNoVK030249; Tue, 4 Feb 2020 14:26:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AplTNN5L+r2sBe+jH4b1Al4L+72dRx8nYadx/tYF8Ug=;
 b=ZQptpfXca1Q2Ug7CIhv4qXR30/e2gpoGXV3YL2Z0t0T2MGKKK6j5dXKjgJUQnDbREHsm
 FEysJBgBfVpQDR8mZnRG92U3HBeQXHpUDhKKdXAMkIcs9IyZtsv1rbVmyFwMNlEGVV2j
 x7ZIhpJim5exW954sZQ+vPSCWnvUSHDhsy7wuwu11nc+ieZGNLt/s59zvAMv9j4cJUAX
 eX7jYYNdXmUZZRecIbbBvVvtNV4YAQWTOgtanF04qHn+qhcm6WfOsccx1ZWXFiVuNdaV
 2q7bZKb+DXRrie9IFAtHat4+z2rcugLY1ZQOsegz0Sz/kylIvf2LdD2uJHYZaXlJbYHF 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xw0019tb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Feb 2020 14:26:17 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 042AB100034;
 Tue,  4 Feb 2020 14:26:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D5FEA2B188F;
 Tue,  4 Feb 2020 14:26:12 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 4 Feb 2020 14:26:12
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Tue, 4 Feb 2020 14:26:03 +0100
Message-ID: <20200204132606.20222-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-04_04:2020-02-04,
 2020-02-04 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/3] USB OTG Dual Role on STM32MP15
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

This patchset adds support for USB OTG Dual Role on stm32mp15.
USB OTG HS is configured in Dual Role mode on stm32mp157c-ev1, role detection
uses ID pin.

Amelie Delaunay (3):
  ARM: dts: stm32: add USB OTG full support on stm32mp151
  ARM: dts: stm32: add USB OTG pinctrl to stm32mp15
  ARM: dts: stm32: enable USB OTG Dual Role on stm32mp157c-ev1

 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/stm32mp151.dtsi        |  3 ++-
 arch/arm/boot/dts/stm32mp157c-ed1.dts    |  4 ++++
 arch/arm/boot/dts/stm32mp157c-ev1.dts    |  3 ++-
 4 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
