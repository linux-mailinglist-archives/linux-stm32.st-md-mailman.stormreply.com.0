Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBB248907D
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jan 2022 08:02:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B913DC5F1FC;
	Mon, 10 Jan 2022 07:02:25 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 337EBC23E53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Jan 2022 08:53:44 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id gp5so7281328pjb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 08 Jan 2022 00:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=7kXCs28W66sTjdWSN/kGCXx/YzaMyVz/KostDbMYDNo=;
 b=XYUtRnSqZLyCfMJsjZiPZ6h/tM6wDNm3I9gT0fv2sqsgH+HHPZS83umFpLfZcbkZA6
 YtBJInOUEnA9DtoRjmHquuxagajzQT97tqjhwPiJvWaOuRVOIDF6t+0c9aRxLr9ofA6e
 +RvNPW6lDhE+/Cj0eC1X2R857mHky757FYqJGlizehwvgNdRG0jTzbNeBOZpLwnVBaEs
 clDEN4YXe3ULyy5kQEq1q4lUeeeaHKysiMbLuH8XK567CFvyq6oIal2zRKmeKH3xlUHb
 hUkmru9s0pH0grqTZ8nDUV7+JvDsRrMJreX4CM4zEPFY0tEcEheoInx0xPu8p5s+LRjq
 go0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7kXCs28W66sTjdWSN/kGCXx/YzaMyVz/KostDbMYDNo=;
 b=Qd0XbbbogxcLIw8tguoDwg/xQy/2PlF914P7pk+Ybh/ei74YgIYN20nqSsVko+K2UF
 qusaf5AktkWqD/S/h0KOD1rEPXIGL564GN0wCDH/5iiBXshsEWld7Cl9NrTkLCi5jou7
 D0RqswUdipsRZlXlEtlaWMeRXemR6Wp2k6PcE2yB2tISECfQ5EgWfaxEZKVQMGNpBSHv
 DeztBA4vyO4QJ4dRsdYfNrzOK5VRf8tYssJJuLsiOjtRfnKtae3PByL0JDENl12cg6EF
 0EeJC933OXJfuMie3zTrZvVDeQa9J6sJ+Na3wWzlaRd+50TQfMO4/DTRj7Pf0bOWvs00
 x2IA==
X-Gm-Message-State: AOAM531zKPtOtEbqFE+v0PN9SAAbgijdc4na+mwzJjN6apAQtAhQvf+p
 KowHg6lExTU+bn/U8dxkGb8=
X-Google-Smtp-Source: ABdhPJxRGudJlEubQRa6AT+BqCt57yVyLI5cKLsapEtYJ/lqs2rRTAfk7sN5HbiEu0UTf+5GGsAlTA==
X-Received: by 2002:a17:902:a505:b0:149:b646:a173 with SMTP id
 s5-20020a170902a50500b00149b646a173mr29701788plq.64.1641632022784; 
 Sat, 08 Jan 2022 00:53:42 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id ot7sm1427048pjb.12.2022.01.08.00.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 00:53:42 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Date: Sat,  8 Jan 2022 08:53:36 +0000
Message-Id: <20220108085336.11992-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 10 Jan 2022 07:02:24 +0000
Cc: linmq006@gmail.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dmaengine: stm32-dmamux: Fix PM disable depth
	imbalance in stm32_dmamux_probe
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

The pm_runtime_enable will increase power disable depth.
If the probe fails, we should use pm_runtime_disable() to balance
pm_runtime_enable().

Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/dma/stm32-dmamux.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-dmamux.c b/drivers/dma/stm32-dmamux.c
index a42164389ebc..d5d55732adba 100644
--- a/drivers/dma/stm32-dmamux.c
+++ b/drivers/dma/stm32-dmamux.c
@@ -292,10 +292,12 @@ static int stm32_dmamux_probe(struct platform_device *pdev)
 	ret = of_dma_router_register(node, stm32_dmamux_route_allocate,
 				     &stm32_dmamux->dmarouter);
 	if (ret)
-		goto err_clk;
+		goto pm_disable;
 
 	return 0;
 
+pm_disable:
+	pm_runtime_disable(&pdev->dev);
 err_clk:
 	clk_disable_unprepare(stm32_dmamux->clk);
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
