Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3735E183
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Apr 2021 16:32:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2280C57B78;
	Tue, 13 Apr 2021 14:32:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BEC3BC57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Apr 2021 14:32:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DEWMhv010104; Tue, 13 Apr 2021 16:32:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=bavnRqI5ucsHk4llNawSfeoyU7Pikb9myCdrZ4Z3/yk=;
 b=TPRfkXKj9nW5uYcESsVD8yTup6G7tzaqJ1lJx1bh0s5Uma3V4PMYyh9qu6PinXubCHWn
 oMKyaDnuVAYcpmsxlmxXz5pLxkxikafapx25l1M3LWWyev/Bn1YkryQgOhcqN2FvPB0l
 q9jM8coK+h9q9HF0eU6IW+n/XdmalwdjYxPnkkwZZMp6jfu1c/rxB0tRSlDQY0UQpHhc
 nww4r4DubsuGy/Vb7ZAVpyuSiu8K1AYMqU0P/LK2Zqrl8esEIMZUhBOdMYMNFQMoigvF
 4jfMOAYhrApjwA5PQet+p3SkqF8QApIlab6BQJ1a2He3knm0LfSgCuY1o/P4x5cM90VB ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37vrp5e7eh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 16:32:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 60A4C100034;
 Tue, 13 Apr 2021 16:32:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C40D246F3E;
 Tue, 13 Apr 2021 16:32:15 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 16:32:14
 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Tue, 13 Apr 2021 16:31:39 +0200
Message-ID: <20210413143141.12919-1-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_08:2021-04-13,
 2021-04-13 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] STM32 USBPHYC vbus-supply property
	support
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

STM32 USBPHYC provides two USB High-Speed ports which are used by controllers
with Host capabilities. That's why vbus-supply has to be supported on each
phy node.

---
Changes in v2:
- use connector node vbus-supply property as suggested by Rob
---
Amelie Delaunay (2):
  dt-bindings: phy: add vbus-supply optional property to
    phy-stm32-usbphyc
  phy: stm32: manage optional vbus regulator on phy_power_on/off

 .../bindings/phy/phy-stm32-usbphyc.yaml       | 11 +++++++
 drivers/phy/st/phy-stm32-usbphyc.c            | 31 +++++++++++++++++++
 2 files changed, 42 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
