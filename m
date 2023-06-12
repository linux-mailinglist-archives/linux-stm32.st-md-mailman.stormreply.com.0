Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D65A72BC0B
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21D98C6B456;
	Mon, 12 Jun 2023 09:24:33 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3583C6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:31 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-4f62d93f38aso4816532e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561871; x=1689153871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=su4Ml188NZQl7/ApV7N4YWW8KD5ToBDayqEyMhucvL0=;
 b=wTReWTESrXF8MQdnFv0BcbECvhA5k1jp/UpUNoz5an+amSVMTnDq4zSy8OhgF+QIHP
 VxqnfBT6c8Gc9esMda2ao0ri3AX9tE/Rej1L2iPODh3z23iryd54EdmTxXf8Akqd40iz
 UUREr/Vua1XefWoHpGHQw9UxoR0Aktnkb6PKHg6zaQXmUGDFO6+IDX5d1DXhwizay6wi
 Sd3rbsJxq7tmZEsN+gMmSOGdFdNh6xTDJfT5ymd+QoUGgf0D1fTFl1R9WITy+EMgUGVI
 c3WesnH2AJ3Dw4o2uhkFqpDxTeAZJc1xoHaxEpGONEJDz97NZzhNi6uUAzStEDQHePL+
 Mdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561871; x=1689153871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=su4Ml188NZQl7/ApV7N4YWW8KD5ToBDayqEyMhucvL0=;
 b=h0BCpBJl5J7JlUThPIkA2W8WbIdf+b86J7K/s2est9lNm1LhWcQwNFpVaupF6A+LJH
 d1R+upxMm+W5w8pkCaP4Z10UT/i0XmNUrOltG29rRXmqYKgiLZG2+l8yQfJmuHhp5w91
 IJcYEOv7dh1BWWJirNv7Bbzays0QlnjA2XKkDeZoFe4j8VLEx9tcCzO52VtYXVUrI660
 tfMGQJbA/cb7mV15jukumqeso1qXF5JgLfycrsp5QA+ZtHeLQZ4Yp7g/idjAS1YCpYKr
 GNKdl+SJPnJa3EGDzYC3XVihZkdlzDhXiv6VcTwXQlUtA/pe8qc9TYfCVYdOXdp3BXG7
 s4zQ==
X-Gm-Message-State: AC+VfDzC2xzI63jAT1T3vU2C8mnDuhU0Ct3CdWO8WnT9/nBTuqXMaJhQ
 2kCqmD0b7KEyNEdzBv/f+dSVFA==
X-Google-Smtp-Source: ACHHUZ6avE4dbfTuPulQJx5CHawnorQOK0WS0NUfFL8AJner9iIRg49w5a0WkmL8BvBwi9Ny+W3Ubg==
X-Received: by 2002:a19:6601:0:b0:4f6:5bf2:63bc with SMTP id
 a1-20020a196601000000b004f65bf263bcmr3203042lfc.3.1686561871076; 
 Mon, 12 Jun 2023 02:24:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:30 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:33 +0200
Message-Id: <20230612092355.87937-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/26] arm64: defconfig: enable the SerDes PHY
	for Qualcomm DWMAC
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

Enable the SGMII/SerDes PHY driver. This module is required to enable
ethernet on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 8d850be05835..f62c96fd4335 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1367,6 +1367,7 @@ CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m
 CONFIG_PHY_QCOM_USB_SS=m
+CONFIG_PHY_QCOM_SGMII_ETH=m
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
