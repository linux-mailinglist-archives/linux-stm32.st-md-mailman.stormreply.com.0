Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5312583AB
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Aug 2020 23:38:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6F59C32EA3;
	Mon, 31 Aug 2020 21:38:06 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4275C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Aug 2020 21:38:02 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id o16so608298pjr.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Aug 2020 14:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hv3iIpISK+Eauvn2X+pBHs6mFWEi7dy0S6XImcuWXSA=;
 b=OoSQtxW0+3StDvjlRlEx76r1riZgAyXM6VLcswEInCWblGV3xuGwJyaBg0whjjotcM
 wbH5LSI2btvaYWjdAMl8iD8+jfMtNajn/k+jdCapSLxs2PUL9hFiwcbCyWlG2CEiNyuE
 imvA+k5Cp1q54kbpN6IFAXldiwPGnNiDWDg19+L1/3R7QHHB5U7xuReYGKicSFPbD3vu
 T10liVf2z2TtjFiLG9Ie/jgxDwgxN7vRdpL2r99IO5n4U0S6pPseE5xhSbb6AJU/JT3q
 e47+qDo+iusgo3/v0drWT23NdWz5Cb7f8ftbffL7SD4KUSm1r5UVc66381v8afJ6BXnB
 uPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hv3iIpISK+Eauvn2X+pBHs6mFWEi7dy0S6XImcuWXSA=;
 b=FIHI79Qz3TPJEGa5MmqRkixR2prsf46h4V+3OT7aan2332Auj3V+lJcHccGDtJbtio
 7v2xXGhW2/qo9iE10kENZ8ouQo59KETZphp/tBQ06C1Q+jPh65oG0iePp/TnK7UJH3AB
 tTOhIG9UZZ6/O6FbKbyFCc3plnN1GSK79G42i6HhcRxCT5v4SxewBRyz/Qllk7YtkZiQ
 qTQfdE+baPlLQf7gfPaVto901iPzebtsAp4KP3VpSHi/Xw+YIgZAQMyh2TuZo45fuHcs
 kmKqlVjLAZX6BrUACLIfNPFy0wx93CDzsWnb/aClt52Hn2K6+j+MVXdRfRkXxE4JlYj4
 g1bA==
X-Gm-Message-State: AOAM530vkQ7AdD0MRQeAZFBBDmxfgNWSYxd8c7pBVDRnjb/UQF1y+JrT
 KoMu50GaJ2HAYAU8iYe91Ao8qg==
X-Google-Smtp-Source: ABdhPJwOasYqywsqH/gXmdcdXJCqpia6QSc5UMEsjUUKJTmBkUyNf87L6K0ndjbpJfKkGCtLXdwLyg==
X-Received: by 2002:a17:90a:fe04:: with SMTP id
 ck4mr1235872pjb.210.1598909880687; 
 Mon, 31 Aug 2020 14:38:00 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m24sm8525514pgn.44.2020.08.31.14.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 14:37:59 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com
Date: Mon, 31 Aug 2020 15:37:58 -0600
Message-Id: <20200831213758.206690-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] remoteproc: stm32: Fix pointer assignement
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

Fix the assignment of the @state pointer - it is obviously wrong.

Fixes: 376ffdc04456 ("remoteproc: stm32: Properly set co-processor state when attaching")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/stm32_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index f4da42fc0eeb..d2414cc1d90d 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -685,7 +685,7 @@ static int stm32_rproc_get_m4_status(struct stm32_rproc *ddata,
 		 * We couldn't get the coprocessor's state, assume
 		 * it is not running.
 		 */
-		state = M4_STATE_OFF;
+		*state = M4_STATE_OFF;
 		return 0;
 	}
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
