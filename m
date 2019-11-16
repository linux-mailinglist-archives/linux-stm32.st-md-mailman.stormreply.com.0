Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A816FEB5B
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Nov 2019 10:41:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26FE2C36B0B;
	Sat, 16 Nov 2019 09:41:11 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66E8DC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Nov 2019 09:41:09 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bb5so6444182plb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Nov 2019 01:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=qiKpDqxor3KUPMlSYGxk73RwYW/8ZTPLFV2q2AOqPwA=;
 b=W0ha5aHVkIGBLHwz/gdctkLmI4Oql1roTIHHOzCoD2VoPA6H+wa/xnBl+cs8UD5BOM
 TqAAMleVYFKgE2Fh9xJGTXJI+98T1GYERAcv8VsFeRYFOv9E3ABzxWRepgCXeTf0qvHG
 TpGjaFD0g0tdxsfZaFCTEbp6AdWP/Sl4yKGW4Qzun0mjABtnyHTIS4jeWCNU4zs1qKfN
 oO3rDQh9uMU9bDV92eZUvEnJZsEfyb+l0D8nfKPdWsliLYKJOodSv+T3soY8EXSfn8LX
 kwkoWAoO9zMkkLsIaqzq1+quFn+N8iuofy4HbNUqvGUavZmmx4JzID4nyCsj8j9A7pOa
 Dafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=qiKpDqxor3KUPMlSYGxk73RwYW/8ZTPLFV2q2AOqPwA=;
 b=eft7f3SsfKQFMkzc+R5hWV9w5D7/wM2EhnlkS4DKM/1I+2uLHGVNPd6j4vBEbKT2Hd
 ldEQzPy8iHvwIf0k8+drer4hY90Z+jVEFyWhGwvCu8yrNM4NmoclG46hf5wPSKU1OEP7
 RQSok4pjY/XEOT2WEXpCFp3SXj5eQNjc/Ls1ujosqEUg8ggsVl8eKXQorLgV144kGQ9G
 vRpPzOTSaXsoArGhwlPMxyWUIPq9/JTsE3bG6WaD79ySjeVMeHt2Aycm2sQLrLaibULy
 LDMxn7QVrRQtQL6YhJlQdQ1jce7zbhzZAbwFj5nxTrZ/jszUbLau1gMg8zF1esEdVsln
 qGGg==
X-Gm-Message-State: APjAAAUh4ug6+y7aVOCV++/O0A1G+kBAnWQulW8quLJP7PZEauxLjGG3
 prhMkcA4Ur0Q3+76yLnddfo=
X-Google-Smtp-Source: APXvYqyW6+jLj/VO7pVPjaOQjAqUjgSvy7AbiRgLXW2biey8wHyiwFbIYDRR3iLvuMHbxUJ9v7EUHQ==
X-Received: by 2002:a17:902:547:: with SMTP id
 65mr19631123plf.239.1573897267640; 
 Sat, 16 Nov 2019 01:41:07 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id q70sm16531609pjq.26.2019.11.16.01.41.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 16 Nov 2019 01:41:07 -0800 (PST)
Date: Sat, 16 Nov 2019 15:10:59 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20191116094055.GA4863@nishad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: Use the correct style for SPDX
 License Identifier
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

This patch corrects the SPDX License Identifier style in
header files related to STMicroelectronics based Multi-Gigabit
Ethernet driver. For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac5.h   | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h | 2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
index 775db776b3cc..23fecf68f781 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac5.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
 // Copyright (c) 2017 Synopsys, Inc. and/or its affiliates.
 // stmmac Support for 5.xx Ethernet QoS cores
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 99037386080a..9d08a934fe4f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
 /*
  * Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
  * stmmac XGMAC definitions.
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 509daeefdb79..aa5b917398fe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
 // Copyright (c) 2018 Synopsys, Inc. and/or its affiliates.
 // stmmac HW Interface Callbacks
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
