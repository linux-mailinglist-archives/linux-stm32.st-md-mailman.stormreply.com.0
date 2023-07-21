Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB475C269
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 11:06:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30FDBC6B442;
	Fri, 21 Jul 2023 09:06:25 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D835C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 09:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689930383; x=1721466383;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I75kCCDlibaMONLjfxO4Q2JWzzPAojEBILnYVxUnPFI=;
 b=hZK3UL3PhpefyLPEOY36rt1jHRoPOdiPhYbQ67GAi6h4PiYE5zqL1h5S
 ds1v0Oz4JHy+nDZaAsA/ahnR0WB7h6xHICCRTADwWeXoVkktKP6aJ2t1I
 twlaFy3+rljqYGiqZ/KajwQu1+OIroxpaLLhjGfUhiyrlg3kB5LbVkuXT
 KP8tl8JNLF/ceyzf50Wmkgl4EYsG9G8heOQY6hHVQskM/S169FgmU/huC
 stsG/DtXUnnTP5xJiXjHkaSzKJIS++94k4WJuzRb9aixbu8AcuoHgnIcW
 hUflIWMihsr8jwUyodp4UIR4e6I8CSMS72TjObpVF+ycujqcIsKPbkLXE w==;
X-IronPort-AV: E=Sophos;i="6.01,220,1684792800"; d="scan'208";a="32049643"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 21 Jul 2023 11:06:22 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6E89D280078;
 Fri, 21 Jul 2023 11:06:22 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Date: Fri, 21 Jul 2023 11:06:16 +0200
Message-Id: <20230721090618.1211081-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: gpio: Add gpio-line-names to
	STMPE GPIO
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

This is a gpio-controller, so gpio-line-names should be allowed as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
index 22c0cae73425..b226a8892f8a 100644
--- a/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/st,stmpe-gpio.yaml
@@ -27,6 +27,7 @@ properties:
     const: 2
 
   gpio-controller: true
+  gpio-line-names: true
 
   interrupt-controller: true
 
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
