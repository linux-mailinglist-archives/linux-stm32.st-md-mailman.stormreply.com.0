Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 524657686DE
	for <lists+linux-stm32@lfdr.de>; Sun, 30 Jul 2023 19:50:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13D1FC6B472;
	Sun, 30 Jul 2023 17:50:01 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E0AEC6B471
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 17:49:59 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-99bdf08860dso671237466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 30 Jul 2023 10:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690739399; x=1691344199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qguXrs4rxGcbuCHOHcNCgApPSjMlmrZgyKpyWeupbD8=;
 b=zws/0VbtnpKpRF1lvbRBleJfUuecSrRxeRow4xtk/RAhRpnPpBiQgL0ZB2jkQGa3ME
 q/uI/ieAfQtCb/qRnKjGNHMuBTDsI1qBqjq4icaRGik4u7SnjlqfTpGFSZpYLqHw4Opq
 NCYDuuEtQMcqls9LzdQpfabnaDMhZ7vyaYlRUy9npcR2Q1xL+0teS19kW8Ii7q5Q+PUV
 qdboRTgqROPfnTE/usxiSYsr6nHF7n7Y14SxbojW4+lUMWZLuNccXVtwv7HTnzOEHUpP
 DRY9Vm64cIzYTDKsCG+Nka6uFReGNCL02AMNNsmXL6f9AbBSL/d6OAaDYKoBwg0TXhCW
 7TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690739399; x=1691344199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qguXrs4rxGcbuCHOHcNCgApPSjMlmrZgyKpyWeupbD8=;
 b=UN3L6P3bqKDGF/HAWU3B/P/EQxJ2uFyGKPvyLDEYXhNEvXEIzwMhF4jtiBCY3u9fmw
 fvBH38T2vnk6zarho+eAQ7rNsMzSpOEy/vZYSOxa89UI37LNxorOkaI9B0uFbOpUh2jr
 G7HTgt8Qn3Uigw1uav83+6aJyq3qXAOvpgvCandHljsKECEFX/uoW0k37M66vsUi0dSp
 FBKzzmOPk5gfaznd7cCBRCiHxlKNHIafBs2+awFfYzx8zsrKh0Bd6bfM8p06UV+qGABN
 cEpLHiFxfuM4J+f7i7zSoLthH6xmR79bpea57ObGLIfGe64iQVbpDNeocZeos3i/+IjR
 801w==
X-Gm-Message-State: ABy/qLZZPT6OYHRQYstMLM/8MmLAqSPjSNDf96Yk8XFWhonAoA9ph1pD
 ZiZs+CkwnvLEspg5nYZRTBjEMQ==
X-Google-Smtp-Source: APBJJlGYOCXtkkxRgf9ch6URmqY64GItVtmscencCEMZ8NP0GlBTZlArsL8PgKSu5kTgES1Dkua/UA==
X-Received: by 2002:a17:907:961c:b0:99b:af5a:fc2c with SMTP id
 gb28-20020a170907961c00b0099baf5afc2cmr6119843ejc.26.1690739399106; 
 Sun, 30 Jul 2023 10:49:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183]) by smtp.gmail.com with ESMTPSA id
 f19-20020a170906495300b00992c4103cb5sm4913537ejt.129.2023.07.30.10.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 10:49:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 30 Jul 2023 19:49:52 +0200
Message-Id: <20230730174954.5293-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
References: <20230730174954.5293-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 2/4] ARM: dts: st: stm32mp157c-emstamp:
	correct regulator-active-discharge
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

The "regulator-active-discharge" property is uint32, not boolean:

  stm32mp157c-emsbc-argon.dtb: stpmic@33: regulators:pwr_sw1:regulator-active-discharge: True is not of type 'array'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
index f8e9980ed3d4..009209ca673b 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
@@ -320,7 +320,7 @@ bst_out: boost {
 			vbus_otg: pwr_sw1 {
 				regulator-name = "vbus_otg";
 				interrupts = <IT_OCP_OTG 0>;
-				regulator-active-discharge;
+				regulator-active-discharge = <1>;
 			};
 
 			vbus_usbh: pwr_sw2 {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
