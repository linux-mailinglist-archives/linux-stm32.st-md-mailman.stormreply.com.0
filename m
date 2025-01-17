Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 930B3A149B7
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Jan 2025 07:28:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32E3CC78F7D;
	Fri, 17 Jan 2025 06:28:44 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B4F4C78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Jan 2025 06:28:37 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-218c8aca5f1so42550525ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 22:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737095316; x=1737700116;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c6+Wm5CZdNlKmE1tVKo1ksQSIgVDbHTd1rV+5hkxZOM=;
 b=I6U7p90iexb9Y1AHzUXEg4UTtcwkF5UjPFxktseRPKjtz0zG86kq5NiIKrWmrAuZSV
 C/iEb9xHW3rg/wQe1x+syIF3+g56Sem9Lhu9BEs1m0u6/nyzd4/qxAFaJp3N58lsXzqj
 BHTEPlbxZhetZWX+yQ8Y7B1pnNYYYnv4h3coJX4xe8WQB5MxwpHedGB6CxDfiV6ybSj/
 ACAyeSinKx+MNziAhV7Qag6RRF/LUu1Tcx7AQALCpVYMk8Jc6a7mISwzv+jwK4Io0aU1
 AIbzkLb5kSLhO9Hyyh1g9kgdHobeFkHFL+yALFtzHLIz7D2c88dWgmR0puHuX762OO5Q
 YXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737095316; x=1737700116;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c6+Wm5CZdNlKmE1tVKo1ksQSIgVDbHTd1rV+5hkxZOM=;
 b=fcfy2EARlDeUl430TRqG0NO1+IdpVjOHc/L8lsAdtJWUykzBMzBMdjveuVij9EewRM
 VBOYadC59Xph+FlI6HZzS9ScnDa/j9j0m3ILJDqgZX63z8lXfetQ0MKUwfM+Cv6r0OSL
 NCxJ2x9QaKvV7N5yKvUnLHSZLvU4Zk4yJ2kaxchUxS6BI66lg9twKV0OvH3AQaYKghLM
 0wmVUg9zhJhflGRKGNGTGeitmVcABpiLDs/nJenEL+C9SZGoWUvSgGqsDV7cmypvRDGr
 9Xg1ejU6JGES9KDUlQhPNZrqBgyE2If6VorV75l5Kvqu8+ybXO4NjEPQMAHocgroIBi6
 1teQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8C8VvbbPjCUCiHYhvZSLrss6RFlpzKlybwFX7MJAL4o+MNJjOiMgxkAA9m+s6+4KVV8p+H1YwFXOLwg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwS6CfsdHG1xrWKhGNz5wnbkefaoXWUTK6sVe7rYobOnbUX5m0E
 buHsWnO/mQjeHiA651AGyOoBynbY5px/xCGMZe3/qig1x1edwJUJ
X-Gm-Gg: ASbGncuuvA2qZgMkIuooSNzQxsd0HHUCB1123Lf8F9OMqiPy0alh7rR8Dv6aencrgJh
 1jv5qfk3+Vh2aC3e/mll/zUqWUfEr0SG3DnPnZRTXlgVowJE+N404ly8cMGmmSA7NM3/2sxzJOO
 DC/JaYu5UfqltCOfgJxfb012xSOT/aiIkcspA1W5oa8QjzFkI5AH5WgsEy2o4jQCSxH7aYnujNf
 mdOVm3h9rPMUG6h5XxtZsy9cHkN7QuG53/Xom3XghylnvQ9FhOZ/siHlfyykt7apW9Ojg==
X-Google-Smtp-Source: AGHT+IHyjC1e6YwY9YHvuL+IbiKZAbT/cPRhYH50ITXRrN4vHsd3qn4TLfhYEAimdjDDwE5QqrH7dQ==
X-Received: by 2002:a05:6a20:8428:b0:1e1:9f57:eaaf with SMTP id
 adf61e73a8af0-1eb2144d54amr2419536637.6.1737095315722; 
 Thu, 16 Jan 2025 22:28:35 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-a9be08a6186sm1018808a12.78.2025.01.16.22.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 22:28:35 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 17 Jan 2025 14:28:05 +0800
Message-Id: <20250117062805.192393-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Drop redundant
	skb_mark_for_recycle() for SKB frags
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

After commit df542f669307 ("net: stmmac: Switch to zero-copy in
non-XDP RX path"), SKBs are always marked for recycle, it is redundant
to mark SKBs more than once when new frags are appended.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index d99ad77a8005..edbf8994455d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5644,9 +5644,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->page, buf->page_offset, buf1_len,
 					priv->dma_conf.dma_buf_sz);
-
-			/* Data payload appended into SKB */
-			skb_mark_for_recycle(skb);
 			buf->page = NULL;
 		}
 
@@ -5656,9 +5653,6 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->sec_page, 0, buf2_len,
 					priv->dma_conf.dma_buf_sz);
-
-			/* Data payload appended into SKB */
-			skb_mark_for_recycle(skb);
 			buf->sec_page = NULL;
 		}
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
