Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65878734FA2
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 11:24:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08C3CC6A60D;
	Mon, 19 Jun 2023 09:24:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDF28C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:24:12 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-3f901f87195so13869975e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687166652; x=1689758652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NQTveEsgflRe93KWoqKfVrG8nlhmeJM2igknKYDTnhc=;
 b=IZtOngQUj48lgG6+O3gJagYiNPDkkKMc7uI2DjMmiXkaARrGWmmQvNwSiNHfP3KdKp
 dozz3gHy+RHYrFV4qgVZ4vtDPnXGAc6pOR2sGowPourxz9omYODemTCa+hKq73BSuP2z
 /5ofFH/d5yWb38OupfrR1VIsUG6BQo/lqQ1xM5wyudFSS3eLfyNoPFf46zx2e1b+1EL1
 m+BqoUq0JHODu5HlzPhPNlzttRHatazImjhorjexyLFNbBl+zm1TGmtAOqGWl716j3p/
 v/JchKmSDWZdtsDfqTTEvnuUZ8VRMyQN/ge0sJShHNNYEs5HbTC5moAI3pTv7UFzbP3h
 f+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166652; x=1689758652;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NQTveEsgflRe93KWoqKfVrG8nlhmeJM2igknKYDTnhc=;
 b=MoNX4tN3+uuEyJzjeUfiChZYvCGLyGFgm0uJyiNsN65mIL7KKBDOXiSlyGxXxV4Fx1
 X0o1gnkHIungoj/UdMy5rhvdh8cNJvnyqwm5/bs/U9DhSGvacZRnRI0Qd6IDs9ln9CW1
 pscHXTcffDjOkKXOSlYePSC737bYA0nS4dm5aw4muV8eIb7LrmeEPDA/PQOyQh8gcZcj
 JKu5PTCcta7r9nJf9La6tNXziwcrKMa4x9v6W4A1pH6RPYGuxzLIpD7Z/aA1YUQGNhvu
 oB0JBPrCFmxGcm5ADayonhTpj0uCQIY4pUmgi+SijqOMmY4iNhgSFGioShvnw6kIiRcl
 ZAZA==
X-Gm-Message-State: AC+VfDxWT82vvSf7AmQj5TVgebcHMDQA4Sg/nnH1gNpdBXNOY6km71Fl
 lSYyflaEtb3glX7kKsdEH8MdpA==
X-Google-Smtp-Source: ACHHUZ5TX/nrqYHgNnCprkhTEFlW0oqAmEf9RibG7Vs2uuQjjjYsYzduC9TIQoszFHG3eJiYems05Q==
X-Received: by 2002:a05:600c:4f96:b0:3f7:f302:161 with SMTP id
 n22-20020a05600c4f9600b003f7f3020161mr13122941wmq.8.1687166651986; 
 Mon, 19 Jun 2023 02:24:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a7bce89000000b003f7cb42fa20sm10045229wmj.42.2023.06.19.02.24.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 02:24:11 -0700 (PDT)
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
Date: Mon, 19 Jun 2023 11:23:48 +0200
Message-Id: <20230619092402.195578-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND PATCH net-next v2 00/14] net: stmmac:
	dwmac-qcom-ethqos: add support for EMAC4
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

Extend the dwmac-qcom-ethqos driver to support EMAC4. While at it: rework the
code somewhat. The bindings have been reviewed by DT maintainers.

This is a sub-series of [1] with only the patches targetting the net subsystem
as they can go in independently.

[1] https://lore.kernel.org/lkml/20230617001644.4e093326@kernel.org/T/

Bartosz Golaszewski (14):
  net: stmmac: dwmac-qcom-ethqos: shrink clock code with devres
  net: stmmac: dwmac-qcom-ethqos: rename a label in probe()
  net: stmmac: dwmac-qcom-ethqos: tweak the order of local variables
  net: stmmac: dwmac-qcom-ethqos: use a helper variable for &pdev->dev
  net: stmmac: dwmac-qcom-ethqos: add missing include
  net: stmmac: dwmac-qcom-ethqos: add a newline between headers
  net: stmmac: dwmac-qcom-ethqos: remove stray space
  net: stmmac: dwmac-qcom-ethqos: add support for the optional serdes
    phy
  net: stmmac: dwmac-qcom-ethqos: add support for the phyaux clock
  net: stmmac: dwmac-qcom-ethqos: prepare the driver for more PHY modes
  net: stmmac: dwmac-qcom-ethqos: add support for SGMII
  net: stmmac: add new switch to struct plat_stmmacenet_data
  dt-bindings: net: qcom,ethqos: add description for sa8775p
  net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p
    platforms

 .../devicetree/bindings/net/qcom,ethqos.yaml  |  12 +-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 284 +++++++++++++-----
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
 include/linux/stmmac.h                        |   1 +
 5 files changed, 226 insertions(+), 76 deletions(-)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
