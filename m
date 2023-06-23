Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5819373B492
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 12:08:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 129EBC65E42;
	Fri, 23 Jun 2023 10:08:51 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6EF9C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 10:08:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-3f9b258f3a2so6056895e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 03:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687514929; x=1690106929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fDzo5p1mZFBjmKSvhuFKJUtPJvnlJYcgbu3Ka9Hgxzg=;
 b=LveZnjMCCP6/fpLmRtKGNhRIBVmVK8oK/2H6vqKNdprxDvC+pY1VSdVbkOKJTvvbeh
 HAkpEq2O+8Ih/1+l7K/hMvqY7rl1E+km397snNYReBh684dv2IA+Gg0TxACACoVd0x1U
 K0avKe8Yg2bXKN8LZZPJFbYrRZemip/M1Q+5QFfl2NpRD1KdtE4Mt2XJTceKYZr+DVLI
 BCyUILxBK8ac65/zzcIWnljpVK6Ih3fAnp95R60fB2wPiwh3wY9uFQqN6pjPu76/5dzP
 Iz+P9QuFEVVQz1pZdtdHTIA1crTylPnUmO9ubd8DNDyMv8W+S703s78z05Q/Nyn8RREA
 cLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687514929; x=1690106929;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fDzo5p1mZFBjmKSvhuFKJUtPJvnlJYcgbu3Ka9Hgxzg=;
 b=JZ8gSPXxDGBzPIMHySqWnCfLyummqJjyg/8WXtDtE2rw+v/wAs3CfIoM2q3Z5VfDA6
 Vx22kw2bwyyWN5CcCaOxW2GAQljQQenMzd7DWJgOhT3QpWOJ+w2E8L0K6BQMUFBxCnkL
 N0I0XpJbqALEkHCzzSgFdFczA32DlCn1l/z/g+aSx4U89oH1pJBMqZljC9qvmM+TtPbh
 Opv+yQcoVjTPy8SxWGk+SECw9mfcy+2o7yUOhBgu5fi/ZzdrCEdNJUfqHcSAa+qC9n//
 eFsYQuL2NrXPkaNyUExv/trNmI6bxJ4xs6/95NkZ5fzfgRqNXuDmjH1CQ5TLoroclvQ7
 QR9A==
X-Gm-Message-State: AC+VfDyFC0XDfEm9iuS7HGN259VkzCfTcWIGivqdkkts+/9xyvZQ7EXm
 lI0pYGiXgJKjQSdyZOFO4K9nyg==
X-Google-Smtp-Source: ACHHUZ68lFgy+5quSvGjq6/o294si3N8IqybkvRXb9VA4ggHvddBsyRaC/PDXNVdHtbL1mYT0kS3XQ==
X-Received: by 2002:a05:600c:22cf:b0:3f9:b358:8197 with SMTP id
 15-20020a05600c22cf00b003f9b3588197mr10247113wmg.11.1687514929338; 
 Fri, 23 Jun 2023 03:08:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:ddc2:ce92:1ed6:27bd])
 by smtp.gmail.com with ESMTPSA id
 k18-20020adfe8d2000000b0030ae3a6be4asm9278100wrn.72.2023.06.23.03.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 03:08:48 -0700 (PDT)
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
Date: Fri, 23 Jun 2023 12:08:33 +0200
Message-Id: <20230623100845.114085-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 00/12] net: stmmac: replace
	boolean fields in plat_stmmacenet_data with flags
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

As suggested by Jose Abreu: let's drop all 12 boolean fields in
plat_stmmacenet_data and replace them with a common bitfield.

v1 -> v2:
- fix build on intel platforms

Bartosz Golaszewski (12):
  net: stmmac: replace the has_integrated_pcs field with a flag
  net: stmmac: replace the sph_disable field with a flag
  net: stmmac: replace the use_phy_wol field with a flag
  net: stmmac: replace the has_sun8i field with a flag
  net: stmmac: replace the tso_en field with a flag
  net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
  net: stmmac: replace the vlan_fail_q_en field with a flag
  net: stmmac: replace the multi_msi_en field with a flag
  net: stmmac: replace the ext_snapshot_en field with a flag
  net: stmmac: replace the int_snapshot_en field with a flag
  net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
  net: stmmac: replace the en_tx_lpi_clockgating field with a flag

 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 23 +++++------
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  5 ++-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  8 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  4 +-
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  2 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 10 +++--
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  5 ++-
 include/linux/stmmac.h                        | 26 ++++++------
 12 files changed, 76 insertions(+), 57 deletions(-)

-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
