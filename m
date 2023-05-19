Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B070B4DA
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 08:07:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99129C6B455;
	Mon, 22 May 2023 06:07:25 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBFE5C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 11:25:15 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-5343c3daff0so2113631a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 04:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684495514; x=1687087514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6BlLLSb4t/MYbESNdbnlmX8aWP0pTO6ZrGYiXtEq3JU=;
 b=AdTJK5Yy8ERyK+67dFz4QkLtifLll3Mh81VfJnwH6n2WmKtkscqtfrb18kd61SrlMk
 rEYjInP3g6CL/QzhLYXKtHy2rqbRnLySMQrx4d9+Fa4+g4V0YPPWaFM9nUOoh/LumoFy
 OZUIYQAtJn04uQJu4aXzlS8VovVRqEy9YvQFR2hJL2P2Wkum21BlJljtPLghAKEiQrGn
 B8CT2s+owWDQYOnyySWTIjmu0ZDxrz/bD5FNvUxlZvffgK9XHjUI/Mt84CyrqHvcomQj
 z7kWdqKBUw5VLgIxiSL4YkDb+E6Qc7SWy8cMy4oV3arBSAFbRqVN9I21cxzZ56OkPKbp
 qdUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684495514; x=1687087514;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6BlLLSb4t/MYbESNdbnlmX8aWP0pTO6ZrGYiXtEq3JU=;
 b=ewyz41Egxl99ID8CQX+2RbaXHrij0//NBJFPELoGlwbQDTzkwbA6hkd04FlAlO6I+i
 xUYTS8dKqdDnL1ehfDeiXZPhAaJXdx1GfrmFHg8+6Fn0iIN2JEcR7Sw2oDrgomKwLVkU
 EIh+76OAHut/AR3lHFdARJOE5hatfIP2FJkQ1rsf9GOJkGUKf/kPLKRb1miU4wDrdqij
 qmElCf+G+V/Jpc/P1LueeOwa1XfUFBwOc5r/ZqBcax2TYCImgviemeR47l7KoWXfRzAg
 wqWfdlEkO3ujM0qpgvXk7GRKuNHNGdT7h32WLYfI6m+I6fZ4H2thPGZg0j2MyOcA7PGW
 KOrQ==
X-Gm-Message-State: AC+VfDwsVfRGdo0pvIZ1kcdnhAr66MXCtV+B9nkIb4iVK2PAsgG70bLR
 n0pzTQ506JdaAMP9pf4AcGg=
X-Google-Smtp-Source: ACHHUZ64CiYvdspneYPeXoJ9FG78ZZve8AsKQbiHpjWwuP8+rb6oiNv3DRb2T5J8X8D5z9uBuDDoiQ==
X-Received: by 2002:a17:903:2343:b0:1a9:9a18:3458 with SMTP id
 c3-20020a170903234300b001a99a183458mr2800765plh.31.1684495514183; 
 Fri, 19 May 2023 04:25:14 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28]) by smtp.gmail.com with ESMTPSA id
 a7-20020a170902ecc700b001ac95be5081sm3170111plh.307.2023.05.19.04.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 04:25:13 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 19 May 2023 19:25:08 +0800
Message-Id: <20230519112509.40973-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:07:23 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Min-Hua Chen <minhuadotchen@gmail.com>
Subject: [Linux-stm32] [PATCH v2] net: stmmac: compare p->des0 and p->des1
	with __le32 type values
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

Use cpu_to_le32 to convert the constants to __le32 type
before comparing them with p->des0 and p->des1 (they are __le32 type)
and to fix following sparse warnings:

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:23: sparse: warning: restricted __le32 degrades to integer
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:50: sparse: warning: restricted __le32 degrades to integer

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 13c347ee8be9..eefbeea04964 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -107,7 +107,8 @@ static int dwxgmac2_rx_check_timestamp(void *desc)
 	ts_valid = !(rdes3 & XGMAC_RDES3_TSD) && (rdes3 & XGMAC_RDES3_TSA);
 
 	if (likely(desc_valid && ts_valid)) {
-		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
+		if ((p->des0 == cpu_to_le32(0xffffffff)) &&
+		    (p->des1 == cpu_to_le32(0xffffffff)))
 			return -EINVAL;
 		return 0;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
