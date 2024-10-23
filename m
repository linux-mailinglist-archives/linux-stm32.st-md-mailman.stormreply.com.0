Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 524839ABFBD
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Oct 2024 09:06:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BDCCC6DD9F;
	Wed, 23 Oct 2024 07:06:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B747C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 07:06:38 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20c6f492d2dso74826125ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Oct 2024 00:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729667196; x=1730271996;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8TKGjQeKzNK1dKhEB6C1AtEwQljW8KsdP2zdrjwMfM=;
 b=W4uEaRGl9p2TkZXvoElBg9VFQTfmWbjoo6QXUTia1+P1rU7MNeUbRIcqQ5padvpR4t
 MIC1pbVQY/KhuYPPgkV1Eqj32oE0wxO6JfE+5T1C+kGI0Uaa6KRxjk7qr/wS8HvxphSQ
 vo1gqTp+nTgDI+AJM0WuoNs/KCA4WHfXAOXRAPnWmALXlXB2ZkZO0TYiEDkgu64P5zhK
 /C80DujoUDSgDrfVTggOhVfP0K3SpWvHhO8KuJLFrT5u4mYXHcc5BSF2Gct/4+zLB9UU
 uq3NjFGrMtrJWxnRyhQifUsym4brUqFOCtAbEkxCa2+iD/G/iFow19HifiNwJLOaV2FP
 h3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729667196; x=1730271996;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8TKGjQeKzNK1dKhEB6C1AtEwQljW8KsdP2zdrjwMfM=;
 b=lOBCvQdqDVh/pC+IVKCDkSWXir8XrjYluq+cEipNjUI8f1p237enAxWbbgkeLrpBHu
 ZruvTVfehmqt7nQl51G1Z7mi2wPOhrsuNdoH7jsUVuP04aWETt/RsGAyKyQK0Efo3PP7
 VtVAAb4hLTagBO9d2Rdwf2UwXpSXcIEds9owgqd+6C1+/8doU3zoduGpQAnDgeh/izHx
 tIIUsrOw9V+WACLUV5f6EdVINQV/o5mktYkJ904anJQKP3qFy3ZOLBAgBHWMZs08m46t
 xsygrfjKr8SOmrYrdSiJYtwRCOyBcJ4O76gnl+iXCME+8YLpYO2iT4of4pYwh1v0aTFN
 3azQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkXVB8KB7sC8umLpdrjJfYbMa2tGV/4nrhfKO3+opNdZbOQ4kvXqtkIq4UZitDMqosz0Z4SbnE5zzwlA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwQb8RDIaLmbeMRF491InqLF+rddm/asmeHtSvDuifPGBSryJwf
 l9SDJDzOJA6waL0F+DRZuM9jN0OpJyHlSFWH8xZdSTJUIQ0ZmARYD2Bz8A==
X-Google-Smtp-Source: AGHT+IHSnPv/WVNjHv6HF60PoAyBSgQDVxcTkHtmIHwy9EeV+7EtdLPdzYBRIDwHlO+bPFZudD1FSw==
X-Received: by 2002:a17:903:2306:b0:20c:e222:619c with SMTP id
 d9443c01a7336-20fa9e9f8dcmr23396015ad.42.1729667196354; 
 Wed, 23 Oct 2024 00:06:36 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e7f0c167bsm51981745ad.140.2024.10.23.00.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 00:06:35 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 23 Oct 2024 15:05:24 +0800
Message-Id: <137e7cf0cb5e6c3e6cbe7f8fe7c979a70373c0aa.1729663066.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729663066.git.0x1207@gmail.com>
References: <cover.1729663066.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v3 4/6] net: stmmac: xgmac: Rename
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
index d2ea941370dc..f7d48bf2faed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -373,7 +373,7 @@ const struct stmmac_fpe_reg dwxgmac3_fpe_reg = {
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
