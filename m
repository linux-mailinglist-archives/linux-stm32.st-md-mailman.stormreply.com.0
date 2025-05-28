Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04544AC6754
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:42:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B94AFC36B30;
	Wed, 28 May 2025 10:42:24 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FEA8C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:42:23 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43d4ff56136so5473875e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428943; x=1749033743;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4B21sivAqyRHyleQii+S+1MjrB/LUMGhjJ1azp6RMvY=;
 b=H6QrURkRhJo08mxODQvuUVuhbxSSUQxNLUjZkJ/+9HCUZHfmp+cDeXWT48ZyzN7je4
 9gBoXrzi/2uo5I+vf15K7Ai39ecOGvRrZhvgljI7+tr/7tYAwzEypRmlMcWdI9ubEFzT
 0slut9FF5id7iVa/+C/KMpiAYRpkmwWEa813Bc8E21vzznf4WLTLd9HKeF/549XPbHyp
 NKrhb9JUcksU7IIne5cw+h51hpVw0hF8qeisVsYOTvp44d7xEmnqZCOt5Wu/tLoKRNwW
 Qok5k8TBsSqKjBqv80c6rIoYl6IEfPKIC96nRqHssdIRpf1gWEbtvOfCqo8baxpSydf7
 TlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428943; x=1749033743;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4B21sivAqyRHyleQii+S+1MjrB/LUMGhjJ1azp6RMvY=;
 b=Id3NWRHuBUe6kDwIl++VRI794nCV+hykv6y6eBTHif69uA+LUdb/XD4yGssDt9olQb
 /NuXD6GqU52Fx/QONW7lyICr3m08x6KghM8DmuoEPREI+fLyjwfUIomS97F6vOl/3EBS
 273cp5CHtiRIeT8k+3m0pf/ureCSn9lPj5L30OhdbUWvRXF/VwcIOw9/nXDy4dD0lXi7
 m4u8yM2Udv3wDx5VDcfavoIQwNzk4icCmiFVVw8+q6UM19FNSJPiJZWp6SpqQfMEX8lM
 JgfIoWMSJ/CV3DxknfqjVzcO6tjCMh7/17FU56zydWobNaYptJhSpJ+DDVCV2ps76RpJ
 y2Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6Ibok8cTUzxV0Pd47WGA+EF6PAWEPtjzphZroVR2pR47I0qjrtGBIur8RFYGBj7HnzPDdFrtwbBz9EA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyNxmgzOrMyW9xdYWjU9rHTij3zBRR7t6juwBc2CnhoaBRCcZx1
 2wf4OgP+qw9IUGs44wcRUvURHWzKzv+VeqdpHckkaVqyR1x8t8KZA0B7K71pe9HjFKY=
X-Gm-Gg: ASbGncvjsk0vrA5CAQ3PCXkBs7qHoSHQrQiprRWjDXhfooBSokAWIToniXWT9QVw1qT
 p6/JjJ0yxG4Vt9T51HQmqbpNtOnF7N05xJmDFYMCeMuTkzFljeRTnoM3dmerSpaTgME2Ls8aTlw
 N5AW9GKFKICwJpd0OKAvqDDcBnOhSszHeKkKkNiuXcpTECJimxR37tkNLcHUgNVf5dTnWOiuT53
 omgbmuv5Z5q/7WqyDqclhJVRr8FW2r+9hPeKFS9grpug0xaBiEF2g0V5ZRjvylR4GS3Okd3Y52U
 +MAVWghCttFVJlvRZ23aucPDxLkutq9lkhO9qzt2EUtYIzqij+NOoVjdYoAim+mfOYht6wKIudo
 s3q8k6A==
