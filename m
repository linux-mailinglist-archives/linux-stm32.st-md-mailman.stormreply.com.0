Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F863373C24
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 15:17:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F13D6C57B5F;
	Wed,  5 May 2021 13:17:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD7A0C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 13:17:34 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 145DHMeS022118; Wed, 5 May 2021 15:17:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=oKWdkh59xaWBXpAlbJc3K7xKwP0fD1UPO9YaA7JF6dk=;
 b=XELtC+voQP/UEhp6mOTj0IhYvZm9YYViaUf3ZgfQTviRfFHehe63ZMXfylx63UJuUsfm
 BY7/n9BK8VSY7PNM30BaZ3D+HFS3cbwW2ReDumx1M0yL+fRKDsCiYFsZnzX88TLRlM4J
 n3+x7gyjmmUmDuzuiJwUnk62sY8/CC5Ir2XVBd3q7HBpHMu91ExY7OvgjMCiK70HmVMs
 331yNAMJEeuy1F+kRhDNy9YO9dmgX2uGOW+w6EDRleFIL7b8TB0/4wkOdMGLZYWIKnIg
 MqToVwA4Cl6Tk2DXMTzSZO55v4TmsXrI70yzdVNlCi7QVJrQobnkHV3mc9JiwTucS4/S aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38bea3vd3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 May 2021 15:17:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE7E510002A;
 Wed,  5 May 2021 15:17:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA7D22C4206;
 Wed,  5 May 2021 15:17:21 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 5 May 2021 15:17:21
 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Wed, 5 May 2021 15:14:37 +0200
Message-ID: <1620220479-2647-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-05_07:2021-05-05,
 2021-05-05 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/2] i2c: stm32f7: add SMBus-Alert support
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

This serie adds support for SMBus Alert on the STM32F7.
A new binding smbus-alert is added in order to differenciate
with the existing smbus binding.

SMBus-Alert is an optional SMBus feature and SMBA alert control
and status logic must be enabled along with SMBALERT# pin
configured via pinctrl in the device tree. This is the
rational for adding "smbus-alert" property.

---
v4:
add a new generic smbus-alert property instead of st,smbus-alert
update driver to use smbus-alert instead of st,smbus-alert

v3:
use lore.kernel.org links instead of marc.info

v2:
When SMBUS alert isn't available on the board (SMBA unused), this
logic musn't be enabled. Enabling it unconditionally wrongly lead to get
SMBA interrupts.
So, add "st,smbus-alert" dedicated binding to have a smbus alert with a
consistent pin configuration in DT.

Alain Volmat (2):
  i2c: add binding to mark a bus as supporting SMBus-Alert
  i2c: stm32f7: add SMBus-Alert support

 Documentation/devicetree/bindings/i2c/i2c.txt |  7 ++-
 drivers/i2c/busses/i2c-stm32f7.c              | 73 +++++++++++++++++++++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
