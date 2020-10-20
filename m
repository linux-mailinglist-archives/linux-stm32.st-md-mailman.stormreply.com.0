Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FD5286237
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Oct 2020 17:36:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B79C32EA7;
	Wed,  7 Oct 2020 15:36:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99C06C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Oct 2020 15:36:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097FVuqo020404; Wed, 7 Oct 2020 17:35:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=qd5+/AbCEM53HLfce4bWxYU4BP8hENng6CU0MTPn/10=;
 b=QEiEP/KU/gXmc696cLJr57K5wtltvdCI/HuHDPhlWieLmRFl0Rv1g7ddwfYroDYmsDGO
 xGYqi7jomW49c0+bxV1WlOcdxj213+v1SkIhM1nN2i2rla2ZP/Jc0OLX/OFsx5VtRSba
 gCT6WvduasmA/i6E2+1BOJ0h2lXYJvBHCnOPRHbzXuDVSSCuu3b9/6hvftQ/SFvcZa73
 lRAgIhzTa6doCmEGSJYz8ifqZGrd71OI4TGiAZEEbYIxUePZSmahVgO0ZsEX77c4VIfB
 26xcjMkKWmiy2uGFibu4FU659OwWChvdR+02oUb5ZUBm/yqVODYms2bp+tN6lfp+4R0Q qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tk5pre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 17:35:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1DE8810002A;
 Wed,  7 Oct 2020 17:35:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C75692B8A27;
 Wed,  7 Oct 2020 17:35:13 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct 2020 17:35:13
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Wed, 7 Oct 2020 17:34:57 +0200
Message-ID: <20201007153459.22155-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_09:2020-10-06,
 2020-10-07 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] ASoC: stm32: dfsdm: change rate limits
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

Widening of the supported rate range in the STM32 DFSDM driver.
The rates were previously limited to 8kHz, 16kHz and 32kHz.
Allow rate capture in the whole range 8kHz-48kHz as there is no hardware
limitation to support it.
Actual sample resolution is dependent on audio rate and DFSDM configuration. 
Add a trace to allow simple check of sample resolution.

Olivier Moysan (2):
  ASoC: stm32: dfsdm: change rate limits
  ASoC: stm32: dfsdm: add actual resolution trace

 drivers/iio/adc/stm32-dfsdm-adc.c | 4 ++++
 drivers/iio/adc/stm32-dfsdm.h     | 2 ++
 sound/soc/stm/stm32_adfsdm.c      | 8 +++-----
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
