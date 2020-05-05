Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DF41C4DD5
	for <lists+linux-stm32@lfdr.de>; Tue,  5 May 2020 07:52:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACAD5C36B27;
	Tue,  5 May 2020 05:52:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B31A6C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2020 05:52:37 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0455lAIt026985; Tue, 5 May 2020 07:52:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=mYm1aPGrb5Sqtq3pKPGZgvor7iTnX4e9UCvFT95c2cI=;
 b=pPfbSQIn3uVS+P4qi6urtq5nSV+ua/tIE9mhET/ZUw5Uas3suoH+HSTtZJXfEY/USViN
 YhOEhBaO9PXiUnyfhgC+Pq6w3QN412EJgXJApEyU06dybvmtOWZ9i2UmFH8TjY2SmLc9
 hLNdhXxZZaCIfUmxep9AYNbaJ2ffRBJHxvRLzClz1ZNd0wRra6FKEu317HTwC7WkLQRT
 sMnu8iRwcl7aUaqqZqj6IewvKYMbuG7D+9CTSy7/6QZhMTGh3fow9oy4NtX7kGM9b1Kj
 QTAxgqTmbhvn9snOfYXUTm7g6F6Lj5XZPw5R7dTk6VYWZB6W2mIG9XkasspJhL81H4MX Rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30rx08e845-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:52:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 31E3D10002A;
 Tue,  5 May 2020 07:52:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 00B7621CA80;
 Tue,  5 May 2020 07:52:19 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 5 May 2020 07:52:19
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Tue, 5 May 2020 07:51:07 +0200
Message-ID: <1588657871-14747-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/4] stm32-f7: Addition of SMBus Alert /
	Host-notify features
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

This serie adds SMBus Alert and SMBus Host-Notify features for the i2c-stm32f7.

For that purpore, I propose two enhancements to the i2c framework.
1. Addition of host-notify client handling as part of the
i2c-core-smbus so that any other i2c adapter can benefit from it,
even those without specific HW support for Host-Notify.
2. Addition of two i2c_algorithm reg_client and unreg_client allowing
adapter to take some actions when a client is being probed.
Indeed, in case of host-notify, the binding/flag is related to the
client and the adapter might want to enable the host-notify feature
only when there is a client requesting the host-notify.
(Since SMBus host-notify is using the address 0x08 which is a valid
I2C address, keeping host-notify always enabled would make the 0x08
I2C slave address non usable).

Alain Volmat (4):
  i2c: smbus: add core function handling SMBus host-notify
  i2c: addition of client reg/unreg callbacks
  dt-bindings: i2c-stm32: add SMBus Alert bindings
  i2c: stm32f7: Add SMBus-specific protocols support

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml |   4 +
 drivers/i2c/busses/Kconfig                    |   1 +
 drivers/i2c/busses/i2c-stm32f7.c              | 198 +++++++++++++++++-
 drivers/i2c/i2c-core-base.c                   |  11 +
 drivers/i2c/i2c-core-smbus.c                  | 105 ++++++++++
 include/linux/i2c-smbus.h                     |   2 +
 include/linux/i2c.h                           |   6 +
 7 files changed, 317 insertions(+), 10 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
