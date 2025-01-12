Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 779CFA0A993
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jan 2025 14:33:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2475CC7802D;
	Sun, 12 Jan 2025 13:33:05 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46B37C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 13:33:02 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5d8753e9e1fso631258a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jan 2025 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736688782; x=1737293582;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BOVqy08C6GsLjB0sMrq2+YSaSxUnwU9JmLZUrKlTUz0=;
 b=nen+gZXhqGLItp7MgJ69jaFMGO+SDfNpTbfhOSDUt7ckxLjIbRZwtRGIR3yVH3LkD+
 HEF8upUDLjfQdhnHp2kfzXFB6q4f/csD5dBbG2ONVjfy6G0aeDawz6Js0qFFtEq0H6iA
 VuMN+xxTkOHLlcTVzon40KFFMJtBrEzkBj7fCc1jsYNdotx3Fnf40lSuDOcbPMEQRTez
 cohhe7lbj6H0O/L78xmDxyPsMPST4gjl70RA4jB581Zv5yg4tbvoxuzx59BUJy7APc+q
 6DqFhlSSHDMUl4OcKC6cHZexFJOQioL9mnJTE+w0sS5t7dOJ/gscs6BBI1uWCCKqvFry
 63lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736688782; x=1737293582;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BOVqy08C6GsLjB0sMrq2+YSaSxUnwU9JmLZUrKlTUz0=;
 b=rPcuPwyon8n4TTllAHWi71XE6gEn1bd6bI4RdDH1ecMATI8jvzJllU4FqzruvOQzld
 F8+YmzvFJ9WGHrAztfrpvbIMLntSzt8ZxcuxGCifkLo8oSFIOekX819uMYoEGStMOnHm
 SFfCCuITApD+NmLHVVNM2D12oCpHLf46BxZDbWV74Y05b+JN68q4fwymWxEC9B8fECs5
 zIhZZSffzI32xMp/Ii58gzGsDOgj1fiZGM67n4bunuC3nHcmMa/8ToiiEDytpKCGE4+x
 YznyAviPLvSn1xvfnFWXKhRsJij26wzjmv1/sQtGK8ufPf+3RZgybKmNutVo3zBF4ckA
 VZFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7/hOmkBKJA7V7Db5pEDcamqsBakt+DjNhxzHG2sktdWiKNYUYmjjlB074VQZ1vORvmjtSW9dlJGJUBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz6wKSHMh7qDpHTqZrQe9u+zoe3KNtXXTmjSosP5XoCft/xeBVD
 hNKtNE2iY5U33ea5z1GEeGItCc6Z0N5ul6wiN1dgghrWqJ1CSMv3R3OCxegMKuE=
X-Gm-Gg: ASbGncs2sGf9qDUGQhmfCkWatn2d+hF5tA6OLnTiIuwoOwWjy+7UVxwYz+4nug5gOqF
 fXoKBEA+H/eqMH+SRY+pP03xOlzDNsSis7QxAjmvjBNlspmi2Sw/kMYJOQTh1VYQ5qtBFQqaizm
 qO4gZSLDC157ugH+jxUv/GoAoJ8cQmcCNgzoYV1uz1Do8h1FnR3A2hs62uZlAdNmpgnsyi+Nnt1
 mu7Az14Nm2+LD6Lm5VdJMPXGCtBWeAITUYhrVL/0PsO7xWMGEghtylmKagHRFqT1hXWF7qv
X-Google-Smtp-Source: AGHT+IHAPDDqI1itoMeCFKalJTN43D2b88pk2KL4TDUxwjUyr+2n3z7I5NTnbvxsw1RUzD8twrEPcg==
X-Received: by 2002:a05:6402:5206:b0:5d3:d747:6496 with SMTP id
 4fb4d7f45d1cf-5d972e801dfmr6260298a12.10.1736688781780; 
 Sun, 12 Jan 2025 05:33:01 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9903c4477sm3584609a12.51.2025.01.12.05.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:33:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 12 Jan 2025 14:32:44 +0100
MIME-Version: 1.0
Message-Id: <20250112-syscon-phandle-args-net-v1-2-3423889935f7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1430;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9S7gVVHLbOOdhmOrgxdeq6yW9GeOcGb38tpUZkh03pU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBng8SCCW0MlfjlA9K1TjLeHUu3QGRRtM/WgAZoC
 WMtHJkHeVGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4PEggAKCRDBN2bmhouD
 10+YD/9A02R/3MQQubS4ahQZTK/vIgEnDoLeLOZ2z6ur0SaSsl8P8g2c7riLLdYF92lSsgr7uRd
 jmeT9wLRxCkXUvDb6BlQcaqDWHzdA8yCfatXJo3i/2gmM28IQU0DZHciCQ9Er059Bd1mWk1TZDp
 LNC55whGCCGmpzxIn2wGaL7HylIHDR0oWZ2JQ+IBGe4+Iw2oTVS4tPErPl7ysAZCJbqOl8oHjI4
 ijfACgxQuzSwv72lLqmbXddZZ5BsAbYIfA0ql2sUIVsXx7/dcdo+J+1922mAUQcDtuQ3L8YdsK1
 nrT2AECb9AT2yQFJUWCFgml36SGT/AAGcCDFhEGrSm5sqmRhO+pbePafGg1SzeB/ykFZP8pbtmI
 kYyHMLG58LuLSM9wBwV7e230On5UeKDGtoQB2lhdPZqpTAypo/lNglE9T0jBII67mTOsel8rhNY
 8eWLdF/Ir8VjBmMK66BDKbEGh5NscM7qzw602iC1Zf4w/xVnMqR/P6ukm9kumXSAueVzXvGHj4P
 /9tyS3lSciwxAHxVcbKlC5/9XPgtg7i/7Ij3eN0jCdXqwbClXlaRNEYPaQ6bGPpOj4Ozpq7FzLc
 BDYupKiqx9fiH26x/CdTVFDC0seiQ9ZBJW9cttHi/2Pr2k57jYb1KWuMCQeroyLpY+MEyUYCjfb
 o98tiqTnTayP/uQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/5] net: ti: icssg-prueth: Use
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 5465bf872734a3fb9e7e481d556eaec3cce30e0e..68f1136e3db725eba239b10f337786ac735030ca 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2559,20 +2559,15 @@ static int am65_cpsw_am654_get_efuse_macid(struct device_node *of_node,
 {
 	u32 mac_lo, mac_hi, offset;
 	struct regmap *syscon;
-	int ret;
 
-	syscon = syscon_regmap_lookup_by_phandle(of_node, "ti,syscon-efuse");
+	syscon = syscon_regmap_lookup_by_phandle_args(of_node, "ti,syscon-efuse",
+						      1, &offset);
 	if (IS_ERR(syscon)) {
 		if (PTR_ERR(syscon) == -ENODEV)
 			return 0;
 		return PTR_ERR(syscon);
 	}
 
-	ret = of_property_read_u32_index(of_node, "ti,syscon-efuse", 1,
-					 &offset);
-	if (ret)
-		return ret;
-
 	regmap_read(syscon, offset, &mac_lo);
 	regmap_read(syscon, offset + 4, &mac_hi);
 

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
