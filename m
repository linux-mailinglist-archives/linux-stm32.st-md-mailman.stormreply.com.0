Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A92119B7AC6
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Oct 2024 13:39:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E952C78036;
	Thu, 31 Oct 2024 12:39:10 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE598C78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 12:39:08 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-71e61b47c6cso699843b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Oct 2024 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730378347; x=1730983147;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gr5byz9uGWQ6qTVVNyRJz2fcSvGGfWOU5qQmAfQjTs0=;
 b=dFkxU5Ld5LQ41tky+FWJZapx7Z4ZgR6DFS2Gmk/Ou+N6MexRLZ2IchD72ASVxUAvn2
 w2KW5+IVEsJ1EJPw0DNW1c1PZSUySSLAn/A6WVeQ33sbz+ccq88W4wSlWJG7j0eTJcUK
 LXRWTfem9aD14POu3eyiAtunFQ6lgV7asR9XUV/9C5idzZ+nchbyvRwSuAA4y3jA7JE/
 UIrTdtUNKceQQFd/4yDudlFbfybofYUZboz1tSvVUUROdLzAhtjhyT3Y91kjHDbpIESD
 ZFjWFOJYSbKqpvmdcm1gaaM1AHtRJ5E4exl798GliMAT9AB3GjlaqZMDsIoQA1eIc3mv
 LuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730378347; x=1730983147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gr5byz9uGWQ6qTVVNyRJz2fcSvGGfWOU5qQmAfQjTs0=;
 b=sJqY81+ry2SFL9gJ6YSQLp9jcYOvLpqOUk5UnsTWBgLiwjj4ChaR0E3//8w/avsIUU
 I+tJnDe/rgwVzDXNAzBXJYNQs3lcQuOJ4isU2xdjo9WZWq3jrzicfOpE0fGbhHYzCWSb
 wlWUOxjx4/JFzDR1XGMPZyqHRQG1DkMXvoOXiy62JiN3mcGnKUH19z5Ok+09Rjv+HtrQ
 Op6XIQT80xh7Geos5ul/sWzBCSu+TTPryjgPIQqD+YJj4+cTKRIRbDFBrf6MPloAffx8
 oGFKzHYXZ0mezQ10SvKgBzbDi0/tBn/ofGuLUmkqnqxPiHz3BqgZCVLKhw6qeRW7WlM2
 of+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSOwMv7CJ2RYLXOthHZ6KgBzQe684QIMlc1YHXBBeY/jaJEDxqLj2gvO8iBACFjoCh28ItmulrduCgsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx7mqERDjwKDfnz3FJUJMuoei8lYazRqqoO9vYVqe7zyrY+ZygK
 gtXr6uMRlsXvEeBgJFlZ4KQOwgq7IA5CnI4oCnV2y6WJXz9ufNax
X-Google-Smtp-Source: AGHT+IFrvqh3fZqXzS4zBEWib3+Sale7tzbI8D4zdSrUqBXu2tE+RWOF0X7aeH5toWPKujtUAdjN9w==
X-Received: by 2002:a05:6a00:2384:b0:71e:68ae:aaed with SMTP id
 d2e1a72fcca58-72062f81e6dmr24955795b3a.1.1730378347148; 
 Thu, 31 Oct 2024 05:39:07 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 05:39:06 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 31 Oct 2024 20:38:00 +0800
Message-Id: <de8a31fe931152b569c4addb22bd9359c7eafddd.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 andrew+netdev@lunn.ch, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <horms@kernel.org>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v7 6/8] net: stmmac: xgmac: Rename
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
Reviewed-by: Simon Horman <horms@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index efd47db05dbc..a04a79003692 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -84,7 +84,7 @@
 #define XGMAC_MCBCQEN			BIT(15)
 #define XGMAC_MCBCQ			GENMASK(11, 8)
 #define XGMAC_MCBCQ_SHIFT		8
-#define XGMAC_RQ			GENMASK(7, 4)
+#define XGMAC_FPRQ			GENMASK(7, 4)
 #define XGMAC_UPQ			GENMASK(3, 0)
 #define XGMAC_UPQ_SHIFT			0
 #define XGMAC_RXQ_CTRL2			0x000000a8
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index f07972e47737..b833ccf3e455 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -364,7 +364,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
 	.mac_fpe_reg = XGMAC_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = XGMAC_MTL_FPE_CTRL_STS,
 	.rxq_ctrl1_reg = XGMAC_RXQ_CTRL1,
-	.fprq_mask = XGMAC_RQ,
+	.fprq_mask = XGMAC_FPRQ,
 	.int_en_reg = XGMAC_INT_EN,
 	.int_en_bit = XGMAC_FPEIE,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
