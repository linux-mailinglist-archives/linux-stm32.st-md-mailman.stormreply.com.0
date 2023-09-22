Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB447AB041
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Sep 2023 13:13:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77459C6C82F;
	Fri, 22 Sep 2023 11:13:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BB60C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 11:13:09 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so700035e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Sep 2023 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695381189; x=1695985989;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ijlwZ6JRdK1U0SnHerxGcEJGjK9VRf4PRp/VeOrzMQ=;
 b=UH0d6COzydNdhdJJnGgilqJTdPGuvTQj1qtpY5S62SFKhner1YwDSsHnT/pg/IFMbH
 1x4oOak9l5zwFlgIbo9lszb2/8MvonJv56+mF8W7JBjZIg9Msg/pUsKmVc1o50SFKCrm
 hZf0trIfLOi8kW7GbFkY8xH+LaocCp0P/rF402sUeWRKgt/SFNx617Sb4ri0H7ZRTvCZ
 KukWqOrhYqtejAq6f9kqi+musKVc0vTnSNqYipBBREgwnnmE1/ptWZNJbIhr7YR00WQ8
 pqBMvz2lgs8+LCK7Rrt80iW9BNWC/dq325NAzTODkIMeHYzPMb2pc06+2U7s9jAIWA19
 ztxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695381189; x=1695985989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/ijlwZ6JRdK1U0SnHerxGcEJGjK9VRf4PRp/VeOrzMQ=;
 b=UbZkyvXoSkO3NfCqj9ZuZmSvS7NyJwwokcVzX+wSPE6rujsG6vK/L3YD4yliRfEm98
 Ew8oiXN0uhQB80jXzWxU1vul5g4iMgHKpwf9xOzZ3V3yF/ydF7H5p1v84iL1klxhojma
 zbWnVorgpz6mVawppjVEVvyMU+CEWpgZN6reJmYx8ktcLCePyw7OUh1wolvCrtK0T34R
 HtfQoP2Eto0qHpGA+PdohHS30dD5hkPivOYhbKON2aSsmHMMnco9n7/wquU3leAIZCiP
 q6wOpyllpf9cYH1h/fOPh4BuE9g5i6Qd143iIF+MLWQyGTB/HyAFFAh++HyHeRH+09si
 p9bA==
X-Gm-Message-State: AOJu0YxyFlzsJCduY6qCNHFu3O7YdqeRc6PQ+HoLGHsDuP89rdiq6dZv
 ewattMU65LY3SyZydUgvcSg=
X-Google-Smtp-Source: AGHT+IHTzusDD1Vj12nFTAofcTh5ujgUoGMSUjxYvnBVt5FrCDDmYAOQS2TIjfWAp8W6AwxsKaiBCA==
X-Received: by 2002:a05:600c:152:b0:403:cc64:2dbf with SMTP id
 w18-20020a05600c015200b00403cc642dbfmr7548257wmm.27.1695381188563; 
 Fri, 22 Sep 2023 04:13:08 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 g10-20020adffc8a000000b003176c6e87b1sm4191765wrr.81.2023.09.22.04.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 04:13:07 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Raju Rangoju <rajur@chelsio.com>, "David S. Miller" <davem@davemloft.net>,
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
Date: Fri, 22 Sep 2023 13:12:47 +0200
Message-Id: <20230922111247.497-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230922111247.497-1-ansuelsmth@gmail.com>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH 3/3] net: stmmac: increase TX
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
index 403cb397d4d3..2d9f895c2193 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -290,7 +290,7 @@ struct stmmac_safety_stats {
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
