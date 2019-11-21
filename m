Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BC41056A5
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Nov 2019 17:12:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C133BC36B0B;
	Thu, 21 Nov 2019 16:12:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E5C9C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Nov 2019 16:12:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xALFqJSC020077; Thu, 21 Nov 2019 17:12:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=msiolxjNPDbDO0stR1EQ2j+X77+u7RGbPsdUhF4GNCU=;
 b=W2eGSnjnqWrZ1ZxUraj+Hl9KrqXyuVv4aqrUhutFzwq1230HN4X8TGdN4d2cv/fE1xwf
 gmjY0F8wDC9DnsB5xWRmIg2xlFFDgQaYbZKqvpSnucnjvlcPV99paRV4bxnaz8Nr8DOW
 1F5MkW/t2FjonuCfTJc882REcunvoC8zh5kankRZOmIGCVZb0sqc5p1RTbPXVuwDo6qo
 Ak8KLHF/v4/HClWNutn0VdXhgLtAd8nrL99WUu/mX7TjV/EVL3/+f0CM+iwooPy+3mB5
 Ni62+unR7yZZOvKxStwYbX0DqTubbqm4FriyS57fXFWOx7s9xNEP6VoZNOaOiG3WbKJ6 mg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2wa9upcrv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Nov 2019 17:12:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 668B6100038;
 Thu, 21 Nov 2019 17:12:46 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 589B12FF5E2;
 Thu, 21 Nov 2019 17:12:46 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 21 Nov 2019 17:12:45
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Nov 2019 17:12:45 +0100
Message-ID: <20191121161245.25702-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-21_03:2019-11-21,2019-11-21 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/5] ARM: dts: stm32: enable USB Host (USBH)
	EHCI controller on stm32mp157a-dk1
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

This patch enables USB Host (USBH) EHCI controller on stm32mp157a-dk1.
As a hub is used between USBH and USB connectors, no need to enable
USBH OHCI controller: all low- and full-speed traffic is managed by the
hub.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
 arch/arm/boot/dts/stm32mp157a-dk1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index 2914109db26d..7603f9456d56 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -605,6 +605,11 @@
 	status = "okay";
 };
 
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	status = "okay";
+};
+
 &usbphyc {
 	status = "okay";
 };
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
