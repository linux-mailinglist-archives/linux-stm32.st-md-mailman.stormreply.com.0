Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B50F704834
	for <lists+linux-stm32@lfdr.de>; Tue, 16 May 2023 10:52:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 192AFC6A613;
	Tue, 16 May 2023 08:52:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0339C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 08:52:28 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7577ef2fa31so179230285a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 May 2023 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684227148; x=1686819148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Fsp/r/3X/nR5Dw9Y1Zsp/W7/PyEi0YNOAlMQBXhdvU=;
 b=IpHvYlsdGHRVrxdSldGKJOZaCDHvYa3054Jl2mOcEZkIz44x3oKuYk+VAZ+abkVCHZ
 ryThXyKnU22y2lO87uWBgHjsmA7Y4yXjB1rq8PBl1o688QRwuYjGDJhG83VlUfZpCZxG
 1X3Wv34o5BGtgOQW3TLfRUXLewQFbYKu23RfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684227148; x=1686819148;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Fsp/r/3X/nR5Dw9Y1Zsp/W7/PyEi0YNOAlMQBXhdvU=;
 b=Yf5wHliNzrVRPzeY81C2utpLyprsI60vjjThCFh/WfqCP/HUbApMP6HBWV3Pvlnd0b
 e48+dhuqS4+BwSM6F0NdDTC0JKRtAR7A41qFvCtzmwogfQVWtUWpwv4DUuFq7YP41H9c
 QfQm3KpOSgf2IPgTBY16+CIPAz1HPabVXocK8yluOtTsow4gyxvH0l364bZQ88bFewQh
 SJ2QQRtjYyJhsVE2DZVWGhubQUqkDtFb7Z5g92bSf6tvr0776i6PywzDR5bXJ9kbWEPL
 v7XOi5OfHsEGbue6E87IvUt5ylZvIZFMEU+CLfP/YBxp0b/Jcwwgqxl/OPuD1BI+mpdx
 XUfw==
X-Gm-Message-State: AC+VfDwxvXYkIaZHN5AWd8Cm9FW7Zy54HABjMi4tMNUBVdiH/qgzkF5J
 zvstlyVAPcd31pFYjyS0TghS9g==
X-Google-Smtp-Source: ACHHUZ58ENGBVYW2227e7XYFPh3fQ4T1J9FrMj5V0IlG55RxHnBgxuqmrqQC6uWuWy8Rx9ld0qpIlA==
X-Received: by 2002:a05:6214:29c7:b0:56e:c066:3cd2 with SMTP id
 gh7-20020a05621429c700b0056ec0663cd2mr58463378qvb.2.1684227147882; 
 Tue, 16 May 2023 01:52:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (mob-5-90-62-17.net.vodafone.it. [5.90.62.17])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a0ce44a000000b005ef54657ea0sm5480337qvm.126.2023.05.16.01.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 01:52:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 16 May 2023 10:52:19 +0200
Message-Id: <20230516085219.3797677-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: use RCC macro for CRC node
	on stm32f746
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

The patch replaces the number 12 with the appropriate numerical constant
already defined in the file stm32f7-rcc.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/stm32f746.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index dc868e6da40e..e3564b74a779 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -515,7 +515,7 @@ pwrcfg: power-config@40007000 {
 		crc: crc@40023000 {
 			compatible = "st,stm32f7-crc";
 			reg = <0x40023000 0x400>;
-			clocks = <&rcc 0 12>;
+			clocks = <&rcc 0 STM32F7_AHB1_CLOCK(CRC)>;
 			status = "disabled";
 		};
 
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
