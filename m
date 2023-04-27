Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 142826F0D61
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 22:45:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6BCDC6A5FA;
	Thu, 27 Apr 2023 20:45:49 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2C39EC6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 20:45:48 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-956ff2399b1so1624700266b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682628348; x=1685220348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v2A7EdpRRw4uhUr29cHp9TanChHdCrYmggTLXrFrhPk=;
 b=hIxfVLSq+nmegxqmVyJw4MiJ83Xqb06fTI1IBsWQL4pGWYAnJTdpzju1aNI+zZuuwD
 xX5hlc5OhhvXhAJ28lcUTKhZpgp1fGOlxaPd7NsrEqXBWSv7t71UqARcnrEmMUdvbMrX
 ht0H7epNLh2eseqd5EQA6gI8DPVQZq+ED5daQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682628348; x=1685220348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2A7EdpRRw4uhUr29cHp9TanChHdCrYmggTLXrFrhPk=;
 b=Yrx4QjLJxUbdk6CBRViH2WST1QWdx9IWwkqcO/l7/EVx7vU7czokSjUo1JPJZ77kf8
 +/alqBzrrAnYeMo6Usbq7RtQd/EKOxrA3/5ChobMhk4Ual1WDommJd2+jCDyaGuNj+X8
 c6Nnan3WwNnn5LQl5mGh+89vQkpDSBcNLdDZkbmELvNVpB89Vnl65VDbiDkWD4sDKE98
 NLFuqBlqzsSHa2dF+g1ClgzhYRTqr4PssePfW+dT/Wipqyk6A1ddkx0lI3GliAZiFLqu
 VXcv0Jw0yqPcacziuOf5awXPfH+ufUTUhMZJDkayIUIh35jPfCBPLhq0NJdUCpH8jnOF
 1L/Q==
X-Gm-Message-State: AC+VfDxy3ZBo2EPan6LbpzoglzT/h7Bupm9GEZ4b49mzpCZBiNM7iFsj
 KsMia6JnjSCwR81M6w3tkKV5QA==
X-Google-Smtp-Source: ACHHUZ5pkrfEo97jWwEggqo9NSV1NaQsI4JAPpU1paNohPHEtxduAxt0kbk7S9GKgqHPZwm14QdW9g==
X-Received: by 2002:a17:907:9807:b0:94f:24d7:64d4 with SMTP id
 ji7-20020a170907980700b0094f24d764d4mr3007723ejc.37.1682628347769; 
 Thu, 27 Apr 2023 13:45:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906bc4c00b00947ed087a2csm10171360ejv.154.2023.04.27.13.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:45:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Apr 2023 22:45:37 +0200
Message-Id: <20230427204540.3126234-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
References: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/5] ARM: dts: stm32f429: put can2 in
	secondary mode
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

This is a preparation patch for the upcoming support to manage CAN
peripherals in single configuration.

The addition ensures backwards compatibility.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/stm32f429.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index c9e05e3540d6..00bf53f99c29 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -387,6 +387,7 @@ can2: can@40006800 {
 			interrupt-names = "tx", "rx0", "rx1", "sce";
 			resets = <&rcc STM32F4_APB1_RESET(CAN2)>;
 			clocks = <&rcc 0 STM32F4_APB1_CLOCK(CAN2)>;
+			st,can-secondary;
 			st,gcan = <&gcan>;
 			status = "disabled";
 		};
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