X-Google-Smtp-Source: AGHT+IEfBgt/OAZgk34DHzADJ9MeUpb2UzYkszedaNq6ugoLGEzFfo92Ylbhl9rpzuKrpU1AY4Yb1w==
X-Received: by 2002:a05:600c:3588:b0:439:a1c7:7b3a with SMTP id
 5b1f17b1804b1-44ff400feb3mr6125695e9.1.1748428942991; 
 Wed, 28 May 2025 03:42:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:42:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:12 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-16-76fe97899945@linaro.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Lars Persson <lars.persson@axis.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Damien Le Moal <dlemoal@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Michal Simek <michal.simek@amd.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7315;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FISFGxFI6ivl2aBk332273LBBxMajRtCg3EQkjPO9iQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhWR1HX/YrtpvNkBi2iD8jQST5lI2EEHB0zj
 SrEC2o+hnKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVgAKCRDBN2bmhouD
 19+5D/4mmaekZJ82wOBfpYAWiS6E6spZ+UpZObxwxpcq5602kak24kdFhIXJCHhfVQWlKOlpR4P
 aPkN6d0ykMoFqFyaTF5+ujUGqgTGxqBGOsw421hcV8Y9fyM9C6/2KwjQxthekJmjZrn5mGrQ26U
 oxiMyrcgJzLDzwjy7PSYYPyGjyPgpKfH7kAsNKKt3TS0dAxBQ3qvCxhut+44jtJcNlMM5F2Z/FO
 nlzkrgkc6+bkfuMG/2HFdg4ZfMlVw4NK5c2utYaqfkA+pA8EXQM6a8DuJBzZYmagzKsmJ+61Qn3
 H92/vgLUsSS/Ln27n4/KzgTgZwVxR9ae3ZCceU0NPvzGJIrEB5ymvf0VUSlpyV2uUJxIwP37Gjf
 4UCeKgTV/CHPGJUcLZJGDg442wWVYJxnF1k1nWeNcegN98D3O2JL4gD6U8ZE8sr/iQGFwOopvAX
 le7qdbu0q6FMeewfz2i8rEmWNX8NgfVdT3aVMk4WUEiIdz/L0+/NBpitJj3jqtW9bG5w7lc/l/g
 rxbxLpRAJuh+/4I+z0M9/zQyAEFPI1Hh44EWt02t9fzLdlablOCE42Rx1Qq4J3QiZ3e8XkwuQEm
 awAorN/VwMfcQy9rHHjG/ZNeRLpenzMe7+I8215pPy4oUGZjA/oOK1Zmuc93hxnrOXoGAOGjCGL
 n2ZlFoefzDnmhHA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-rtc@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 16/17] pinctrl: Constify static 'pinctrl_desc'
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

The local static 'struct pinctrl_desc' is not modified, so can be made
const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/berlin/berlin.c                    | 2 +-
 drivers/pinctrl/cirrus/pinctrl-cs42l43.c           | 2 +-
 drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2 +-
 drivers/pinctrl/pinctrl-artpec6.c                  | 2 +-
 drivers/pinctrl/pinctrl-bm1880.c                   | 2 +-
 drivers/pinctrl/pinctrl-k210.c                     | 2 +-
 drivers/pinctrl/pinctrl-lpc18xx.c                  | 2 +-
 drivers/pinctrl/pinctrl-mlxbf3.c                   | 2 +-
 drivers/pinctrl/pinctrl-tb10x.c                    | 2 +-
 drivers/pinctrl/pinctrl-zynq.c                     | 2 +-
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin.c b/drivers/pinctrl/berlin/berlin.c
index c372a2a24be4bb80b1f2475ef8512171c8e1326f..e5a35b803ce66d247c5e5ad78e6677570a1add60 100644
--- a/drivers/pinctrl/berlin/berlin.c
+++ b/drivers/pinctrl/berlin/berlin.c
@@ -283,7 +283,7 @@ static int berlin_pinctrl_build_state(struct platform_device *pdev)
 	return 0;
 }
 
