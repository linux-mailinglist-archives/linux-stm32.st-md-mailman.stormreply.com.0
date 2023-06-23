Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D88673B467
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:04:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C1FDC6B458;
	Fri, 23 Jun 2023 10:04:28 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31283C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:04:27 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-31109cd8d8cso470784f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514667; x=1690106667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M1MdpjqTiZB/Ps9LoJ+Yhj9at3Zx7ZNJ3CPY0Mq713Y=;
 b=Gmn4CPGBxppaf2DODUZSGsz6WLHyEDshmlrrZb0eSOwPmIpH4TMuoDUOKrGpHn9Di3
 P8M3l7gt3UFAvZyyQWDyxXYnl8qMIi4/FtrrFaWROrxh8NDVim2nsZv1aqTr91wzvWcX
 8ZYBk22LyUUzPiEASzIKPB5n8dD87s82maoXgJdq7z9mElBSIqvAf+dI5PwTl1avMDjT
 mO1X56utPBOMbxw8KqBMay4XGZh7apBIwzpgtGWkOdTlPJVn7SNLg+EMXZQFdk1f/OZ7
 SR3Q8XTLp04H4Q9yL8yG8w/P8TZ/jsiQo27cA8fP3rNJ6ghcUO4Dva+oMElyJr2IzCnE
 Hslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514667; x=1690106667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M1MdpjqTiZB/Ps9LoJ+Yhj9at3Zx7ZNJ3CPY0Mq713Y=;
 b=SYazldg3Q6Ql4+mf+bZgWEnsQKtiP0XNt41xKm2SE3C8kwGu2TcgpgZLaYRTy5Zgcn
 deT8vFTTrtP8Xw4uBXbToGCfmFVyqNPTxkaxeIryr2BH65msWybfrIk53PBHq9bKitxC
 H0pOjpnaJMsn2FXNAM/LmTLcEITCEYwQ9d2Z7fa+umejkfqo/d83do5gPI0d5pVaZdpv
 PxwXasOJ1z9AYdmhz9dn7Qy5hsDDVH36xMs1rFquVDkhxcHBsHan3UH9afKddokq+SH5
 IdpIQOfFKY4+RH8CH/+Cb5pT/5kPtMX1SUguTCSFikKx3oEf44X/qk/zMa0cTGrckka0
 Kb0A==
X-Gm-Message-State: AC+VfDx8KCNArCxb+IDky+IONXrfhzZL3E3IScOhdm3by+jUUBR+vnGT
 zjXa/xPfV3tkvbg5aftdsCCOnQ==
X-Google-Smtp-Source: ACHHUZ5fYRMaygvi2CJWcmAn7/oTOJt3J07hgY5PtNkWFV293rqUyRH/TNtyiRVcXAUg8vmlR8vUqA==
X-Received: by 2002:adf:f607:0:b0:30e:5fe4:9cc1 with SMTP id
 t7-20020adff607000000b0030e5fe49cc1mr17926510wrp.29.1687514666860; 
 Fri, 23 Jun 2023 03:04:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a5d54c8000000b0030fae360f14sm9079360wrv.68.2023.06.23.03.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:04:26 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:04:11 +0200
Message-Id: <20230623100417.93592-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230623100417.93592-1-brgl@bgdev.pl>
References: <20230623100417.93592-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 05/11] net: stmmac: platform:
	provide stmmac_pltfr_probe()
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

Implement stmmac_pltfr_probe() which is the logical API counterpart
for stmmac_pltfr_remove(). It calls the platform's init() callback and
then probes the stmmac device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  3 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5b2bc129cd85..df417cdab8c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -734,6 +734,34 @@ void stmmac_pltfr_exit(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_exit);
 
+/**
+ * stmmac_pltfr_probe
+ * @pdev: platform device pointer
+ * @plat: driver data platform structure
+ * @res: stmmac resources structure
+ * Description: This calls the platform's init() callback and probes the
+ * stmmac driver.
+ */
+int stmmac_pltfr_probe(struct platform_device *pdev,
+		       struct plat_stmmacenet_data *plat,
+		       struct stmmac_resources *res)
+{
+	int ret;
+
+	ret = stmmac_pltfr_init(pdev, plat);
+	if (ret)
+		return ret;
+
+	ret = stmmac_dvr_probe(&pdev->dev, plat, res);
+	if (ret) {
+		stmmac_pltfr_exit(pdev, plat);
+		return ret;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(stmmac_pltfr_probe);
+
 /**
  * stmmac_pltfr_remove
  * @pdev: platform device pointer
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
index e79134cc1d3d..f968e658c9d2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.h
@@ -24,6 +24,9 @@ int stmmac_pltfr_init(struct platform_device *pdev,
 void stmmac_pltfr_exit(struct platform_device *pdev,
 		       struct plat_stmmacenet_data *plat);
 
+int stmmac_pltfr_probe(struct platform_device *pdev,
+		       struct plat_stmmacenet_data *plat,
+		       struct stmmac_resources *res);
 void stmmac_pltfr_remove(struct platform_device *pdev);
 extern const struct dev_pm_ops stmmac_pltfr_pm_ops;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
