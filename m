Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3326D19FA
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 10:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 421E4C6A5F6;
	Fri, 31 Mar 2023 08:34:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAAD0C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 08:34:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id y14so21602832wrq.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 01:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680251692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7wf9SwyOhQz7g6EiRpZy5Wi8C0ELh2QJL8BxOtMQjNQ=;
 b=KOfHL6QnQCbHbqPXUqo6ZvEG2z1yZ++Zi9D2AelVIxvkp3v4CBUgHj9Knl5oyIiOkB
 RrLOU3ZwudVZ4jmfljtYSayheSg0vohkiDofTFnTQhoEha1hc0cuTi9XKRouKDzXZhEr
 J9XyeJo0ntnzkjZsx99LRBmjqS5GHaMww2M2xDFwaAvJzpSGXfs/qmrNrcmQRbSAdJ9P
 xmGZEQokLL06b9oHiwSanHGu2Q5TyyUzNnrPVGdbyUw9MDXkSyki0njbE2Agt7SfqB0D
 D7v/KRdGjRtIvJ2ttztoo255ZEcYzA6ZAXEMdFTzwMRTu+yhrAtLfGcHK4n+pYDtPeRB
 Recg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680251692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7wf9SwyOhQz7g6EiRpZy5Wi8C0ELh2QJL8BxOtMQjNQ=;
 b=ofBSaBGvusaEPXpd9O2+ifTSsZnB5LFf0Cg9AXt7UpCxX3zlNuYuRW59jFGDpvUDU+
 wW0VjOgWsBzRBJYgsSRfyxw68NPqEq4XRP3c0jOHzXyy3OBdSfcKFiyFz610YqXSyX5p
 ugdoH3MPBuHKCWqgfkBVje0HurwDgt0n0wBInZ9QJKBcKpjPG6bGksEgtP+WvKGexbaZ
 ZfgusMRUqxY+zmwnGCWfy4KirNOPI+eQNK7mQHPJOMIZ3VQV923ebRKGUHxLZ9L/+v4r
 xMh1gkDgrYMpePmJoXWI21EHFVxuCT3g67idrmeJBjGTvayAvghmxPZbxwrhDhHgxkOW
 zVKg==
X-Gm-Message-State: AAQBX9cU0+3IPDcPZxP+cVk3V/Kpy6hQwZpXp7ySDJb5JwzIYi3Fn0f3
 fiO9qq9RKlEdmm0819Drzlvx9A==
X-Google-Smtp-Source: AKy350abqfIAr0v3P1V1HSk/CRdjBgvVisNOx4Kso+mcTsWdfBK5jYsqahojN5zQQJmGitx5MuUOFA==
X-Received: by 2002:adf:ff85:0:b0:2e4:aa42:787e with SMTP id
 j5-20020adfff85000000b002e4aa42787emr4054721wrr.51.1680251692431; 
 Fri, 31 Mar 2023 01:34:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 01:34:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:44 +0200
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-6-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
X-Mailer: b4 0.12.1
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC 06/20] dt-bindings: clk: oxnas: remove
 obsolete bindings
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 clock bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/clock/oxnas,stdclk.txt     | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt b/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
deleted file mode 100644
index b652f3fb7796..000000000000
--- a/Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
+++ /dev/null
@@ -1,28 +0,0 @@
-Oxford Semiconductor OXNAS SoC Family Standard Clocks
-================================================
-
-Please also refer to clock-bindings.txt in this directory for common clock
-bindings usage.
-
-Required properties:
-- compatible: For OX810SE, should be "oxsemi,ox810se-stdclk"
-	      For OX820, should be "oxsemi,ox820-stdclk"
-- #clock-cells: 1, see below
-
-Parent node should have the following properties :
-- compatible: For OX810SE, should be
-		"oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd"
-	      For OX820, should be
-		"oxsemi,ox820-sys-ctrl", "syscon", "simple-mfd"
-
-example:
-
-sys: sys-ctrl@000000 {
-	compatible = "oxsemi,ox810se-sys-ctrl", "syscon", "simple-mfd";
-	reg = <0x000000 0x100000>;
-
-	stdclk: stdclk {
-		compatible = "oxsemi,ox810se-stdclk";
-		#clock-cells = <1>;
-	};
-};

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
