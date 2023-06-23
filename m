Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD1673B466
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0DACEC6B455;
	Fri, 23 Jun 2023 10:04:28 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E030DC6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:26 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3111cb3dda1so701461f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514666; x=1690106666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JiCzEeqmjiEw3zDpGmObBnm4eT4Z865O2xg4BsYR1E=;
 b=dLurroqnBfuZlrXTJOSO1ec8tkOeNMC7/5FOt5gGsGnx23ekrR748s6VoPpqzDKbl3
 vWDMKD0wmLDtvfzCrlozDHyfcJeiN5yr+038ii6HY3l6YuEJqjShtFub/I0GFcC4U4Rr
 6CXXMUTEGhm5w0hGK/fuJUOwY8YbXrOC+taP5VC3tIqIKij5+05rpXvb9eTReVJw0FN7
 X5RfuLo8m7WYea1CwT8CcQCrZwdD0/O7CJK0yTqZsz8AGv7j/3DVE2f8OmP5261eyp3g
 qmxa+PUTNAd68WMx25arfe7WHqgX23/QkOhrMBYsMnNWRm/KUMynJUcWHz9jmRSH8taH
 xUUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514666; x=1690106666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/JiCzEeqmjiEw3zDpGmObBnm4eT4Z865O2xg4BsYR1E=;
 b=GAkJZZiMrptCG3do5mREDKW1hovEGc7VPnVpBd1YN3JcLmn9/n7YuXZU0ACf/7t9Qu
 ytcVEmCSGpS8w9cMQuTCdOVboPYVndZB591Wwiz/BWWh4ohAaihog4OQS8b/ls3DsaUN
 724rbL/0ASCHidH+8nrLOGSo2sMzU/vneDV1acDk++GrFf85dO9sRiHW8FbswHB51SR0
 YyaCBzd2gnuqKS0Sxzj3n3bSLhkEbOlN3hk2KPGG2T8ksx1RhzXpZRRsc24JS8mvyBn0
 XJDMxWocjL2FVOVXUto9w7qBOV5NCSD0x38DDqW/mdLaTp4VWsZSrM1ZumV3/4v2PDJj
 Iy/Q==
X-Gm-Message-State: AC+VfDwIM4py3Qa36rcKeMAwg+m/vKyfMDX5ySMRuRXgkIfCD3eqiW3C
 dwP1j++PQ+Gm+ywEg0y+cBqgKw==
X-Google-Smtp-Source: ACHHUZ4qSPzss8jYv0izBVyPiiYbfcs2GaupcDqzwF7GJoL6obvzFc7cSfwPYlFhIi3eERWkxmjvhA==
X-Received: by 2002:a5d:568a:0:b0:30a:eac8:e5c1 with SMTP id
 f10-20020a5d568a000000b0030aeac8e5c1mr20824466wrv.6.1687514665831; 
 Fri, 23 Jun 2023 03:04:25 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:25 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:04:10 +0200
Message-Id: <20230623100417.93592-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 04/11] net: stmmac: dwmac-generic:
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
