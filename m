Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E05F573185B
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:14:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4778C6B457;
	Thu, 15 Jun 2023 12:14:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2F02C6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:14:42 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3f739ec88b2so15927315e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831282; x=1689423282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbBN5UFZLskttS3+DKY7OChoCqIyyvgczJBfknfqHmY=;
 b=yvPYPB3/twNXwbLjMkJlnuJoOjP5vKUi0hMqRQ30Acy5+J9og3U2sPSx6dJAxPrOvO
 yOKH22lW9kKY07Axj1CuBzXevI7YaVgHFszXRmRqPkXZuDNFtFDIvpvtDSo7Z+ZQlU8y
 pHCs8MbJXDYQUKc3lZSyZC9pSbArUeGi7/mLipar8SrNY11ypiQp3Dgqub2ZlbCEOsGU
 Wq2dm/NvjX4fI0lGSNhZXbZ4goMsq/OSyWhUsILsFcaBoLcjfOzIQizkZeCY9+fFxbpn
 qLtLxdBV7G3/Alw0/iyf2L7o0OIItEpvMGXdiA+TIgCWbfKRf+N8X9enbhmYCovsvoZD
 uAKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831282; x=1689423282;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbBN5UFZLskttS3+DKY7OChoCqIyyvgczJBfknfqHmY=;
 b=XtTG8lOpt5fzhsCxxZr+qum/sj7XMxHmNXdIG7bEks0MdXdocCXCXmAn8mFgXTRbHT
 a3fopBbnF/wg+ctg3fGfM3W2tuNNOstus2gglWyoxWWjtx2qffkBxfLNKekq7UcFKOe0
 gQVm9NAszEc6nn/0fF889TkynUeJ5VLL81ImYHfKf287qmgyc/KOfvWNdHdiRd1uDDO5
 27t0uL8DiiczA28Y393zWLWUOGBP+JymQym1O8j7HjCZL3mmyj344UGNLS99Mj5vyABn
 MqTJmpozBgu+fB6W+1Zg+Nazoi2MzCDsqqHBlRiAWkLGbDiIBOi/WzSIYxscviNztH7K
 8VJg==
X-Gm-Message-State: AC+VfDxf6WckbR0/ZwZ9Pp0JvG/+RSQDyLLGxbi8EA71gbn9/wPnuXs2
 WsKGXq+XFAkXui3yHRJ/rbfcfg==
X-Google-Smtp-Source: ACHHUZ50gkojbsxcYhy0Y9KFQ/3/buCtu4HBZ5N7JDVSu5XZvtC4ZCRBtmSSx5JTV5aSJVa9J+ssDA==
X-Received: by 2002:a05:600c:2204:b0:3f6:be1:b8d9 with SMTP id
 z4-20020a05600c220400b003f60be1b8d9mr12600756wml.6.1686831282249; 
 Thu, 15 Jun 2023 05:14:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:14:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Thu, 15 Jun 2023 14:14:03 +0200
Message-Id: <20230615121419.175862-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH v2 07/23] net: stmmac: dwmac-qcom-ethqos:
	tweak the order of local variables
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

Make sure we follow the reverse-xmas tree convention.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 16e856861558..28d2514a8795 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -594,9 +594,9 @@ static void ethqos_clks_disable(void *data)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
-	const struct ethqos_emac_driver_data *data;
 	struct qcom_ethqos *ethqos;
 	int ret;
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
