Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B956683CC48
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jan 2024 20:35:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D107C6B477;
	Thu, 25 Jan 2024 19:35:11 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 752AAC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 19:35:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-40ed218ed1eso9395775e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jan 2024 11:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706211309; x=1706816109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7AgXqAxt6b/HLf7UsuchGiNA/0l/ev1PlS/qyb2yk9M=;
 b=awxBfxL/Qm/RvNSzucYi0LxUOAnW/HCe6Ce9KjSnLTe5k5ltJA4tXmTJQXssZWxPIa
 zVEolp6uD+kAY86vk/CpBf2ydloJYzRQgwevdzvquRuqgQxz3C5n3Xlz+IEdF7O9oy64
 asEiPWbT7YV0KPcjcjgcs2gmygncVYm+lcq/zCsSjPkPWSXb8RNyV4Pn+hm3BhhSSnF/
 wWoMWuT6Xd0WiNKVmLBezjt0hq8syxTYFAhJd4xAE18HxaW3yGy+Evc84uO9y+y/cKCe
 +yNhyvHy4fDr7/Vkros60O43/RG7aQqB/bFsLAK/DRoFCLA5SMw1ihAhsNGIhsLVNMpB
 FLtw==
X-Gm-Message-State: AOJu0YztLdR6ZlhpObrrQ2qhVVtjCSEGOTGZx9xh1q6WephkmYWMy2EQ
 4Q9aPvhQO0vyzz85Iek6r/ewfQ2WDzBU1O330uo3rY2gCuvf04yd
X-Google-Smtp-Source: AGHT+IEMBVbsaO0ABJQa1RD4+dOg8YSwi6gL4N5tabFR4k4/SjWz/xIxgEfHj9mrOzncFm39Z0BMjA==
X-Received: by 2002:a05:600c:b98:b0:40e:50d8:25c6 with SMTP id
 fl24-20020a05600c0b9800b0040e50d825c6mr141987wmb.150.1706211308689; 
 Thu, 25 Jan 2024 11:35:08 -0800 (PST)
Received: from localhost (fwdproxy-lla-118.fbsv.net.
 [2a03:2880:30ff:76::face:b00c]) by smtp.gmail.com with ESMTPSA id
 w16-20020a056402129000b0055d063bdf67sm735316edv.97.2024.01.25.11.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 11:35:08 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
 edumazet@google.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Thu, 25 Jan 2024 11:34:15 -0800
Message-Id: <20240125193420.533604-6-leitao@debian.org>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240125193420.533604-1-leitao@debian.org>
References: <20240125193420.533604-1-leitao@debian.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, dsahern@kernel.org, linux-kernel@vger.kernel.org,
 weiwan@google.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH net 05/10] net: fill in MODULE_DESCRIPTION()s
	for dwmac-socfpga
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
