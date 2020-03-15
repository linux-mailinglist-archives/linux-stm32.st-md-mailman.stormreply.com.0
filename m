Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B87E185DB7
	for <lists+linux-stm32@lfdr.de>; Sun, 15 Mar 2020 16:03:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35D13C36B0B;
	Sun, 15 Mar 2020 15:03:16 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FF17C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 15:03:13 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id np9so54738pjb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 08:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B8euPoU5e8gVJfEN+dqKJ4mb2aBkkDDZAefTe4BflGU=;
 b=HIbodmEHPL7BJVP1+vBLIeAl86VaRnzD3LjgYEmhF1Bcp2astEcQHLtvnTLtefzapZ
 2NxKakGRUfYUqoYAQQAhgGXFyTjR93j2o5pTgbDpeLcRTylKqnmDLLnw55UyOxZg1GiR
 XUcEUuLQgx3bjHv0eVcvpWwi5dMiOrICctc8TFUZGqOW3wL090KZYiL0RX6ZpKJynl9X
 ujTN56qMdeMBICyH5pvEUO9zEjenwL/tHusIgOT0UryA067Loiqe/wtbWLB2HV8cMyAv
 jUTsAk0SC0s2Lo3ybUGs5DioF2Pdwy4cSOHuivUo1MxF1vE5meI4fPv7COvvdkj3ypFs
 eF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B8euPoU5e8gVJfEN+dqKJ4mb2aBkkDDZAefTe4BflGU=;
 b=poYx2F19vjw2ZxWlzcKrGgcNELCtFaCQSjIz4WMIHqfM/T9I9JK1RgpDbZ4+bnAROR
 BPW3ks+paXlEKzJxvD0fDLikcfbpGg+DJyCh5RTVRQQQAjoJxPhAGw4as/6lBraloz3S
 8Sb7XHHyH0SsPYBwJCk/Pr25jQ5UOyM0Nlj2ChisqmYMkAQROn9uj3RDh0u9VLNzfBmi
 8y3sJ+5BDE4gtAr2lhpjaGEVWJ56ZTVEjT8gu4n3Ax+bRB/YboN/McnnbIYQM790kIMD
 xbO6zxgDmkz726qblz3s+Ld2svkWSuvH0MOTXJTyPZ20STM6uaQk9ne6pN/tjr2WGL0F
 dIzA==
X-Gm-Message-State: ANhLgQ0or1O3BKGZZo6Sndmnw1IY4uMM6zK0S86lt7Z9lTeAXAt/x2m4
 qYrGfBUR+l4ztPfZvcF85hI=
X-Google-Smtp-Source: ADFU+vuc3s3gOmDyjgqaA2Fbl1WL6S/lDyGeRqS4gyUQ6ZQijL0Hcz/WxwK/a63/DvsP0K83onsM9w==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr19745646pjb.45.1584284591722; 
 Sun, 15 Mar 2020 08:03:11 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
 by smtp.gmail.com with ESMTPSA id l11sm17271115pjy.44.2020.03.15.08.03.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Mar 2020 08:03:11 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 15 Mar 2020 23:03:00 +0800
Message-Id: <20200315150301.32129-2-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200315150301.32129-1-zhengdejin5@gmail.com>
References: <20200315150301.32129-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/2] net: stmmac: use
	readl_poll_timeout() function in init_systime()
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

The init_systime() function use an open coded of readl_poll_timeout().
Replace the open coded handling with the proper function.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v1 -> v2:
	- no changed.

 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c  | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 020159622559..2a24e2a7db3b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -10,6 +10,7 @@
 *******************************************************************************/
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/delay.h>
 #include "common.h"
 #include "stmmac_ptp.h"
@@ -53,8 +54,8 @@ static void config_sub_second_increment(void __iomem *ioaddr,
 
 static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 {
-	int limit;
 	u32 value;
+	int err;
 
 	writel(sec, ioaddr + PTP_STSUR);
 	writel(nsec, ioaddr + PTP_STNSUR);
@@ -64,13 +65,10 @@ static int init_systime(void __iomem *ioaddr, u32 sec, u32 nsec)
 	writel(value, ioaddr + PTP_TCR);
 
 	/* wait for present system time initialize to complete */
-	limit = 10;
-	while (limit--) {
-		if (!(readl(ioaddr + PTP_TCR) & PTP_TCR_TSINIT))
-			break;
-		mdelay(10);
-	}
-	if (limit < 0)
+	err = readl_poll_timeout(ioaddr + PTP_TCR, value,
+				 !(value & PTP_TCR_TSINIT),
+				 10000, 100000);
+	if (err)
 		return -EBUSY;
 
 	return 0;
-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
