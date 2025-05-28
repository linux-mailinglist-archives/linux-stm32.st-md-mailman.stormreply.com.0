Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6125AC6750
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 12:42:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 900C7C36B30;
	Wed, 28 May 2025 10:42:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E4A3C36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:42:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3a4e57d018cso212679f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748428937; x=1749033737;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
 b=iUa9OSL+N8co/6TM+fpdbopUccn+AD8D3MHJlZCtYVcbtpAVrhn/Ke9kJmsxkdLbc/
 k9RA78EbPGxeaHgtKqZ1WAwZ6rRsPbShZ8mwUkddMCGCUP2fHsJb5Bg+yEiyZ6BJ8IJO
 dy9Fn5cyOskmycxxU8wfLeeMcc4VcuqDODw5ugNmj1NEcPoFUoe/FO7NCWWxKagI/IM8
 qmegJJu3Rto+TzM2kNOdu4RDb83tL6jDCPsCBndKY+tNyxkkZhklh0ELMqCeAkfLxDrR
 zilbNBwjrfmvRVHv4OvU6iFti3dAGhesl8vIUMx+v4moVoMmv6JZ26S4im6fc6Y1OaCf
 zpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748428937; x=1749033737;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubJ7uuc4KLABL05ikGhsnFP3O+LGDAGrddoVdCFQ7aE=;
 b=DcqEVXRBrNGprZPlvIvh4Y5YHi7+74SCxjI93t1i+t59gyXBWbMgX2pI8HUpOIIVV5
 WlrkmnSDa6k3dL5VhlhuMZ+8eDpolkOq6u7g0hq5y45VMPWMPnY5YkOEGLWpDiuTQR94
 JyvohwFTnKlDizEPn9y8ztsuecB4/tfHXQsqqmmM1hEuKvoaExsXUVUERJAVTT4kxEaC
 hgeG1Yldfbd5obU0+thtVfgfeAghOj+OQ/6/Od6eM3kzYQjpwSK2noSwIluPKeWAlT0K
 1x3MD0dZ6ZaupAHwPDUDio0gOVJhtcg2XMpoaRmJXl48lAFBQ7adoX+F4JFw3gf7naPF
 IFpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcnPfKzYGWB1bmUajtvLtB9Tbu9CDzGdsixagHP8ZK/joSgzngcvG1CMN5HAAN4fGriJC1u01ZY/qrlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwcVGukZt1q0MJPib8HN5wd+Jfh71TUhJk2FUrJdYuCWU2UlYWg
 mzY+zkHI4eeMGSB/u0SfwP+jfr3lq/P8s0bHGRNZmpaIcPelOB8KG96Yp0pubtN1RHw=
X-Gm-Gg: ASbGncuPAEq7Fk9H8yk2LvckrC22W00+8UpuSRF08tzVEhL7g7Hpc2DceSBry9pffpi
 scc67oMP6UyTzUGmalUD++Dhy/hfnrfgy3YPpLt23okxRAd9qEZohc1/Bf2pW5Tksv0v+aPkTCf
 lGpXfhb0kZWU7zEhykDvL38G3atLM1oC0kCd8T+WzmQE8xPZBieZ/qEmtMBhzClLmV0RVQVQWko
 J9m7UiOGaw3KJWWLd5ZaYGhGGkuWhHBJYl1F2MH6uihOrMAD4lPKbybl4Ukh1tvan5A9Xlnw5Ip
 XzF14v98SuBQTp2Sc4233hBA9ETWs+Pnh5S71eVHVtc95XO3d8oeEclfFSOnN8QfCM0gXZE=
X-Google-Smtp-Source: AGHT+IGUEkMw3AazYidVlvlcKxjjPcFl/fdYDePDntNbpwN9JsZRSDdk3Hds7gIIRpwHgP+c7VnBhQ==
X-Received: by 2002:a05:600c:511f:b0:442:e608:12a6 with SMTP id
 5b1f17b1804b1-44c91dc9fd0mr51871135e9.1.1748428936730; 
 Wed, 28 May 2025 03:42:16 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450064add8bsm17331595e9.17.2025.05.28.03.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 03:42:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 12:41:10 +0200
MIME-Version: 1.0
Message-Id: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1221;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wdAVjz1g2LnOLK8YIe+sx2i+Wtxy0b2lB+2wyeAsJM8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNuhVOUmo7glA0KmdvgZw8r0O4XKNab7bHjew6
 T+RsAWcuh+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDboVQAKCRDBN2bmhouD
 12JBEACByGYIJrWmeVaNuGhfgErqLrs8juvgq1he1oiyCbsIYgTgEq+hkshpq5p167n8sAXxqs+
 6iBVk16DcEYvSI0f8eCwat8zII1LkA4/ev5fMWjxd2Z3FzJswscCWFRIcarUCeBg5Ed+JZ9ZJb/
 sN0DzMJHT590OM6XRyVM/p3h3tnUQvwdzoqV9s5W0m9+2com84VzLAOKGdwYycuo+JYsD5GJuCi
 ueDuDOOW04JWSbUxMO5jxxZLXltdZb9B+y09j/dA+vEAU4rLYngyjux8/zx7evW5JMkCosH02FQ
 s8fr+Qw8tSf0/SeZOU/aJeUXpYvGrvaQefJaFh4YdCEA+bAj6pyNvYMWsIfwWvWaE4uawUoQ5Gp
 TJAyZt161KRilFdsJdPhEEcLzR1oML7mLl8Rx6++k0mb7HwaPoSudr64ZzDrwr/2o40pTX2dALR
 xcX4+WF5UWmuN6JwMHP4Pe92IW5urSZ80lzzkkV0kNpzmkBRmr2RmLNe1hcbRvVAO3T7zQ1Ji2V
 2O21d5pDtSNiPIS3BtOOFEf6m5aKJyk3wg64Ze7CTiqUj3VPHlbpMT0VrAMdmrjlY/4h/Xo8axA
 Zo9kbbNMJl2+zQofVcJ2at2Y4TaN2qo9C6H5+FzFTRhJ9EQpHJdf8J7TMx2fib06ZHvXH+XMnBf
 rJwlspjRton9X2A==
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
Subject: [Linux-stm32] [PATCH 14/17] pinctrl: renesas: Move fixed
 assignments to 'pinctrl_desc' definition
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

Assign 'struct pinctrl_desc' .pins and .npins members in definition to
make clear that number of pins is fixed and have less code in the probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rzn1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzn1.c b/drivers/pinctrl/renesas/pinctrl-rzn1.c
index d442d4f9981c908389407275522b936dbce294d3..fb874867dbfb9877b012988543ecbfd1bfb11270 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
@@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {
 	.pmxops = &rzn1_pmx_ops,
 	.confops = &rzn1_pinconf_ops,
 	.owner = THIS_MODULE,
+	.pins = rzn1_pins,
+	.npins = ARRAY_SIZE(rzn1_pins),
 };
 
 static int rzn1_pinctrl_parse_groups(struct device_node *np,
@@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
 
 	ipctl->dev = &pdev->dev;
 	rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
-	rzn1_pinctrl_desc.pins = rzn1_pins;
-	rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
 
 	ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
 	if (ret) {

-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
