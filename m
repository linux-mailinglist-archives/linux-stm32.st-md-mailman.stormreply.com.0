Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6BB73184D
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:14:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2457EC65E58;
	Thu, 15 Jun 2023 12:14:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0BC2C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:14:32 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3f8d258f203so15593555e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831272; x=1689423272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ggxw8AJ4x4mujGVS6874wxSJqrcpmQspYJe004iAEM=;
 b=lM1if9k9keg0vDzbKt1AKO0xkJkVeN+rZ6FMpLcVodcQ7Jp8vDPzt9qq2+wP7YFcc7
 bQVrDiBsAinWN9P34UwWTJg5iSBMMEjgJYGCA1XQtPe3+/pT/pdbQl5x3ASa98cL/k4e
 L14/0sxIsK22vdCpIO97wFnmnCsZ2H+xmdRQfQxCPz/zUr2EduyFrzoELJIEXRN4p7Hr
 ApJH2FGz1TJQL0wGEykuYItgdGHK0fnBXCcS1lurpuqaVIHIClIIbeAYA3xWON+kJNSx
 6lY6wy4nz+cUSJmoBDwJbbGshHu4HchtugP3Tn3EhAr2KWSJMTyE3qWXYQaoAqtPV3g0
 mPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831272; x=1689423272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ggxw8AJ4x4mujGVS6874wxSJqrcpmQspYJe004iAEM=;
 b=FH0u2Wzkjh/a8uREjL5wUij4Jxk8jGl2RP3zNZCluYQzUZht0ccMtxox64OurWObfj
 vp8HBHNAH0Gp7e0OnUbjlr0zKCuwi4mzoPWzOohbFnLPzuEyJOy5MSrJsMjXYqCpLK5G
 lb+UGOSPkoMBL/UzGj2jR9HC0djRMqcA+2kZut1iM0Yf/EfDArR2GD3NxGRpe5Ye2nQ7
 oYFJUjNt3lb36t+c449QqOi3nxip/sGI7bx93xiJOHA+zrAXFjblNlXDPPVF2bjGtLcL
 nwbLmFXdKQLylo39brECLZXlglA9vyjsvxcS/mKT/PPDJ8lcNbhqDTPAfLmUc+wD0nf7
 5M+A==
X-Gm-Message-State: AC+VfDxX7pa0wkKO7J+bJYf+Yt9Wishvb2aUCLzR85Nb6Y1pSJ/0eRWG
 jZO+t2TG6x9llyMYPtXeI+j9uQ==
X-Google-Smtp-Source: ACHHUZ7+XHyQdkqyLOC/Dq+xUto1NKb5LQTqrupqa4BwTtzl1CCPc5GAJrjuw1I7+bALM5I6JonbMg==
X-Received: by 2002:a1c:4b13:0:b0:3f7:f264:3edc with SMTP id
 y19-20020a1c4b13000000b003f7f2643edcmr12461441wma.14.1686831272107; 
 Thu, 15 Jun 2023 05:14:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:14:31 -0700 (PDT)
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
Date: Thu, 15 Jun 2023 14:13:56 +0200
Message-Id: <20230615121419.175862-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 00/23] arm64: qcom: sa8775p-ride: enable
	the first ethernet port
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

There are three ethernet ports on sa8775p-ride. This series contains changes
required to enable one of the two 1Gb ports (the third one is 10Gb). We need
to add a new driver for the internal SerDes PHY, introduce several extensions
to the MAC driver (while at it: tweak coding style a bit etc.) and finally
add the relevant DT nodes.

v1 -> v2:
- move the phy-supply property from the MAC driver over to the SerDes PHY
  driver
- rework the SerDes PHY driver to work with the correct ordering of phy
  operations (init -> power_on -> set_speed)
- change the serdes_phy node label to serdes0 to be in line with other DT
  sources and make it ready for the second PHY instance
- dropped the status property from the example in SerDes PHY's DT bindings
  and moved properties around
- reworked the fourth clock in the ethqos driver: it's handled the same
  whether it's called rgmii or phyaux
- other minor tweaks
- use 0x0 consistently in DT
- squash dwmac and ethqos-specific bindings changes
- collected tags

Bartosz Golaszewski (23):
  phy: qualcomm: fix indentation in Makefile
  dt-bindings: phy: describe the Qualcomm SGMII PHY
  phy: qcom: add the SGMII SerDes PHY driver
  arm64: defconfig: enable the SerDes PHY for Qualcomm DWMAC
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
  arm64: dts: qcom: sa8775p: add the SGMII PHY node
  arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface
  arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY
  arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
  arm64: dts: qcom: sa8775p-ride: enable ethernet0

 .../devicetree/bindings/net/qcom,ethqos.yaml  |  12 +-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../phy/qcom,sa8775p-dwmac-sgmii-phy.yaml     |  55 +++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 109 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  42 ++
 arch/arm64/configs/defconfig                  |   1 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 284 ++++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
 drivers/phy/qualcomm/Kconfig                  |   9 +
 drivers/phy/qualcomm/Makefile                 |   3 +-
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     | 451 ++++++++++++++++++
 include/linux/stmmac.h                        |   1 +
 12 files changed, 895 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
