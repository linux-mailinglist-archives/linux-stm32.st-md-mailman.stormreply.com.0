Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD1929E7F7
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Oct 2020 10:58:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29C17C3FAD5;
	Thu, 29 Oct 2020 09:58:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F00E7C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Oct 2020 09:58:34 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T9v7YB009828; Thu, 29 Oct 2020 10:58:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=sQUt5xRn/ACUiNnmpIUAUToMA3q58Ral13tfa4euS/w=;
 b=yYWqt/pqHCF6VIi88V5MdDfSi9/GPooFvFe9TrKK5YyK8Gql61BhEQZAg2nXbGXekJjL
 /Ss03WZD3C3hAJjOLTDK7N5hJj6AYf9NF7B9QdOoTgGD/KCWZc1s2nvKyDHaM2Iaq3hC
 GsY5qKIl6P8qcaFp+b7vo/HIwhgO0LoEpPtYw25cElIN9FgTQph7qUNpyy5+Lm1qAacs
 uvyPBpzz69XY0CEyEKhgNoaKx8PWERZZvR6tADv3ELXv8fqcRxqiLkSaBip1oaCKzFax
 JKm/4TWioHwPNDluyUjcPqT/6g/QEwEh2mEVpQGq5r/HQEQnJnCdFlrjtEhNExQYcDSK ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccj278d7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 10:58:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3B79F10002A;
 Thu, 29 Oct 2020 10:58:12 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12FAA221F97;
 Thu, 29 Oct 2020 10:58:12 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 29 Oct 2020 10:58:11
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Thu, 29 Oct 2020 10:58:02 +0100
Message-ID: <20201029095806.10648-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_03:2020-10-29,
 2020-10-29 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v3 0/4] STUSB1600 support on
	STM32MP15xx-DKx
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

I resend a part of my series [1] as the driver patches are already
merged. Bindings are missing and also device tree and config updates.

This series adds missing bindings for Type-C power-opmode property and
STUSB160x Type-C port controllers [2].
STUSB160x driver requires to get power operation mode via device tree,
that's why this series also adds the optional DT property power-opmode
for usb-c-connector to select the power operation mode capability and
a function to convert the power operation mode string into power
operation mode value.
Tested on stm32mp157c-dk2 [3], which has a Type-C connector managed by
STUSB1600, and connected to USB OTG controller. 

[1] https://patchwork.kernel.org/project/linux-usb/list/?series=354733
[2] https://www.st.com/en/interfaces-and-transceivers/usb-type-c-and-power-delivery-controllers.html
[3] https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html

Amelie Delaunay (4):
  dt-bindings: connector: add power-opmode optional property to
    usb-connector
  dt-bindings: usb: Add DT bindings for STUSB160x Type-C controller
  ARM: dts: stm32: add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
  ARM: multi_v7_defconfig: enable STUSB160X Type-C port controller
    support

 .../bindings/connector/usb-connector.yaml     | 18 ++++
 .../devicetree/bindings/usb/st,stusb160x.yaml | 85 +++++++++++++++++++
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |  7 ++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        | 30 +++++++
 arch/arm/configs/multi_v7_defconfig           |  2 +
 5 files changed, 142 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
