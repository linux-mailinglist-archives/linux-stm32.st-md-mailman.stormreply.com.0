Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366473186D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:15:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBFFEC6A615;
	Thu, 15 Jun 2023 12:15:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 71724C6B455
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:15:01 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-3f8cc04c287so17460445e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831301; x=1689423301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KVlJCvybdeYjvv8ryzmcQEkNwtr78sKz5e8xX8tuWYs=;
 b=VtZQthxXkJ6Gl3Gr0Rxhxkj4r7xw8xSfqcyo9Ro9BTEa73QgC5ovx5U8VkkMLcJFIT
 dOOekEovMOtoZ7L5ZHlpSTlLUk0AXaEd3ozCrfIK3bZ8wMuapEV4saO+zeZ2vz1MEjxl
 nRTNWBc8b48QbHDddC/7qEExOcUIAe8i2thkfeIzzQwjXqroTLFDoGb1jpHWjTGQ3ytO
 z1VEcPtNOi/O9Yi8JqETNIHYJ262elgduM1jcv0VLPk9QGlmYs48fY4aMnx5KyJ6lPWb
 51Zs6aJ8EuAUBbzhlgigq7j57hfdcnfwCViI9jPL3AaeVeboRN0uGYzOmD/rrzwBsw7N
 kASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831301; x=1689423301;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KVlJCvybdeYjvv8ryzmcQEkNwtr78sKz5e8xX8tuWYs=;
 b=EDro3m5ar9oPBBWpH8/ORXa6faC7PQqQYkGjI5dB/ISGEul3mr3iGQB+bwqd4uQNug
 zReVMcqBfV+RxizaKIqluPQkGQMtybUkQgaBwzn9fhqBoYQVHqHtMZk2fCdv5KqhS2ZK
 BYR0VEh54HZMu/9Fb2JHwURpXTxRQRpFzWxMbIdN0Ywe/dDXz2LXUIcoLCqWXz6Jbzqk
 t1Ywaf3eOq360F4jJbvzMpdfDAAIhtxJux7qwuDMgHc9LNKwb3WrpQt0eZ533duUa7yg
 j2IjVSEo+KluCHjAMTg00/RHrSzINgNNVNwaFF8Py1T88taD+HgdY53U9qOkeK5AC4MV
 8wXA==
X-Gm-Message-State: AC+VfDw2K/BhKefHDtZQV22sAzpbjbDx80suafdbnt1MsGn+o5QF4SAd
 IGODI6TOl8cJciK0kSBou7c/Ug==
X-Google-Smtp-Source: ACHHUZ5fGl2Bmi5j9EaSiuWzDcHUl/220qF10Rg89YYxqATkMANkXIIxOxpidvYKUgDJ7K0JFIeqiA==
X-Received: by 2002:a1c:7213:0:b0:3f7:2638:9691 with SMTP id
 n19-20020a1c7213000000b003f726389691mr13309387wmc.41.1686831301121; 
 Thu, 15 Jun 2023 05:15:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:15:00 -0700 (PDT)
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
Date: Thu, 15 Jun 2023 14:14:17 +0200
Message-Id: <20230615121419.175862-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 21/23] arm64: dts: qcom: sa8775p-ride:
	enable the SerDes PHY
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index ab767cfa51ff..9f39ab59c283 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -355,6 +355,11 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
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
