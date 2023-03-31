Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4736D2A1D
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 23:46:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3567AC69069;
	Fri, 31 Mar 2023 21:46:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04510C6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 21:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680299172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qRXp4dQiGms/64nGsSVBVjLN6Pe4B52p8MOn8ojXq0c=;
 b=f99XDGIHzZ1BipsUPXuofPfH3Ltw9s/Z21T/J+T5fX79jRmgoBQnLsHxUeZDW2jDvfAdgw
 1p57IRYAbcNmo+rV6svtiUZEkyVrw7bv3UfiWahFShGg55vGIeoDovOhFgn3fXJoDZGSq1
 KSe0WuL5OJXIqBdGXDIWmqyP0h0Ne6Y=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-KGxWquoSMXmLcoTMx67QtQ-1; Fri, 31 Mar 2023 17:46:09 -0400
X-MC-Unique: KGxWquoSMXmLcoTMx67QtQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 y9-20020a9d4609000000b006a122249d55so7478398ote.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 14:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680299169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qRXp4dQiGms/64nGsSVBVjLN6Pe4B52p8MOn8ojXq0c=;
 b=c9uCzq8maKE8+o0aS8SlVHMakRjhQqhsuzMpOSqtC4YMRuXTB7bEITB5+qiVY0sJ7u
 2dV+pyY33K4ZD6qP6Vhj8mtAoVM+0sx1BEw3vncixj26RP9MCBaCR6wmUrCvAOQ6uHVy
 9Bj7ppvw+C82az0NflqB4Mza4SRfExcvUa5Sn7rgzV3tmsOb8f/gBQzcKHMJqQyoFSzt
 /oiq2ixEtjEQtu9qanKvXDTWyyDmpIcq4jANw40UFtxzV+JOzfOYeVGYvJYimEOa8XFM
 dkyDI8Q76kg9zYr6sJnpzjedfzoZMiPQ1VjLMf8tcwwbW7TBZTpg325lzalWtAgcmJZ8
 gwXg==
X-Gm-Message-State: AAQBX9e1PS9EkFtBrUUoUvIp0xYUKcnnoLwJjgMMY/4cICc7ITwDRh5D
 Zx9wKavJZeHp83Ht29xamVRqg0MybdaqK/SAfnoMxlkA2e1yLILCPrb7M04/WXOMPvte6je784a
 NkGCqqYG5dSPqmxLOCG1vJk9DtWa8NbwTPLEblDrO
X-Received: by 2002:a9d:7310:0:b0:698:d198:fe9b with SMTP id
 e16-20020a9d7310000000b00698d198fe9bmr13806481otk.10.1680299169051; 
 Fri, 31 Mar 2023 14:46:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350bgDIpshy7eRbTWkRwLsC3s4240Hq2Oc16KqDrLzmDT3k9i5ye972UijmCNDTVHDvOHjC4iow==
X-Received: by 2002:a9d:7310:0:b0:698:d198:fe9b with SMTP id
 e16-20020a9d7310000000b00698d198fe9bmr13806471otk.10.1680299168800; 
 Fri, 31 Mar 2023 14:46:08 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 x80-20020a4a4153000000b0053d9be4be68sm1328531ooa.19.2023.03.31.14.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 14:46:08 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 31 Mar 2023 16:45:37 -0500
Message-Id: <20230331214549.756660-1-ahalaney@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: mturquette@baylibre.com, edumazet@google.com,
 krzysztof.kozlowski+dt@linaro.org, jonathanh@nvidia.com,
 linux-stm32@st-md-mailman.stormreply.com, tee.min.tan@linux.intel.com,
 samuel@sholland.org, linux@armlinux.org.uk, jernej.skrabec@gmail.com,
 veekhee@apple.com, wens@csie.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, andrey.konovalov@linaro.org,
 Andrew Halaney <ahalaney@redhat.com>, ncai@quicinc.com,
 devicetree@vger.kernel.org, bhupesh.sharma@linaro.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com, bmasney@redhat.com,
 mohammad.athari.ismail@intel.com, robh+dt@kernel.org, ruppala@nvidia.com,
 jsuraj@qti.qualcomm.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, echanude@redhat.com,
 konrad.dybcio@linaro.org, vkoul@kernel.org, hisunil@quicinc.com,
 mcoquelin.stm32@gmail.com, davem@davemloft.net
Subject: [Linux-stm32] [PATCH net-next v3 00/12] Add EMAC3 support for
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

This series makes the change for 1 above as well as other housekeeping items
such as converting dt-bindings to yaml, etc.

As requested[1], it has been split up by compile time / maintainer tree.
I will post a link to the associated devicetree changes that together
with this series get the hardware functioning.

[0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17
[1] https://lore.kernel.org/netdev/20230320202802.4e7dc54c@kernel.org/

v2: https://lore.kernel.org/netdev/20230320221617.236323-1-ahalaney@redhat.com/
v1: https://lore.kernel.org/netdev/20230313165620.128463-1-ahalaney@redhat.com/

Thanks,
Andrew

Andrew Halaney (9):
  dt-bindings: net: qcom,ethqos: Add Qualcomm sc8280xp compatibles
  net: stmmac: Remove unnecessary if statement brackets
  net: stmmac: Fix DMA typo
  net: stmmac: Remove some unnecessary void pointers
  net: stmmac: Pass stmmac_priv in some callbacks
  net: stmmac: dwmac4: Allow platforms to specify some DMA/MTL offsets
  net: stmmac: dwmac-qcom-ethqos: Respect phy-mode and TX delay
  net: stmmac: dwmac-qcom-ethqos: Use loopback_en for all speeds
  net: stmmac: dwmac-qcom-ethqos: Add EMAC3 support

Bhupesh Sharma (3):
  dt-bindings: net: snps,dwmac: Update interrupt-names
  dt-bindings: net: snps,dwmac: Add Qualcomm Ethernet ETHQOS compatibles
  dt-bindings: net: qcom,ethqos: Convert bindings to yaml

 .../devicetree/bindings/net/qcom,ethqos.txt   |  66 ------
 .../devicetree/bindings/net/qcom,ethqos.yaml  | 111 ++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 MAINTAINERS                                   |   2 +-
 .../net/ethernet/stmicro/stmmac/chain_mode.c  |  10 +-
 drivers/net/ethernet/stmicro/stmmac/common.h  |   2 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 177 +++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  36 ++--
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |   3 +-
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  19 +-
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |  14 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  |  91 ++++++--
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  50 +++--
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |   8 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 201 +++++++++++-------
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  89 +++++---
 .../net/ethernet/stmicro/stmmac/dwmac4_lib.c  | 105 +++++----
 .../net/ethernet/stmicro/stmmac/dwmac_dma.h   |  22 +-
 .../net/ethernet/stmicro/stmmac/dwmac_lib.c   |  18 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   9 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   6 +-
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  71 ++++---
 .../net/ethernet/stmicro/stmmac/enh_desc.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 176 ++++++++-------
 .../net/ethernet/stmicro/stmmac/norm_desc.c   |   8 +-
 .../net/ethernet/stmicro/stmmac/ring_mode.c   |  10 +-
 .../net/ethernet/stmicro/stmmac/stmmac_mdio.c |   3 +-
 include/linux/stmmac.h                        |  19 ++
 28 files changed, 871 insertions(+), 475 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
