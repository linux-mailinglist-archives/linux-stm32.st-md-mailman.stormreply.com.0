Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5F731862
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:14:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00205C6B459;
	Thu, 15 Jun 2023 12:14:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85385C6B443
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:14:48 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3110a5f2832so539288f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831288; x=1689423288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMgaAHe76eIn3F9IB6JgFSErZkAha9wqjAecsB/W5Vk=;
 b=v/JROUtIn1Fn9P10DPijytJUNeMgvE979wcEBNHrOGUdG6qtCKQ7nd6DTn78TsgPK9
 oUGOJElAik/a1BznjNO6USDB/u5nHsu/PStgHyApHHv40RgcfIHdXONrGyB4WGs3N9q2
 P63IyhbcJA1JqCZcROq+tanvqlpIehMj3UQRBQ+UlGU+jlpNfEMVUEz0MEtBoShEy4ZU
 AQ/i+SxJff++kZZD7Sf5WR8dfphK1E/o4XQNiVfem4vMTW3A/Bom43nQ69X1BXRfPwkq
 wfno0VaUOkbOKuWBS3EM/692Ilu/HgF+kCT3+x3uTUUE5d1uhem6sSeoZ6PbKoMXoxD3
 UQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831288; x=1689423288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMgaAHe76eIn3F9IB6JgFSErZkAha9wqjAecsB/W5Vk=;
 b=VDJpklnNGOHw5KKqCv7nd9V06Go6mpS/v+CqYcTDpjaqQnQmXZqgSJcYSkUhOPD9EQ
 nVtI3Uge3FHr63lz3i1L+vJlhyJXSOmXTezzR6B3DPBclCHuzJ7HYPuAlyXJjf8Gtdkt
 Zjn2XChTyQR2cV97SAvGeguxPlxJ1vlOYopQXHTmSpvkyEbtyjABi5hCFHsRfa67LdmB
 lcu7IivmM5jp4ShbLNISAtMtcuwkwe6x5mNWNDV2T4JNOURlsU84sQxI4EYFHSyo3+hL
 mWAlJdB8bQiKhmZqy66lwlc+0vcaE5c+30wsD7TArXtFxirTesrKlyYqWG9izs7kKq+T
 SWaQ==
X-Gm-Message-State: AC+VfDzWPJhha5sg5PvE5zveXWMsmGQzI7II/321pjV7iMt0Zntj4vIZ
 qKZuBY6phzsFLOBVSRexWoPuCQ==
X-Google-Smtp-Source: ACHHUZ7hpsGhA1APGWhKHqXJARHR7T/asvTIBCcezaYjJwRDKg1LmwDvqWkfZ7PEzsLAv9Oam4DVuQ==
X-Received: by 2002:a5d:6a88:0:b0:307:f75:f581 with SMTP id
 s8-20020a5d6a88000000b003070f75f581mr3870500wru.18.1686831288107; 
 Thu, 15 Jun 2023 05:14:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:14:47 -0700 (PDT)
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
Date: Thu, 15 Jun 2023 14:14:07 +0200
Message-Id: <20230615121419.175862-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH v2 11/23] net: stmmac: dwmac-qcom-ethqos:
	remove stray space
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
