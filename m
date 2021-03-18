Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C02340714
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Mar 2021 14:45:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBAAAC57B7C;
	Thu, 18 Mar 2021 13:45:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C122C57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Mar 2021 13:45:14 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IDg0xD011735; Thu, 18 Mar 2021 14:45:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=1cBACOkWwFgVHLV1t08H9i06ryZ+4fiD69xR3S9lcVw=;
 b=JchpHIeunO2KnBLqZHVTgCdLTG8myMSefqgkx+8OqFwdD8bTdBV07oHWUyzqr1S6RarE
 QiYIEgNeGjFRh6EVc09gZQ2HSjTJYCnQktPLssEoKXSpWEZkKP4Nr/iY/bBlqpV/SgOf
 /niu8H2IFaCH/ERHXbdMx3EzkubMXslJvJXVA4xhcWLIgRCHTj/kCJeTM0Glq8nUc+Xq
 Uo1YDAJPNC+UfoLcvsO6vTJjvB3w1h9kPdYgjxCtKyOvKE1yBUnuohpAGDAJKsdWxkjp
 MYrmWX8cjY9eDDXN8TgA6vJtIqM3I+JAomusxKmEu6cqMxCx9Dmw1xwpNWeroMzddARS Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 378pr65pu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 14:45:02 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 72072100034;
 Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 56915226D15;
 Thu, 18 Mar 2021 14:45:02 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 18 Mar 2021 14:45:02
 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Thu, 18 Mar 2021 14:44:47 +0100
Message-ID: <1616075089-28115-1-git-send-email-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_07:2021-03-17,
 2021-03-18 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, alain.volmat@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/2] i2c: stm32f7: add SMBus-Alert support
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
A new binding st,smbus-alert is added in order to differenciate
with the existing smbus binding.

SMBA alert control and status logic must be enabled along with
SMBALERT# pin configured via pinctrl in the device tree. This is the
rational for adding "st,smbus-alert" property.

---
v2:
When SMBUS alert isn't available on the board (SMBA unused), this
logic musn't be enabled. Enabling it unconditionally wrongly lead to get
SMBA interrupts.
So, add "st,smbus-alert" dedicated binding to have a smbus alert with a
consistent pin configuration in DT.

Alain Volmat (2):
  dt-bindings: i2c: stm32f7: add st,smbus-alert binding for SMBus Alert
  i2c: stm32f7: add SMBus-Alert support

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |  5 ++
 drivers/i2c/busses/i2c-stm32f7.c              | 73 +++++++++++++++++++
 2 files changed, 78 insertions(+)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
