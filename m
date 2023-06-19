Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B8734FAC
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 11:24:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 98CBBC6B454;
	Mon, 19 Jun 2023 09:24:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1261C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:24:20 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f9b258f3a2so5184025e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 02:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166660; x=1689758660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMgaAHe76eIn3F9IB6JgFSErZkAha9wqjAecsB/W5Vk=;
 b=k6hUzsBdbW852NGN1tgRKfvV8+nCAhx6DYEPsgRjsWlZ0BTtUlFExnS/x1vqW5n848
 D4J1nktobWGcUq4l0hluW577VVrCeg+Py9HYgt4695ySSnSmkrlNnPc9RmtNwK1stwQY
 Jsx7XXRnhk6C5mQ9jTw5RboNB4higsW7c0F1HuaeZPTCaTdjtY3R4V+K7+KysIzkdj27
 0XuGEv7CgJ21CbJ9AhNl9A49Los6afD9v2IgckI0lgFJ5E1+v0rzd1bwrf/aPs16VOrY
 475v0VPp49d8KiURbla6ANCC2JIWJ7/gVEUG2XUk3sOD9fLBi9Si5IQtVkkJbLAR1T0L
 l8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166660; x=1689758660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMgaAHe76eIn3F9IB6JgFSErZkAha9wqjAecsB/W5Vk=;
 b=REOhvAGNFlCccisjBf/K0INPtbLW7nq54MxA1IWOtwcdo/MKvasJ9OxwEhb2emZ+ZY
 wGESmFJ0YK9wrzlFKoJem7+13mvmXSKla+yV9n1XppUI7g82fmZovs3Qij0cJnhTAZXw
 L8x6vgVwkcVhSV6YahgpwJem/qKfHsJ9G7tjonF+D+XtEXNiK4bOD0pBDETLkrRGbXXj
 ABed4v1p898AU+zO+uuQyLPZhaTErktUTWoQsa2bwL/Pza1AWpawZkTNjz4MkBoi0rrk
 wooq/nNWo4jZ11wCn/vgvavC6BPF/Y9iABv29xJyArG8UgooyOeltThRj+PEWShg02fd
 ty/A==
X-Gm-Message-State: AC+VfDxTdWz/Anzc1HjFm8XoeGekx7sokp0MP4g5psVBj7WHHPNdr/49
 wuUYZ1td/8SRksQmUbTk1W/HUA==
X-Google-Smtp-Source: ACHHUZ6Nn/68uiujSBlIeSENzRMSR5Q+y8Y7jbVXv2vkfmhUq7+1i9cbhugLNdmWErDKVc9aUsPEZw==
X-Received: by 2002:a7b:cb56:0:b0:3f7:e48b:974d with SMTP id
 v22-20020a7bcb56000000b003f7e48b974dmr10384783wmj.27.1687166660443; 
 Mon, 19 Jun 2023 02:24:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:24:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>
Date: Mon, 19 Jun 2023 11:23:55 +0200
Message-Id: <20230619092402.195578-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619092402.195578-1-brgl@bgdev.pl>
References: <20230619092402.195578-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH v2 07/14] net: stmmac:
	dwmac-qcom-ethqos: remove stray space
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

There's an unnecessary space in the rgmii_updatel() function, remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e3a9b785334d..ec3bbd199501 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -117,7 +117,7 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos,
 {
 	unsigned int temp;
 
-	temp =  rgmii_readl(ethqos, offset);
+	temp = rgmii_readl(ethqos, offset);
 	temp = (temp & ~(mask)) | val;
 	rgmii_writel(ethqos, temp, offset);
 }
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
