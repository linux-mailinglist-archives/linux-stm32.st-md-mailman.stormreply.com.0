Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029307C93D5
	for <lists+linux-stm32@lfdr.de>; Sat, 14 Oct 2023 11:30:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB379C6B45E;
	Sat, 14 Oct 2023 09:30:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D94CFC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 09:30:31 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4075c58ac39so29464445e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Oct 2023 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697275831; x=1697880631;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSAhxNCccBDPfEaHOYwSm94ZHYVqbuNn4mUPNvHQg0g=;
 b=TQUom2Bln/AkPaSnZTPh6nygoGoEfqeWWEnl7hCyauMww9IZ+UPYh/TKflNEW8SNBh
 kIX6OQDt70EUHoqK1FZEzYs8MEfv/RvcJT/oy4IFDeOkc0Rr7QhTo4Hq83jcfbKEieWx
 W/qYC68jtET8WgF+DUnZOflfZIUA5+a4YBsuA67dXKqcHhao2huUR07QDzvCym0j9IAW
 VVUuWwW9Of5gAnA0S5HUDHvlPHOdwEtSz4r9VqAw7LenbBfkxB8XT0oJsDV953W0IV1F
 Zl+1m7clBREUd9RqoYlZhhh/T8aF/jicq2fZQjPox4kNMUHhdLBV1eqgjJhj5VIsagC0
 /OAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697275831; x=1697880631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SSAhxNCccBDPfEaHOYwSm94ZHYVqbuNn4mUPNvHQg0g=;
 b=U9U69rwwLhNlAYiGbty/J6ZZjklNHa3CMrUxZjHTuNAnBQTeJWFNjT3LLjkPM4WlVt
 HAbBMZWbhayt89lPQF8E5WQdry8dWYQzBCkRYE5nkIESgtb7jsLhQtO8136b4BNeuEhl
 UxjlQL1BXtNpOVKbk81NfsH8Uelhii9FVdJ9GDBe0GDzyt/fvSjFHzBfjBjnjElCcWWz
 KP+INKdYwv9J9Pz8vblX/75D1IpyzGrIwbEUoYKzb27+mFk4W7M93RWmRl56kQ/LVYEB
 3yyH0nTsFUQLP6M/X+IHxWOuUefdqNR25Q/2a+h8ldjCcws7ItXaegpwmpNjTRu7NYMI
 halw==
X-Gm-Message-State: AOJu0Yz0slDL5IXSX+fk0nF9vChbxQTHRc+zQLqfPUOhMtZ+dNtKTieV
 zNI8QdaP/2SoeweTMA+fR3Q=
X-Google-Smtp-Source: AGHT+IFpFx9x4EPEvCFdXGS/SpNKLQq7KRgOHBLFfKy+KqvZNLFbEiecbXCUkuM9Sz82toMeuJ08jw==
X-Received: by 2002:adf:f084:0:b0:314:a3f:9c08 with SMTP id
 n4-20020adff084000000b003140a3f9c08mr24141801wro.39.1697275831283; 
 Sat, 14 Oct 2023 02:30:31 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it.
 [93.34.89.13]) by smtp.googlemail.com with ESMTPSA id
 u12-20020adff88c000000b0032d9a1f2ec3sm3691564wrp.27.2023.10.14.02.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 02:30:31 -0700 (PDT)
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
Date: Sat, 14 Oct 2023 11:29:54 +0200
Message-Id: <20231014092954.1850-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231014092954.1850-1-ansuelsmth@gmail.com>
References: <20231014092954.1850-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [Linux-stm32] [net-next PATCH v3 4/4] net: stmmac: increase TX
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
