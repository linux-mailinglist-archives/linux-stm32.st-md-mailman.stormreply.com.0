Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EBBAFC2E8
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 08:41:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91D48C3F931;
	Tue,  8 Jul 2025 06:41:15 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9D96C3F930
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 06:41:14 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b34a6d0c9a3so4001078a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Jul 2025 23:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751956873; x=1752561673;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8NWQCR/vjjoocQDKQ3G4Y+84Q55VY5nfXeYI6Rtw6A=;
 b=TNHd0KhwMaKkSB6CaAq9zPwAOFPoK1Dwgmb7Sh6IYJ+sA+qqiTod4RlVHrjLuJXhEC
 9kDkfEwBKOJ8bfM4vOd5jlhitHPE4NatnIfFBIWwTNnBLu0ytmnUwF+Wv1fN6Rn7fCu1
 gyR+tg8Qp4ePlHNaFftKcrtLeZJeZxLEf8aZhTDrP7PnuchHnzrC8ZUOWw+/Dn57VpFP
 nLuyvLowhhXZ7rM7L2WGHUzJ5nRew7TiWlLFQ31TCWBqqHEeEq62bfbSVXov0cnGvBVy
 /p/fwi2p1lics/icLX1eKxEIHscTpOjk8tTkT9dd/CWyFp3z9gFv7HZAGC9SYJs7e3jU
 H19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751956873; x=1752561673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g8NWQCR/vjjoocQDKQ3G4Y+84Q55VY5nfXeYI6Rtw6A=;
 b=qpt9dS84imOjJ6FX8WFyyCzfGNtlwiS2e+aXOEivSQSZxGU4PMuJCGUu7UQnI+xkp9
 ym8t6vR6bkUleUK89itRmHNsplBgAuj/nPr1R90zL30NYsUtoMCgfK/+WG2gl9vdSbAc
 ReEptWpT4sCXsw2yBM4A0npqN24blKiURBlDz9hiDorCAXlgwuEpdtiriUPmM77FUprm
 WU71YGbsr5TUKis8FDhGCSQt48NhgPMb1aPeFx3+Rqf5U+sHpPk88DqKaO+oaFQBUrZR
 c6wLL2enslzqsvueeX7DSiqzIIddaZmnb+dAWZ4kq2wjSWdvG7gL/ZeLLqFeVmzq1Dt+
 4sFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfXYGwkerMoLjZXlX57Kt8KrFrqlYU8bpKK5THEvGul/s5gDY7C8ODMzVeJcE+cmShjWsFQG2xmThUxA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxVd4WxTiJOHixeW52T21+ANQxU5CsvgtyyY7QA3tsFrflWAPUS
 fI5g4PHW6jI5V8WIxWYlyohB10cgoDH2sOfTlPeYEJMujbMsmTXiX9Rr
X-Gm-Gg: ASbGnct2xkqI3R8qU0x66pin95eepJ3WAGE6XKo5pbWAyAGFq0hdQ8KGObSSrXGPvHz
 OUIyNLCtKJA7UbTeVYTKqYHD4DletUbmuRZRM6gZqoKWMu4PkbBZV+84Q1y3If60pC0kb5w20O/
 oIzTWqBal07hylrRE0ah4FwZyzA+Aa5UWfakYjVcdU9NBwXdHkqGV/wgA7bkkZbfaDmpaUKygKO
 8AXGogjmfVpMn9HdUkQMZIJHQ1S6qenEGL6Ds9dXBdZz/mHfL7j/1KenAzuYMXGHJOCMWJcbxxz
 3rB/Mro6BxbaeoZ1dA/SsNZfKc1E3Dm9lecG+vvpy3HDxDrmqXzGOGfDnlj1XQ==
X-Google-Smtp-Source: AGHT+IGi3okrZezMQqZWaDno0rnyTSGvjOHwFQZN6i9UVU/ZSCdmvAAsyqq8FHCig1FFJj0ZJIxfOg==
X-Received: by 2002:a17:90b:1c0a:b0:30e:3718:e9d with SMTP id
 98e67ed59e1d1-31aac552db1mr23882560a91.35.1751956873397; 
 Mon, 07 Jul 2025 23:41:13 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-31c22055c99sm1328425a91.9.2025.07.07.23.41.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 23:41:13 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  8 Jul 2025 14:40:51 +0800
Message-ID: <20250708064052.507094-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/3] net: stmmac: platform: Add
	snps, dwmac-5.00a IP compatible string
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

Add "snps,dwmac-5.30a" compatible string for 5.00a version that
can avoid to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..399d328b3b11 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -410,6 +410,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.00",
 	"snps,dwmac-4.10a",
 	"snps,dwmac-4.20a",
+	"snps,dwmac-5.00a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
