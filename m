Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D57CDBCC
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 14:36:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24615C6C840;
	Wed, 18 Oct 2023 12:36:04 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF868C6C842
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 12:36:02 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-32d9d8284abso4347953f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697632562; x=1698237362;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSAhxNCccBDPfEaHOYwSm94ZHYVqbuNn4mUPNvHQg0g=;
 b=H4FYGtwCAW8j1HpLYUzN4uGsdmPb52q9skNOlQErYfRRZozMJSbbnwNOTvaxuNm/5G
 nF2VcClNsWNZ4YJaYmN7iwHhB9K/foZv3TFvO4rheZn9VtbpSSRDQ2bKdhO8klcDzeSo
 vpC6OD/cS9na26GwLbxEhN4qLZk6V1eEIeYPW1SilhrnpWgkTPjfxR5mM1rqw9uQjnyJ
 87a9WUMZ0LlvMT9oDRxMAwYMa/QYeocojy120BF2xtt9AKCIq8WuI/CFsszhIPQFJGmJ
 o/CJqr9RwxdaUjEtX5j1ExPqMe7ZdSN0hdNXuOesvYHB7xOBa0Ez9HKS7g2NxWMKC0QL
 vIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697632562; x=1698237362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSAhxNCccBDPfEaHOYwSm94ZHYVqbuNn4mUPNvHQg0g=;
 b=xG2U+Ef3Mm2PLFsrooYia9ugchNHQv0D/WSvtFGyyGH1porkOq1ndeyhI4ClJ7e5xI
 pF727ZEKl4JAV48q/vkPtyOg/s95yIMeHXhFyCRw1CQSItwjEqU4xtqXbfRPc1ToLcX/
 sf6SJ8ZLwxZHFYQSwrqbdG7pUCHqzDoAddZBdRPHJPUZCg4x8+AK3UCFgrGQJ80Xr0Nz
 Oyn9IVTDUZyTrM1EK9YnECtqTWXn6qlec39Fdv6h8qWFI/ZDajwZca9ynHTv41dY9yFj
 I5kPv4AFqU9ACghyFTQrP3v74T6IYUxohe4DMlz8DtuojfDfuskPD52sMjgI32qWvhKa
 h/0g==
X-Gm-Message-State: AOJu0YyJskFnIE+va9vBm4RIdiE3qbLHSvlXXnD1aTqdpQT58EUD0hqQ
 xAsYF4l7Q5UI2I2E8JepY2Q=
X-Google-Smtp-Source: AGHT+IFEKMKg55GmM1zKHZcYfYfsUWrXoXfEZKLoyDe07dO2uoRsG8MlML19lGyIoctSD/nE3A+OCg==
X-Received: by 2002:a5d:680d:0:b0:32c:d0e0:3e70 with SMTP id
 w13-20020a5d680d000000b0032cd0e03e70mr4069642wru.56.1697632562231; 
 Wed, 18 Oct 2023 05:36:02 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 q28-20020adfab1c000000b003248a490e3asm2048211wrc.39.2023.10.18.05.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 05:36:01 -0700 (PDT)
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
Date: Wed, 18 Oct 2023 14:35:50 +0200
Message-Id: <20231018123550.27110-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231018123550.27110-1-ansuelsmth@gmail.com>
References: <20231018123550.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v4 4/4] net: stmmac: increase TX
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
