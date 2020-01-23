Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6804146DF2
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 17:13:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81145C36B0A;
	Thu, 23 Jan 2020 16:13:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DF30C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 16:13:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00NFve58031431; Thu, 23 Jan 2020 17:13:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=r/6c10V8HCc+Fjz5JnvPVy9a3NtCwRdREVfF/KVqSgI=;
 b=mflejtxGm2ZsR5E0/hbbcq1Oo447wSLkEP+G3mDuj0rX49pqJ9zqYU2mwjm4xrX2jvJr
 KrCUGIzhfBYBAb0++x80C6DT4bOeLYpQq2g+8LDYfFC9FW9kI2vPeUBK80s6jiiR4Pov
 QCwBti+In5y6kpMIirp/8v8Kum09D+GcHq7aWQzY09tXJheXLZkHs7+TieIPnUwxrRi0
 bpBT+2ejWoA/Fnc3r2zjRTnAjOgCF6Rk6kZSs+KC0nwSomLvEH4crhh7pC2z+m/BIRX7
 WDi4sNaWAJd6d2tO3RigPp3atGuzGONQD6tt9HmP/uAk6Fd+JI6I/A0Tf1bmSBycgjxW kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xksspaynq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 17:13:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 457BF100038;
 Thu, 23 Jan 2020 17:13:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 290DF2BC7D5;
 Thu, 23 Jan 2020 17:13:16 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan 2020 17:13:15
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <robh+dt@kernel.org>
Date: Thu, 23 Jan 2020 17:12:45 +0100
Message-ID: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_08:2020-01-23,
 2020-01-23 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/5] i2c: i2c-stm32f7: enhance FastModePlus
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

This serie enhance Fast Mode Plus support in the i2c-stm32f7 driver
(support suspend/resume) and add the support for the stm32mp15 SoC
that has new syscfg bits.

Alain Volmat (5):
  i2c: i2c-stm32f7: disable/restore Fast Mode Plus bits in low power
    modes
  dt-bindings: i2c: i2c-stm32f7: add st,stm32mp15-i2c compatible
  i2c: i2c-stm32f7: add a new st,stm32mp15-i2c compatible
  ARM: dts: stm32: use st,stm32mp15-i2c compatible for stm32mp151
  ARM: dts: stm32: add Fast Mode Plus info in I2C nodes of stm32mp151

 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  6 +-
 arch/arm/boot/dts/stm32mp151.dtsi                  | 18 ++++--
 drivers/i2c/busses/i2c-stm32f7.c                   | 75 +++++++++++++++++++---
 3 files changed, 83 insertions(+), 16 deletions(-)

-- 
2.7.4


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
