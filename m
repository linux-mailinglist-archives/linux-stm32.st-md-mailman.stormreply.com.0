Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C71F9CD2
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jun 2020 18:16:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6EA8C36B11;
	Mon, 15 Jun 2020 16:16:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B676C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jun 2020 16:16:26 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FGErYJ010869; Mon, 15 Jun 2020 18:15:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bZLdngu1T79B9CrirZEYQHkjEj22wNJY7PUv6kBJrmQ=;
 b=NQIobxBr+rX5VTLmyc7vPLHNgD3LW8Pb5hHYFgsZU9bIOm3wJ7mtTY7nG0ADsWidmAZz
 cyOykLhl35Y6R+kzqh3uioxLQTDj3bGvUOMZ+6jh06Wt+RUzCbGUbqCJrhjzveVq8n6H
 ln5d6knEOJXKn1CyMttgX0LcEL9XA1KvlDJHAWQR7KYk6NJGkNlMEZM7tG3OHz1cGTop
 bfiYMS+XddAzUl3+NpFXQ7mPsxSePA/ESi3vKt3xhl/yebjNJZlhVX+OKycYVnnzScjY
 jFJ20LrnH9eHZINBGRZStfoWxBpq+0ZN7CaZm1c4eRUXZ7Qh+JjGxyPKSLwHUmrQrqos 7A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31mmjvthhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 18:15:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 241B410002A;
 Mon, 15 Jun 2020 18:15:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 02B062C5AD8;
 Mon, 15 Jun 2020 18:15:47 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jun 2020 18:15:46
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 15 Jun 2020 18:15:06 +0200
Message-ID: <20200615161512.19150-1-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_06:2020-06-15,
 2020-06-15 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/6] Add STUSB160x Type-C port controller
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

This series adds support for STMicroelectronics STUSB160x Type-C port
controllers [1].
STUSB160x driver requires to get power operation mode via device tree,
that's why this series also adds the optional DT property power-opmode
for usb-c-connector to select the power operation mode capability and
a function to convert the power operation mode string into power
operation mode value.
This driver has been tested on stm32mp157c-dk2 [2], which has a Type-C
connector managed by STUSB1600, and connected to USB OTG controller. 

[1] https://www.st.com/en/interfaces-and-transceivers/usb-type-c-and-power-delivery-controllers.html
[2] https://www.st.com/en/evaluation-tools/stm32mp157c-dk2.html

Amelie Delaunay (6):
  dt-bindings: connector: add power-opmode optional property to
    usb-connector
  usb: typec: add typec_find_pwr_opmode
  dt-bindings: usb: Add DT bindings for STUSB160x Type-C controller
  usb: typec: add support for STUSB160x Type-C controller family
  ARM: dts: stm32: add STUSB1600 Type-C using I2C4 on stm32mp15xx-dkx
  ARM: multi_v7_defconfig: enable STUSB160X Type-C port controller
    support

 .../bindings/connector/usb-connector.yaml     |  11 +
 .../devicetree/bindings/usb/st,stusb160x.yaml |  85 ++
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi      |   7 +
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi        |  38 +
 arch/arm/configs/multi_v7_defconfig           |   2 +
 drivers/usb/typec/Kconfig                     |  12 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/class.c                     |  15 +
 drivers/usb/typec/stusb160x.c                 | 875 ++++++++++++++++++
 include/linux/usb/typec.h                     |   1 +
 10 files changed, 1047 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/st,stusb160x.yaml
 create mode 100644 drivers/usb/typec/stusb160x.c

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
