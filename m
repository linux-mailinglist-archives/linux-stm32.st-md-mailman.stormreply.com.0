Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A08A0A995
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2025 14:33:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B7F8C7128F;
	Sun, 12 Jan 2025 13:33:10 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17DB3C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 13:33:09 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5d3e5c225aaso702002a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 05:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736688788; x=1737293588;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qkxcGNEB2JVbUM+gOy8SUbx7zqelxFkMblu3o9jMzUg=;
 b=R8iYQjNfhMAZL+xSQ7yC57YHiE3rZx9Ublh2BJWNqYu23k6rKsV7EXpwQrghmo9Dji
 SFTgtLsUtrtVyYqPYkcYYsNuT19xXOzNQADMnGJ3RL9hU1yy27bztQUXnM40W9s7jjLl
 DBoI67pqPNvghwF7CoxtcGUGbejVA4A//sj1vsIH090fQDuATHAXrlutymTTXVIGPJ8q
 /fv6E2BPHwbPw7hdaV2CxgkfDBR4Av9E42inBUdNeeBqYdUZrfRcCEigDAouYxSOzZpz
 yN1VlhckP0QTBWYdpJKhxFEhB4nA3EFTgxDMwsrXyiGUkWmH/ph3jU9aWiph16Y7OK7U
 i/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736688788; x=1737293588;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qkxcGNEB2JVbUM+gOy8SUbx7zqelxFkMblu3o9jMzUg=;
 b=pxGqXq1BpTFVOc7xF8o+C9odhkTK5Svtu3XtaOL1L1fJjxwrEVF/y/dVMetqyG5G9R
 IiZbUPMyyT4hrjQiUA6L64mtfSUjGu4+9EFfLFxnF8XQc50zJOhViDA2+jtHQi960UH5
 +8r43PkUzlWXV6Q5OFYiri2oxvqtukVARymgaX2uEkdK1PO+bdpT+ainoYVJ55txIkRH
 vpJ/eBjqza4oXTP6nMncmHES4IRMDcJtob3teyglzOxQKUTI7PNhaIZaLUE0JILHCt0d
 ybJibDnoXYEa7liT5KCe577kuOLufn2zNuLjXLvdovSD5s3aPYgX/KRfYCFWzHELJ5I3
 UMwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlS/eDmb5rjvQpjmIseEcSepZtWWGpDtV5bNL2G9PSm40hyu6poOZ/kC1Y+CoeVPxbE616LoJS7AJyKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywf3hJyzh+WKiNUS53lyRUcTBzjrX263q5cR2goLsztn2lUA9te
 g9xTJjEwq53/MF659yOcFB7e3vmyyUSVqgIDNxyb5tiWWXGP+I2FzGyY/IDJB8A=
X-Gm-Gg: ASbGnctZiJXHd0ptxD4Qvsfo2gncKw6ACuSNhbhsRCxq0IC+u6/XpHpKthnHhs2fTvI
 BCqEQUed9P2a58NwBWuzKaVj+TCUJ1r68X3mZsDhwEBeMuFB+Zo7KIxJMu/aYan5JGmntIuRhfl
 MzW9VhmI5JvVglt6Q2oY7r7G+KaaVuczxJoLq8MQW2NQ9V9o2jWZ4vAYiGLJrOPz+0IqOnRbJ+S
 Dk09j3BBOQWorLQeo+1S9Nb/rPQfBhNivUxK1zR6Tv4XlP9BHt6YLfCGIDnYXOi6ZdjuYHL
X-Google-Smtp-Source: AGHT+IGF6bnQlGOOJSwmTTavg2zo5fkx649YuwkX2KVGh7yeql8d0d2LdpF/plNT/VzyYLuHpWJzKA==
X-Received: by 2002:a05:6402:13c8:b0:5d0:bb73:4947 with SMTP id
 4fb4d7f45d1cf-5d972d26b14mr6157273a12.0.1736688788499; 
 Sun, 12 Jan 2025 05:33:08 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:33:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:46 +0100
MIME-Version: 1.0
Message-Id: <20250112-syscon-phandle-args-net-v1-4-3423889935f7@linaro.org>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
In-Reply-To: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1695;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NXMkmgaOV2RUkC4HwkfQVhlGXXVP2A5zrSYO2RnmBmE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SEMvfAj1e6BkujbTFZ72MSWMgcm2SMXQBGK
 GiE3r2n/mWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEhAAKCRDBN2bmhouD
 1+CtD/9NYfzUH01iViVY6CFPIesUd//8aqafZv/j9gif1sZe4BnpQWtWRxsUu6VQdMZlDJKE9W2
 glDpCZIW+8lLh+IbsiXM/flGx1S/efHzGzwpjeK7L/+01H4KcEeR/NDg1+8TsGk3d6NX1yF1/js
 HwaSYCG5gF43SPXB2xa/7mE5PMEKpV30x5gImiU69/kQEkU+hG0h7SsxJIgj3xt/HOP5Z2VjmRd
 c4HXi8KAUcvDdEeAC1MKg7tZ39OjLQFztwEufapop5grKUL5tbxEaeZ8o2BlJwG/uCvWOTpXYyE
 XEW+sImdFKOMeKn464A5PXwEu2KkucXyL08nDihzDzhH4RmuG9XNtHs8yCTXvRmIAMtj1eYy2OU
 idW1s7RxvW3VBVusNX1ehUd05WYPYctpK+gqlj4H6DzxGAUuHu7b+vdVjnbFX+XI4UuUpXlkztG
 TkLWHNjvzf6OnOYG86bYh4Dr8IVPiD9ikN4N4rK+xw3ax9d2rsVK1/7ap4qJJt4iRlNaFQa5x89
 prfGPAHxKBpsWwTTUQYDTjGg46zzir0mxKHPl+GxOyLo/9S+3xMdLTt7AAI874KFG7SjGAIgHcr
 JNJ2MvA9XFr3QF2JPTvtkqonyCssxtjXflAge8uhZAveyDIMEC1DiktRW+Y3V0P5Xxfzk03OH8G
 w23Ba9WErAio4Zg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: sti: Use
 syscon_regmap_lookup_by_phandle_args
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index eabc4da9e1a985101643908d2efdb0b4acaa9d60..d30d34fa6ca52e32b10c312c96d462bd6df859d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -199,16 +199,11 @@ static int sti_dwmac_parse_data(struct sti_dwmac *dwmac,
 	if (res)
 		dwmac->clk_sel_reg = res->start;
 
-	regmap = syscon_regmap_lookup_by_phandle(np, "st,syscon");
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "st,syscon",
+						      1, &dwmac->ctrl_reg);
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	err = of_property_read_u32_index(np, "st,syscon", 1, &dwmac->ctrl_reg);
-	if (err) {
-		dev_err(dev, "Can't get sysconfig ctrl offset (%d)\n", err);
-		return err;
-	}
-
 	err = of_get_phy_mode(np, &dwmac->interface);
 	if (err && err != -ENODEV) {
 		dev_err(dev, "Can't get phy-mode\n");

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
