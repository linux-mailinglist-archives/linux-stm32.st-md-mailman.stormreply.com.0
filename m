Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6D472097D
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Jun 2023 21:05:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4851C6B443;
	Fri,  2 Jun 2023 19:05:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 507EBC6A617
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Jun 2023 19:05:12 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-30ae69ef78aso2883329f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Jun 2023 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685732712; x=1688324712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=If31y072xq4e6P4sxZ7wENONrwovu6qw7j2QcnCLwYM=;
 b=iw2od1eb1LLnTIiTck7tEolOQHlCSsiuiuK5Az1wQSsyQuGpmGKl+Ddz6oaTtYMOzE
 T5Pnesq+GFxqESCem3TjpoUlvFNgtO2PKO1B0wmLT590vpkWUz+hZIgTV49nhewaoPhO
 /R3iGhEYJouZbX9L1pxez8SCfqDXal7HKVE7A29/lYBlkkB14Z+itAmcRkIA7BlSJAZl
 iooncu6iVfqshI8TqaN7O8K152pq1VBbizt+FTAQSLTp9nsQ2Srm5C/AJJlUFwbKsC1K
 s3o/b2T4EwBTJ8ng314F/99Imw/npLH8nX8MwWUCryUxytFt+vMpaQRNOed9724L0UZZ
 LKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685732712; x=1688324712;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=If31y072xq4e6P4sxZ7wENONrwovu6qw7j2QcnCLwYM=;
 b=BSfOGEw0wrKtShkyyULBNRpZh99MWuq3/rZiERkBmkpe8xEviJVjXJIPZBaTlBLYjl
 y/d6kxrVBXP9VwOXB0w9q56h2q6cmD3aocKGvsSCJ8KP8ej8QJ4w4XNvax/tlOIDtBMn
 ahP7bbQBCs5RFYl21t6pm77qFQ4zAQax5C3ORVJkWp43aFMMGcuNSYa4bMu6rgyXuIv5
 GTyAhn7dzjw/7z2HawoZcLIBfI9nvX06JzgkrHg6B/mCXny98RWLn41okG3etAnua/8k
 hIOdUguK3hZ2S0GD0ts9NQHJSP2nBxL6hVjNS7myAvbCBx64rOBXzsj3r1bkQ1k/b4bc
 A+BA==
X-Gm-Message-State: AC+VfDyIXIpN/lD2ptWwlp1YGhw1Ge3mxktI93fRDuqmBZUjVOFNr3g3
 sNpOXgqPchyQAlOKd04DhXHBAA==
X-Google-Smtp-Source: ACHHUZ49cV0H3yp9vW9BOannfVeKeUwyqy/UKFpf4uPItZATZzhUiTC+cpJxJ2yN3zr/xYJXdhwL5w==
X-Received: by 2002:a5d:6b0a:0:b0:2fb:92c7:b169 with SMTP id
 v10-20020a5d6b0a000000b002fb92c7b169mr585237wrw.10.1685732711749; 
 Fri, 02 Jun 2023 12:05:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7569:c0c0:3a0e:c54d])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a056000108800b002ff2c39d072sm2361029wrw.104.2023.06.02.12.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 12:05:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>
Date: Fri,  2 Jun 2023 21:04:55 +0200
Message-Id: <20230602190455.3123018-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: dwmac-qcom-ethqos: fix a
	regression on EMAC < 3
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We must not assign plat_dat->dwmac4_addrs unconditionally as for
structures which don't set them, this will result in the core driver
using zeroes everywhere and breaking the driver for older HW. On EMAC < 2
the address should remain NULL.

Fixes: b68376191c69 ("net: stmmac: dwmac-qcom-ethqos: Add EMAC3 support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 16a8c361283b..f07905f00f98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -644,7 +644,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->has_gmac4 = 1;
-	plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+	if (ethqos->has_emac3)
+		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	plat_dat->tso_en = of_property_read_bool(np, "snps,tso");
 	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
