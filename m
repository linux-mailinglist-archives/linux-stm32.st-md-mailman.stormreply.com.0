Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3B17DA35
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Mar 2020 09:05:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B451C36B0F;
	Mon,  9 Mar 2020 08:05:06 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB407C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2020 16:40:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v11so3107482wrm.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Mar 2020 08:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XjHnSwyS0af+P6Jfh8Jzg4HPNo9WQiL8yOX1s0HApbQ=;
 b=CbSaDyS3tlGIXzJPDGmj9+AIlYyU7Yowmve6GEk50xA6VmLmZxHH5HW67z5v9akxJN
 nGmqQ1FAjSNx511yM1rus1wIj4/+IgiLa4jFXAq3t+VnZPbcJi2ejnaUkV6b5SKW6kyN
 hzxB5IKSXIbWozwe8M041xvmZrKHB1s6eVUpG+MsHaDJ0Spfb05SAOeiwB8cKCN/Pn2e
 fPhbdTuB2mYwsxcsDnol2mJBRBqcYUpJIndkM4bjmdNdbvdjzaAKHs5iHbBERWAoQ6Ed
 IPbTM3kZsKjUscXO0/PBVdGu+tjOfbi+/lP9+Wz2T8EPTasDaTPRevA4VXyeTR6nXrpn
 tWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XjHnSwyS0af+P6Jfh8Jzg4HPNo9WQiL8yOX1s0HApbQ=;
 b=DfwE+YBY8bOyE5HgkYkYVhASR3z7J9DT+5DRqlXGylaHUal1DIhQWSXuK5WtwtBT/U
 Ab6hKdXicHGPbw9nJP9Zj9tMoQYwx9moh6+o1mSKTTNXxXZ6+hdTx79V1YSlmDnnCMAd
 32zFyky/5SD5FofhyLD5mmp/d0j5OL7KZAz+Az7KccZmgAMzNWRVRsoRWULe2XA0IbKL
 fVYtqtvSm8ASlvnyLw8gKBmaflFmFD9u2mVbPP+Me/5axdrNDHNfqFyIUYTB1U/kFbST
 iAGfzx97036vcQg+ADWOokn0zg3GR3Jl+knjouCa8ophwAbpmR2zNtOCEklQV/wGNjG/
 QFew==
X-Gm-Message-State: ANhLgQ3CEtUfVstf30oEOoduSOoF6AbHw7K0d+/9K1f7cAdjoM9CBTWG
 SYcF1Q84N24Zx1ZJ9GOaABo=
X-Google-Smtp-Source: ADFU+vtU+an94UKd4UPfywLnbr+VHC0wDCwOSaA/3LsprBBI1hOWapF4bBHrYJWtYeuKNmQC60ln8A==
X-Received: by 2002:adf:8162:: with SMTP id 89mr882490wrm.45.1583512841997;
 Fri, 06 Mar 2020 08:40:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:810d:1b40:644:c890:7487:7d:ef6f])
 by smtp.gmail.com with ESMTPSA id
 c11sm48946421wrp.51.2020.03.06.08.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 08:40:41 -0800 (PST)
From: Markus Fuchs <mklntf@gmail.com>
To: mklntf@gmail.com
Date: Fri,  6 Mar 2020 17:38:48 +0100
Message-Id: <20200306163848.5910-1-mklntf@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:05:02 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: platform: Fix misleading
	interrupt error msg
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

Not every stmmac based platform makes use of the eth_wake_irq or eth_lpi
interrupts. Use the platform_get_irq_byname_optional variant for these
interrupts, so no error message is displayed, if they can't be found.
Rather print an information to hint something might be wrong to assist
debugging on platforms which use these interrupts.

Signed-off-by: Markus Fuchs <mklntf@gmail.com>
---
On my cyclone V socfpga platform I get error messages after updating to
Linux Kernel 5.4.24

Starting kernel ...

Deasserting all peripheral resets
[    1.206363] socfpga-dwmac ff700000.ethernet: IRQ eth_wake_irq not found
[    1.213023] socfpga-dwmac ff700000.ethernet: IRQ eth_lpi not found

These interrupts don't matter for my platform and many other stmmac based
ones, as we can see by grepping for 'macirq'.

socfpga.dtsi:                   interrupt-names = "macirq";
socfpga.dtsi:                   interrupt-names = "macirq";
sun7i-a20.dtsi:                 interrupt-names = "macirq";
spear600.dtsi:                  interrupt-names = "macirq", "eth_wake_irq";
artpec6.dtsi:                   interrupt-names = "macirq", "eth_lpi";
rk322x.dtsi:                    interrupt-names = "macirq";
sun9i-a80.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
spear1310.dtsi:                 interrupt-names = "macirq";
stih407-family.dtsi:            interrupt-names = "macirq", "eth_wake_irq";
stm32f429.dtsi:                 interrupt-names = "macirq";
sun6i-a31.dtsi:                 interrupt-names = "macirq";
meson.dtsi:                     interrupt-names = "macirq";
rk3288.dtsi:                    interrupt-names = "macirq", "eth_wake_irq";
sun8i-r40.dtsi:                 interrupt-names = "macirq";
sunxi-h3-h5.dtsi:               interrupt-names = "macirq";
spear3xx.dtsi:                  interrupt-names = "macirq", "eth_wake_irq";
lpc18xx.dtsi:                   interrupt-names = "macirq";
stm32h743.dtsi:                 interrupt-names = "macirq";
socfpga_arria10.dtsi:           interrupt-names = "macirq";
socfpga_arria10.dtsi:           interrupt-names = "macirq";
socfpga_arria10.dtsi:           interrupt-names = "macirq";
rv1108.dtsi:                    interrupt-names = "macirq", "eth_wake_irq";
spear13xx.dtsi:                 interrupt-names = "macirq", "eth_wake_irq";
stm32mp151.dtsi:                interrupt-names = "macirq";
ox820.dtsi:                     interrupt-names = "macirq", "eth_wake_irq";
sun8i-a83t.dtsi:                interrupt-names = "macirq";

So, in my opinion, the error messages are missleading. I believe
the right way to handle this would require more changes though. Some
kind of configuration information, telling which interrupts are required
by the platform and than conditionally call platform_get_irq_byname().
This would print an error message, if something is wrong, on the right
platforms and nothing at all on the others.

.../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index d10ac54bf385..13fafd905db8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -663,16 +663,22 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 	 * In case the wake up interrupt is not passed from the platform
 	 * so the driver will continue to use the mac irq (ndev->irq)
 	 */
-	stmmac_res->wol_irq = platform_get_irq_byname(pdev, "eth_wake_irq");
+	stmmac_res->wol_irq =
+		platform_get_irq_byname_optional(pdev, "eth_wake_irq");
 	if (stmmac_res->wol_irq < 0) {
 		if (stmmac_res->wol_irq == -EPROBE_DEFER)
 			return -EPROBE_DEFER;
+		dev_info(&pdev->dev, "IRQ eth_wake_irq not found\n");
 		stmmac_res->wol_irq = stmmac_res->irq;
 	}
 
-	stmmac_res->lpi_irq = platform_get_irq_byname(pdev, "eth_lpi");
-	if (stmmac_res->lpi_irq == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	stmmac_res->lpi_irq =
+		platform_get_irq_byname_optional(pdev, "eth_lpi");
+	if (stmmac_res->lpi_irq < 0) {
+		if (stmmac_res->lpi_irq == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	stmmac_res->addr = devm_ioremap_resource(&pdev->dev, res);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
