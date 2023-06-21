Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7EC73899C
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 17:37:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95636C6B45B;
	Wed, 21 Jun 2023 15:37:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C7A9C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 15:37:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-3f9b627c1b8so26695165e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 08:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687361834; x=1689953834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E6sVXJ2cleHMEi/0WcOIV4n/ZjjS+cQY293Qzlx7CXQ=;
 b=ytqBTHWqr0O6rcQRNtmKsh6dLK9ftebsw4tdZY0QALt/SZisDjORIlR8rIG6/uV3md
 Fi9A4HVDkOyoWSMA7Mz7056cAx44DmV7cxp+RvXiGtXEmoT53ssbK/UINJgMzKIxvjiX
 i6NQ8irc3evTR/v0RNBj96Z3U0BLUfvP7hZoPoOFthjN4cKd5kn+4dQvMOLTziRTaxA5
 C4MjpzPVOkOSoxgU8IRrMXT42kvmzDvulnhca8o+5D8Rm/UVKjTQQPM0hbKnRFubb8MC
 GcihCfDkvFZHTukagIqhhPGdtFVti8r8T6ObiUbjglX8KjcFlCqOoEerd/t0KuX9ecDg
 G5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361834; x=1689953834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E6sVXJ2cleHMEi/0WcOIV4n/ZjjS+cQY293Qzlx7CXQ=;
 b=AvUQXilx3Zxl+tKpenR7GhuBdkTRZEi37i+Uw292mXMDii9lNs5jPozq8ZB+NLEIbA
 fcGFubvQ/5SdEFt80VqKHtyGiwMKLrnniGw4qEZflnieURxKh8AU9SR/kQ2MibPfMgMG
 QJtEk9xx5yk0zZPtVM2FtqPKLZOQ/Ozvl+SkxVGAwr+qTlqceJ16Cfrogp76SsHrAWBe
 3gOLIl38e6wnY3Gj9gDbUrD/CRdss55xmLwReg+LlBjcVNdUeJlcE5UpvPOmbPsGARyE
 ZPMVxQXQ0NRW0ssYwUQGZdwLvYG6nIVQG3tMG1ztE4UTqoFmcL5erwC7UAq1OnaO2sxB
 MgBg==
X-Gm-Message-State: AC+VfDzWWIBr9YO85R/o3nDzluBuLFzrljxwp+Lmb6Q3ynbx2cQ5oZrk
 hqqO8/6Q9F13NFCTM07ZTEFuXA==
X-Google-Smtp-Source: ACHHUZ6vWMgzwi5LD2ZvSmbyFHyTJXtLbN1jGnRVAYlkgSjDYwX4jrJvwJ0I7n0yZevtJM1G7OlRsA==
X-Received: by 2002:a7b:c8c9:0:b0:3f9:b8df:26ae with SMTP id
 f9-20020a7bc8c9000000b003f9b8df26aemr3963143wml.34.1687361833803; 
 Wed, 21 Jun 2023 08:37:13 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a69f:8ee3:6907:ccdf])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a1c790d000000b003f7ed463954sm5322491wme.25.2023.06.21.08.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:37:13 -0700 (PDT)
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
Date: Wed, 21 Jun 2023 17:36:50 +0200
Message-Id: <20230621153650.440350-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230621153650.440350-1-brgl@bgdev.pl>
References: <20230621153650.440350-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 11/11] net: stmmac:
	dwmac-qcom-ethqos: use devm_stmmac_pltfr_probe()
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

Use the devres variant of stmmac_pltfr_probe() and finally drop the
remove() callback entirely.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 7b9fbcb8d84d..e62940414e54 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -787,7 +787,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}
 
-	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
+	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
@@ -801,7 +801,6 @@ MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
 
 static struct platform_driver qcom_ethqos_driver = {
 	.probe  = qcom_ethqos_probe,
-	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name           = "qcom-ethqos",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
