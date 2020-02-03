Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFF41503DB
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2020 11:09:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D4BAC36B0C;
	Mon,  3 Feb 2020 10:09:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0946C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2020 10:09:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 013A7laG019683; Mon, 3 Feb 2020 11:08:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+4sb3dxn9Wm1UXCadNBKjHSse+85wiCwWOp50/uIgYk=;
 b=GHPTUpU7vWN8TA0QE+qyk7CUOKxWDYcSA1qrfaYorG8q4wKKfYPX90r8nJiV7zrwUBwF
 fSC1ATigccIeEonEyDk51oKNrCsqjZKM2aSr6t3cIDYSWTKtHab9VPjkAUcvr4R/aTPv
 WfKLrhVp7yVrUJvdVFKJWXixmVqk3m8V86WfldlJScUizvxUK68Uy9mII67LbER2Lii9
 EPtas/rc+SVGKFuwppF2G0cJPi8LIPkC37Jr10WbJI/L3b7bvRDKACpVkuoQoHSRm2T/
 6CLWZF8YKAhcWC612OdeNsEJRP1YICChZsgl+gHCSeF8IY/d6csRg0buL+gXnh9Oq30i MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xvybdrs6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Feb 2020 11:08:52 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0BA6D10002A;
 Mon,  3 Feb 2020 11:08:48 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A28A92BE22D;
 Mon,  3 Feb 2020 11:08:48 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE2.st.com (10.75.127.17)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2;
 Mon, 3 Feb 2020 11:08:47 +0100
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>
Date: Mon, 3 Feb 2020 11:08:08 +0100
Message-ID: <20200203100814.22944-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-03_02:2020-02-02,
 2020-02-03 signatures=0
Subject: [Linux-stm32] [PATCH 0/6] ASoC: stm32: improve error management on
	probe
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

Improve management of error on probe for STM32 SAI, SPDIFRX and I2S drivers.
- Handle errors when the driver fails to get a reset controller.
- Do not print an error trace when deferring probe.

Olivier Moysan (6):
  ASoC: stm32: sai: manage error when getting reset controller
  ASoC: stm32: spdifrx: manage error when getting reset controller
  ASoC: stm32: i2s: manage error when getting reset controller
  ASoC: stm32: sai: improve error management on probe deferral
  ASoC: stm32: spdifrx: improve error management on probe deferral
  ASoC: stm32: i2s: improve error management on probe deferral

 sound/soc/stm/stm32_i2s.c     | 39 +++++++++++++++++++++++++----------
 sound/soc/stm/stm32_sai.c     | 26 ++++++++++++++++-------
 sound/soc/stm/stm32_sai_sub.c | 11 +++++++---
 sound/soc/stm/stm32_spdifrx.c | 29 ++++++++++++++++++--------
 4 files changed, 74 insertions(+), 31 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
