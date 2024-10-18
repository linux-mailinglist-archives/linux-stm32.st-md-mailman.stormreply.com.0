Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4000B9A35A0
	for <lists+linux-stm32@lfdr.de>; Fri, 18 Oct 2024 08:40:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05490C78037;
	Fri, 18 Oct 2024 06:40:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62782C78035
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Oct 2024 06:40:31 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20c803787abso13840925ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 23:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729233630; x=1729838430;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=TNMXQwF/uYpjYycmQePJ+qULpg6V2uaLb8GCtFhBQnNEfaXXThLWO5X0BGFAJCjneV
 0OV0FYR+owmDI7I6xr7goLYPCTW5FV8+n6RpL8KXszWBIdpg/ERnov/KHiV5O+vvShV+
 pdfcHnkgR9Y475vxWZPTChO219BanNQ2mhV1pV2wwTeSEhovmZxiQ4eR1t8teFZPZfGS
 IhWXbDLaQgr+MKnzcDS7J+kIyH3S9rTMMDXPid7HUQk/o42lQPRI4+AydIbMidS5mEfa
 wJf32OyeP4mFYEQFDtmjjPLkXE7Q7eia27r5ueZyCe10p7W43rAeaL5ue3ZTYwEMKJer
 JHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729233630; x=1729838430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZgSPrHkP+5PHa4TM3CPdf/GMcXQ4aZTX0bTblaWKZw=;
 b=EdHD6ByWd3zNuRVkVFrHgjvfStNWssHjFj0N2/ZzJ+JFmRk/46pKniH3VUpg24MRlD
 /1hAxYX4RFWnIsEpAQpsI2nDcd6zxk6IQEwbXnznKukyNwr9Zbrj5AGRvEeiFcfgIrGR
 Lt7rfl5Oiip3uLi9MNwg4aj+9DV9FdU8KYcTUdUVp/ZcobLoUqw/P5bTRyNM5Tr18xIh
 d3vRcyKVOrgPehRiUMRdmmcZ03bTdajSJB5mCT9s9cYpnKbxfz/aY6Dvpg69aqKgWknp
 8mxQ/L5fALsB/YroGXrU0eFswnGM4TxghFzUll+2ba6bFLTxuUFUymGlHrFvim/7szRq
 QlBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhcF3wnLsXxWdIwP0g/J6vHZN2SFYnKTYRvgvrNs1O9LohB3eNV3i5qbI+dyssCJX7DeoEWgx/ch79Rw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YywEtN+32a/78g3MIpDLFj3QNYqtKD6BTgS5yxdgZGfcViCa9OD
 cD1p7d3evi9Rcg/MHSauzIowCauV1K9stcmJeOxHYvlf2zHwavwY
X-Google-Smtp-Source: AGHT+IESugbPIpWfbBYQesKtzI8163cWBzPYauR2huuOlT53gaEAxREbyE0/wzo69ZzWjSymRoyEzg==
X-Received: by 2002:a17:902:c94c:b0:20c:f261:24f3 with SMTP id
 d9443c01a7336-20d47928b66mr91420885ad.17.1729233629882; 
 Thu, 17 Oct 2024 23:40:29 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-20e5a74766fsm6285455ad.73.2024.10.17.23.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 23:40:29 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 18 Oct 2024 14:39:14 +0800
Message-Id: <947ce15f80c474be286b3f969f21a74b017b89e4.1729233020.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729233020.git.0x1207@gmail.com>
References: <cover.1729233020.git.0x1207@gmail.com>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Simon Horman <horms@kernel.org>, xfr@outlook.com,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next v2 8/8] net: stmmac: xgmac: Enable
	FPE for tc-mqprio/tc-taprio
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

The FPE on XGMAC is ready, it is time to update dwxgmac_tc_ops to
let user configure FPE via tc-mqprio/tc-taprio.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 75ad2da1a37f..6a79e6a111ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1290,8 +1290,8 @@ const struct stmmac_tc_ops dwxgmac_tc_ops = {
 	.setup_cls_u32 = tc_setup_cls_u32,
 	.setup_cbs = tc_setup_cbs,
 	.setup_cls = tc_setup_cls,
-	.setup_taprio = tc_setup_taprio_without_fpe,
+	.setup_taprio = tc_setup_taprio,
 	.setup_etf = tc_setup_etf,
 	.query_caps = tc_query_caps,
-	.setup_mqprio = tc_setup_mqprio_unimplemented,
+	.setup_mqprio = tc_setup_dwmac510_mqprio,
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
