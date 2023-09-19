Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B57A727B
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Sep 2023 08:04:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0ABC5C6C823;
	Wed, 20 Sep 2023 06:04:12 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E49EC6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 19:20:03 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id
 af79cd13be357-76e09202322so408811285a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Sep 2023 12:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1695151202; x=1695756002;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tnm2Moa364NnFvHBWbJW5Miitr7z3kjIIDJjJlIthFQ=;
 b=ILXvQcS2DsgwFygmeef5F2PJIWko2JqvA4LDUhWUrANcNRUqWS8P0JSw4/8+XomwxG
 WnrcGIhNjy+wBZ6HVK69/lW/DEsqGbsQBIDEvsEL7KRR7nWWHM6ZPi5saBtxaiufprtR
 xu8DT+oJqbTRvllLNxf1mwQW8pPqeJu7Rg2/tcblNkFEvfbh4XzQUWb0ShiaDTu0r8di
 Xdte3hFKa8eZt/8dlyaQrlcjtYSbhekfSF0WVJMcAqK/XgQ2/hFx6u7hEbGpC3ErPt7G
 7wZW1hhLZRk6yKzplxbiJNNu9mblwDTn1SNsv7owTc0VQI3Z+OHO5HNzhWm+v3V4Sb96
 SvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695151202; x=1695756002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tnm2Moa364NnFvHBWbJW5Miitr7z3kjIIDJjJlIthFQ=;
 b=NtfXY4oXYghWx7uqbEwnvim6tVKZctHyRLagDDiXUitBDobbxwZpoPaudK3TNjTm9u
 wdJMO0jqqGGHgVVnCA6qmdjMEKGMWXlc+uuEWPdSEK7lLStCHuwPAfx1grpUGhDKqE+N
 1CXcsBFBA/0XufJpZnYBwkxx550JYRRtYYnDQl85yt/BJkcBM5MVNYjJaAgprAUNjkTl
 f16EELZ9DaUy5C3ONrbeWnVMkieQ9SI4tlCQ09yakK1paMqeLdxgM5nS49Ww/XV2XNoP
 +WmmAC8d5rb4ZVsGrgT5UZzM/WbKG2I6cgOLTbgXhJK3EzeRUjzntrPvRpW0vYdGgmQM
 6GBg==
X-Gm-Message-State: AOJu0Yw7b+AZOegBWDnZTBS/eb8c9XCPnq/BCOt8bTVoX8wYNJNL804k
 sME8QuR/EQBHuqFiw6jmnX5N1q1ZeFFF1Jj18SmERGri
X-Google-Smtp-Source: AGHT+IEtMT18UqS7I4dDjLyzrmF1BJ/xA9i1ZcPz4h6w0cU5Wi2SCvT/zEEnS+t7MQZQTRvyYMQR/w==
X-Received: by 2002:a05:620a:288e:b0:76c:d958:d549 with SMTP id
 j14-20020a05620a288e00b0076cd958d549mr784459qkp.11.1695151201770; 
 Tue, 19 Sep 2023 12:20:01 -0700 (PDT)
Received: from dell-precision-5540.lan ([2601:18c:8002:3d40:df77:9915:c17e:79])
 by smtp.gmail.com with ESMTPSA id
 x12-20020ae9f80c000000b0076c60b95b87sm4179704qkh.96.2023.09.19.12.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 12:20:01 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Tue, 19 Sep 2023 12:45:35 -0400
Message-ID: <20230919164535.128125-3-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919164535.128125-2-ben.wolsieffer@hefring.com>
References: <20230919164535.128125-2-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Sep 2023 06:04:11 +0000
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH 1/2] net: stmmac: dwmac-stm32: fix resume on
	STM32 MCU
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

The STM32MP1 keeps clk_rx enabled during suspend, and therefore the
driver does not enable the clock in stm32_dwmac_init() if the device was
suspended. The problem is that this same code runs on STM32 MCUs, which
do disable clk_rx during suspend, causing the clock to never be
re-enabled on resume.

This patch adds a variant flag to indicate that clk_rx remains enabled
during suspend, and uses this to decide whether to enable the clock in
stm32_dwmac_init() if the device was suspended.

Fixes: 6528e02cc9ff ("net: ethernet: stmmac: add adaptation for stm32mp157c.")
Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 26ea8c687881..a0e276783e65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -104,6 +104,7 @@ struct stm32_ops {
 	int (*parse_data)(struct stm32_dwmac *dwmac,
 			  struct device *dev);
 	u32 syscfg_eth_mask;
+	bool clk_rx_enable_in_suspend;
 };
 
 static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
@@ -121,7 +122,8 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
 	if (ret)
 		return ret;
 
-	if (!dwmac->dev->power.is_suspended) {
+	if (!dwmac->ops->clk_rx_enable_in_suspend ||
+	    !dwmac->dev->power.is_suspended) {
 		ret = clk_prepare_enable(dwmac->clk_rx);
 		if (ret) {
 			clk_disable_unprepare(dwmac->clk_tx);
@@ -513,7 +515,8 @@ static struct stm32_ops stm32mp1_dwmac_data = {
 	.suspend = stm32mp1_suspend,
 	.resume = stm32mp1_resume,
 	.parse_data = stm32mp1_parse_data,
-	.syscfg_eth_mask = SYSCFG_MP1_ETH_MASK
+	.syscfg_eth_mask = SYSCFG_MP1_ETH_MASK,
+	.clk_rx_enable_in_suspend = true
 };
 
 static const struct of_device_id stm32_dwmac_match[] = {
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
