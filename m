Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6513C573609
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 14:09:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24EC8C64100;
	Wed, 13 Jul 2022 12:09:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F08FBC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 12:09:14 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DAqEtS027649;
 Wed, 13 Jul 2022 14:09:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=0nNYBKQRoohYg+GVCKTpuhNPiAljq5RXkULRe1bl6I4=;
 b=oc8IDTpiDKHJPX9hi5YiIB5NkFaz6t4QlrrxS14Qz5pFb0xQWFdDKOEcMDgn2VzAYYN4
 M5YvrOxYfLUIBvgs0kYwHT4RSJ1sDHCmu0ulSQyXaIV8dGgnOt9cmRy9xPuyJhb2ddk9
 DgLgNsuHV9mrH6hpOlfAhqFfVoqHUqMvplp0dHWuvRqsRtKBQY0Tj5WBtdfx5OjH1EeA
 Lu7n8jsTRkMUHdse/sW36Gb/0txpU1OYntS55MAdh95HM9m7g4tCHZSRGsuSSo2XzXjT
 Q9nCht2AOGOQBOXz/R1fubwo0nV7HqbevdbwFBS7ynGQd/6Wi6RcQswd3X6f2chcnuO0 Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h93cwh8wd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 14:09:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C016D100034;
 Wed, 13 Jul 2022 14:09:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BA92421ED53;
 Wed, 13 Jul 2022 14:09:02 +0200 (CEST)
Received: from localhost (10.75.127.46) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 14:09:01 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
 <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
Date: Wed, 13 Jul 2022 14:08:39 +0200
Message-ID: <20220713120842.560902-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, christophe.jaillet@wanadoo.fr,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v3 0/3] usb: typec: ucsi: add support for
	stm32g0
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

STM32G0 provides an integrated USB Type-C and power delivery interface [1].
It can be programmed with a firmware [2] to act as a PPM. Currently it
implements UCSI protocol over I2C interface. A GPIO is used as an interrupt
line.

This series adds a driver to support it, including:
- dt-bindings documentation
- optional STM32G0 firmware control and update, over a secondary I2C address
- power management

[1] https://wiki.st.com/stm32mcu/wiki/Introduction_to_USB_Power_Delivery_with_STM32
[2] https://github.com/STMicroelectronics/x-cube-ucsi

Changes in v3:
- Add connector to the required properties as pointed out by Krzysztof.
- PM support squashed as suggested by Heikki (hence removed patch 3)

Changes in v2:
- Krzysztof's review comments on dt-bindings: update commit message, use ports,
  use unevaluatedProperties: false for usb-connector schema, define maxItems
  for power-domains, adopt generic node names, remove quotes.
- Christophe's comments on driver:
  use kmalloc instead of kzalloc
  Use-after-free of buf: directly print the offset

Fabrice Gasnier (3):
  dt-bindings: usb: typec: add bindings for stm32g0 controller
  usb: typec: ucsi: stm32g0: add support for stm32g0 controller
  usb: typec: ucsi: stm32g0: add bootloader support

 .../bindings/usb/st,typec-stm32g0.yaml        |  91 ++
 drivers/usb/typec/ucsi/Kconfig                |  10 +
 drivers/usb/typec/ucsi/Makefile               |   1 +
 drivers/usb/typec/ucsi/ucsi_stm32g0.c         | 777 ++++++++++++++++++
 4 files changed, 879 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
 create mode 100644 drivers/usb/typec/ucsi/ucsi_stm32g0.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
