Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C117B6C6F
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Oct 2023 16:54:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8144DC6C833;
	Tue,  3 Oct 2023 14:54:44 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68578C6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 17:14:13 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-77575233633so3023785a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696266852; x=1696871652;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VNHPyhjdF/EgT+ErFOTgdy7sUGT7qrL3KrhKOabumMM=;
 b=B3cs0M0F+9Tzffzkk7VAfAqJS+I9ApFySStN/MlHFMS6vHKiWCLP/EpahALdB8qCve
 16CR3EbtvYYTT8jpLzgps2vCbZ7ZN6ohNbS6J/B0bcvap3vkK0ukZ9fJiAWAOyO6BCvg
 6Vhe16MfXhPBKwktktzPAlqHGFKvFFfo5/kJv9nRbaUZeFxjJkxRvXss6deX2isDJVaV
 vUxVBuANNz76Ccg2qjPXhyu+3oefczgkKHGyCvoZOWyv7ADv9Iv1vaoRj8pVsSK0ZiI9
 qlYLFQvr4ZtkzaY49pZ5U9LlKiY3wdhgEqYx2M7WhOtWiJhbzqCWfBJzLWcnz6nUXc6K
 TDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696266852; x=1696871652;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VNHPyhjdF/EgT+ErFOTgdy7sUGT7qrL3KrhKOabumMM=;
 b=OWI3eUsCIKhMTbiHuPGiFo0f1taYDoDP0ftYUqmmNN7ER3p/tkgUzWX4WmkZsGK5on
 g1LSMFhemR0AiIbUNEXZBlZ3vK9rv4C+z8V7SenCUgigzh+hDX4FF90s188AayWNxfhP
 ARM3Te3uL5WZ7l/rzukAXfU/z7Z82lSD0IN71/nDxQcpsWXI71vIqsfrtg0fCJxFVJHZ
 y8+xbfCDJqmZvz0GAQyQ5y7ZCfd8Ffv7gtYdjxzr/VcNInzsiomQ7Zu4Dq9g0RsbBCs0
 7YfViV+urNxfK8ufBVH3uzlj4Lh22GdHz9KOkLFRyAgX8gv6jOfG5cPPw/bmbpeMedd3
 02Ow==
X-Gm-Message-State: AOJu0YxU+ZZcXYr8YRlACaClzvTbr6aYDC/+exvg/XMfVra64cV3hGCb
 1WHApCtt4oC/fcF8NzF07TD+RVVF4qaSZe4NmvTUzg==
X-Google-Smtp-Source: AGHT+IEWK9INZfqH54sojbPPQ04UX+zsKbgvbESo0CRSHjzA94kt7jBUvnzEPtI2+sJX7off71P2Fw==
X-Received: by 2002:a05:620a:25ce:b0:76d:2f15:56a9 with SMTP id
 y14-20020a05620a25ce00b0076d2f1556a9mr12871693qko.31.1696266852065; 
 Mon, 02 Oct 2023 10:14:12 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 dy52-20020a05620a60f400b007678973eaa1sm9132660qkb.127.2023.10.02.10.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 10:14:11 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon,  2 Oct 2023 13:13:39 -0400
Message-ID: <20231002171339.1594470-3-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231002171339.1594470-1-ben.wolsieffer@hefring.com>
References: <20231002171339.1594470-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Oct 2023 14:54:42 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 2/2] ARM: dts: stm32: add SDIO pinctrl sleep
	support on stm32f7 boards
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

Use the new analog mode SDIO pin definitions on the STM32F7 boards.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 arch/arm/boot/dts/st/stm32746g-eval.dts  | 3 ++-
 arch/arm/boot/dts/st/stm32f746-disco.dts | 3 ++-
 arch/arm/boot/dts/st/stm32f769-disco.dts | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32746g-eval.dts b/arch/arm/boot/dts/st/stm32746g-eval.dts
index a293e65141c6..e9ac37b6eca0 100644
--- a/arch/arm/boot/dts/st/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/st/stm32746g-eval.dts
@@ -188,9 +188,10 @@ &sdio1 {
 	status = "okay";
 	vmmc-supply = <&mmc_vcard>;
 	broken-cd;
-	pinctrl-names = "default", "opendrain";
+	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdio_pins_a>;
 	pinctrl-1 = <&sdio_pins_od_a>;
+	pinctrl-2 = <&sdio_pins_sleep_a>;
 	bus-width = <4>;
 };
 
diff --git a/arch/arm/boot/dts/st/stm32f746-disco.dts b/arch/arm/boot/dts/st/stm32f746-disco.dts
index c11616ed5fc6..b50461d676a7 100644
--- a/arch/arm/boot/dts/st/stm32f746-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f746-disco.dts
@@ -103,9 +103,10 @@ &sdio1 {
 	status = "okay";
 	vmmc-supply = <&mmc_vcard>;
 	cd-gpios = <&gpioc 13 GPIO_ACTIVE_LOW>;
-	pinctrl-names = "default", "opendrain";
+	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdio_pins_a>;
 	pinctrl-1 = <&sdio_pins_od_a>;
+	pinctrl-2 = <&sdio_pins_sleep_a>;
 	bus-width = <4>;
 };
 
diff --git a/arch/arm/boot/dts/st/stm32f769-disco.dts b/arch/arm/boot/dts/st/stm32f769-disco.dts
index b038d0ed39e8..5d12ae25b327 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco.dts
@@ -131,9 +131,10 @@ &sdio2 {
 	vmmc-supply = <&mmc_vcard>;
 	cd-gpios = <&gpioi 15 GPIO_ACTIVE_LOW>;
 	broken-cd;
-	pinctrl-names = "default", "opendrain";
+	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdio_pins_b>;
 	pinctrl-1 = <&sdio_pins_od_b>;
+	pinctrl-2 = <&sdio_pins_sleep_b>;
 	bus-width = <4>;
 };
 
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
