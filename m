Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C540738993
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 17:37:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4CF6C6A5F7;
	Wed, 21 Jun 2023 15:37:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20821C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:04 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-3fa0253b9e7so276535e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361823; x=1689953823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohR2MIoFexvaG1IRw5Am1pEJrTY7jcRqlxnO/EQTdy8=;
 b=dkyDfYiIBxOJV2hxR/4c8Uta3MSZJK6qmT57b/J+17eBqI0hCGQ4XExaV4F7mYh4be
 VgT3ePn99e8bol/sXnx1xvaO+w76lIn+/zPxUZDiMYIOPqYTFeXmZfLsWUl39mCAqHVm
 HmyVVnGIWuw9CPtJxjxzHypnrORSkLN6pecDdYnUN5jV4DzRvqFQ+pZ6CnSJD5xIYOKa
 B2ovTwgnrU+dxC4JIU+t0UGPXJiIBbiAJrMXERMaiJ65jYeyaF0Jjc2Ovwlz89sqjlUT
 c2h5du2jStF+P4xOeLkev3lON5iHC9iTT22u8lbT6RBnHQbRkWakb1/EofidM1kHhnNO
 VpQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361823; x=1689953823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohR2MIoFexvaG1IRw5Am1pEJrTY7jcRqlxnO/EQTdy8=;
 b=kBXmdRY7Wi40NChImIQ7xsw8EmELd80CObmjht3QvVmz39D8z8PIErh/78Vo7LdGRf
 1PipAjrsr84KzsCSEO//cU0TT+JFR7Ps4Pu/43pP8h0VntZfvmMJcDpR4XSbvt216MgD
 gcLyisJXp1LeFCP0OWJ3VJL/EZOYXXlhasDk9iEHUdAAMRtiOWakOnyJLfLCecyKq2TS
 fkKOFC1ZjgjubQmsijpRA3cH8RMXKY+ZoYW+A03rgq0+EtSTETenjFiof0Fpi1zrv/SD
 k0y4P4Jlr4qRk8okK8brbmjTJbRk8luG0j8h9AoQTcz306NcWGpigMeXTjTnMM6rLsHi
 j8lg==
X-Gm-Message-State: AC+VfDyb8eF/MqM9JVAm2f+lpoFCIzZHMpywC/txxrsDJGrewp0ihLUI
 C9hE7V5lATVjSblS1l+qMsvHXA==
X-Google-Smtp-Source: ACHHUZ6ZDp52UApJ3piW/H11lxFyTw3oeRrK9CSYjqYjy6prgfBnCMfLOO2kaY9rWqwnOQ/4eCyV9w==
X-Received: by 2002:a05:600c:21d8:b0:3f9:bc32:ca6c with SMTP id
 x24-20020a05600c21d800b003f9bc32ca6cmr2740533wmj.13.1687361823489; 
 Wed, 21 Jun 2023 08:37:03 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:03 -0700 (PDT)
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
Date: Wed, 21 Jun 2023 17:36:41 +0200
Message-Id: <20230621153650.440350-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153650.440350-1-brgl@bgdev.pl>
References: <20230621153650.440350-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 02/11] net: stmmac: dwmac-generic:
	use stmmac_pltfr_init()
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

Shrink the code in dwmac-generic by using the new stmmac_pltfr_init()
helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index ef1023930fd0..b7fc79864e8c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -47,11 +47,9 @@ static int dwmac_generic_probe(struct platform_device *pdev)
 	}
 
 	/* Custom initialisation (if needed) */
-	if (plat_dat->init) {
-		ret = plat_dat->init(pdev, plat_dat->bsp_priv);
-		if (ret)
-			goto err_remove_config_dt;
-	}
+	ret = stmmac_pltfr_init(pdev, plat_dat);
+	if (ret)
+		goto err_remove_config_dt;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
