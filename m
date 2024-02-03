Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C01D848400
	for <lists+linux-stm32@lfdr.de>; Sat,  3 Feb 2024 06:31:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DA30C6DD98;
	Sat,  3 Feb 2024 05:31:59 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 659F1C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  3 Feb 2024 05:31:58 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-5d4d15ec7c5so2567294a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Feb 2024 21:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706938317; x=1707543117;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VU5xgvL3cR0xNsh2zZS6yozISBYA1A6NcgWvOieC82Y=;
 b=Invc5oNlYVRuFfg3Nb240UNOyIGQjNno3bxxOj3bDsuO70xecQg0JW2qO9ay3XD+wW
 kO1AErRkTAK0t5Vr5isfm33qi8Kyl/ewuxyXz9bWq3P0wOqlLK1ShmBKxJ5dIoovHti/
 8C7iBEoqc3QwHoiw27StVXZtWoKJJsLTUJOEm0GnLfBix+1o7JBTVAoFaFkDxY2eH/9F
 grH5JXXckAXYNf2jxwJ6KymKr7mh/XQEdFZD8Lf1xlPtLz24XDBA6oQ6amXifDuqUwRY
 S8PFGUmTrwP9+WJHwSDR8e0iDKfWcas1kilf0uF6gXITcf7QuwZC1uObY/HEDhFNSkv3
 KY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706938317; x=1707543117;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VU5xgvL3cR0xNsh2zZS6yozISBYA1A6NcgWvOieC82Y=;
 b=ldGw18kYuk4fulNr64YzEHW9MrklOtOF1kvHD0PL1ufK9VFR2uLMxuVSQknAS//Iv+
 Q9yDjdX2J7FjJvb0XdZaKimFifeWuCWsq4wgQ1dww+LIwUMxi/MZRnPYeh8uw4YQPDiq
 aquYIHRYbnvzSJ/3Yf1jslehifcp3TG3fQgdSBQroAS5k6tv0j5Pqt91QqR6TqZGMarz
 rtjvP6+AGLuu8ZVelHD0JbWoQZ2mbuGGwE9efvKfu/dz1ytTZ7m3CesjREMdl86AVGEt
 h6LDTQmPux4+iiW6GLuuwrYIq7ar7wh9HsFqsIVJDYRcLNExkFi6ZqtMDfxbqZZAo7hV
 fakg==
X-Gm-Message-State: AOJu0Ywbkq7DN3B7TyyxoeLpyIfEtjVrXhbxrBNwpTc6HP8nyxGsTOo/
 yUDZAP+ls/P9HJ6Hx/tDbMOcRSyTx9ATG+jstn158xkITK4Vf/uA
X-Google-Smtp-Source: AGHT+IFWVqk1b0NST/97uJ2zgzmU7AmYZH/GXvS5SuXLfRb8AyJVkmN6i1eMozNxdaY3jAwfjnS4Qg==
X-Received: by 2002:a17:902:f68a:b0:1d8:fb17:a1f2 with SMTP id
 l10-20020a170902f68a00b001d8fb17a1f2mr14667824plg.34.1706938316894; 
 Fri, 02 Feb 2024 21:31:56 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW/R92Ns9HBAWu7bG/hQmdzg+lbNaMtxd1B6bSQMgjyvZ4LykqfWtBvSlY2RA/gsNvsVgPHYho+rSngrGVondwbmV+ZHPARde3dhMZ7htzR/L4OSM5UAPKGefXjZIjEFNpEP08DlSOqISkTeXSf/HA8YhUofhJexVdmsVqdN50KNYGQT4fyz2Pk7q+SQgX+ox0CJYAuja8+vRvRx7ARtZ+YFSHRmxcWYAHJg6kP1nEUcPPfzyN8gdGmbqia3dahNPr9nQeqWNKlMbLbo+FWBoE8j3WY0d+rED8yr3LatP39NsjcaaGbH9DJByzMI1yvzXQ66wg8rvjsB8jwzWaIu4AxRShBlh3YLwpV0rNe9P9uegtppmeHAtfDI9x/oCJNEtXOWA5Y8bCfjcySAQ4jRxN4ac6jtiXOzqYA0ks/r/OIfnKlzpL2xwslLh3TVqJLrs3SLI3l7/twiDEwoWVxo4T0GcQV4u3IFLyvUDN3QuwP/euZ+rIMR5M2Kai4k4FgdKWFLKUiDPAiirSYkGYoBv+2OPNseHjw35Q=
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 v11-20020a170902d08b00b001d8f6b95dcbsm2507121plv.20.2024.02.02.21.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 21:31:56 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joao Pinto <jpinto@synopsys.com>, Simon Horman <horms@kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>
Date: Sat,  3 Feb 2024 13:31:33 +0800
Message-Id: <20240203053133.1129236-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Furong Xu <0x1207@gmail.com>, rock.xu@nio.com, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: xgmac: fix a typo of
	register name in DPP safety handling
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

DDPP is copied from Synopsys Data book:

DDPP: Disable Data path Parity Protection.
    When it is 0x0, Data path Parity Protection is enabled.
    When it is 0x1, Data path Parity Protection is disabled.

The macro name should be XGMAC_DPP_DISABLE.

Fixes: 46eba193d04f ("net: stmmac: xgmac: fix handling of DPP safety error for DMA channels")
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 5c67a3f89f08..6a2c7d22df1e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -304,7 +304,7 @@
 #define XGMAC_TXCEIE			BIT(0)
 #define XGMAC_MTL_ECC_INT_STATUS	0x000010cc
 #define XGMAC_MTL_DPP_CONTROL		0x000010e0
-#define XGMAC_DDPP_DISABLE		BIT(0)
+#define XGMAC_DPP_DISABLE		BIT(0)
 #define XGMAC_MTL_TXQ_OPMODE(x)		(0x00001100 + (0x80 * (x)))
 #define XGMAC_TQS			GENMASK(25, 16)
 #define XGMAC_TQS_SHIFT			16
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 04d7c4dc2e35..323c57f03c93 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -928,7 +928,7 @@ dwxgmac3_safety_feat_config(void __iomem *ioaddr, unsigned int asp,
 	/* 5. Enable Data Path Parity Protection */
 	value = readl(ioaddr + XGMAC_MTL_DPP_CONTROL);
 	/* already enabled by default, explicit enable it again */
-	value &= ~XGMAC_DDPP_DISABLE;
+	value &= ~XGMAC_DPP_DISABLE;
 	writel(value, ioaddr + XGMAC_MTL_DPP_CONTROL);
 
 	return 0;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
