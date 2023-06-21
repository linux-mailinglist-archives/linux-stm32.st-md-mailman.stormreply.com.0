Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0623C7385C9
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 15:55:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6455C6905A;
	Wed, 21 Jun 2023 13:55:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21181C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 13:55:45 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f8fcaa31c7so65093125e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687355744; x=1689947744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TGiINbu7foWgaD89gaNM9RV3a9vEUoSjU+97idyE2Co=;
 b=G5MLNwrMO/ygECl2UrKnTU4hYZAPfCguFUUBoqVRG3tRN7Vb04To5n0wDzGBF6f9uu
 SrAyU1MPLRIzDsEAZZzVc3u9m29IKIkNND81q1leCLtwqeXIqNaoqKGegINEEVVhbawA
 lExWWKmCn1a/dyqWCjd/GKB31g6qHiPLXntc6CxZGa0j3MtIG9oO/SDZMLwTiUdNZw9w
 mEuKhbpeXSqFRWSbmSWMxJ2wNF63e7yMjAtS8xw4UircxJRfc2yFhtDsx9nR76005mya
 rFBm0l+tgvZwCeuNJklbDwxyzx8/AjGTKlDRwZY325eNt4a324SQDVm8GJNdTefEaaAw
 eoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687355744; x=1689947744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGiINbu7foWgaD89gaNM9RV3a9vEUoSjU+97idyE2Co=;
 b=OFIk+SfxISIjvfVbxxyYNVc5oCg6blI57vxkSChyjWEQcz/xCiWOj+WXpYy8j6ykXQ
 q0Evhh1Nah5eMwsOWaZacUFtaoP+Yr3Yi+gs5DLlxD31XhuEfZgmYVVyTOFZk1DUF9sH
 DRF3jzV10wiSNMFIkA4qp9F9OHL2Vrq95uZ5AA9pJzG3BKfBjAyrv4laUJlBJ521mt1J
 GS/RyR1SSSmdHN4LU6kIrwSrI53L1av/MoE4sYbpAfkAWJctf7HUgmO/1af4EIG1J52H
 zkS9IpGS/IrJuo+IrFrK6MzMTW1VUtVXAuopN6GCMA5UJycjdRRpU5/9tDn5kE900lwP
 m+bw==
X-Gm-Message-State: AC+VfDyVqULuMh1P+v2Or5hj5/3Q8tLnFcauYYiK2vFYX2WJIbElqLt7
 ylsEFPuBXDYjQtKXvl76+MHV5A==
X-Google-Smtp-Source: ACHHUZ6lpAkKw4lUE1mi/nl5WQy66Jmf4UjvJOEHqcX5UnW2U7zvUnOOSSgljBc/dyx9VV5dVySgcw==
X-Received: by 2002:a05:600c:22c6:b0:3f9:b244:c294 with SMTP id
 6-20020a05600c22c600b003f9b244c294mr8259781wmg.35.1687355744011; 
 Wed, 21 Jun 2023 06:55:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1c4b07000000b003f17848673fsm5069294wma.27.2023.06.21.06.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 06:55:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Junxiao Chang <junxiao.chang@intel.com>
Date: Wed, 21 Jun 2023 15:55:37 +0200
Message-Id: <20230621135537.376649-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: fix double serdes powerdown
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

Commit 49725ffc15fc ("net: stmmac: power up/down serdes in
stmmac_open/release") correctly added a call to the serdes_powerdown()
callback to stmmac_release() but did not remove the one from
stmmac_remove() which leads to a doubled call to serdes_powerdown().

This can lead to all kinds of problems: in the case of the qcom ethqos
driver, it caused an unbalanced regulator disable splat.

Fixes: 49725ffc15fc ("net: stmmac: power up/down serdes in stmmac_open/release")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 10e8a5606ba6..4727f7be4f86 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7461,12 +7461,6 @@ void stmmac_dvr_remove(struct device *dev)
 	netif_carrier_off(ndev);
 	unregister_netdev(ndev);
 
-	/* Serdes power down needs to happen after VLAN filter
-	 * is deleted that is triggered by unregister_netdev().
-	 */
-	if (priv->plat->serdes_powerdown)
-		priv->plat->serdes_powerdown(ndev, priv->plat->bsp_priv);
-
 #ifdef CONFIG_DEBUG_FS
 	stmmac_exit_fs(ndev);
 #endif
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
