Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4856B7EC9
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 18:06:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA1B7C65E5A;
	Mon, 13 Mar 2023 17:06:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E5E4FC035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 17:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678727184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t5POBg1qZ82GqoEDaDaIA79xn4Mgw94E10MmvGFG+QA=;
 b=OYDCeKYlLkV7IjYnwOUnHjq6WrudNIr917/uTp+ppX7zcvq7cPCYe/g3rR8t0eEf3jOoru
 /sybMZCRtx89OIjFlpGiG5ImRpnuTNTQpyib6CywGb1LkACq4xirRWrxkxQXJJCA1Z/80F
 vYEiKQMAFeL6P4o5/TB/hkO8zJaei2w=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-aEVwre1jPfOsp0Ar7NH1iQ-1; Mon, 13 Mar 2023 13:06:23 -0400
X-MC-Unique: aEVwre1jPfOsp0Ar7NH1iQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 b7-20020ac85407000000b003bfb9cff263so7085695qtq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 10:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678727182;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t5POBg1qZ82GqoEDaDaIA79xn4Mgw94E10MmvGFG+QA=;
 b=YjUEldBB27+FLaGUYtUq2OKtH8c6TMqO4tCDqq/6rYa1s9PYZeBTPDDPOWDVVAU781
 wtXSg00neZMhQC8lZ2xaTw/y/QF2K/RqAHZzAKfEQc5MuEghK5B1XvKSruK+j6euHfYR
 fQPk2mTMzzMEYy+wOkw1jMWnk3HxN5dqnZUwEEPmK9J+bwKvDWcsQT5jcRphNVvUBMLp
 e871IKOcDSeN2m7ujEuiU3Tw3HlfEtcnvYB5IlAXlljiuPZFZj76wHV6lT8aIV3rXkS1
 VTJvFd8JVCPSwtC/Y0df9wgxSH94JmpbVuiCRAJUZA4Lm7GNFbsxlNWMk929F9S1q6up
 O4YQ==
X-Gm-Message-State: AO0yUKXNFL5CrliusNdQuq1EOxScNnj2YDzdau5C1UiDPl4TJZUlh9Ff
 Na3/q4Wh8IWAMVA6Qi9ol+8f0ABZlWZuOF/1Lw04zdSxJJtDbnwruZdK+/14QuQmlV7gPXO93Wp
 8DNKeerfrYs9+U88MxDEgSYfwbtbviYozhWTq3IQZ
X-Received: by 2002:a05:6808:150:b0:37f:b1d6:9f3c with SMTP id
 h16-20020a056808015000b0037fb1d69f3cmr17439013oie.46.1678726637931; 
 Mon, 13 Mar 2023 09:57:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set/DcZ9ZIOTk8pbqQbIpqBKMFacVCaRW/B1/QFZ8b2XK2GO2nvasDBBZ4a2w0GAU24OnbrYXGg==
X-Received: by 2002:a05:6808:150:b0:37f:b1d6:9f3c with SMTP id
 h16-20020a056808015000b0037fb1d69f3cmr17438954oie.46.1678726636191; 
 Mon, 13 Mar 2023 09:57:16 -0700 (PDT)
Received: from halaney-x13s.attlocal.net ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 o2-20020acad702000000b00384d3003fa3sm3365273oig.26.2023.03.13.09.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 09:57:15 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 13 Mar 2023 11:56:09 -0500
Message-Id: <20230313165620.128463-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-clk@vger.kernel.org, tee.min.tan@linux.intel.com, linux@armlinux.org.uk,
 veekhee@apple.com, hisunil@quicinc.com, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, netdev@vger.kernel.org,
 andersson@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 agross@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next 00/11] Add EMAC3 support for
	sa8540p-ride
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

This is a forward port / upstream refactor of code delivered
downstream by Qualcomm over at [0] to enable the DWMAC5 based
implementation called EMAC3 on the sa8540p-ride dev board.

From what I can tell with the board schematic in hand,
as well as the code delivered, the main changes needed are:

    1. A new address space layout for /dwmac5/EMAC3 MTL/DMA regs
    2. A new programming sequence required for the EMAC3 base platforms

This series makes those adaptations as well as other housekeeping items
such as converting dt-bindings to yaml, adding clock descriptions, etc.

[0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17

Thanks,
Andrew

Bhupesh Sharma (3):
  dt-bindings: net: snps,dwmac: Update interrupt-names
  dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
  dt-bindings: net: qcom,ethqos: Convert bindings to yaml

Brian Masney (1):
  net: stmmac: Add EMAC3 variant of dwmac4

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 ----
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 113 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  11 +-
 MAINTAINERS                                   |   2 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts     | 181 ++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  53 +++
 drivers/clk/qcom/gcc-sc8280xp.c               |  18 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 161 ++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  32 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 190 ++++++++--
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 336 ++++++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  38 ++
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  | 144 ++++++--
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  29 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    |   2 +
 .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |   6 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  17 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |   9 +-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |   4 +-
 include/dt-bindings/clock/qcom,gcc-sc8280xp.h |   2 +
 include/linux/stmmac.h                        |   1 +
 21 files changed, 1164 insertions(+), 251 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
