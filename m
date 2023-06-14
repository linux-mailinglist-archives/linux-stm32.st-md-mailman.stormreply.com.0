Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C969730179
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 16:16:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B06DEC6A617;
	Wed, 14 Jun 2023 14:16:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DD0DC6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 14:16:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3f8c74af64fso6790305e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686752208; x=1689344208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zXrtZVNtigeKgJSwA8SW/6hEN8pGZI7BArpmacufnTg=;
 b=ZvlIhWO+UbdEXvtjkfHV7Na2P16yHMVjdBcJ4rDysGC7/aPhxMv4zaZSiGm/ZhK2td
 UwCJg/2ARuYuOw3iMAbcyZ+es5K4mrPdWEah974xwoTL51Jj7Z5nu0QlR23j2ZuQDsUJ
 e8P/44csh3nSZRI+/nZBtYpVh3jCekSF28BWITcHCUTcFvMJJSWpgyZul8+XTPZepgSl
 zXZZ5vAg+ylHT6Mgpke+nVaAOQuRqhkQwrT458KV0vM0lTORfTeVnTu7HM77N/lJOnVR
 3ws8iybDCDLn/yh6cBw11r+FD2XeoxcT9eFPbqlmki5v9CsHchOL4bk7498MqGGoD62s
 GbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686752208; x=1689344208;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zXrtZVNtigeKgJSwA8SW/6hEN8pGZI7BArpmacufnTg=;
 b=AURsnyTsB9gbPb/nczhgxdz6WcHlY5M5NxIMLMdhLIsxjqGTMqdiwXQhKZx1vm53/m
 GR5SZCCSFLyqWGMKrXrUXHyUCltZ3ecyc1NB1R1iSH3e4BKUzMnhFw+BHWq1PcbJnPGW
 S5qrUQdFaxMbuCX8CMdA+ye9ofOBpFVdRsqPUXrsE2xtShNL53gSnerlX8FJ+TpFnp4a
 0QAz1s2cOrLEJTriga4a6P1YrhUgwfxYms79IvWLMMIY0ajwjqkVpmVwsB6Nc2uLq/fW
 JVX+3u4xl3LDJB1Oe+S3T13Atos86J7H4IriwkWd4P56UYfgSkEbjeO3ieejXNkmNqWK
 a4CQ==
X-Gm-Message-State: AC+VfDzmWtSEG2VSgaHJ1AnGxBxwq6bw5HVtK4mTRhX3sG8aOgCXuIJ+
 PSsZObQ/DB5Wn/7Uo4eFL/M=
X-Google-Smtp-Source: ACHHUZ7u0M9cZqByWtISOn1h1jPvoZT7oi+IfoTVD0JOaPtyqavnoW4rP3x4WqugXE0GnbkR+7oAuw==
X-Received: by 2002:a5d:480f:0:b0:30f:ca3f:64d4 with SMTP id
 l15-20020a5d480f000000b0030fca3f64d4mr4131734wrq.47.1686752207571; 
 Wed, 14 Jun 2023 07:16:47 -0700 (PDT)
Received: from localhost.localdomain (93-34-93-173.ip49.fastwebnet.it.
 [93.34.93.173]) by smtp.googlemail.com with ESMTPSA id
 v13-20020adfebcd000000b00309382eb047sm18509045wrn.112.2023.06.14.07.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 07:16:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 14 Jun 2023 09:32:41 +0200
Message-Id: <20230614073241.6382-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, stable@vger.kernel.org
Subject: [Linux-stm32] [net PATCH] net: ethernet: stmicro: stmmac: fix
	possible memory leak in __stmmac_open
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

Fix a possible memory leak in __stmmac_open when stmmac_init_phy fails.
It's also needed to free everything allocated by stmmac_setup_dma_desc
and not just the dma_conf struct.

Correctly call free_dma_desc_resources on the new dma_conf passed to
__stmmac_open on error.

Reported-by: Jose Abreu <Jose.Abreu@synopsys.com>
Fixes: ba39b344e924 ("net: ethernet: stmicro: stmmac: generate stmmac dma conf before open")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Cc: stable@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fa07b0d50b46..0966ab86fde2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3877,10 +3877,10 @@ static int __stmmac_open(struct net_device *dev,
 
 	stmmac_hw_teardown(dev);
 init_error:
-	free_dma_desc_resources(priv, &priv->dma_conf);
 	phylink_disconnect_phy(priv->phylink);
 init_phy_error:
 	pm_runtime_put(priv->device);
+	free_dma_desc_resources(priv, dma_conf);
 	return ret;
 }
 
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
