Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4049B3DD359
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9D15C5AB63;
	Mon,  2 Aug 2021 09:51:16 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A196AC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 20:11:14 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id q2so8270669plr.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 13:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SFY+mAXfPYLLK9cW7HzO6u98/FnYWTRchgWW3VXCzJY=;
 b=CZRZWcBHZ3gsBtAsaaCXtu4WXrBPcFPXBjErtIBPrg3LCfGvZKMvnvfzxOpuB8yNuS
 b7hhyG7Ydp7eXWqF8NZvY4Lk1EBHnBK1p9DWUGTAWBOWxqGVTxU/8wFyMteNvkDgQsu/
 /D4PUp0w1T3efUYYyJrY/whFdocsigxCWbSaSOONiVqCG1LMGxL/6XSduRWAMFT4NY/0
 3wGuS5uxtRvB+kGK/10DuuJNLa57PUIf04hkTgiN/AhzEhd5/8FmI3+ezlTqRSIMW9fY
 /8FKk7lN/0ho69zNfQ/k9avzfqLVlDOOiDcavnkKkuof89/k0Ite+rQ1I6n4ghc6uEWo
 VU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SFY+mAXfPYLLK9cW7HzO6u98/FnYWTRchgWW3VXCzJY=;
 b=QF4Ab+EzqBxC+BL/fUlBv0KMd+lTDlFXP/5QiH9fX5i1KDCeEzVdzgnOzCnGxlQXnQ
 3z2adIdp86vyv6TvHofJnsfZj1C1JocIW8oKw/ItWRAhnkjFsvsCvjnXGpaRuzWKoOVo
 ic44slPU2qt3c/jvMiCjd3CtNVGUVZyvL21rB/Z5V2DuFvMbA/ExPcHCy74aIVxSrs2L
 Dd2XyuZIAuTAGQWhYPlWt8yAHH2PUnU6J6S8CwVJHKI2Lkkb7lnA0+Xvaq0BQuNwgqxs
 9Y/u6xh31Q9GLmELplK8vUzJKmDmsHoyJ7Hc7wZlorYX+2bXZoQKumBveyEEDkbHo8G7
 HADg==
X-Gm-Message-State: AOAM531CEswSaaod5hcJztvG1/EURGK/ufGbsEv/lMoHj4/mDPR4oQUi
 O/EExFKyLlWliFUmMo3b9DM=
X-Google-Smtp-Source: ABdhPJyLfmsnUTsywkKEatkPj6U8cyNcuBN/igDBOIZHeLE0gMDlmQgZxQF2YmSyYSFXYKsLiD5tZA==
X-Received: by 2002:a17:902:f68d:b029:12c:4619:c63a with SMTP id
 l13-20020a170902f68db029012c4619c63amr6316218plg.66.1627589473174; 
 Thu, 29 Jul 2021 13:11:13 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:12 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Date: Fri, 30 Jul 2021 01:40:49 +0530
Message-Id: <20210729201100.3994-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>, Anand Moon <linux.amoon@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [Linux-stm32] [PATCHv1 0/3] Add Reset controller to Ethernet PHY
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

It is being observed some time the Ethernet interface
will not send / recive any packet after reboot.

Earlier I had submitted Ethernet reset ID patch
but it did not resolve it issue much, Adding new 
reset controller of the Ethernet PHY for Amlogic SoC
could help resolve the issue.

Thanks
-Anand

Anand Moon (3):
  arm64: dts: amlogic: add missing ethernet reset ID
  ARM: dts: meson: Use new reset id for reset controller
  net: stmmac: dwmac-meson8b: Add reset controller for ethernet phy

 arch/arm/boot/dts/meson8b.dtsi                |  2 +-
 arch/arm/boot/dts/meson8m2.dtsi               |  2 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  2 ++
 .../boot/dts/amlogic/meson-g12-common.dtsi    |  2 ++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  3 +++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 20 +++++++++++++++++++
 6 files changed, 29 insertions(+), 2 deletions(-)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
