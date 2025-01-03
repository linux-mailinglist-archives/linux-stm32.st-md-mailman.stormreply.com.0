Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B030A00727
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 10:38:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52ECCC78F67;
	Fri,  3 Jan 2025 09:38:07 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E53DC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 09:37:59 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2166f1e589cso202880515ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 Jan 2025 01:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735897078; x=1736501878;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tIWKiLB8KnEZOm+SI6dbLJmqYzCWnnlF58g0NlWh4Tg=;
 b=UlCllxkctyQ4aqy0dcckRk5K+oaUNXtzYWgWrCbeO0JJzktY7pQr8gMnNJEgJEgAkP
 ENA/NnT8ufdad0EENUMPR5Z3/wJWcXcGrbR5OgIlsjtCrXPhPimtZLq2DEcn92vUYV0J
 lzrqT+cd2+tM820//M5V6cH2lTu0ah0K5Zg13XWGqVi/zrHCCKL7+mu2HB/b09PgpVeI
 XGamc5ywgEyUcVG4OlIsw/+lPOIrbUQKnswgee2HwU76MMiSZOQtjkOAw0kJKUFiyevO
 Gf5ga21J/WenXy/oGGngium8PSgVPrfq48D5j6IZCuOyKQN/qtbdTKGNCcE0q7aGcMaO
 5v/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735897078; x=1736501878;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tIWKiLB8KnEZOm+SI6dbLJmqYzCWnnlF58g0NlWh4Tg=;
 b=NknlL8p4Sh34ZUTYep2Kj/bKn9eSEx4f7PLRURrI1OW94cXU6JxaNl/goByui2Xn8w
 410ZN/CZhQQmceZo6MkQqZi4c6cfxPMN3Clj8Kizhb24UyxOEdrN4YcfINX4Yk9xauww
 Tk5/kwMQEsTZ7kQW9KOmNsIrcedWW/CO0np/+6llOv3ERQh972u3ArXyA1gL6pcxDk27
 EjoRADNYo9lIYxh8CNd065yIR8zjU+KivpUp2Md9GQAlbx2FkXv9PdqHe1u2zEso5mww
 YWgH5BWmI63e1+VZuHxYG/NgItoBpgNRETYnMezf9yrV+8kWP4Yv5/ZC1YNBNdnmWeNz
 2FEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvB4+MWdSMeNyh/el6+G1hah3DVhz1jt/jYJ2yxGNEkjwCXHc2FxioKCu5LAzANTjQXEsD6F/BR0N79A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfVCV9NWm/OghOrNJJUAIb+o7UFA8BTE6CMzoJBLQyhtIKPNXO
 26gyEHqUlEUMx+DDY3q9h/unf9PNl/VBoUqVfVlZLiJzMBtXMicY
X-Gm-Gg: ASbGncvlE/79MuNkXPF2DaLqfC/R6z4Kx7NXRV4G5mpivFJ22wZyTfqfNP/89cF8T49
 kRSS4NgUfMgiqRYUEZS7rBPEE+GHMYYiZXlVnPp8xK3mgT5yLxA7O7CzxZ6Z2Kep8QwsYbTT0wm
 JVy1NPpNofUhjJTjF7M9QqYRaoOlOAhAWkVK4XxpH3ti4PWGaGAJ0uWTuT+H6RefXh0BOXYmd/u
 rix3YmNBjAj6Rgm976kOZkiVxkKx1o++8b1CudDoJ83QveYZzsTu92Yb+MjTKyQxELCiw==
X-Google-Smtp-Source: AGHT+IEsfYK7/PGJhM8Gb1hlU/h+2ggzuQZhcjiI2RfwOotYgSfS9FXc9Ht12SveoR4AdIe31Pb6mg==
X-Received: by 2002:a05:6300:7113:b0:1e6:5323:58d1 with SMTP id
 adf61e73a8af0-1e653235b45mr18248605637.26.1735897077548; 
 Fri, 03 Jan 2025 01:37:57 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-72aad848020sm25860479b3a.81.2025.01.03.01.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 01:37:57 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri,  3 Jan 2025 17:37:33 +0800
Message-Id: <20250103093733.3872939-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Furong Xu <0x1207@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1] net: stmmac: Set dma_sync_size to
	zero for discarded frames
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

If a frame is going to be discarded by driver, this frame is never touched
by driver and the cache lines never become dirty obviously,
page_pool_recycle_direct() wastes CPU cycles on unnecessary calling of
page_pool_dma_sync_for_device() to sync entire frame.
page_pool_put_page() with sync_size setting to 0 is the proper method.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 6bc10ffe7a2b..1cdbf66574b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5472,7 +5472,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
-			page_pool_recycle_direct(rx_q->page_pool, buf->page);
+			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
 			buf->page = NULL;
 			error = 1;
 			if (!priv->hwts_rx_en)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
