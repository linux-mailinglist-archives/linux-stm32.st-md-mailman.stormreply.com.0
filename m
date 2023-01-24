Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F76793D7
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:19:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 229FBC65E72;
	Tue, 24 Jan 2023 09:19:24 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 487E8C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:19:22 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id e3so13176961wru.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
 b=ONjezc3uRXZlJmtLiPWC5mw58yms5cO1PTcTCwcnTPM7f+VvICxnFSBl4X/nLpZfmY
 aFmZ3dz8KHuvPhnMycUrIU/wfcpj8N8tsdpFu5yuGNIbgryu8ovn89HtaD4MKOiJKEDX
 szOT9ZhlzqEDlnnFaMRhnlVV5qYKwvhQwI3JN7baJMOGma2Qj4R0RJVNKqfbbQMGyvKQ
 Tip/5m94Y2UniXLOdCInty6j5cE1B0Bn5OkDlTQr+FOLfGUpyhQQlBlj7sINgWJ53+VX
 1JUDRoNwSdUHX6CRdmFB63SsqOSneNpY5t3UXCyF/IZuzsgGFD/JuD03wzIN/9nfsVus
 YW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=43A1eeWrpE679NQnTX4HGXlIW2NbDWo9ZcYcCEyQGv8=;
 b=K9nScRb7956brdUs3nFL7wAeTkHtVaRKpuThitay9HkoyZ/FUJbbp6NKimEMVMephh
 JULndmFbHhbp5oFgj6+5Egf8MpVGjQh9+P82rZ+w8mIGtEGUnLfUU6B8BSnCNNEht5AG
 upPnns65dFa5o9LYvpkF6Kx67Sj8O32g5HonKVwTk9JvuF0wB1ALXtCGUX0ggnbrgDJV
 GDD2QKSiYZipUYL9v6O8w4CtmVPATOORJRxjGmR+a/7w6klifdGOgO8tglpA3zBUvgi1
 HRf7WnUTYqVLFixoZ4+FjfPFYFvGhn+Futi9pdFmHNQGPA9Hla+aOb36UvUdEBz9oL27
 lBqA==
X-Gm-Message-State: AFqh2kp0N6yi9ylgh3ofOej9M8MkkamHPz8sv57yK2vXgxH1yY/LVb5g
 Ctzz2w/aFOdmvh0IHLk2bw6m+g==
X-Google-Smtp-Source: AMrXdXtDeqK3bf9pLkBQmMDNhFtINAt86Lm3kD2eTMHoeuC73VR+7IfQ6qYkFopm1Ln3EMVZmWg2kw==
X-Received: by 2002:a05:6000:1706:b0:2bd:dfbe:c17f with SMTP id
 n6-20020a056000170600b002bddfbec17fmr28359868wrc.58.1674551961808; 
 Tue, 24 Jan 2023 01:19:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:19:21 -0800 (PST)
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
 Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 24 Jan 2023 10:19:07 +0100
Message-Id: <20230124091916.45054-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 03/12] dt-bindings: serial: pl011: allow
	ARM Primecell properties
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
