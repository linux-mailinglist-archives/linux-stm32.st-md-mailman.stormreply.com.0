Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A4BD3BE73
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 05:36:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A190EC36B3C;
	Tue, 20 Jan 2026 04:36:33 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com
 [74.125.82.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7ACFC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 04:36:31 +0000 (UTC)
Received: by mail-dy1-f171.google.com with SMTP id
 5a478bee46e88-2b6f5a9cecaso948881eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 20:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768883790; x=1769488590;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
 b=SPyAFzJ9BVnACUs4mE+WdNAZOyMjQq8UTBaUYGKwrBYLHKhbNHoH0nRQLlrXv7CSIb
 gp5RASV5raNfO66dZ8OhY6Dtz7Uom0qR95wqyKoc8AM+bpnV8GxSyT32w1qGYqotUAaR
 RV95qKrbxYbZww0PIoybU08mv0jyw3nvofNPD483MkGUF1K2PhOKNJd5Hyw2qBETEFRG
 i7OZp01khRP73IzgigIFFpDj7VlJEojbKHy+9FcDV9wP+Az5EbNnNcIT80fBlsYezuFU
 OFlZPnI842NXz5FPaM8mKOZoEBTXBQR0Q5pnsJqClqx90zw5GHG1CHgotHYGxB3XmGki
 mPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768883790; x=1769488590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yB8/RdUGEfLZjhmXdp52kQTD2QqD1w42DdvzuHTbkg0=;
 b=LvNhb7alXGgzS7levlQkNmURchyNNDrI0imOqNWFzGbHsefned7WYMFOVtos9zhR8q
 9UcHVcGU1H4AZk9emK577b7BDumGtPlOy6PxOgre5dFrl79BO7i4m8dg9SoCQXILYBsa
 1VF++l9MCw+oeXcY2UHT/pCD7dMdQtS86g3jR6itl49Sxd11MWng3qyjpNWWnJeDAi+I
 sQ4J0x+2UVHkdYKKQYEtWF7JkpWXMU/srwji1cs2WOzTFytvclORw+YjLQIfcdZh3E/s
 UgReWvyF5nr4ooynqYVp9RtMDPt7cL//VKTxCKTxqt5f55ubWIF+Cae8CO3XHyukkoB4
 18+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjzPkLWtO3KuyMQC41ncmr8Cp5nBboKKUY93ZSHeMqMkXhd0zXLQU3b4aoFCAcFKoixHWM/Zcl1n306A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx97kyponYv98/9sxAW5TZYEmnvCU9VapnCkcN9N2nnOXCDX/pJ
 2P/Zmy5hGMDyfX5v3Em7j8g6QGUq1saPtBaDO6CYSqREmv/FWiwIOX3e
X-Gm-Gg: AZuq6aJJw9uxJSZrJ3KdrRv4poUgi/XopTyshyImL/B6Mg6ZEuS/p7G62nyF9kRoYuz
 HlFnVc+ca0g2k2VMQxEEcDTbhfAA8G0fEh1rr8UX7zCLrxg3E6KBssajslEKfrDWtNHRlQ7PN/3
 uJJcmqiE2fbwYGi1BrwaQ3L/Pv6bcMVzLe3th7+nwHEXvJa30kNOrWvGJ4UeDyLcWARTAlTszXW
 4v2Efb0scYaH8/elqQ31AbXcbvHzRMr2NeL6R80pAiZwWvFNrzRrGSsm6Q7HDrGoLRBbd2G/svq
 SFLv0BvSGFwKBmdVSjySzCRoGcmM2aFrNoWZvUQQKCqfWNcNsdSrCM8ou5VOl8flue1er55NXAk
 5XkAdG5VEv04sxXjcLKcpIcnF1bpp8vgbujMjY9OsDMPL7ISWS0r7kHtfSF34JotOVnaYMs+fKt
 Bifg7TRLQCIVB7JinbIzZk
X-Received: by 2002:a05:7301:9f09:b0:2ae:5e93:b6d with SMTP id
 5a478bee46e88-2b6fd7e55f9mr304430eec.38.1768883790053; 
 Mon, 19 Jan 2026 20:36:30 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6fc2820a2sm1030314eec.35.2026.01.19.20.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 20:36:29 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Boon Khai Ng <boon.khai.ng@altera.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue, 20 Jan 2026 12:36:07 +0800
Message-ID: <20260120043609.910302-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120043609.910302-1-inochiama@gmail.com>
References: <20260120043609.910302-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: platform: Add snps,
	dwmac-5.40a IP compatible string
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

Add compatible string for 5.40a version that can avoid to define some
platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..54c7b1537ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -396,6 +396,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
+	"snps,dwmac-5.40a",
 	NULL
 };
 
-- 
2.52.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
