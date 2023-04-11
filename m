Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F466DE53B
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Apr 2023 22:04:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B03E6C65E4F;
	Tue, 11 Apr 2023 20:04:30 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BD4FC57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 20:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681243468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cxcg4D7oOn+vhVnnmmIAydop7TdCDBp1rp6PwiTdQPw=;
 b=MpWLn8aaPj9nn9AH3IXpiZlr+S2X23tYPXHChCIRC4qIxveHd0TdHbYrnLBqB5t+cokysX
 fzqvlohUSkF25S1peYs/4RqfhCZMc7VFiXSGu6/K76OuNESHAzQHeN4b08fFl1NWyIzHOr
 r8eBfIfLMEKeqYPZdw3yOVtLgatN/tw=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-iMlqBzmJNO6ZpLA4MiqeLA-1; Tue, 11 Apr 2023 16:04:25 -0400
X-MC-Unique: iMlqBzmJNO6ZpLA4MiqeLA-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-1842c947865so5229153fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Apr 2023 13:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681243464;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cxcg4D7oOn+vhVnnmmIAydop7TdCDBp1rp6PwiTdQPw=;
 b=hnqEhaMS+89VCuDtzxdwMjwgMgZTzvhCUK3aVSNhdfsr2NTqVT1thzulG1+MTDOMpG
 r6pk9/BNzQ7WJrYNuXnmnGydVPxpVNIdiAkl+y1gTeMnsBTRQQ8Y5VXalBw3aOKmhY3n
 VyYrk+Y2VjWzAzIMHTPhZWJ6qzZOGM6IDZ6Acef7TIafzl4Br5gVzcfXLnd0PQFUXy7n
 t9eih6ppZTgdY5VndM2ba5RE8bo8uRWPeQS2kJfSXXtLUy53gLSJdxZsciyO5GNxOTfw
 VLcKn/mGtTZ5/cAFfMuHjC0DUSqiH8pU3nWK4O7Xh2bbswwCuU9noNCITW0FzppIwVsy
 xGWA==
X-Gm-Message-State: AAQBX9c87F1jigKzoUlwx1fBTQFq/240Lv2Vs08MO3czpIYaNYNpPuFt
 5v6q9iZX5xfw1fOTXDo4SPBhFK8WUOFlcPf+ZWFY97i6S4zgm8guiTVGIKLPNb0KwVpU5ebh3C7
 tDz7KPEVPXpOIgElo+WYAcEPShJ89GAMOqDigZsdi
X-Received: by 2002:aca:d743:0:b0:386:9720:77da with SMTP id
 o64-20020acad743000000b00386972077damr5007471oig.26.1681243464511; 
 Tue, 11 Apr 2023 13:04:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350azWr6mlU8tkLsqApkkAbbpQnuMkm8iMeE0b6zA76CdTeqoq06KhY/ps1Hoi3qB/iOjMgYrUA==
X-Received: by 2002:aca:d743:0:b0:386:9720:77da with SMTP id
 o64-20020acad743000000b00386972077damr5007433oig.26.1681243464151; 
 Tue, 11 Apr 2023 13:04:24 -0700 (PDT)
Received: from halaney-x13s.attlocal.net
 (104-53-165-62.lightspeed.stlsmo.sbcglobal.net. [104.53.165.62])
 by smtp.gmail.com with ESMTPSA id
 e20-20020a056808149400b00387764759a3sm5868545oiw.24.2023.04.11.13.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 13:04:23 -0700 (PDT)
From: Andrew Halaney <ahalaney@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 11 Apr 2023 15:03:57 -0500
Message-Id: <20230411200409.455355-1-ahalaney@redhat.com>
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
Subject: [Linux-stm32] [PATCH net-next v4 00/12] Add EMAC3 support for
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

    1. A new address space layout for dwmac5/EMAC3 MTL/DMA regs
    2. A new programming sequence required for the EMAC3 based platforms

This series makes the changes above as well as other housekeeping items
such as converting dt-bindings to yaml, etc.

As requested[1], it has been split up by compilation deps / maintainer tree.
I will post a link to the associated devicetree changes that together
with this series get the hardware functioning.

Patches 1-3 are clean ups of the currently supported dt-bindings and
IMO could be picked up as is independent of the rest of the series to
improve the current codebase. They've all been reviewed in prior
versions of the series.

Patches 5-7 are also clean ups of the driver and are worth picking up
independently as well. They don't all have explicit reviews but should
be good to go (trivial changes on non-reviewed bits).

The rest of the patches have new changes, lack review, or are specificly
being made to support the new hardware, so they should wait until the
series as a whole is deemed ready to go by the community.

[0] https://git.codelinaro.org/clo/la/kernel/ark-5.14/-/commit/510235ad02d7f0df478146fb00d7a4ba74821b17
[1] https://lore.kernel.org/netdev/20230320202802.4e7dc54c@kernel.org/

v3: https://lore.kernel.org/netdev/20230331214549.756660-1-ahalaney@redhat.com/
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
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 178 ++++++++++++----
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  36 ++--
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |   3 +-
 .../ethernet/stmicro/stmmac/dwmac1000_dma.c   |  19 +-
 .../ethernet/stmicro/stmmac/dwmac100_dma.c    |  14 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h  | 101 +++++++--
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c |  50 +++--
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    |   8 +-
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.c  | 201 +++++++++++-------
 .../net/ethernet/stmicro/stmmac/dwmac4_dma.h  |  92 +++++---
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
 28 files changed, 886 insertions(+), 474 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.yaml

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
