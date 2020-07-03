Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 47131213832
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jul 2020 11:55:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5DBCC36B2A;
	Fri,  3 Jul 2020 09:55:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 219BAC36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jul 2020 09:55:34 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0639bMKr014401; Fri, 3 Jul 2020 11:55:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=BScJztGlfYcevM6vG7P/xzi6490U6vbgga1vE9lI1xc=;
 b=o2Tl32h/Gk9cJ9YiuPZJ0nWBn2ZUE9tEKMeRGD6+isCJgCUm6Tu4D32MYtlEFfcBReHK
 Np1uqbf7NrA0HnodlLdDebrHHBL66qQOAdBVLUm9paVu/NqfaRoD4rfcQmtpgCCstLBb
 r+W1TNLd/aOJ2Znr6tlp3XoJz7/dxDvFip6UA054MDXVLvUf5l8t0sOnBBjcNuyB6txr
 rSM+wJMEIzFyHINR0junLiadv3dRLbF5uwr1o0mUAhDyiNHmvwhoG1WtzUat7SsIJeMg
 6DhzB4YUwXWdD6cwdQRi3ohAIfwTlFLkaRJB8g7KF2Ijdq0OJkjXWS3P231csmZy7ar3 xA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0gp0hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Jul 2020 11:55:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F290810002A;
 Fri,  3 Jul 2020 11:55:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E09F72BAC64;
 Fri,  3 Jul 2020 11:55:23 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE3.st.com (10.75.127.9)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 3 Jul 2020 11:55:23
 +0200
From: Benjamin Gaignard <benjamin.gaignard@st.com>
To: <robh+dt@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <lee.jones@linaro.org>,
 <benjamin.gaignard@st.com>
Date: Fri, 3 Jul 2020 11:55:15 +0200
Message-ID: <20200703095520.30264-1-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-03_03:2020-07-02,
 2020-07-03 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/5] ARM: STM32: Add compatibles for syscon
	nodes
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

Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a more specific compatible")
it is required to provide at least 2 compatibles string for syscon node.
This series update the syscon of the STM32 SoCs to fix the reported errors. 

Benjamin Gaignard (5):
  dt-bingings: arm: stm32: Add compatibles for syscon nodes
  ARM: dts: stm32: Add compatibles for syscon for stm32f426
  ARM: dts: stm32: Add compatibles for syscon for stm32f746
  ARM: dts: stm32: Add compatibles for syscon for stm32h743
  ARM: dts: stm32: Add compatibles for syscon for stm32mp151

 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml     | 14 +++++++++++++-
 arch/arm/boot/dts/stm32f429.dtsi                           |  6 +++---
 arch/arm/boot/dts/stm32f746.dtsi                           |  6 +++---
 arch/arm/boot/dts/stm32h743.dtsi                           |  6 +++---
 arch/arm/boot/dts/stm32mp151.dtsi                          |  2 +-
 5 files changed, 23 insertions(+), 11 deletions(-)

-- 
2.15.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
