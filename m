Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D40AFC2E7
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 08:41:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 854F2C3F930;
	Tue,  8 Jul 2025 06:41:12 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C60EC3F92E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 06:41:11 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-311a6236effso2892610a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Jul 2025 23:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751956870; x=1752561670;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fLiBq2WXDjQXd+fjZ92LJ4ai9vU68aXWw+t+C2oy52I=;
 b=CA9CMcmizMLsPAsWNyYjF7kyF3jC1/BXdNKWCGW9HQc1CRHb/PDylApEGHxp41TnIt
 rKotRc1LZRbpJWXE6njB50rLvQV4SDysYD4/Qeg1Vel5VTIf3DeiNpyH36Lbp9PQ4rjV
 ogzZQpnk0u6hn/miYlOVat8P7HmiVZx1NyB3TgBtXFO91PXEjW+FACIpCB2q2f5Pt3XQ
 Piu8KUXDCytNqdJwvKkrfx7vi2oKv5V0cTa4UAU6mc8ZIXy+gjCSGmeOjoa8pnT+j+/1
 MKD1rgyZ4YNBQRPIOCVYGHvn8bW7Jga/soNtMgNdxbnjmdRMPLu23132gHcnRwANoKmB
 pO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751956870; x=1752561670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fLiBq2WXDjQXd+fjZ92LJ4ai9vU68aXWw+t+C2oy52I=;
 b=U3l35MdmwQW9fLVpN8W26bW+weYZTahIY4Qf22RFMFlO72k8jQs5Y0bZ4cvcVOU/xf
 RtsozB5m4f0sdXP0tfHNCq5zTZJgxCPPffsnFbU6o8agGgR9Ap70kACcd7uj04sXWDCi
 UvG1K8l6jDUbUHzRyavrG9lNuMfHYKb1IONmBV83SayP9aZVZqYpfCppOGlmRCcerZM7
 IThEovuExbK4nN2ms3BfJILE4Kudd4UqmsE8m/o+h5NSfOYf58maoN7S6haC6d2ZLmqj
 LVK0JFakFCGu8TgU5/fmdOWEDK6VsU/P4L67jbejm/xNT7a2blC5ieOertTtjr+08tGh
 bUlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqmEFlrZumYRxGIIHt6tP8IUNNLmc6IxzswGecmRCLl84B9nsHiylxvE9Bwh+VVM73mf0rHF+QhN/c+A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6gU25gsiMtQAHzdXK2admkbB4zJzOya8pH9359YkqO3TIgdJX
 0X18jpod8sx7avifSEZkUYCOsGYm1TxFb9czI4QxyPgHsL3+uqxVDbDR
X-Gm-Gg: ASbGncuuOxq6SxuX/t3U2CofaezLQUlGrjE8gbBbhZH2i30iYX09A57muMARwnzg/Kb
 6Adk/+WufaF66ua4lvdlCbykVNapNsnMMwjCFG30k5h1TCE+VJlcCPvZiNroaN39+qj8A1X/QTi
 kTHcJcWzfClpe/rIizaEsML7+jmYvBr6i2ITVCKVpdvZ89KW76OfRYdw0SXhaGH9fybcqrRDt55
 p6x5jlFDlCBszgYg72EXLQtV0s8WCpo+Btbvh/XgEOvgTbCn9SzS9AZmU+wPoEKTpo9XfeN9EZ+
 IfhLkDGz/BXly+9u1T16SHiLBRR0t7OyyB1vNcUsI9HdQqKRZyeC/yijrwoMPQ==
X-Google-Smtp-Source: AGHT+IGLMBKLkTLMuH2Vb0CDrC1iseBxe/ZnNx75ISOJrVgy0Sw4kB2z+b7qCz4DGT+64Y7TlWzLGA==
X-Received: by 2002:a17:90b:1d52:b0:315:f140:91a8 with SMTP id
 98e67ed59e1d1-31aac4ba08dmr25723943a91.16.1751956870099; 
 Mon, 07 Jul 2025 23:41:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-31c21d27f09sm1203410a91.2.2025.07.07.23.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 23:41:09 -0700 (PDT)
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
Date: Tue,  8 Jul 2025 14:40:50 +0800
Message-ID: <20250708064052.507094-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 2/3] net: stmmac: dwmac-sophgo:
	Add support for Sophgo SG2042 SoC
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

Adds device id of the ethernet controller on the Sophgo SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
index 3303784cbbf8..3b7947a7a7ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
@@ -54,6 +54,7 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id sophgo_dwmac_match[] = {
+	{ .compatible = "sophgo,sg2042-dwmac" },
 	{ .compatible = "sophgo,sg2044-dwmac" },
 	{ /* sentinel */ }
 };
-- 
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
