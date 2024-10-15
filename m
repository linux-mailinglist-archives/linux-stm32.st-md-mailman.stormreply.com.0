Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D58C99E25B
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 11:10:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 555BDC7801A;
	Tue, 15 Oct 2024 09:10:28 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99FE7C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 09:10:27 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-20ca7fc4484so23373205ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728983426; x=1729588226;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qC4ITX8vr0WBNue0oHaO5HTmQIFp73nTXTvZqY8X0oE=;
 b=TZM7//6nzK3I3fdixJ6pZ/kbWGUtFQcMgTjSqpRJvC8+hAxCU1lHFUA0Azfh4Mb3LR
 lerNZfwpe0XJNk7WPAecqh26aJyUaOXjRgO0X5mF4/s1tWrV8tmtUpp5wrTVlNj3LDyN
 tS0WQ2TsBr2yBavt4aFCJDQjaVbcy5adJMhIrVjMXCfz5VijRHzuRd/ToeSRRM7/u/ji
 kLkgpbCoZr3mo7D40u9SgngRlGRED2pY5xJNbhPfDUhgWanR0cegzEKNzr8bAZ/WDwjJ
 Gg5AH7GX2Zppp5clO+Oe+ggMRzVAwCG9LcPjm+Vlgsz3jf8xjLXYaeZEAr9LMtDXY6Rd
 8M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728983426; x=1729588226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qC4ITX8vr0WBNue0oHaO5HTmQIFp73nTXTvZqY8X0oE=;
 b=rca3GrPozWS30CwivdHUTO/WYLnA7eOd53AYQ1uXWCwUDKmLt9EfaS9azWgN/Zbnrl
 6K28MCSLLpGM7jpRAjW+WC+XGCK8SZtBNveaoaiC3WEdprY+EhP2fomyOn0P32MJFR/N
 nhT5uAd8HW13XCDJM82akZz9gXLL/y4TVSVyIqhI9IdPXxmtvtHkZ7dmKT6XoN6SV/Q5
 OSSec8l2UKIOWAF7eNIkIMXDXi2xQgrRFS0/Yj+Ya/1hrqclSTr5WaXlaThGjUFgID/B
 xwGjLk9xOPKSx/LY2j+vWDth2YzibLlXIkchkayq8DyZc4GUlzJvhnWu+aFWX91gZrQL
 7+oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0KE5Vp/EugjuTNdpgWDC89fz1rQ9iKNYmyUc2UN7XTYGAHJORCWoz3mF4XnEfFyaW5qHtdMPrUET3+w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxyvgczEObtfP5Dd/ZBULEWb6ttiWfIPg62obTetazpkcSl7W5r
 BMtoAt/4Hnk/+B3oXjk/sWxEorIOQu2ZX+c3sxfcnI1Rkd8e8rOP
X-Google-Smtp-Source: AGHT+IFdWqzBaHWfrp76YUJtczY0dt/qtyrIGQByrUQ7U4/m9oSOLWWvisslI/C2kgflrL3/LwZ3uA==
X-Received: by 2002:a17:902:e747:b0:20b:ce88:1b9d with SMTP id
 d9443c01a7336-20cbb22efb7mr169979085ad.45.1728983426052; 
 Tue, 15 Oct 2024 02:10:26 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20d17ec8f35sm7905095ad.0.2024.10.15.02.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 02:10:25 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 15 Oct 2024 17:09:25 +0800
Message-Id: <4557515b4df0ebe7fb8c1fd8b3725386bf77d1a4.1728980110.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728980110.git.0x1207@gmail.com>
References: <cover.1728980110.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Furong Xu <0x1207@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v1 4/5] net: stmmac: xgmac: Rename
	XGMAC_RQ to XGMAC_FPRQ
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

Synopsys XGMAC Databook defines MAC_RxQ_Ctrl1 register:
RQ: Frame Preemption Residue Queue

XGMAC_FPRQ is more readable and more consistent with GMAC4.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 917796293c26..c66fa6040672 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,8 +84,8 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
-#define XGMAC_RQ_SHIFT			4
+#define XGMAC_FPRQ			GENMASK(7, 4)
+#define XGMAC_FPRQ_SHIFT		4
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index 0c13d5aee3d2..6060a1d702c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -332,8 +332,8 @@ static void dwxgmac3_fpe_configure(void __iomem *ioaddr,
 	}
 
 	value = readl(ioaddr + XGMAC_RXQ_CTRL1);
-	value &= ~XGMAC_RQ;
-	value |= (num_rxq - 1) << XGMAC_RQ_SHIFT;
+	value &= ~XGMAC_FPRQ;
+	value |= (num_rxq - 1) << XGMAC_FPRQ_SHIFT;
 	writel(value, ioaddr + XGMAC_RXQ_CTRL1);
 
 	value = readl(ioaddr + XGMAC_MAC_FPE_CTRL_STS);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
