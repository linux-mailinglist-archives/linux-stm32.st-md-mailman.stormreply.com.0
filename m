Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68602BC3C8E
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Oct 2025 10:18:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AF97C55591;
	Wed,  8 Oct 2025 08:18:15 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C84BBC2870B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Oct 2025 08:18:14 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-46e3a50bc0fso56944585e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 Oct 2025 01:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1759911494; x=1760516294;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
 b=vEbXezrjnV8JpWr76GrUXI3gV3JLeNinLOnD1qbP7ab/78bSUt8Ef8SnlzidH7bJ8V
 gDtSPxRKpBOqna61GbSTZhAEW8gnkEGMBaF8vf435vcKNTpW6Wm28L5leA+vZR/RAu5I
 YqbmT297YjQgkPrTKLmgcmij1hadHGwWnzCt0kJO8M6wO594QSEOHYplECVJMZ+7FWnL
 dksJRuXlWciyZuSv1MgoW/JSacab/9Ixwk/b7wYXJWYmeXQ14vliWXPp/PExCGAasbO/
 Zt+eJZPH72Jd3BFhdi6K+dUSLS/C/1DPs0Q3L7mBTZFTEWVEXw44/77aHYiqKcla2hHQ
 pumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759911494; x=1760516294;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CdoEjc5e7kQwXoL1Cm6IjPM2seG7Imvb9wLqalhk7Jo=;
 b=LAcUA40zkA+gmrOVERK9Y2tBgVK+tFY2YdwrIStt9f75v+Aq/b+dS6SYguEwY8BZt+
 nMeX3swfU8tViIsH4vJtr3NhnPUXqnHTIMQ+PGHSqyUKp2MkVY6MXtz+7xDwuliI1fp1
 m82v+w9FOBDC0JSX5Oa28Ha7QvYmmOtWm1vWuVpWyXeK/KrVShzR8DyOk1LLLxWlMj9k
 CRevHEtMsVrgD4qVNR6qSPxoAxec0Ka/x7Ft6SdCNBTn/jOXYxU/dvvwX/eXAjO7KzQh
 ty45ITTVthSI5XSIlkdOcOfUWXVfXvmCX1S/brTbzWNxslawfesSAdqBVBvUHeiZmBMo
 7WGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBVO87x4IQoJmTiAssVz1gKJEQnC9UlwC2SOxAQlhhwiOENHMkT6Orkhq03h2xt34lMtYDj3cdvNAgTg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPjxaf27QRMmx3gWonvGin6n9e5u1JGM4HFYLzXjzXD+x2dBJy
 hgrVKiMNYJ6ilolvk34948AaozZW9LjWphyhTn3fkmuR1gWoNe0Uihwqzsf2pGISkZc=
X-Gm-Gg: ASbGncs+9jf4BuLKtpz3iynkvLhNx4pr/0b+4+K2MU2vok2NkvfEmDPLU23Yi6AU7Zo
 Il27A4r982Rrm6cb3zhX8H6M756VZbwIlqElSSVJ1qKG8lrCl+ztvRwFTknoUfoDGVWU7PgwPtx
 3ifcfCxhTV7gV9v1NJC/sIzthymmGuHOsDJJWiDw/vwaJna7+9zq3+5B1d1000UiFPN7XT9AjG0
 DG/BGmbuAtKN4NPQu1i/I7SPx7mtDZCGPaJaWkfBbxbHRNTSIUx1lMbiV/tdRrH9ggFcs/Mev79
 cdQWr6ms2SBAX7CZtZXIyIoKCzkidcyjmRBOiAcOxlUvdZfgX+2wlT5v2y+qD0s3Vq5HpOqBB46
 3Fb+3QsE5UDgdQJiqQRlh9RR3CwpGgbmNm+gGfLDeKqz3GF4qpTsP
X-Google-Smtp-Source: AGHT+IGGV9RTxvTs6ChYk2BboL/91pz8TbAVWTDNgaDs9JbMT5f/sR8m26V513f/xADuHAv6BhGW0w==
X-Received: by 2002:a05:600d:4205:b0:46e:74bb:6f6 with SMTP id
 5b1f17b1804b1-46fa9af914bmr14615105e9.22.1759911494198; 
 Wed, 08 Oct 2025 01:18:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:286d:ff1d:8b7c:4328])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8e97f0sm28498943f8f.27.2025.10.08.01.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 01:18:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 08 Oct 2025 10:17:54 +0200
MIME-Version: 1.0
Message-Id: <20251008-qcom-sa8255p-emac-v2-7-92bc29309fce@linaro.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1914;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xmsTTIN+xNt0moiTieLp775A3Rxh60igauD1SnixUA4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo5h424wYIOWx/QTIauQ0Xb0HiSiOu+mcvinaVu
 GhOkDp/gnqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaOYeNgAKCRARpy6gFHHX
 cln8D/40P5o2ziTr4Wk7CJ0ckAfckinQriPZ81qAubZQawfXquU0f9MHcGxOVvpWRqeF8pQsvQV
 XSQsT51LnHQ9SZMfesP3vKY0QQaz6SKjkhiAoR2CKFM/8nkGzuRjt7oWYKFKbJVhwkJKAfK6tRf
 6/vUg0er/eXFIy/tXoe71+uRvAqTClesPLUXGcPLRpcGchrumTBYB5j4bKFN0DdQBuNJlp2QbN+
 0/gxygzyNpUtZwtdJLGN73TZSTSE1bVeVicT3tIIiYPIjCW1Lah0/IJL4w5Cp5qEiq5oiThfgjx
 /t6Eq2bUJ5kns+bSpzgVx3cHIMMdqf/Km/K2gUsyBPkW6VF9KvF3QObG17Nej1gxaOGRgDoFje7
 X3/68pKORhRcaflwwnlGIwWUK0BGsjQ9rAZ4OUMg+7Oz8mYGwlhKrI/Aq1Me6slet7SrbfBpkyf
 uEOYvdOLVFR/0WSifZVhrNABqZWtD/BBnanKxR8Rh5VGg3fki7Ev8jEDA364ubJkfYcKWt6O3bK
 q+ukAukJOQmZayqSjIyQ5gqU0j97tXkVuqONtZA0UGiFf7RvuodWy2AteLDVpbwXXmGRt8InpSf
 S03B2C+Ox/rniLc3eY+4YPs40szdtegi1bKYPhM0FIKWxCbL6B97v+vVxnMSPo7t9K2l0S2s0my
 bRm3rw809SJ/T2w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/8] net: stmmac: qcom-ethqos: define a
 callback for setting the serdes speed
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

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1fec3aa62f0f01b29cdbc4a5887dbaa0c3c60fcd..2a6136a663268ed40f99b47c9f0694f30053b94a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -125,6 +125,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -646,11 +647,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -881,6 +887,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
