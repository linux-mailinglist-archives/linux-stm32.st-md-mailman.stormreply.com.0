Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98183209A9F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2020 09:40:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 562D6C36B14;
	Thu, 25 Jun 2020 07:40:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAF87C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jun 2020 07:40:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P7RNI6002372; Thu, 25 Jun 2020 09:39:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=bHP02EBAOn+1XnI2EebWLmYBWJN6Wh587rzZXl9nQ8U=;
 b=tAnuXlL/Gzq4t7/ql/hJeEeUcZaqRnsyneb3xOB54hX60IJgqLVXbB2H1qj1TTDRLCtR
 hYdu0/cMLV9/SXZnKnvAoaDJLSjff1RJD1XyEq76cWYuP9yJV14HqZZWtmmZyPVdTKK4
 XtkOvU4Nj/HaPZBHbteN9U1MXagpgaBXZ2cdedxGI5mFbcw8U8UH9pHgyerYr09Aun0C
 vIH14NxV2oUv+Rbed+bT8Cb22/3W+B5HHB6mbv7ZrJmP5KSIfJA+S89pNDRCTSEkMblp
 gbhBl84qqcsQbD4bn58bAPt0IhG0Yx6v2qaCTPLLqVAayNnwItItsOWQGtk8Gd3XMqm6 cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuucgkpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 09:39:54 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 82BEF10002A;
 Thu, 25 Jun 2020 09:39:50 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 525CE2A82E2;
 Thu, 25 Jun 2020 09:39:50 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 25 Jun 2020 09:39:49
 +0200
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@kernel.org>, <robh+dt@kernel.org>
Date: Thu, 25 Jun 2020 09:39:25 +0200
Message-ID: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE1.st.com (10.75.127.16) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_03:2020-06-25,
 2020-06-25 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/4] stm32-f7: Addition of SMBus Alert /
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

This serie v2 rework comments from the 1st serie and replace the very generic
reg_client / unreg_client callback with HOST_NOTIFY only reg_hnotify_cli
and unreg_hnotify_cli callbacks.

Alain Volmat (4):
  i2c: smbus: add core function handling SMBus host-notify
  i2c: addition of client hnotify reg/unreg callbacks
  dt-bindings: i2c-stm32: add SMBus Alert bindings
  i2c: stm32f7: Add SMBus-specific protocols support

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |   4 +
 drivers/i2c/busses/Kconfig                         |   1 +
 drivers/i2c/busses/i2c-stm32f7.c                   | 194 +++++++++++++++++++--
 drivers/i2c/i2c-core-base.c                        |  18 +-
 drivers/i2c/i2c-core-smbus.c                       | 110 ++++++++++++
 include/linux/i2c-smbus.h                          |   2 +
 include/linux/i2c.h                                |   8 +
 7 files changed, 325 insertions(+), 12 deletions(-)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
