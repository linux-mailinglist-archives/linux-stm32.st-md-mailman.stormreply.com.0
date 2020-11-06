Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A86D2A9245
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 10:19:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A31AC3FAE3;
	Fri,  6 Nov 2020 09:19:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B5ECC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 09:19:27 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A6984N6008656; Fri, 6 Nov 2020 10:19:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=AkT3nZvrMkPiCTDg+fr0IFiZsRF1AFGxLk5KsoqZleg=;
 b=Rdc8ySYh6gCTBqT/g7EsHBDlITo4yPfsZuqEUfTn/RYtpPrOu77WQ9OVNFZQSYTGPzCj
 qGiyoz+CVomRdNauuqB0RB6VISAUIuHR5maI1jyBwBUpRROux4Ey6DQwH81a0nxrB5Cr
 spTvYx/x+iDbFPh6UgMkbL+2xmYm6zu7zAX5ipwWls3kDL/mU8IDC5L+8L9720gxAo7z
 8B6kKfPPG7K5B4NPkf/3gNm78vYkO8c3HXciKkcxMVWJGzqprmof4deqZcuDWpdtsTGU
 PjjAEodBMEBm6AJzw4veOyitACOOuAThFu2UGTqqE8Kdn/XogFRCd8dRNkkXiEtZyOk+ MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gyw1uws4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 10:19:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 91AE9100034;
 Fri,  6 Nov 2020 10:19:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 77D3F233E9D;
 Fri,  6 Nov 2020 10:19:07 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov 2020 10:19:06
 +0100
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Badhri Jagan Sridharan <badhri@google.com>, Jun Li <lijun.kernel@gmail.com>
Date: Fri, 6 Nov 2020 10:18:49 +0100
Message-ID: <20201106091854.14958-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_03:2020-11-05,
 2020-11-06 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/5] STUSB1600 support on STM32MP15xx-DKx
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

This series adds missing bindings for Type-C typec-power-opmode property
and STUSB160x Type-C port controllers [1].
STUSB160x driver requires to get power operation mode via device tree,
that's why this series also adds the optional DT property
typec-power-opmode for usb-c-connector to select the power operation mode
capability.
Tested on stm32mp157c-dk2 [2], which has a Type-C connector managed by
STUSB1600, and connected to USB OTG controller. 

[1] https://www.st.com/en/interfaces-and-transceivers/usb-type-c-and-power-delivery-controllers.html
[2] https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html

Amelie Delaunay (4):
  dt-bindings: connector: add power-opmode optional property to
    usb-connector
  dt-bindings: usb: Add DT bindings for STUSB160x Type-C controller
  usb: typec: stusb160x: fix power-opmode property with
    typec-power-opmode
  ARM: dts: stm32: add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
  ARM: multi_v7_defconfig: enable STUSB160X Type-C port controller
    support

---
Changes in v4:
- power-opmode DT property renamed to typec-power-opmode and mutually
  exclusive condition with new-source-frs-typec-current added
- Due to DT property renaming, patch 3/5 is added to update stusb160x
  driver.
---
 .../bindings/connector/usb-connector.yaml     | 24 ++++++
 .../devicetree/bindings/usb/st,stusb160x.yaml | 85 +++++++++++++++++++
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |  7 ++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        | 30 +++++++
 arch/arm/configs/multi_v7_defconfig           |  2 +
 drivers/usb/typec/stusb160x.c                 |  2 +-
 6 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
