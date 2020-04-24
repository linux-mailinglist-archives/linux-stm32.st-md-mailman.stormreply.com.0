Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE21B8078
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Apr 2020 22:25:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70F12C36B0B;
	Fri, 24 Apr 2020 20:25:10 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05790C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 20:25:08 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id y6so4336623pjc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Apr 2020 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/73dacrr5ih6hdF656dZ5NCkiqG8RDgJvTOSmKNoCEs=;
 b=r4xd9ee3KSRA3FkjbDp5pdoFm4oqf1ju1oMdUPs/LsELEPXvZTvfKG3lRQumA6wtBK
 x+11xAVPcf4GVSmDPoM6yZhyVTuH0Z88Wj15SecjCXvbdLCQXKiBGWk1zgiHGuKnIsre
 UznblhiyO2NnxvzlnO09WN491gJDC0If/15xLvatdvan6jKISKDaqChXy4yQAJGt+f50
 VV6RFOYRhf5L8brlwXTCehm8v5IOrJMhuIjG9/XiPVBz9bS1pgKSjPdg5Ru3DBHI3jSp
 vP5N7sSdSals8yTBFMtInrHk4tK9aYrw5h5cXjxkEnbVe9enZ5IwrJ0WDfRkBsA68auS
 3eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/73dacrr5ih6hdF656dZ5NCkiqG8RDgJvTOSmKNoCEs=;
 b=uXk5OjrKsH0s4+gYxkna97sQRFm/ndvB/R+9VDMsmy1BqhShBHtWiYQe2h2Bvx1Wqp
 GmeO3NhYawdYA5YFmNRa7DK7DWQSiI0l/+7/cmT63SeSwrDr+NRVG47OyBPgjbmT/VDA
 /PP3BHLhtDVMxIS+ukbeIHNmE/FTfFFT1zYvkSJeLv8rF38SFE/1tH+mZTdMVp4LpDAk
 KCJSNpiGBOtY4A51gCl/YvgIpjNxtL3KNwmbZU3JC/vDYxWhX//X4dEpSmqlJlWWi0Qc
 h4c/we+FmAScMGXQSyChV+vEK1atamoYh0MR0UPZHIQtKNGwYlwsrT3d3B7HGK16lww8
 iEqg==
X-Gm-Message-State: AGi0PuatDuMcUy8UhGqxEhFi9Vh5EXWl+LYYDWHzIexQR095Lju+AyWh
 fgwaAwpkEeZrBc0y34WneMQYLQ==
X-Google-Smtp-Source: APiQypLieWB+6wi/jnde8vnz/b1lgyl0vak4oSUed0SccGbaG2k63/PSP2q2PkRgO3eDH/w4o71TWg==
X-Received: by 2002:a17:90a:26a2:: with SMTP id
 m31mr8258040pje.128.1587759907264; 
 Fri, 24 Apr 2020 13:25:07 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id c1sm6553245pfc.94.2020.04.24.13.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 13:25:06 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: bjorn.andersson@linaro.org, ohad@wizery.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Fri, 24 Apr 2020 14:24:53 -0600
Message-Id: <20200424202505.29562-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/12] remoteproc: stm32: Add support for
	synchronising with M4
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

This patchset needs to be applied on top of this one [1].

It refactors the STM32 platform code in order to introduce support for
synchronising with the M4 remote processor that would have been started by
the boot loader or another entity.

It carries the same functionatlity as the previeous revision but account
for changes in the remoteproc core to support synchronisation scenarios.
Some RB tags have been removed when the content of the patch has strayed 
too far from the original version. See patch 3, 8, 9 and 12 for more
details.

Tested on ST's mp157c board.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=277049
[2]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=239877

Mathieu Poirier (12):
  remoteproc: stm32: Decouple rproc from memory translation
  remoteproc: stm32: Request IRQ with platform device
  remoteproc: stm32: Decouple rproc from DT parsing
  remoteproc: stm32: Remove memory translation from DT parsing
  remoteproc: stm32: Parse syscon that will manage M4 synchronisation
  remoteproc: stm32: Get coprocessor state
  remoteproc: stm32: Get loaded resource table for synchronisation
  remoteproc: stm32: Introduce new start ops for synchronisation
  remoteproc: stm32: Update M4 state in stm32_rproc_stop()
  remoteproc: stm32: Introduce new parse fw ops for synchronisation
  remoteproc: stm32: Introduce new loaded rsc ops for synchronisation
  remoteproc: stm32: Set synchronisation state machine if needed

 drivers/remoteproc/stm32_rproc.c | 262 ++++++++++++++++++++++++++++---
 1 file changed, 244 insertions(+), 18 deletions(-)

-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
