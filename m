Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD9CAC673D
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:41:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F418C36B35;
	Wed, 28 May 2025 10:41:56 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC6F8C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:41:54 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-442f4d40152so5987245e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428914; x=1749033714;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4eqWfvPKnGs6dEV8KWDXklpALBHd/Gw82aMk/cyVxWg=;
 b=V9p2RcoUr6rT1sUYtpisre3lAIWNEOsrzgo3gRO6IRGQwJaMCZwTSyF9CnbJlklnWP
 6mL84//MIcIEjMta5PKsgNPFzsu/jcirUBaadclj5to9jvaJ4/AyF4BGtRrZyeLpBkiQ
 5xoJrj+kBfiqAf+Ju4RV8OxN9OKsn6Yrnszmq6jve+JJ5QVQU2tC0f4fKwjndUusQ2gc
 hYkGRwueywVquvQ3H33yzEW6KfYIEmlUUKnGzBWq8Q4ROWKkyMs+Cf5tmK7bBN0AQ+ry
 CllmOVr8TnSCYOakVrmqbELd3G1pe3AeXEyE3+bUZd1v04j4tT3i+0vlnFbZX76yCznr
 8kYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428914; x=1749033714;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4eqWfvPKnGs6dEV8KWDXklpALBHd/Gw82aMk/cyVxWg=;
 b=nVzlOIL2YUlP/Ntp+tlYKtLc+BEdLC2HgWd3pY2AxLkFaGSDDZq3MFxK7Ivs+PPIHf
 RFsoHcAOXmUA6cnFpMrswqQ1TLSJBRX1/CMwmtO3ITTcjLgs8VJf9RbTWz14iKGmlnLc
 aW9y/RmYy/Wi1cTEmFxFgV33GaV+OcEZnRDH7qTqGtTn9ePMZnKdpHz1SDy1GmQfQLPr
 fJ1JC11o0bWG6Q8Quorg4RnhWcJjYTHdQu/w8+XizR/9AkgihntXt9DcoV65Rt6E1VKJ
 ZsEUunyos2ahahtfl6RvPXHYiBNNhUq8+D9ZYNd/s5jg1XZnU0AVX1IDhGlCQND4tL7n
 zs9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIJPTXAms3qDS9jntoGnMBM8XxFdhcFlr2BUAn5d3kfKH9sZ3mX7JuQDJ8YXaPF5byGSbgyuGvElL5Hg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywe1hqBRDJXMkrhMAYr8DF0L7RSr93kkYSdAObRbZ1jtVcT3ZDd
 60e56DiabcXq8QCanA7tkbbMhIKkPr+wNsoGQMsVwMSdENdCMshr4qcz1euB158cEq0=
X-Gm-Gg: ASbGnctNINNU7XfvtqGu+zhKqSOB0Debltrd17N8BMiVjzDJ4EJXENbgYNMzOX+Il2H
 t6Q7LApjZJ5L5Kn5stccFqDpNufAdSKX4/BGdN3RT0rauI2LcOy/oYscIEVGFeQ/5M46nUxy2I/
 EGMT7kTXfpWkOSxoFBLleNKf6CpcLFAFuvHmWv4/ngSpdQTNy+bXWy3Q0V/TNflqdE3gAq9MoYv
 vs8ni/z9wjhMkJ79s5G7nwGF+Bn6PYVOUyrQ9ysPu93RO3P83NeZFHQ779MMmXS0Str9esexIBy
 NrLwS4RtqZbZ3S8fBqxv3qz0Rs6NOi7gfuHFU0V0R12h3vIwUJd5lF8d+IYH2AsexX3nZ90=
X-Google-Smtp-Source: AGHT+IHqXCD2Zw01Rwu6Y3SAvsPyX9CqAzleS6jGDMZtlcG8vOZNw6N59XBM2abO07C+micSLyXkEw==
X-Received: by 2002:a05:600c:3c96:b0:442:fac9:5e2f with SMTP id
 5b1f17b1804b1-44c91cc3bc4mr57701585e9.2.1748428914050; 
 Wed, 28 May 2025 03:41:54 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.41.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:41:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:03 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-7-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1496;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ABHNDkrQtwVI0zXe6lhvrQu7yt9ZZOAkqbbG+yTdfqk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhOkNkLKO2b0zaSv6TMTVNLJbk5UgYW6TFwg
 jxSUj1tHraJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboTgAKCRDBN2bmhouD
 11tIEACA1WGvClNApJH2VgRBIboy0fFx1D+Y+FmGZZOWF2Lr82rwxR+M2b748c5TlSo9L++jcYr
 ZIR9lt4fSg+Yq5PmKkMDS5q4/ycD2Gcrmt5FcuzV3FHj/sG2BsZ4jRCEU2k0iCiKO2X1G5tK6zW
 cPFXEwBw4P08YI7Nu2Ke8Li1A5AQfcSHEssreNopxfynn3hcgemwVvxqcrgTgn7LKeyty9xxRFf
 Kn4F8QcbHnhFHps9umRJISETKamqcHenUST3DXcgLh47hR495Vcu58lodmhE2bAmutSDn5thYfe
 DoO8QFiiJskkUniuoDUTujIX6m6u+A6gWbXWz6beprpg3Xf05DIvGAxvrQw5iCf4HEKY+m10FEY
 43eDfDRbqF3WlANoUSuRFJNxtdKy/sbJjlSx/hgmTrohMHQuWXOua6jZ+L5S0pD+1WTBkGWJ+X1
 xFECehBz9isI0FWdgZrOiu7VDyAyjj+5nFjPqGNf1RCGXB4e9CQ3Wk3tawW1XnuZjfYNJxyX9LL
 wGPxw86wuE4eFNLbtUC/wyhkH0OYnduQDq8aidt0TCaFCrmsSv6hkV0VKDTnjl7D4cOaPPst08d
 I6jHmNloifkKQPK0TtV1VNakHBf8aR1kzbxtqVvWqR2c/B8gIYE1dpqeAFLbE4Pxl+6pc4QiYJN
 MPOQPOjSdZQleng==
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
Subject: [Linux-stm32] [PATCH 07/17] pinctrl: bcm: Constify static
	'pinctrl_desc'
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
 drivers/pinctrl/bcm/pinctrl-bcm4908.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-ns.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
index f190e0997f1fa9fe8bf07fc3ae5700bc721e1651..12f7a253ea4d5bd0af5dbabc320fc2df32172e4f 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
@@ -456,7 +456,7 @@ static const struct pinmux_ops bcm4908_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc bcm4908_pinctrl_desc = {
+static const struct pinctrl_desc bcm4908_pinctrl_desc = {
 	.name = "bcm4908-pinctrl",
 	.pctlops = &bcm4908_pinctrl_ops,
 	.pmxops = &bcm4908_pinctrl_pmxops,
diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index 6bb2b461950bef5c420f1b250d48fcf6e907b98f..03bd01b4a945adf72445576a8a111f3c0637e095 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -192,7 +192,7 @@ static const struct pinmux_ops ns_pinctrl_pmxops = {
  * Controller code
  */
 
-static struct pinctrl_desc ns_pinctrl_desc = {
+static const struct pinctrl_desc ns_pinctrl_desc = {
 	.name = "pinctrl-ns",
 	.pctlops = &ns_pinctrl_ops,
 	.pmxops = &ns_pinctrl_pmxops,

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
