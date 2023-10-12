Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACD7C6A7C
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Oct 2023 12:08:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80138C6B463;
	Thu, 12 Oct 2023 10:08:42 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E2D8C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 10:08:41 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-50573e85ee0so1056865e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Oct 2023 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697105320; x=1697710120;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSAhxNCccBDPfEaHOYwSm94ZHYVqbuNn4mUPNvHQg0g=;
 b=Fu6fLUNXACKUaiZyCdO5IkbvQwpc1r4bD/ctUbHv1Q4tF/rj/NV0wyzWlLjedvsH/I
 Pc3taRLNpuN2NiMJRv682ESEY6HzRfB5XY1EkUdtFYl/SmzxvgR/2NPlz6eDDIXMcZ7B
 ya9O1qzQ7go+AvnNX8zx8s6EZ+5Eu//iTJ1yA58wBY9drTgDxeba1XjwnEXyI1M0XBRU
 LPGfsrCev3NzWQ7U3oFr9zFp0OG2TjfStpXTFs5bEkM/ohMsVy1a5nQOYgX6WyfGbkBx
 fUn6c2uVfXVXg/zjjRGZCDwSbOmE+uAguMc87YiPZyBr1aOTOb69LokVkO3By/nALmvM
 G9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697105320; x=1697710120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSAhxNCccBDPfEaHOYwSm94ZHYVqbuNn4mUPNvHQg0g=;
 b=ErfhRwcn1gE1oTOAu5r0/30irZ/EQ1bUv59ACfn6hB0B+3ntACaegw8ixdo5Xzu4jc
 xlX57J7c/jWqvxCPlwvawkI0QG1jpt4S9j/qQkuH8YSF0n+zmy9K6POZ3jiUX/TWSxr/
 XPiGufx9yrKFpqXlOQo3ydlpwOrdtYjGaA2lSJGeP/FIe4+sO5SdRX7aVvPiKitHycIu
 RFTLzXqfET5iaqXpfJMb0282Wfaq83e1XHhfbH5pDwqLZ2zMxtlYsDSUbw0mdVFfpVa5
 XtWr8HYBiprBlQIMV+EN3+QOmA2kmrpsofPjfqjiFNtrqFYcDpF7H+bKuBq+6MWkXskh
 gTUw==
X-Gm-Message-State: AOJu0Yyw7IIUDv5kTtphSKUtx9j7XqZjgIViSSWIlbwwC7dqJypynPaf
 olDEAKs8bNM27cVhREFfRAk=
X-Google-Smtp-Source: AGHT+IFS5wYVsErszFbLHXbccvljCxec7tsdB2hdb2nVZS6k8/mqAnVjAi0sisagLq6W9E03Rccilg==
X-Received: by 2002:a05:6512:210c:b0:503:36cb:5436 with SMTP id
 q12-20020a056512210c00b0050336cb5436mr18333699lfr.9.1697105320566; 
 Thu, 12 Oct 2023 03:08:40 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 dj16-20020a0560000b1000b003198a9d758dsm922737wrb.78.2023.10.12.03.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:08:40 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Raju Rangoju <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Simon Horman <horms@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-wireless@vger.kernel.org
Date: Thu, 12 Oct 2023 12:04:59 +0200
Message-Id: <20231012100459.6158-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231012100459.6158-1-ansuelsmth@gmail.com>
References: <20231012100459.6158-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v2 4/4] net: stmmac: increase TX
	coalesce timer to 5ms
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

Commit 8fce33317023 ("net: stmmac: Rework coalesce timer and fix
multi-queue races") decreased the TX coalesce timer from 40ms to 1ms.

This caused some performance regression on some target (regression was
reported at least on ipq806x) in the order of 600mbps dropping from
gigabit handling to only 200mbps.

The problem was identified in the TX timer getting armed too much time.
While this was fixed and improved in another commit, performance can be
improved even further by increasing the timer delay a bit moving from
1ms to 5ms.

The value is a good balance between battery saving by prevending too
much interrupt to be generated and permitting good performance for
internet oriented devices.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1e996c29043d..e3f650e88f82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -293,7 +293,7 @@ struct stmmac_safety_stats {
 #define MIN_DMA_RIWT		0x10
 #define DEF_DMA_RIWT		0xa0
 /* Tx coalesce parameters */
-#define STMMAC_COAL_TX_TIMER	1000
+#define STMMAC_COAL_TX_TIMER	5000
 #define STMMAC_MAX_COAL_TX_TICK	100000
 #define STMMAC_TX_MAX_FRAMES	256
 #define STMMAC_TX_FRAMES	25
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
