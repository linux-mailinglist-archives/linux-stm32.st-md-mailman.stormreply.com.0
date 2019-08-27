Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDC9E7B6
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2019 14:19:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4086BC35E01;
	Tue, 27 Aug 2019 12:19:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76A3EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2019 12:19:48 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RC6odm017691; Tue, 27 Aug 2019 14:19:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=jmXRhIE8q+Sed7f9WiZAUW4GbJ4tUfk7sqSvhf1B3xw=;
 b=tWSbMhUxOcUa7IXi/+0gVCq61TsIBEaiL01X4EURsI/nyBZg39ganAiugp279ZTR6Wp1
 9B999Prv5z3C6LXligMToI4Qp1j/zzFcvfJOH/0ZbQ72Qt1rCydaqAjlNBLgb9agrZoH
 T6VfkLZw/ywI6PST2MAagFbtGgQRcAc1UBe+jQWPIUoORXRoARBuy/ICtcgkF21kTc4x
 1uWHEXHNX6pi5HobGjJvb+wxk87YbTg9O6zr8CaiD/thxQw7GMjxpINQM6rKWnhLAYxt
 UAXzlK8Cc0sC5VeJUPnGqSB1kZFkYH5XIjU/54tdi7m7QSiQ+EvjiM6NviK7tRXJdBtE iQ== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ujv4ksbxh-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 27 Aug 2019 14:19:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8E95353;
 Tue, 27 Aug 2019 12:19:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 461EE2CA731;
 Tue, 27 Aug 2019 14:19:33 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Aug
 2019 14:19:32 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 27 Aug 2019 14:19:32 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: "corbet@lwn.net" <corbet@lwn.net>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] Documentation: add link to stm32mp157 docs
Thread-Index: AQHVXNGu+WgWi0gJwE+sfJwWkTflzQ==
Date: Tue, 27 Aug 2019 12:19:32 +0000
Message-ID: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_02:, , signatures=0
Cc: Gerald BAEZA <gerald.baeza@st.com>
Subject: [Linux-stm32] [PATCH] Documentation: add link to stm32mp157 docs
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

Link to the online stm32mp157 documentation added
in the overview.

Signed-off-by: Gerald Baeza <gerald.baeza@st.com>
---
 Documentation/arm/stm32/stm32mp157-overview.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/arm/stm32/stm32mp157-overview.rst b/Documentation/arm/stm32/stm32mp157-overview.rst
index f62fdc8..8d5a476 100644
--- a/Documentation/arm/stm32/stm32mp157-overview.rst
+++ b/Documentation/arm/stm32/stm32mp157-overview.rst
@@ -14,6 +14,12 @@ It features:
 - Standard connectivity, widely inherited from the STM32 MCU family
 - Comprehensive security support
 
+Resources
+---------
+
+Datasheet and reference manual are publicly available on ST website:
+.. _STM32MP157: https://www.st.com/en/microcontrollers-microprocessors/stm32mp157.html
+
 :Authors:
 
 - Ludovic Barre <ludovic.barre@st.com>
-- 
2.7.4
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
