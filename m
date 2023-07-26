Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5C762C74
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 09:03:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46234C6B45B;
	Wed, 26 Jul 2023 07:03:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2440CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 07:03:58 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-9922d6f003cso1072913466b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 00:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690355037; x=1690959837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rKeJEiUanxKvu93sGzjSg4GF4B3WGVBx7i1L2VdYJQ4=;
 b=M+tp6oZe1gPH9xEEcC4NIz/+17tPBDwyrg5XqayofEhQcOhoKm69JynkDfwwln3rpV
 2bXq4FIfw0gia5OxZ792IV+GtBZD6vKPmmSwKoprsYvEmbnFGq0giDCbB3+D6hFg3Ion
 X2666qbAZ4Bfwgo20pn4ExEnfw4a1wvkXZ99Fc/huplZ4OhgbD3uahNruY7BfFt+Vck3
 dxw6cE84wmU0EPOzPqT1BitAPEnnHn3tt0VJdCaW3gjULq3xd81txASd+wFyY6O1Mx1x
 MDS1iUHm6HxJJf5hgiTlDcL6nG9XqmWfzwEHhf5kG7dcwgHMdGvNAgfmy4iqPe0v4fQz
 BE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690355037; x=1690959837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rKeJEiUanxKvu93sGzjSg4GF4B3WGVBx7i1L2VdYJQ4=;
 b=Nw2fl7tpaHs1mtSCpqBXHAjQXdTSFLJZN6xgHRdFvn4BNfUXxXVFtMTgk0yIn5jrrs
 cw303i25tmAcnc3QurK4K3Jv4i2kOus5jOTC5xel7kNz0gX//BJhSjBFDRq1dOe9/+vC
 WYLPiRRuZE/F8AxH7vNS712puvc3DZfZ/Oi5ZpxoeeIpCZSjukZdLOxPZvHM1J9CCjpQ
 apMTA6DXq17rjD+W8ZTdaYc+ZldKJS2/7i2dtjmLFxeIO4Lz1rONSNBIGHGxt5ck+9ep
 TdMUjmxRc5iboufYWpPT15wlVNjRvhCHdGV5nBup4m0BFipXwwFg+QSh5WGsmE2yvC5h
 U8qw==
X-Gm-Message-State: ABy/qLa4IYBV4o/JsiSs8qfT2rfdr8/CtPhOem0tXWb/rAJIQtIxOa6f
 ehzpHMuysiow+2DJAeSq/eqxjA==
X-Google-Smtp-Source: APBJJlE8axeyzzn/n+ng+MNgJLYji7w3J5DoQfiai3wT/y6u66PcIt1x5dtooYjcqwlxSCkpv2+5yg==
X-Received: by 2002:a17:907:7705:b0:99b:627b:e96d with SMTP id
 kw5-20020a170907770500b0099b627be96dmr900296ejc.44.1690355037838; 
 Wed, 26 Jul 2023 00:03:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 ks27-20020a170906f85b00b0097404f4a124sm9212372ejb.2.2023.07.26.00.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 00:03:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 26 Jul 2023 09:03:51 +0200
Message-Id: <20230726070353.103989-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
References: <20230726070353.103989-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/4] ARM: dts: st: stm32mp157c-emstamp:
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
