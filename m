Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25862914E78
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2024 15:28:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDCEDC78016;
	Mon, 24 Jun 2024 13:28:50 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1033CC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 13:28:50 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso51960551fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2024 06:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719235729; x=1719840529;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WtEe7sDqfN9JW3LcLHq6hNyDw8ZBCvPF/f0tUgUw0Ek=;
 b=BtbxhX01tBKEEaKBp7gC+tb8m6KKScVgqtQDe9ecxnguBU4rxRmRbr2QfJF4gHRc5V
 f2mwGujAdmV15B0bvMfpS5SheesOzql/5EIqjHh4C+EEp0RQZUrWiqatdeWw/H247och
 PZ4q3DGMuEcjTV5naz+hhLVidwMNE3eqr7sFgiYg2UaC54PvA01lDjLPDBhxREsDtVU1
 1lr1BH3H3vacKoLN0lEpaIxkowDF2179gkcqEA/je1buMBsMRcD0v+co4m0BHXssUoHC
 c9RSChhaUsryS+alhbA7u8JcbSwQ/U43ew8FNkwAtRWZW5o5M27n+aV3Lb3JzuBs/3wJ
 V8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719235729; x=1719840529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WtEe7sDqfN9JW3LcLHq6hNyDw8ZBCvPF/f0tUgUw0Ek=;
 b=k158KMSLHTO3Y4qrtZQEoqHrstJyfBbluiRpaRHNHil7HYFqzmcLRl85WR7Cxo1jM1
 G7le8Fs3lIpnvMyaZ6Ys+2lH3dFyu+EfcG+aVrxFYuUqf+4fDAXAuIEsXcXy4JJEiN0n
 rqqHv1RGap4HaoWZhEmfl4wxkifdVmJLj2HO0HaJWpS+NVV4wJaucvkxwrPjy0C4aTWy
 tdGAWG5MRk/YxltbFmFiY3MiiE/vN7icIFjwToH0MwCBjnxOBUcTaofn7enuTil1M9wL
 YdS1kF7KLu70w5U6+ewSmMGyu/WkngDIovcRboMzql3xbGvIWShS+NTK3ALlnH4CdE3E
 eFIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjXq4FyQnqfcGUhTawFd6TqzDwnkM19FSCk/sJzhdt5Bo6pvxLU76Kzjs3E6m3A3LAzkEuz3uJHff6GfOgfLita18tzreTVWwQEktqEYQG72WX87RFHcAn
X-Gm-Message-State: AOJu0YzK/mZOVXdbaRokOJJvnBqcZHVfCygOC9poLi87dM04nWUe+IL+
 NdVwpPYROaBfKGT26mLTOjbkBE45fsd8nQQ+KwAUX27wcXMl3iWB
X-Google-Smtp-Source: AGHT+IFPP14441T+3czwKEItmbrOsbND2YdLL8uZN7bzYoWhRPQpBDSL2HCd8X2teLzstMx3I7E0FQ==
X-Received: by 2002:a05:651c:1988:b0:2ec:637a:c212 with SMTP id
 38308e7fff4ca-2ec637ac2b5mr15471271fa.39.1719235729169; 
 Mon, 24 Jun 2024 06:28:49 -0700 (PDT)
Received: from localhost ([213.79.110.82]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d602519sm9997201fa.6.2024.06.24.06.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 06:28:48 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Halaney <ahalaney@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 24 Jun 2024 16:26:34 +0300
Message-ID: <20240624132802.14238-9-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
References: <Zlmzu7/ANyZxOOQL@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC net-next v2 17/17] net: stmmac: pcs: Drop
	the _SHIFT macros
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

The PCS_ANE_PSE_SHIFT and PCS_ANE_RFE_SHIFT are unused anyway. Moreover
PCS_ANE_PSE and PCS_ANE_RFE are the respective field masks. So the
FIELD_GET()/FIELD_SET() macro-functions can be used to get/set the fields
content. Drop the _SHIFT macros for good then.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index a17e5b37c411..0f15c9898788 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -43,9 +43,7 @@
 #define PCS_ANE_FD		BIT(5)		/* AN Full-duplex flag */
 #define PCS_ANE_HD		BIT(6)		/* AN Half-duplex flag */
 #define PCS_ANE_PSE		GENMASK(8, 7)	/* AN Pause Encoding */
-#define PCS_ANE_PSE_SHIFT	7
 #define PCS_ANE_RFE		GENMASK(13, 12)	/* AN Remote Fault Encoding */
-#define PCS_ANE_RFE_SHIFT	12
 #define PCS_ANE_ACK		BIT(14)		/* AN Base-page acknowledge */
 
 /* SGMII/RGMII/SMII link status register */
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
