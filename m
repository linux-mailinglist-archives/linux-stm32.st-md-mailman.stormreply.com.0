Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D135791C4E
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 20:05:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4594BC6B455;
	Mon,  4 Sep 2023 18:05:24 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0189C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 18:05:22 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-99c93638322so366023166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Sep 2023 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1693850722; x=1694455522;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BwZewNI4F+2A2loSj+kf1NfW7/PQMO46viQSdkuX7pk=;
 b=EkEC7eU927dJvR11k6HaUK3Dl9nRk3sSArohe6+U7gpgj3RCxphcUSZQ3CU+M3yMaz
 b4dlI06DGtwNawmahebFFQZatEkb7q0leQ1D/+j7XFozG/5nzO04dJvyl+x+KxbTyQ0b
 6RsxCm/UknAuGprQQSruTbEC8k7wVWn0tVglI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693850722; x=1694455522;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BwZewNI4F+2A2loSj+kf1NfW7/PQMO46viQSdkuX7pk=;
 b=P7PsRy/IG1Cq0TH/z8F2uuazic3s/kwdzdC6tj9vKPGQUjdLgITMdMH1sSwUODZrWb
 MZ4TNwfyQoKBqMv0zJMjbbHVFGX5BggwRWct96Wnmcn+WGF56PiFFDPG3FjiXOglLa9W
 VjxWNU2oggvmRAZfORNgWcHtrs5H82lBbuYkIgDJSbQCuEKZUGxcMPSAp7WoIdqjXwd2
 U5A9iQhLZOaKgatU3CdKTw9feWceGcpV+F612sOMFtpfSGMDZforv6Sc7rPB1V6Dgtjl
 9fXDt487cWVdb1qMBF7ZiVEwjEbCF0j5fjrQBY9ziaTbJ0Ht4GWiJqCmG/uqkLFu3JRl
 kyIQ==
X-Gm-Message-State: AOJu0YzvxKjWbd9SVJw5AooZUSMDmykerVWY2FvhoNBBEcputOmEu5ku
 ZGnjGiD8qAIdj9VrHY0/l6jIIQ==
X-Google-Smtp-Source: AGHT+IEYctr6D2EcdpyGOsS9HFSxP/Ij1SiHZ9bQWe2PcRm76C8Xxe7LTR4UZmZqVc4lcVqibvJZ0A==
X-Received: by 2002:a17:907:97d0:b0:9a1:c69c:9388 with SMTP id
 js16-20020a17090797d000b009a1c69c9388mr13413090ejc.37.1693850722354; 
 Mon, 04 Sep 2023 11:05:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-71-141.retail.telecomitalia.it. [79.54.71.141])
 by smtp.gmail.com with ESMTPSA id
 pw9-20020a17090720a900b0098884f86e41sm6382620ejb.123.2023.09.04.11.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Sep 2023 11:05:21 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  4 Sep 2023 20:05:13 +0200
Message-Id: <20230904180513.923280-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH] ARM: dts: stm32: fix SDRAM size on
	stm32f469-disco
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

The board is equipped with a 128Mbit SDRAM.
128Mbit = 16 Mbyte = 16,777,216 bytes = 0x1000000.

Fixes: 626e7ea00215 ("ARM: DT: stm32: move dma translation to board files")
Link: https://www.st.com/en/evaluation-tools/32f469idiscovery.html
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/boot/dts/st/stm32f469-disco.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32f469-disco.dts b/arch/arm/boot/dts/st/stm32f469-disco.dts
index cbbd521bf010..f173a5892b7d 100644
--- a/arch/arm/boot/dts/st/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f469-disco.dts
@@ -84,7 +84,7 @@ vdd_dsi: vdd-dsi {
 	};
 
 	soc {
-		dma-ranges = <0xc0000000 0x0 0x10000000>;
+		dma-ranges = <0xc0000000 0x0 0x1000000>;
 	};
 
 	leds {
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
