Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDE186189
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2020 03:33:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF26BC36B0B;
	Mon, 16 Mar 2020 02:33:03 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72C17C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2020 02:33:00 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id ng8so440704pjb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 15 Mar 2020 19:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdMG7Y+xU0eu7euegCHI14a27CukttOQVa2zPD7qKFg=;
 b=qaD+nGz+4req7pisApL3TUgA0bDYUAFYBmMwL+17JsqmYhf05/TQgGkvVW5BleOaVN
 J/ArPj8zJhtN5OBrAcb/uch4u4bsxOR8JqLHkChDE0m25vx07AYeKrZFaF2O9GjiOWhg
 hfFwu9EFCbArdNKVZexcfOTlhp9/a/qBSUinhX/YSyraqkhfFulgcR7Pd5bCwR0pO28+
 nu73c/DvxBaxr/vmey0ww+UOL18TLJ3AFX3k/jonOGvydHwMpqQGER0OlZOKVN7jzFjA
 mgR+3Y7GiyGKn1ZGiFaXwHuPkpDMYNeR+WmKGPTHtRNQZ0BnbV03/ZGkSi0N4zqokKDG
 JtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LdMG7Y+xU0eu7euegCHI14a27CukttOQVa2zPD7qKFg=;
 b=evdY2DtnjRVs2jxNx8kDiNojD6Id3p7hjXZ8m3U0WWK0++D8JbAOweFX828w+zm9Bg
 QEk/UBnZCiEf3K+yhv+Z2wFDnAdLwrPuLWRcJBzoGhkG8pTJOrsJudcGo4hr4p3A5xHX
 q9kKWm6pbEPMFo/3pzxC3ptR9F1TOqcJ1dQ8tcnqCaB7FLId6ZrqJPWvaLAu8L1qYhk0
 NU/TRPnU4QStW2sH/Rg4r0ou5E8EMEnm4Tk3BvTqbvyVfHNYZlTryVq1cUwIFO1gHQcF
 cTf5ENEGvO0Wy6No9Fq/9/Z1ogmNc3L1Sivl6+jgUL/OXuwSaXrAd8NLrORGBvudlWjO
 PEqg==
X-Gm-Message-State: ANhLgQ3TaORk8ifzo2kM6pTC3iD4dCM0rGjuuPe5epjqsM/hewxpnJTk
 x4ot6iVc0rTCpjxsEfeKoPs=
X-Google-Smtp-Source: ADFU+vvefGbRI50sNUTTuCEtd9NhIpfisHMiyldT0aZLPmtS2/VO55W4NpqcF4zc7qkrvptmGtG9fw==
X-Received: by 2002:a17:902:b710:: with SMTP id
 d16mr22228351pls.293.1584325979094; 
 Sun, 15 Mar 2020 19:32:59 -0700 (PDT)
Received: from localhost (216.24.188.11.16clouds.com. [216.24.188.11])
 by smtp.gmail.com with ESMTPSA id l1sm14949598pje.9.2020.03.15.19.32.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Mar 2020 19:32:58 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew@lunn.ch
Date: Mon, 16 Mar 2020 10:32:52 +0800
Message-Id: <20200316023254.13201-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 0/2] net: stmmac: Use
	readl_poll_timeout() to simplify the code
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

This patch sets just for replace the open-coded loop to the
readl_poll_timeout() helper macro for simplify the code in
stmmac driver.

v2 -> v3:
	- return whatever error code by readl_poll_timeout() returned.
v1 -> v2:
	- no changed. I am a newbie and sent this patch a month
	  ago (February 6th). So far, I have not received any comments or
	  suggestion. I think it may be lost somewhere in the world, so
	  resend it.

Dejin Zheng (2):
  net: stmmac: use readl_poll_timeout() function in init_systime()
  net: stmmac: use readl_poll_timeout() function in dwmac4_dma_reset()

 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c  | 15 ++++-----------
 .../net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 15 ++++-----------
 2 files changed, 8 insertions(+), 22 deletions(-)

-- 
2.25.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
