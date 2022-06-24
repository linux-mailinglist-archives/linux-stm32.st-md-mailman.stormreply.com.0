Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 595AD559DB5
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jun 2022 17:54:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 203E5C5F1ED;
	Fri, 24 Jun 2022 15:54:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C480C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jun 2022 15:54:52 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OBjq7O006621;
 Fri, 24 Jun 2022 17:54:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=HoeVTfxf/DYnA17IxGe5aE0zIDbNSRToMCzD77yE0xM=;
 b=5y8qKJRSFEWz6zPYa39P1GJFHQfOeAyM+PMZ+nM3pnGm19bIwy3Td9TTdi4ojjOy21ME
 6Z992+9TIlCnVw3ey9CkcGakXIMshKEJd8WtaIn5vnAZYmZo251o+xn7E9jMqkpIZiAG
 PGggJbwWlYXBCQHgDyuhkQbYHyB2bLpFNuQ7KAzhUddDE7lgPZYyv4znI1Xca9bhKmhW
 lAg5nCaeoYF4tJ3Wwum0T8lRaZIOILrTyT0Gxsuf4wt3NRSK1aMq70k4hrtgi1r0BqI1
 KOVPaHkSvQznU7p4M4JQ2qMPQLLD9zbulHCpNlavJIbWpd6K2oxVyVX8OoZ9IRXSsb/V 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gua1nq8b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jun 2022 17:54:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2BC0510002A;
 Fri, 24 Jun 2022 17:54:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DCFF226FB9;
 Fri, 24 Jun 2022 17:54:26 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 24 Jun
 2022 17:54:25 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <robh+dt@kernel.org>, <heikki.krogerus@linux.intel.com>,
 <gregkh@linuxfoundation.org>
Date: Fri, 24 Jun 2022 17:54:09 +0200
Message-ID: <20220624155413.399190-1-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_07,2022-06-23_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/4] usb: typec: ucsi: add support for stm32g0
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

Fabrice Gasnier (4):
  dt-bindings: usb: typec: add bindings for stm32g0 controller
  usb: typec: ucsi: stm32g0: add support for stm32g0 i2c controller
  usb: typec: ucsi: stm32g0: add bootloader support
  usb: typec: ucsi: stm32g0: add support for power management

 .../bindings/usb/st,typec-stm32g0.yaml        |  83 ++
 drivers/usb/typec/ucsi/Kconfig                |  10 +
 drivers/usb/typec/ucsi/Makefile               |   1 +
 drivers/usb/typec/ucsi/ucsi_stm32g0.c         | 777 ++++++++++++++++++
 4 files changed, 871 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,typec-stm32g0.yaml
 create mode 100644 drivers/usb/typec/ucsi/ucsi_stm32g0.c

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
