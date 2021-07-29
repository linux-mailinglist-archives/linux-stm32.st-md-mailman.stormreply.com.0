Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 705833DD35B
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32164C5AB69;
	Mon,  2 Aug 2021 09:51:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC7D5C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 20:11:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id e21so8300570pla.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 13:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1DcINwqfJqO0dtPIz+bu4Dg7uAJTjlEluLn5n1AaFQ=;
 b=igb01awKOgcbEbBWdptZNnPS3aA2621O4Rz8/Uw3mYCgfIlIp/mFJXb+zFB57GL7vM
 WRqgSTr74HoTswSPtoQqs+Nz6JC6g3uUiw0q0sBYGP9lMztqCB05vl5FNYxyRavi8YM6
 IqidDVLUbNk2dIzYSj8wni04030cr+3fRwUanN1ikHAMCJnsyZf4AA3Qw7SF/rn+ovfj
 ZHmcm6omslE0MFq+2Kh4GFgj111d9vEnZ4JT9hLvrYVfLYIrSS9lkX6WE5c0TXZmqVsu
 mPRiKekh3FGxZvSZ3aOYbWVdIt2jH9tK/vPkr5/HpcAdBDeqJJ9/LtGajwxyaJjDhPRy
 KN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1DcINwqfJqO0dtPIz+bu4Dg7uAJTjlEluLn5n1AaFQ=;
 b=EO/9cu+t8imAOa8RGFEC2VicOdo/HgURd1Y+A5aYu5PNTp3U1wGhfONHIq4yVA/sbd
 rhyLHzkE4i0DcRCWgTanLPeHERM7v3VOX0EeJ+NiLatfKwePrgY9ECPa1N4KuqgXlgZQ
 8oX0izvW71zxdnOAqlsZSGawcPrIRmnIIA9IuuqFyc8iH3OYItQfZ8KSnf3NUeqxtq9v
 RYX9AGuf5s3Za+z+rVIkF96VIzFyVcI+0LK3xJc7Pl9yCsz/ztnj71pUdXF/GWfahqnL
 Hnh3QAFfaC7KeaDEqMIY9HJbAGrUeIw0/wPgaBQuSmhH2tGoUUd1z8wD4+bqQmHzjKwe
 cuxA==
X-Gm-Message-State: AOAM531po4sSRSreAXgDBNCG/sy0gAxjoueho9q6zqPQn3Nyv+Xv6HtV
 pOFoDImo4FdbPJt50hdjlSo=
X-Google-Smtp-Source: ABdhPJwGKpnTbv+C5Cd9r3idwiLy7WXCCr7A9uP9HatThZRm4SpBVI1ma+PGoaVlCJygldBP6r8vLA==
X-Received: by 2002:a63:1359:: with SMTP id 25mr5265930pgt.79.1627589501459;
 Thu, 29 Jul 2021 13:11:41 -0700 (PDT)
Received: from archl-on1.. ([103.51.72.31])
 by smtp.gmail.com with ESMTPSA id i25sm4581407pfo.20.2021.07.29.13.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 13:11:41 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org
Date: Fri, 30 Jul 2021 01:40:51 +0530
Message-Id: <20210729201100.3994-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729201100.3994-1-linux.amoon@gmail.com>
References: <20210729201100.3994-1-linux.amoon@gmail.com>
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
Subject: [Linux-stm32] [PATCHv1 2/3] ARM: dts: meson: Use new reset id for
	reset controller
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

Used new reset id for reset controller as it conflict
with the core reset id.

Fixes: b96446541d83 ("ARM: dts: meson8b: extend ethernet controller description")

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/meson8b.dtsi  | 2 +-
 arch/arm/boot/dts/meson8m2.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index c02b03cbcdf4..cb3a579d09ef 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -511,7 +511,7 @@ &ethmac {
 	tx-fifo-depth = <2048>;
 
 	resets = <&reset RESET_ETHERNET>;
-	reset-names = "stmmaceth";
+	reset-names = "ethreset";
 
 	power-domains = <&pwrc PWRC_MESON8_ETHERNET_MEM_ID>;
 };
diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index 6725dd9fd825..cfaf60c4ba5f 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -34,7 +34,7 @@ &ethmac {
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "stmmaceth", "clkin0", "clkin1", "timing-adjustment";
 	resets = <&reset RESET_ETHERNET>;
-	reset-names = "stmmaceth";
+	reset-names = "ethreset";
 };
 
 &pinctrl_aobus {
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
