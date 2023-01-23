Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D5677EEB
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:13:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3146C65E71;
	Mon, 23 Jan 2023 15:13:17 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B805C69057
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:13:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id d2so11107210wrp.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
 b=FbKY5x7kOocmY+G15u1Rybl6N5c7s5hINmWMLLUIbiX/Ia7UVazwL9ZlxHQPrvzNe0
 hmTthuzRAT/WvX5fVZYCvGgbezljFwp4yEHJf/7w0iWxS3KE22I3LPlX5YWIKd5EZY3P
 NwyQCoxNJQxTUzsgP37xTwwuxTNRiYeM+5Kl2bv84O+8PY4QJxP0qjtbyqXL+BoD54ue
 GmriCtjqim4n05LitBhAPlA5IsdCIQ8OfYkbsLvk7ijkAi7eUJ51rjKr/zDQRqpI6yXZ
 ligCskz7bKRdcY2CX+Lj/O1lLGNoGiZp0YCls3ydkJtQdpsBLTnb3UecqVDiGxN/CHsx
 fegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
 b=rXDKLUq0PGgDf+7RSHQLHWslVM536z4GkWc8sUrnOdj6cRci6OvM2sFFW0FUmLQMSK
 gST+H04yyp0PllmkB856D1eENhY6KofjOB/joSu2zS6Vp69wJHqKiU08dNttyoisss8g
 HnlJvHGQeotYel6yVK/6zqMr02ZjaMZPRo2ivnFfw0wKtlphA962cKUzOmWBb2w2yD7a
 XXFfg2BoYvnVhbgW5OZz4Fx+Dcyfi9qJj0wEFtPHEzenxxt2HsxKv2bUUzLEyB3lGdzf
 SJDv7b2JWbrP+MjUHgICQgZx5ujWRhKwCWyW0qP7Q2zrZWJOWfR5nVhCOr5ffvGJy8zy
 67rQ==
X-Gm-Message-State: AFqh2koI7Cy4/9/Hi1WXCWDHiJDAiahUdgVfGDS8Ifoupg5Y+M9zxCVp
 WGqLhWUmZfrggfpQvMfZNRm4tw==
X-Google-Smtp-Source: AMrXdXv89Fdo1L5qZYdd8EVxzoXYPQmn3ECLVZ91hGdnIDdEE5C27DGKNmJUU86YLBT9uYnmMZ2p9g==
X-Received: by 2002:a05:6000:1f14:b0:2ac:5b46:9c85 with SMTP id
 bv20-20020a0560001f1400b002ac5b469c85mr21246802wrb.68.1674486795939; 
 Mon, 23 Jan 2023 07:13:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 23 Jan 2023 16:12:52 +0100
Message-Id: <20230123151302.368277-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 03/13] dt-bindings: serial: pl011: allow ARM
	Primecell properties
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

Reference ARM Primecell bindings to allow typical Primecell device node properties:

  broadcom/bcm2711-rpi-400.dtb: serial@7e201000: Unevaluated properties are not allowed ('arm,primecell-periphid' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/pl011.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/pl011.yaml b/Documentation/devicetree/bindings/serial/pl011.yaml
index 80af72859876..9571041030b7 100644
--- a/Documentation/devicetree/bindings/serial/pl011.yaml
+++ b/Documentation/devicetree/bindings/serial/pl011.yaml
@@ -10,6 +10,7 @@ maintainers:
   - Rob Herring <robh@kernel.org>
 
 allOf:
+  - $ref: /schemas/arm/primecell.yaml#
   - $ref: serial.yaml#
 
 # Need a custom select here or 'arm,primecell' will match on lots of nodes
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
