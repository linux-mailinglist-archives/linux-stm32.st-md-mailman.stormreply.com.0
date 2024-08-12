Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7799F94EE49
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Aug 2024 15:34:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B123C7802B;
	Mon, 12 Aug 2024 13:34:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F383CC78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 13:34:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso33471735e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Aug 2024 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723469673; x=1724074473;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KDjln6hpCDXYJ0URbIXokRubyMBzSip15NzhUO8TB7c=;
 b=iGHbNR3GiMiH2JP5umTBAQPwyp+h88kaldAoC4dIBOXCyZFWdFJ6pqIb6H9OycI3P9
 ipIszAfS23Rs67KnHnQrdQF2W9AA5A2JncTbBUkYLhygWi+ZuhPA+xuC75wXWKzYrrih
 MHmGiPruLamyfNC36AliObpY9s5GeO0fXhxU/mn6KpZ1FowauqFDDyf2iprLZ+B8dPbl
 PNYCNREAowlaNZezamtnC3GuqLQjEkpZ+v7jp2Uj0pGy8wxduRXII7uAONj2FNhfpeCv
 QhLLOZaqNRFDHkRaC2LzRRF0274KdAtsqrCctu1mxs4Z3vG9RMXhfj29FvE6kuTHqCcE
 eN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723469673; x=1724074473;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDjln6hpCDXYJ0URbIXokRubyMBzSip15NzhUO8TB7c=;
 b=iY+Jn9kxOTWwvDLkxRZFmkUMgVpHw2WFn+gdZbkUc7U+uqB5RCYEB6d1eRrSD5Lc9w
 hDyKh1QNYfD5nC5xaQTcfJj8Cgz9M1Gn70hgiSW51EjAasqHNdjj1g9x3H9j8UhkyHL3
 b63veN0zfrdBTb6cKVe/jzaeQ/B7HvvC3tNpBTxUH/l2sO8yyRw4mpVuSFgki+531uIO
 sTI363ku4gH9e4IP2UN+ilMhymwxAdfFHTV3V52MSQXD0F8isPa9y7hYsjqDCmq4iS3w
 fDvFJ2wQ5D7zO1BrmgyBf8O75I1ilhNmTfobQlgMfr1aFZDCEUZoEWTd4q41qo3ADf8T
 gjKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+OUdL4wUAzQpdXhVbVVL89HYiqKCAXYcbCO2jSTzEBcfVo3onvJfmAqrelCmcSuc2LBPqFPPR7q1NtgLehnAZeIxJSFgFa7JL+oPVPmyEP6EXye1YnKsr
X-Gm-Message-State: AOJu0Yxqawn/t/7APfoJCOmJZQGmWpTADStM8RBa+Es1wMRxe/96bQFA
 dhI+lnHfiSrD0pYLwHa4+HotBM9srGz0OoipMbZa9zd/Vbz7zA5CuMxwo1NYs+s=
X-Google-Smtp-Source: AGHT+IGxNdfGFBc2sd+uT8Mshv7zE0iMHxVPPRhCFdm+enI7xTfevgaIs4pdgcrzguVgeuzP0FcuHg==
X-Received: by 2002:a05:600c:358a:b0:426:5269:9838 with SMTP id
 5b1f17b1804b1-429d47f43a1mr3753855e9.4.1723469673377; 
 Mon, 12 Aug 2024 06:34:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429c7737c64sm102733975e9.31.2024.08.12.06.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 06:34:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 12 Aug 2024 15:34:03 +0200
MIME-Version: 1.0
Message-Id: <20240812-cleanup-h-of-node-put-memory-v1-9-5065a8f361d2@linaro.org>
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
In-Reply-To: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lukasz Luba <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1869;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1y9LIZ3UpOVR4pnvMVqojw1S5Kf9CAK2N1Et998QgxM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmug9YQQCkCmD6RWyldjxAxJ+p417Q43d0hTixW
 dLzROOtWr+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZroPWAAKCRDBN2bmhouD
 1+nCD/9WeAq/6x6IjpXwsbY6q4WpzSCuLIsFjo3y8wWVAXieoqOsqOZ33OR2zlrlb5R7xqAmLOk
 n+hWanKoaIz81P6uaaOV4ADrfzpSGO3F3pljzOFcC5kjgcvvPffYqPKATl5sUjzZNH+GbX+OJRZ
 0av395if4QbFFVZNGRncMfCo2pB8HZQQawKOrIVCOPLzN1l5iqgNomvHLRDECCa/i8nCeaWlmi/
 9UjCR9X02xh/BxZW74SjO55jI7IqLA9ohbA/OOGySP5UKVr42BoPn58P1GXpkfY6FZA+HZZ3ZxH
 v+AGb+6rq80Wl7Lz7DM4tVc3RniN66Yw1veXOM5c0CnQcQHGRGJDD0PV1Mm5Y/UEhTzsYmy3srt
 a2GcSDTHi2UlW11x5nxxS3OqY5xQ0lPmPn3y1UQ34g+x6gZpPZIQ5sRbQBNisH0kkU20pL32Toj
 vJG2V8EcF8BgyExdqs5VwUIyMk+IGrWmq9XPpedyVUo3qSrUBR657572wxtDIFSOEkJ4sPtKxg0
 j3AB0xCbvaDIJIE3xaTuD2DMCy2Tqf/EocjX/gF6//BfmKUbuQQUFxqm5UCiuSihYMtB82scL+Q
 uQzGTpTFXzJKJUPlJUNaBiagiaOp0EoNTtbPKrmqybnQqPkBi7eMW/iiBy5E8nu+QOfyqv/mAoP
 uWIYBVUyjipVCyQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 9/9] memory: ti-aemif: simplify with scoped
 for each OF child loop
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

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/ti-aemif.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index e192db9e0e4b..cd2945d4ec18 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -330,7 +330,6 @@ static int aemif_probe(struct platform_device *pdev)
 	int ret = -ENODEV;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *child_np;
 	struct aemif_device *aemif;
 	struct aemif_platform_data *pdata;
 	struct of_dev_auxdata *dev_lookup;
@@ -374,12 +373,10 @@ static int aemif_probe(struct platform_device *pdev)
 		 * functions iterate over these nodes and update the cs data
 		 * array.
 		 */
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_aemif_parse_abus_config(pdev, child_np);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				goto error;
-			}
 		}
 	} else if (pdata && pdata->num_abus_data > 0) {
 		for (i = 0; i < pdata->num_abus_data; i++, aemif->num_cs++) {
@@ -402,13 +399,11 @@ static int aemif_probe(struct platform_device *pdev)
 	 * child will be probed after the AEMIF timing parameters are set.
 	 */
 	if (np) {
-		for_each_available_child_of_node(np, child_np) {
+		for_each_available_child_of_node_scoped(np, child_np) {
 			ret = of_platform_populate(child_np, NULL,
 						   dev_lookup, dev);
-			if (ret < 0) {
-				of_node_put(child_np);
+			if (ret < 0)
 				goto error;
-			}
 		}
 	} else if (pdata) {
 		for (i = 0; i < pdata->num_sub_devices; i++) {

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