-static struct pinctrl_desc berlin_pctrl_desc = {
+static const struct pinctrl_desc berlin_pctrl_desc = {
 	.name		= "berlin-pinctrl",
 	.pctlops	= &berlin_pinctrl_ops,
 	.pmxops		= &berlin_pinmux_ops,
diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
index 628b60ccc2b07dc77e36da8919436fa348749e0c..a90beb986f5bb707c54552e1333802943a4b04bc 100644
--- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
+++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
@@ -448,7 +448,7 @@ static const struct pinconf_ops cs42l43_pin_conf_ops = {
 	.pin_config_group_set	= cs42l43_pin_config_group_set,
 };
 
-static struct pinctrl_desc cs42l43_pin_desc = {
+static const struct pinctrl_desc cs42l43_pin_desc = {
 	.name		= "cs42l43-pinctrl",
 	.owner		= THIS_MODULE,
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index b97b28ebb37a6ec092360f8ea404dd67e6c43eac..ccd2b512e8365b3a5af0bb223329f39119bc7078 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -2852,7 +2852,7 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc airoha_pinctrl_desc = {
+static const struct pinctrl_desc airoha_pinctrl_desc = {
 	.name = KBUILD_MODNAME,
 	.owner = THIS_MODULE,
 	.pctlops = &airoha_pctlops,
diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index 717f9592b28b51737e67aafc93664b1345511908..af67057128ff1e9e766b958fece9c71518c89081 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -907,7 +907,7 @@ static const struct pinconf_ops artpec6_pconf_ops = {
 	.pin_config_group_set	= artpec6_pconf_group_set,
 };
 
-static struct pinctrl_desc artpec6_desc = {
+static const struct pinctrl_desc artpec6_desc = {
 	.name	 = "artpec6-pinctrl",
 	.owner	 = THIS_MODULE,
 	.pins	 = artpec6_pins,
diff --git a/drivers/pinctrl/pinctrl-bm1880.c b/drivers/pinctrl/pinctrl-bm1880.c
index b0000fe5b31dfbcd6af6eaf0c01029f00cbd205b..387798fb09be51cabd5cb76e0d90a28b1d363050 100644
--- a/drivers/pinctrl/pinctrl-bm1880.c
+++ b/drivers/pinctrl/pinctrl-bm1880.c
@@ -1298,7 +1298,7 @@ static const struct pinmux_ops bm1880_pinmux_ops = {
 	.set_mux = bm1880_pinmux_set_mux,
 };
 
-static struct pinctrl_desc bm1880_desc = {
+static const struct pinctrl_desc bm1880_desc = {
 	.name = "bm1880_pinctrl",
 	.pins = bm1880_pins,
 	.npins = ARRAY_SIZE(bm1880_pins),
diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index eddb01796a83eb86c8c5bcf6788c999e8bf2926a..66c04120c29deccf53b21cbf8705f1d10c74ace5 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -879,7 +879,7 @@ static const struct pinctrl_ops k210_pinctrl_ops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
-static struct pinctrl_desc k210_pinctrl_desc = {
+static const struct pinctrl_desc k210_pinctrl_desc = {
 	.name = "k210-pinctrl",
 	.pins = k210_pins,
 	.npins = K210_NPINS,
diff --git a/drivers/pinctrl/pinctrl-lpc18xx.c b/drivers/pinctrl/pinctrl-lpc18xx.c
index 0f5a7bed2f81b731714e3b65908df23f2ffdfd63..5e0201768323521754e7ecd27e878a81925c18a6 100644
--- a/drivers/pinctrl/pinctrl-lpc18xx.c
+++ b/drivers/pinctrl/pinctrl-lpc18xx.c
@@ -1257,7 +1257,7 @@ static const struct pinctrl_ops lpc18xx_pctl_ops = {
 	.dt_free_map		= pinctrl_utils_free_map,
 };
 
-static struct pinctrl_desc lpc18xx_scu_desc = {
+static const struct pinctrl_desc lpc18xx_scu_desc = {
 	.name = "lpc18xx/43xx-scu",
 	.pins = lpc18xx_pins,
 	.npins = ARRAY_SIZE(lpc18xx_pins),
diff --git a/drivers/pinctrl/pinctrl-mlxbf3.c b/drivers/pinctrl/pinctrl-mlxbf3.c
index ffb5dda364dc81808cfd5a168ce3f1e9f119357d..fcd9d46de89fb3e5215784109ba31b171fd15448 100644
--- a/drivers/pinctrl/pinctrl-mlxbf3.c
+++ b/drivers/pinctrl/pinctrl-mlxbf3.c
@@ -231,7 +231,7 @@ static const struct pinmux_ops mlxbf3_pmx_ops = {
 	.gpio_request_enable = mlxbf3_gpio_request_enable,
 };
 
-static struct pinctrl_desc mlxbf3_pin_desc = {
+static const struct pinctrl_desc mlxbf3_pin_desc = {
 	.name = "pinctrl-mlxbf3",
 	.pins = mlxbf3_pins,
 	.npins = ARRAY_SIZE(mlxbf3_pins),
diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index d6bb8f58978df1577db24f96c2174f47962b5520..2d2e9f697ff99b4209dda8d5511f478a18b26a21 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -735,7 +735,7 @@ static const struct pinmux_ops tb10x_pinmux_ops = {
 	.set_mux = tb10x_pctl_set_mux,
 };
 
-static struct pinctrl_desc tb10x_pindesc = {
+static const struct pinctrl_desc tb10x_pindesc = {
 	.name = "TB10x",
 	.pins = tb10x_pins,
 	.npins = ARRAY_SIZE(tb10x_pins),
diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinctrl-zynq.c
index caa8a2ca3e681718fe213921deca8d130371b122..dcde86fed10db3e2dfebc19cb841ea7f63e74989 100644
--- a/drivers/pinctrl/pinctrl-zynq.c
+++ b/drivers/pinctrl/pinctrl-zynq.c
@@ -1143,7 +1143,7 @@ static const struct pinconf_ops zynq_pinconf_ops = {
 	.pin_config_group_set = zynq_pinconf_group_set,
 };
 
-static struct pinctrl_desc zynq_desc = {
+static const struct pinctrl_desc zynq_desc = {
 	.name = "zynq_pinctrl",
 	.pins = zynq_pins,
 	.npins = ARRAY_SIZE(zynq_pins),
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 27f99183d994dccb92aac81ca42228bdb9225e87..aeaa0ded7c1e5ee7f9c5e4113bfd208fb844ba7d 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -898,7 +898,7 @@ static const struct pinconf_ops starfive_pinconf_ops = {
 	.is_generic = true,
 };
 
-static struct pinctrl_desc starfive_desc = {
+static const struct pinctrl_desc starfive_desc = {
 	.name = DRIVER_NAME,
 	.pins = starfive_pins,
 	.npins = ARRAY_SIZE(starfive_pins),

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
