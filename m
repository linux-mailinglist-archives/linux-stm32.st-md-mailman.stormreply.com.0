Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3446E3035
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 11:58:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8CDFC6A614;
	Sat, 15 Apr 2023 09:58:19 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8012C6A611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 09:58:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id rp27so14678404ejb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 02:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681552698; x=1684144698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hT0dzvsXvb7f698PuX8ThKiPZDrN3+S4Z3pmgV6QSpo=;
 b=bTJHqYbGlp4UGrO9oKw8Bghu6wDHkK/qnJECB0OENhFCw2eZ/EZszvWSjj70/YPJYt
 e+SbWG3F0D4EqrDyxt6GxI8XihIfzTdjOTHapVRqqT6cKzhUCJtTQ3r0G4h44nzNLWWQ
 ux2Kjc8ytqLSZQAEKogyli0FMWqt/vZNMr9SEyUA2YTNUpD7/nItuVCDjwdg+MiJuJW1
 vANBOgpdSnvkdN9ZVr1N13DrgR+Gp4mx0gNHxIXIeJLfdX7IeqmgcSTF9N/UZTh/L0Ry
 wxJlWA70/mXfUjCxjF7exBcKLFTWKawIgeepbswAsogQGBefk2Bd6BbI99WZQHoonpcn
 J1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681552698; x=1684144698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hT0dzvsXvb7f698PuX8ThKiPZDrN3+S4Z3pmgV6QSpo=;
 b=WCNxsVqiTjc4pZa4dakp6iG+AFTWQ07gitdTIPKZglJNDi6A/eD7gZaLGBPTt1nq8S
 MjrmKmtwyouEYFddDfF+5i9890YfwhPzrWDqZhgMdW71MefXi5SjMGTCWeAz5gHHYkj1
 7nJE0n4GGvEPc/2UAmIzoWYNB+k+VvJnkgtOyRjts71Ng7r7H5OqetYfVeiZnI5esnRi
 YjChkxon2fB01TMAeHr0iQRHJXkHt+ka+x4MEdWH6CujcT3XwObcS+3+kPwwJzsoOOzr
 OQO3DXhvS+64OXQVxMrmJyMstoR/jAEtJ2UuAtIPX3CfMW44+HoLFUeEzDWyUP5tiZqN
 VZYA==
X-Gm-Message-State: AAQBX9fmfgb+MW2ZNeh4J6eusKSTQNPBzQPsRRkBwbUpnbYY+Gcf9CQc
 kaqzm9fAYsqNKWizCK8UK0iCRQ==
X-Google-Smtp-Source: AKy350aa/SbsRtF67gLeFejSr20s5v+RMrFrIbspoXpE7GmfmW1U/LDuriV5iYIvkKV83gJzv44SFQ==
X-Received: by 2002:a17:907:77cc:b0:94e:e30e:7245 with SMTP id
 kz12-20020a17090777cc00b0094ee30e7245mr1380769ejc.8.1681552698443; 
 Sat, 15 Apr 2023 02:58:18 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
 by smtp.gmail.com with ESMTPSA id
 gn23-20020a1709070d1700b009373f1b5c4esm3594248ejc.161.2023.04.15.02.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Apr 2023 02:58:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sander Vanheule <sander@svanheule.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Justin Chen <justinpopo6@gmail.com>,
 =?UTF-8?q?=82ecki?= <rafal@milecki.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jamie Iles <jamie@jamieiles.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Sat, 15 Apr 2023 11:51:09 +0200
Message-Id: <20230415095112.51257-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 3/6] dt-bindings: watchdog: arm,
	sp805: drop unneeded minItems
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

There is no need to specify minItems when they are equal to maxItems,
because it is implied by maxItems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/arm,sp805.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
index a69cac8ec208..7aea255b301b 100644
--- a/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
+++ b/Documentation/devicetree/bindings/watchdog/arm,sp805.yaml
@@ -43,7 +43,6 @@ properties:
       Clocks driving the watchdog timer hardware. The first clock is used
       for the actual watchdog counter. The second clock drives the register
       interface.
-    minItems: 2
     maxItems: 2
 
   clock-names:
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
