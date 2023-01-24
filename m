Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D61679295
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 09:10:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7BCA4C65E72;
	Tue, 24 Jan 2023 08:10:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74428C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 08:10:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 c10-20020a05600c0a4a00b003db0636ff84so10304635wmq.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 00:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=enwdC86sSt/Bgsu/79IZPHQk8UBBzGfxK3EOWaboBvw=;
 b=LcQfP+DFrQkopCoUrWUbHLoP4V1A7Jw1ekHzODbLGw0RsBJ0NZipqk98NN5wzpfnje
 fjrBQPcHcUkuHaTXmA+2i9W2FyiRa5INkBoymVv+zy8jnBG5uMHcH2QmnSQ7TwavBJme
 YsDgJmd0oJiI6Yno21owwT9KKCPicOuyET79ngsfc9IX54m/2by7la+cri3wOkVilrcU
 jsWiSH0EWljo6FXFJt+X4x89Jf5O5auswhQ88bWuSP4OwUOqdJYXQrdo58pmYWjvriN0
 y0jPhPRcL9Dw3ONd3ErVNlomrNyq4rTb1SAyOz5Xl7KuSZ+2sK7O8ixEtyrgGDbWg0tm
 I4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=enwdC86sSt/Bgsu/79IZPHQk8UBBzGfxK3EOWaboBvw=;
 b=ANrxHL1qwe0gC6U/69bw/leq71QKEtOrylzA7xlaULIoza6tIHKyGV9kHkiRQhc+M8
 B/Ua7l9Uhi4Fi/QegChLYzBdMCpPSRr/mst5EhtK7F7p1360diA4zmNLBy1ApPxCvYjd
 3H9USpyJanZ7C7Fhe+K0BRUW8kP/CW5dhtbHEvEmsEKa1KdDjrxtndcCWNRBXPPxvjwf
 bEUxWYn+5mrn7PuzorFpYNeQq2BU3kNh/eKg9Z+yGFnrM2lcNX3BnM7KeOf8W2qT41Na
 LhP0ZEDFv4/jRIhfpOKyeuXsfraQvUcgGev1XuUzlc8lv5d8ptz70RUpoo1uBifaHQ5v
 D90w==
X-Gm-Message-State: AFqh2kqZyvKIgttbDMtpXnmgmL19AZr4nh6uKROhplsCzNtFxnGF4I5Z
 SaqoBVVXQALgRoqjOEn1/MrSdQ==
X-Google-Smtp-Source: AMrXdXvrMchcqxie8a683KuQ99WFLZa7O3FNKCTK6c7MV7bXkFWf0TNY9aYHjbV8oRAaUDfzhGOBEQ==
X-Received: by 2002:a05:600c:3c8a:b0:3da:2a78:d7a4 with SMTP id
 bg10-20020a05600c3c8a00b003da2a78d7a4mr26317985wmb.21.1674547849007; 
 Tue, 24 Jan 2023 00:10:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003db30be4a54sm13459779wms.38.2023.01.24.00.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 00:10:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Puranjay Mohan <puranjay12@gmail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Renato Lui Geh <renatogeh@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andreas Klinger <ak@it-klinger.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Nishant Malpani <nish.malpani25@gmail.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Stefan Popa <stefan.popa@analog.com>,
 Robert Yang <decatf@gmail.com>, Sean Nyekjaer <sean@geanix.com>,
 Artur Rojek <contact@artur-rojek.eu>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Philippe Reynes <tremyfr@yahoo.fr>, Alexandru Lazar <alazar@startmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Stefan Agner <stefan@agner.ch>, Daniel Baluta <daniel.baluta@nxp.com>,
 Harald Geyer <harald@ccbib.org>, Eugene Zaikonnikov <ez@norophonic.com>,
 Phil Reid <preid@electromag.com.au>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Stephen Boyd <swboyd@chromium.org>, Sankar Velliangiri <navin@linumiz.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev
Date: Tue, 24 Jan 2023 09:10:34 +0100
Message-Id: <20230124081037.31013-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124081037.31013-1-krzysztof.kozlowski@linaro.org>
References: <20230124081037.31013-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 2/5] dt-bindings: iio: minor whitespace
	cleanups
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

Drop redundant blank lines and add such when needed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml        | 1 +
 .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml b/Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml
index ff50c72c62b5..9eb9928500e2 100644
--- a/Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml
+++ b/Documentation/devicetree/bindings/iio/dac/adi,ad5380.yaml
@@ -12,6 +12,7 @@ maintainers:
 
 description: |
   DAC devices supporting both SPI and I2C interfaces.
+
 properties:
   compatible:
     enum:
diff --git a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
index 00e3b59641d2..d4e09d2dcd21 100644
--- a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
+++ b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
 %YAML 1.2
 ---
-
 $id: http://devicetree.org/schemas/iio/proximity/google,cros-ec-mkbp-proximity.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
