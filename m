Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D569AABF99
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 11:33:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3BA7C78F83;
	Tue,  6 May 2025 09:33:33 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB60AC78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 09:33:32 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-47690a4ec97so68292881cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746524012; x=1747128812;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7b6FPH7tpbMtyDXufMUwUF6RvC02CLrBmvJ944Zgtpg=;
 b=itFpHqVzhqwQGEXq1eAUWpaEig57ArFPuXsXzZ+tuLKhc1ZejWsPAwWJ3gsZs2jess
 JFEcRF2ZHDUirklO51BdXKfrGNEz201vSDbEdThB4UClyoOtZ38NO9lBJSyfPgXozqgv
 FofXoDjh+KixQnFYUB/jKTgxjAtlktTkDYMqYtOqYSPJpLBP4uvHupoJsc0DCzT2nyTM
 vaYPn/IfzzpYTE0u1qakGXy2HOSFd2f2/73joUVMUIWNkub9CsjqwVC0k4xB40AdNcNI
 tSD9duTS2AjoiW7oXFBReyZ5fqgazTveocBfTYYMmIUwnX7JbUGxqNUpT58Qw6/GMk4h
 SAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746524012; x=1747128812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7b6FPH7tpbMtyDXufMUwUF6RvC02CLrBmvJ944Zgtpg=;
 b=qPi4kzGrKo84sw+SrrzDHHTyncW90N4aPB2yuUhCGMG1bYpMTrlGbiACUaZyS3vM7r
 mAOkhiTc+6PYkgawS31uIplCy3Bdr3gxuQHw/vTYB/za8D+S0oEMqaOQxV7prXPUIGzq
 vgVXKyfFTvlnSvasSVqmuSHYJUv4rIQ/UUJfkXSP6v3g4/WtbJn1kkWrj6oln46d1vY+
 RjgLfwcagn5yzKxfi3PqmcfWg3BpiSs0yHVx12zMdCQZJ6cS+83/Z1Tf8v9yKgbEYgad
 IyICluCYrx9Zm+W2mIEQDI8RPUQLr9FvnaFvXVXqGRhQbyl4Jfr+6VdrzSte+h+Ktcbi
 F55w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwqEBxqrDkOQ7NUun/h/+5WwkodouUsRh50Mr38WkNGm4/ZrY4AbrEZbO7xdnMIXmr3/ZD+VMi0sBn0A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwP/2hJaEooQNTnsrNgwYt0BL2gI561XXicnv7XGL/FbvLqrFFo
 d7yMdr5JNCRcIwxS2MrHHJ1oFv4TyGPXhQRSHROmpITqf3IBbOVt
X-Gm-Gg: ASbGncubsm1Kx/sCzPibQsce8p+fQwZnMBwT8vSgkgeVF8iFNRQj6a5r+sia+HLAH3Q
 r/8mZP7duMlw8XQvQvCTFlREpRB3nTJOkvR+N1BDCgu6YEpEtoRX7WM+Q4l8oIce0t5P9QgEk6G
 z+Bns3GPuvmiH3z68ph3JIumlfGTm84Gf8+JvKpkAs+xIu7Rwc/S5zdE1CsIdYrZJsIsiqj9p45
 3wKeYM1/V0TVbEFRA7yQKwrYWkg8RrrN0+Z3mc78Fx0Ps3jY2BJ6iqQKL9X7roOTBm8JQ8l74pV
 RVmIux0ZDJEuPGCH
X-Google-Smtp-Source: AGHT+IFxXii2pf1jlW5RlCREc3ls2A9Oonn2wTcNloToOzLYm2iAZfy1uAN+qSi/0vm0NCoUaFddKQ==
X-Received: by 2002:a05:622a:199c:b0:48d:e36e:9836 with SMTP id
 d75a77b69052e-48de36ea26cmr138510361cf.35.1746524011717; 
 Tue, 06 May 2025 02:33:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 d75a77b69052e-48b987209f1sm69892791cf.52.2025.05.06.02.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:33:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  6 May 2025 17:32:53 +0800
Message-ID: <20250506093256.1107770-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 3/4] net: stmmac: platform: Add snps,
	dwmac-5.00a IP compatible string
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
index c73eff6a56b8..de3098a773ba 100644
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
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
