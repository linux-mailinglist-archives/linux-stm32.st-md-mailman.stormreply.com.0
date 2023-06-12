Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F772BC23
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:25:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B07C7C6B45C;
	Mon, 12 Jun 2023 09:25:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDE52C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:25:00 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-3f736e0c9a8so29742295e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561900; x=1689153900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f4hcroDV0hdKX/DQDft+g0yZ5ckCppngKltjTy4swGs=;
 b=MAMjiLP/Ub2YMkZrYMQu9I+vzT6+M/KG3XopFjXfiAgrNHxfkR1XAmH5b8FPhTzsfl
 AqRdT7fKsLe1LsAM2ySEpkmdoZpmATyl8UlCZdD0WerCqDDnXfaLcu9TW+BsqAjtpDP3
 h4Y8lowLuAZMm8+6vaV2+O5tZ4JOtojf9TOohwrc3VXLVH0Lp62NqHuEEzvSQ7XMsIgJ
 FjwcfKOhlAEOQ+sWQqGMbhR8naVGQyOA17XnUN5/G+unqZS2uYPEfzRepIdPMJ3pNCJT
 C2VSAmBfiHnpDcna93MrdqjGaOpKmOoY5f4NTJ2Krkj/Qavu3TIAsxqxZqX2d9tNvUnX
 YUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561900; x=1689153900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f4hcroDV0hdKX/DQDft+g0yZ5ckCppngKltjTy4swGs=;
 b=kW31b/x2tkTwD5DFkYINQCzMv5coekZTeqkpkKqsTHcldMcviqQR/pZ4CGqdcM2jzK
 +APfLmHHeeYP1yW9f41cwqsvIK5egJIcgakRTZYAZCU0DP4P73NtJckCg50yqXW3Y+Ly
 8Y+vyljeSOOy2cqh33ZU4GlLN0d6Ua5orObQNfHNlhb+73XcpAfP9nllYEQXkjXvHLfA
 nQGGRyc3Wg5DLILGjlFR3Kf1MImIY1osB6JsTa9RPSZ2s81LJBjKQYd/bUKOvd02ecyT
 /capBITcRhOBwMmmoMNxMm9oQN/HZEw8dzmGFm3PKlhgLSu5I2AhF5iK1K4TrViMzP5f
 EazQ==
X-Gm-Message-State: AC+VfDzW4y3VnIXC+KJ1/eX1NFidnMbpsVp0uhRB6bVGX7JXsSuz23VG
 UBNTnqCg626ZQUqe7wbSzwOY0A==
X-Google-Smtp-Source: ACHHUZ61vW/FRawgaaHnvQGC2M+qoPMGa2BJ9bPXYYT98KJ/c8JNEM8dFY2uCnSfW5vwruY6E+eizg==
X-Received: by 2002:a7b:c047:0:b0:3f8:1b55:ac08 with SMTP id
 u7-20020a7bc047000000b003f81b55ac08mr1200775wmc.28.1686561900531; 
 Mon, 12 Jun 2023 02:25:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:25:00 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:53 +0200
Message-Id: <20230612092355.87937-25-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 24/26] arm64: dts: qcom: sa8775p-ride: enable
	the SerDes PHY
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

Enable the internal PHY on sa8775p-ride.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index ab767cfa51ff..7754788ea775 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -355,6 +355,10 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&serdes_phy {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
