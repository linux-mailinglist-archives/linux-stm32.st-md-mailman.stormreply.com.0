Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D735770B4D9
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 08:07:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 718C1C6A61A;
	Mon, 22 May 2023 06:07:25 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D6CCC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 May 2023 00:25:33 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-64d2da69fdfso575649b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 17:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684455931; x=1687047931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X7LSztTgvuTG/1LRG7rLGwi1XpsK273SzAIspcW50Sw=;
 b=r5g0rd74gzmwM9IK6Pm4C1P66N8ea4c0hLbvF8+Kw11dnEnGuJjnrsUvV8iXMI1m4E
 yzkwWbNbBo7IWy7BNZYjdx28A23ZWhbyX1yQPACdK/rfjOxPV+KCiDE1++Lwdf2RPbix
 P75kxZMOEMr0FsCLspJcxMhIV56lHHfs/pBvBudhO9rzIEsHG0/AMjCAaQaeGLWGmNEL
 eNe9RQd0lLpHTyDB0XqYRf2Y+/licUOj/P5N8ZiSywTKEUIVfDbl4jOktqFaq+UsJfhK
 D4ppWsAdYNpQlRttSZhZq04x5eUTNp/rb06JYuQVBXlry3MNG2FqXSF2JFsD22nz5ATo
 TAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684455931; x=1687047931;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X7LSztTgvuTG/1LRG7rLGwi1XpsK273SzAIspcW50Sw=;
 b=kbxuLJlgyaGUpRDVVt3X/+IFk3y9d1xs1rvUWM/de7JXRhmLIvgGAYwMtCpz7GXcFP
 J51iSbAqGWwHuuKex+hggG+iMcC1gSW1hXYj7qBy93xJ/7u3Mwm8wTeM2ehNzeEa3IYJ
 81EzYTdCkVxP4zyKB7MAzAvUd32jceZhFhqa1prnLdLZh60wspZm/y1X8UhApFAZInXC
 Wrx4yFgWVnl6nn6jG7iRi60WBWfcgKsppR/pPXqhBG2coU3uLUOqoqWGvNjEtoyDq37F
 YcxZ4u7rBZkUcZvYBs3mKT0IzwqomffDJrtV0m3McbazWnX+u9psOe6PUmKybUAtZJG6
 zVJw==
X-Gm-Message-State: AC+VfDwDF5MM4+1L5Zjeu1+jq8BBAGvtymTP3zRuTD+lvptScaqGcdlC
 TvLg5QuaIY+m6r/f9TpiV5o=
X-Google-Smtp-Source: ACHHUZ6Cp9812QVrJ99pDHsU2f7yl3xWCuWgrcVsItIUf0yvdilus/B0BzdVR5+viHcZ1+7jwCVZJA==
X-Received: by 2002:a05:6a21:33a6:b0:105:b75e:9e0d with SMTP id
 yy38-20020a056a2133a600b00105b75e9e0dmr319961pzb.1.1684455931481; 
 Thu, 18 May 2023 17:25:31 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28]) by smtp.gmail.com with ESMTPSA id
 m8-20020aa79008000000b00643889e30c2sm1864056pfo.180.2023.05.18.17.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 17:25:31 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri, 19 May 2023 08:25:21 +0800
Message-Id: <20230519002522.3648-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:07:23 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Min-Hua Chen <minhuadotchen@gmail.com>
Subject: [Linux-stm32] [PATCH] net: stmmac: use le32_to_cpu for p->des0 and
	p->des1
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

Use le32_to_cpu for p->des0 and p->des1 to fix the
following sparse warnings:

drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:23: sparse: warning: restricted __le32 degrades to integer
drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:110:50: sparse: warning: restricted __le32 degrades to integer

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 13c347ee8be9..3d094d83e975 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -107,7 +107,8 @@ static int dwxgmac2_rx_check_timestamp(void *desc)
 	ts_valid = !(rdes3 & XGMAC_RDES3_TSD) && (rdes3 & XGMAC_RDES3_TSA);
 
 	if (likely(desc_valid && ts_valid)) {
-		if ((p->des0 == 0xffffffff) && (p->des1 == 0xffffffff))
+		if ((le32_to_cpu(p->des0) == 0xffffffff) &&
+		    (le32_to_cpu(p->des1) == 0xffffffff))
 			return -EINVAL;
 		return 0;
 	}
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
