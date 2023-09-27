Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 236507B12C5
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 08:25:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3979C6B473;
	Thu, 28 Sep 2023 06:25:11 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE16C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 17:58:07 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id
 d75a77b69052e-41810cfc569so50082891cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Sep 2023 10:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1695837486; x=1696442286;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AQzb+SwvsGBOEDzBjP4js4Sz2yj+gakJ7LKev+o0njQ=;
 b=wyWSzGnxeP0POORybYOnowqZp3Sie7cQXw++rf1chFqw5HEw01k1uQx0fS+6+oz4y9
 DeUgbqvuKh3Qkoeh5KdpXRtTMuAc8QB7FkaKoIWLGj/exnILhkG64eKmwq+THwM3jMUB
 naBiXceH1JFlcz9ISt411iLMVIKqoBl43iXAmetUeeZ+wNhEy4HhFGkiDSoMScPcC08H
 n9SCEeM9xHDvlVLe8mA7X/rbg1SfgMHLWmUUUGMr8slBj4wfKbxJyB5z0ZxFWnmOJG2L
 a7AGxAb1UL9QPGzGVJW6qON+mY4HpIGJc0SguAAZFv7jjZeBG9tKNKO+Pwpcy8czzu1n
 /XtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695837486; x=1696442286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AQzb+SwvsGBOEDzBjP4js4Sz2yj+gakJ7LKev+o0njQ=;
 b=f2vW54zbxDhg1E1m1j3hiwKt8zNvOVMfovfjnpnisWobUHDsc3WIznhw0FMV26f/KH
 wQ5q/A9/Fnl08xfSbkmFWzlyw4dLJLQ3fr8Oimluo72QbcY1DfVsM04cK7ScCkZu3h4e
 02Rdz2E15LwB3sJZaeYTiSPKbcGmeHUD6I9sbzr0PI73YjHZkWmYX7W8tBLHd9gqJQjl
 HPLrIGIajwGMfBrapBO4hei9qCI9wSvFaDc/eMOW2aLyGp/tA/5hb9K091BDetQsd67+
 s6cnQDtJ0C8gHRd3/PaNhOVp7zpAtElI4+qx47QdBz0XmE1Z39di3boN8zZ2MXXpJ74K
 awqQ==
X-Gm-Message-State: AOJu0YwyWDQ0JUGPejKiT+kIzL/r4TLMMiNs4fitp5DYYbi6l9zmUBCL
 dybV4bHmz//GfoF7WCbzcpuY02f9RXcNgS1C0BiEQSvc
X-Google-Smtp-Source: AGHT+IEBMS9WLtGs4+++Dzkg5Mo5nm24aZkgeo3xhxJJgHUp6UGYBeiOZLJhiw6Jv5TzrYz5ZxgiEQ==
X-Received: by 2002:a05:622a:14b:b0:416:5ead:6171 with SMTP id
 v11-20020a05622a014b00b004165ead6171mr3362737qtw.47.1695837486383; 
 Wed, 27 Sep 2023 10:58:06 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac84c84000000b004195b8554efsm711368qtv.24.2023.09.27.10.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 10:58:05 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Wed, 27 Sep 2023 13:57:49 -0400
Message-ID: <20230927175749.1419774-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Sep 2023 06:25:10 +0000
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net] net: stmmac: dwmac-stm32: fix resume on
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

This approach fixes this specific bug with limited opportunity for
unintended side-effects, but I have a follow up patch that will refactor
the clock configuration and hopefully make it less error prone.

Fixes: 6528e02cc9ff ("net: ethernet: stmmac: add adaptation for stm32mp157c.")
Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index bdb4de59a672..28c8ca5fba6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -105,6 +105,7 @@ struct stm32_ops {
 	int (*parse_data)(struct stm32_dwmac *dwmac,
 			  struct device *dev);
 	u32 syscfg_eth_mask;
+	bool clk_rx_enable_in_suspend;
 };
 
 static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
@@ -122,7 +123,8 @@ static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
 	if (ret)
 		return ret;
 
-	if (!dwmac->dev->power.is_suspended) {
+	if (!dwmac->ops->clk_rx_enable_in_suspend ||
+	    !dwmac->dev->power.is_suspended) {
 		ret = clk_prepare_enable(dwmac->clk_rx);
 		if (ret) {
 			clk_disable_unprepare(dwmac->clk_tx);
@@ -514,7 +516,8 @@ static struct stm32_ops stm32mp1_dwmac_data = {
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
