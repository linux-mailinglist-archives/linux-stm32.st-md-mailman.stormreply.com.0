Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 597F9738995
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 17:37:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B3FDC6B454;
	Wed, 21 Jun 2023 15:37:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FFD5C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:06 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-3f90a7325f6so49468815e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361826; x=1689953826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JiCzEeqmjiEw3zDpGmObBnm4eT4Z865O2xg4BsYR1E=;
 b=zAnRcyEUDD5wtE0JhsBJCTGSOI9JVuvZGa/odSLqFHGsQXN85gQbvlTZBX+am6cdI+
 wCvXHD639o04po8/nN9twgtY0tb8Ta1S3yBXDl7G0Fd9XQKAb1wC9qdjPaWIBd5mOT48
 7zeagteknLjoF5nSF0V7R/AtC20zPvspcgJBBYFLMPkitQz6gJSXwUKaWBwX5jxjEOHy
 JOpbdPE6txob69F4MW2cyB9+zk0UbktknOZ49yzYBKDghJy0OqxuCH4OAwiGOYqiNK5A
 L8qJa5APnKWbZKMZxsy51rLkI/usP+ajNckWWYum2ZWXFca8SHEIjTp4o0UIVhnnXfW3
 mt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361826; x=1689953826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/JiCzEeqmjiEw3zDpGmObBnm4eT4Z865O2xg4BsYR1E=;
 b=EKOnrrB5rn0U3CqBUmSkZQnXl1oX+JcXMc6jZVNwqHU+JMu0cRUwM6A9hkoFoeozew
 qAJRoTRtcMjndNvRRbknlHC8zbwK9i8M/jKDGTiulx4z2LJwd3nEEixJiL+Xi5wltwh5
 2X5we15+uyvdwmQ7xgx8sB6tzSg3oCJ4AcdpAWIwgLBdK2U2fAFf6vX3ist50yycWEzu
 XBPrC7gnl4DkDq9l2eKbDr8HymaPoWxqaBzN7Pa2gAcenoKZmKrz2Xsnji+yjsJQe+KD
 6+Uy1UcH7mCTtczkuZMRnUNazvn9/cGZJFVRFOcKfMzJv5CCs4HXwwM37mWklK3374lY
 7JIw==
X-Gm-Message-State: AC+VfDwoyhU0UUDegVafOl0RmZuiOV3KUm7rBNkj+kaHL4tiD5i5z+U3
 CGRF4zVLXZ7bEuLffQgR1vXC5g==
X-Google-Smtp-Source: ACHHUZ7xPJZ1J9M1CQ6hghcx/4kh4qmQUTaDMOedqzbwk1iUrz91I0UBgHrzOTPLQtNdytzHq/JnJg==
X-Received: by 2002:a7b:c391:0:b0:3f9:b3f5:b8f with SMTP id
 s17-20020a7bc391000000b003f9b3f50b8fmr5845974wmj.34.1687361826051; 
 Wed, 21 Jun 2023 08:37:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date: Wed, 21 Jun 2023 17:36:43 +0200
Message-Id: <20230621153650.440350-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153650.440350-1-brgl@bgdev.pl>
References: <20230621153650.440350-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 04/11] net: stmmac: dwmac-generic:
	use stmmac_pltfr_exit()
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

Shrink the code in dwmac-generic by using the new stmmac_pltfr_exit()
helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index b7fc79864e8c..dabf05601221 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -58,8 +58,7 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 	return 0;
 
 err_exit:
-	if (plat_dat->exit)
-		plat_dat->exit(pdev, plat_dat->bsp_priv);
+	stmmac_pltfr_exit(pdev, plat_dat);
 err_remove_config_dt:
 	if (pdev->dev.of_node)
 		stmmac_remove_config_dt(pdev, plat_dat);
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
