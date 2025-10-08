Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A50BC3C79
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 10:18:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC08CC2902A;
	Wed,  8 Oct 2025 08:18:08 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1C0BC28770
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 08:18:06 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3ee12332f3dso6294930f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Oct 2025 01:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911486; x=1760516286;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
 b=HLQ741WEUp54YpcVttl0qiRNNKpjKFsrFBbYqkWquKKOhlRIOa8kvBpz7PAGHFiFkF
 opAVgpT96WVuvp3Cvz6EuWhENGtZKtl5GtzGruBYNwq5GsJiXjU9GzOIE4Pjlb5ICbpA
 7FONyLNZQXEcyVmyqK7IoRotzw/WRL1x0ZlmihZqokPvggOHWQr337El+FOa9NL0pEWv
 QK4hpEJcvbPeBN29jTnf/BrcyolLD8HPBrMdUuAv/TTAX9DFzesA8k0WSSxpBeN1S5A6
 bjpygR26eP6HR6Wg5c04Fs2NeGr2aCgJLXiq9B/QrOlIkP5uLPsZT5bY3EvEdvScxxcp
 wY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759911486; x=1760516286;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pG70VB/2THcHEf1bbNlRsLCEdjUZ295qJspYMOYZW5c=;
 b=onYFphPAke1vAFtyLBG1yp8C7D/eEEPik1Ay9ik5i8ZO96fz8O2ULvHKKCplICRF1D
 02542Id33kWnhReOujm0TVL9YB7wEU5i1EeQqtOpz+RjuvO8eryZPzzVsCZqQ0zbiGqI
 tpMuT3ifh2bil0NVLaoDJ9kfnlyGS7pPcO9AK3UuLLAV1pa+zOdxy27TtU5r6ovoCUS2
 WJJ/vmyn9CQRbfOb1ez3RFNqCyWKQ7APyYX3rAX6GliSHjy4Z+aFjARekXlibEOCPc9S
 D/5ymHR9asNt5iVh6LleIzz4n3JRH/UYJvC1GrXTszqdaJqVn1dXMHjO4PHqFwosacXo
 sRBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXATCElX6RxaWV0mTfwRGjk5WfpoYeooDdVO/9f3tbajxSh9H8FLwu132RQrhxrDEe+5FgPgclKpLDaJw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymiZ3mEIxbo93J5vYXSh0IbClcjlJFtCOlkhdZaoEOyYAetFg5
 IhaxxOyf1+bJRrSqtzAdboIz8mAUM96RzRBk935cTRP99ROtMGSYWctd3DvJp2Yp4KQ=
X-Gm-Gg: ASbGncsLLqD3bsEwTI2nK/O5KlB28Ucwx6oJ/RMJzVH2Ts1CCpKHvG7++hZ8c9zlgmw
 WF+JiQWUe9erLWWgoe7T8CufPQ/vsX4dgj1hocA13bBI3rDkIIo7XJgTO5qRaIQKiJCANEov38/
 Ua7ZAhp49TvEq4nZ8+NpyaNoOQxLeCUdUyWRZGSL+VHhzz0JpM0MjxrxQSDXzeIx0h7DetZWbR7
 G6gtOqP1VzcC+zjCywGkgBJqbEJh6wNt8homLKIt6B1HVrotORQ8hD5hdGI9GqCkBxgOXLN+EAc
 gmSExej/LzCTlsdKzbmToc42WZZNaSwYpEnvNPUJ/tTMRA7D3yaYKaBJYx5Hcx8xEyZXJ3XhQV0
 X9+tCHh1GqO40Qf8ykM+p0EYePcIdi4ilFYUApUnLRg==
X-Google-Smtp-Source: AGHT+IFZ5tJ74Dd8NfGzTg8vtMg1MllO17lT82vWUmOq7OQ3gG3+s+nr7vbc7H7XnZcyQC4U55uDjQ==
X-Received: by 2002:a05:6000:2c0b:b0:3ff:17ac:a347 with SMTP id
 ffacd0b85a97d-4266e7e11c4mr1568045f8f.27.1759911486432; 
 Wed, 08 Oct 2025 01:18:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:18:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:50 +0200
MIME-Version: 1.0
Message-Id: <20251008-qcom-sa8255p-emac-v2-3-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XKd4Dvzw0ejsOil4omJOz8oD8d0/SZudynnYpUwSWG4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h415mstwMbaW7Pd+AMIYxCLrUK+0mL13oDMj
 r/Lo2JcBn6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNQAKCRARpy6gFHHX
 ci4REAC4/wE7bcatuqkHrpg5e3HuhnTcns6CmyWz3AKa2/Puse4ECBVjst/2AarVW1uwOO54Y6w
 xuvwBtYsD5n/fFvMElHuDacPLVuUEKxPAGIvSa2rWXpQDz+/rDz02E618QKXcAOPAGP/udYMrGK
 pCNGnGHYbu3973QNtraN9l/qkIWonjrYC8j2DiHWxlmTG438f/ioYqBN8lGWNgB0gABdFc6nB4K
 8FAfZzZr12R3W/hHlSLye5wRbw86R8tPGuVI8fdB3hHo/EGTEZyhZf5VkYFIm0cVX3Dw+dkR9+G
 fZBw7gcfpi92uN9QetmOSiiFRvD13QpiD26EtbO74cinB72NGOXb6s3Fdnf5mvTa2Hwn87zUQme
 ftGnM2R2IZc8rxslO14U4tNEc5/bKHT/QX2nxSPQ+xA7riXel0xBu2VlP+oh+15E2H3jZ00CyN5
 zoBVnoXTTolGtT/AceoBTEsobWOnHMtodoxIBuwLDCQEn+URSm4esLLlTotDkCuD2dQVdY7MN7a
 dcpeDWTx6OCqZH2PLrk/Vl/mLsD6thI+Bw5BNhNO1pjh0g1zbI9+3Q/VvgEn4BCyowO1iS+6k59
 hoi68TOJV25dXJ73L0Os+xXL+7hQZDY2h5VBG0zeiFi1hNfB7oaUgC0GBMacCHqeveAb31UxRtI
 6gA8uKzLorgErgQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/8] net: stmmac: qcom-ethqos: improve
 typing in devres callback
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

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index aa4715bc0b3e7ebb8534f6456c29991d2ab3f917..0381026af0fd8baaefa767f7e0ef33efe41b0aa4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -742,7 +742,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
