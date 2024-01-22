Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B6D8387C6
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Jan 2024 08:04:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C00C7C6DD6B;
	Tue, 23 Jan 2024 07:04:23 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D1BDC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 18:47:10 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a309222cc62so73314566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 10:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705949230; x=1706554030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AgXqAxt6b/HLf7UsuchGiNA/0l/ev1PlS/qyb2yk9M=;
 b=gzQQJ92ZDYIPhmw7Cw7s5kZuOS/2Qpq04i/GbOK6cP4Z2FYxATKQK+BBc3IhCCgBbt
 cyNm5w32RazNJdw9SLk4j8aebEtWTd2gk8xu3ADhbR2+Oe4EVM8UXyrkYOHw1SMErhAw
 y3zfoWSXN+Z13FwBd6dX8prP3K9yOeSEo4NovWysdBgKBOoQW6tJhtz2kAtFAOHfLCdB
 fXpAHy4XYkatgZ0m0Tv0KVSdJKD8zq8x6cPn+v4K4zfJv7JmlwKDpt3RYSScQrt9DZ+z
 j0dDWVBK36G1fnqIJpJsY+u1VwEvMAvq8ng/VKnhEzIav4DKKavknurtOUDz5ot4O4Xf
 Q/CA==
X-Gm-Message-State: AOJu0YyYQjR1t0JPZy8htzY8ehRKocoa7retwiPYWEXXEqwCBb3sZlS9
 j7py0z+ent+/OohWY8swXmaD80UforAQ5uRgy4KDVsKTe5dLUzxr
X-Google-Smtp-Source: AGHT+IH3gTSGI3SxAP9i1h8YcrB3qhE5DHJO+EwUl9v/RrhOAk2VBTus+0Y/q/rD13UKqbRQYhRg1g==
X-Received: by 2002:a17:907:8e08:b0:a2f:e26d:ceb2 with SMTP id
 th8-20020a1709078e0800b00a2fe26dceb2mr1691230ejc.135.1705949229792; 
 Mon, 22 Jan 2024 10:47:09 -0800 (PST)
Received: from localhost (fwdproxy-lla-001.fbsv.net.
 [2a03:2880:30ff:1::face:b00c]) by smtp.gmail.com with ESMTPSA id
 rf19-20020a1709076a1300b00a2e9f198cffsm7241654ejc.72.2024.01.22.10.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jan 2024 10:47:09 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org, davem@davemloft.net, abeni@redhat.com,
 edumazet@google.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Mon, 22 Jan 2024 10:45:41 -0800
Message-Id: <20240122184543.2501493-21-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240122184543.2501493-1-leitao@debian.org>
References: <20240122184543.2501493-1-leitao@debian.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jan 2024 07:04:22 +0000
Cc: "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 dsahern@kernel.org, open list <linux-kernel@vger.kernel.org>,
 weiwan@google.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH net-next 20/22] net: fill in
	MODULE_DESCRIPTION()s for dwmac-socfpga
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

W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
Add descriptions to the STMicro DWMAC for Altera SOCs.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index ba2ce776bd4d..68f85e4605cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -585,4 +585,5 @@ static struct platform_driver socfpga_dwmac_driver = {
 };
 module_platform_driver(socfpga_dwmac_driver);
 
+MODULE_DESCRIPTION("Altera SOC DWMAC Specific Glue layer");
 MODULE_LICENSE("GPL v2");
-- 
2.39.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
