Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C36C2456
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 23:16:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58E6DC6A603;
	Mon, 20 Mar 2023 22:16:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FAA4C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 22:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679350595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/pYp/+TvIZEdbO864hX1ZaEe6NV95MuM6NldpNo+j88=;
 b=K7DQ7AC7+b/juo3xmxmW7NpCfdOvaIQW1hxtYebGRJ3eXSLxcDXRARmFhA1ER4DbT8l3e1
 tI9piwESwlhK1YMga1GsLKscrYQZvnM2WJXBTILB1FWb4UUc9lxKMT6lQ2zrcGcpeaxzSN
 Gx4rRLHHZjbLihPcIWJ9DnRVCl21cLE=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-JWZQUTe1P0a2zUxrj10taA-1; Mon, 20 Mar 2023 18:16:34 -0400
X-MC-Unique: JWZQUTe1P0a2zUxrj10taA-1
Received: by mail-oo1-f69.google.com with SMTP id
 e3-20020a4ad243000000b00536a31d36e6so4042060oos.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 15:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679350593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/pYp/+TvIZEdbO864hX1ZaEe6NV95MuM6NldpNo+j88=;
 b=DWlUOEUALQAWxm/dSNtcEo0ungiXmpQVf+SNWJzPPJI3+qRzqX3UKxLrgeDM5TJk0+
 T23ZonPEUt/lpo9TaDGB1sGhS6fwvfwYUtnla+G4zoNzz6xcHg6CpfG0rUvJK8y8MA1Z
 5hp9wh+3gWtaZ29iyMVc/OTEZoqItomeIBXRHgRp6V/moclXlDNg3JtdaZcKxDhJtx3W
 MLg++MDZO6Btm1uzjGpOVA3xX2oAoTWWU/B7Q63cj9855J8JeGalPccmxJaFNE/oCo05
 LRGVboGpFe9I7iUFCS86YFN4MM4ERyK4pd3u+CZ3O+ck4dH2/ilUHVUmjeYxMtIG33zt
 X8fw==
X-Gm-Message-State: AO0yUKVIvHhT2Z7Bwov9HRhb1UPwT5yQ7NgdITSCIc8wCsxyX65zy27C
 Qk1HknpdRa1eMowJ6g1oFS4AlTBxymEZLTrU8lvnGiSEUvNfqR/z6DOsLdGPEU+7kdqg1hLvclS
 EC6SJG4P2kn5HReqk1owcN2bYYevy5RbjQ8XTZ2JU
X-Received: by 2002:a05:6808:10c:b0:387:117f:f7fb with SMTP id
 b12-20020a056808010c00b00387117ff7fbmr25019oie.20.1679350592186; 
 Mon, 20 Mar 2023 15:16:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set+FD0dDk0+dvXSvybPdytDkBKj3L/oyZtE72xtPkWildC/DlDoAUTQxy/hAD04b7A6y0cPDLA==
X-Received: by 2002:a05:6808:10c:b0:387:117f:f7fb with SMTP id
 b12-20020a056808010c00b00387117ff7fbmr24984oie.20.1679350590464; 
 Mon, 20 Mar 2023 15:16:30 -0700 (PDT)
Received: from halaney-x13s.redhat.com
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 q204-20020a4a33d5000000b0053853156b5csm4092465ooq.8.2023.03.20.15.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 15:16:29 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 Mar 2023 17:16:05 -0500
Message-Id: <20230320221617.236323-1-ahalaney@redhat.com>
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
 echanude@redhat.com, mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v2 00/12] Add EMAC3 support for
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

v1: https://lore.kernel.org/netdev/20230313165620.128463-1-ahalaney@redhat.com/

Thanks,
Andrew

Andrew Halaney (8):
  dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
  clk: qcom: gcc-sc8280xp: Add EMAC GDSCs
  arm64: dts: qcom: sc8280xp: Add ethernet nodes
  arm64: dts: qcom: sa8540p-ride: Add ethernet nodes
  net: stmmac: Remove unnecessary if statement brackets
  net: stmmac: dwmac-qcom-ethqos: Respect phy-mode and TX delay
  net: stmmac: dwmac-qcom-ethqos: Use loopback_en for all speeds
  net: stmmac: dwmac-qcom-ethqos: Add EMAC3 support

Bhupesh Sharma (3):
  dt-bindings: net: snps,dwmac: Update interrupt-names
  dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
  dt-bindings: net: qcom,ethqos: Convert bindings to yaml

Brian Masney (1):
  net: stmmac: Add EMAC3 variant of dwmac4

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 ----
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 111 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 MAINTAINERS                                   |   2 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts     | 181 ++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |  53 +++
 drivers/clk/qcom/gcc-sc8280xp.c               |  18 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 161 ++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  32 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 235 ++++++++++--
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 334 ++++++++++++++----
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
 21 files changed, 1196 insertions(+), 258 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
