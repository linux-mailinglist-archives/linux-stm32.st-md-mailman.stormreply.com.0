Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A985FCFFD1B
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 20:45:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77860C8F283;
	Wed,  7 Jan 2026 19:45:49 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2BC68C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 19:45:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b7a72874af1so460932566b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 11:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767815147; x=1768419947;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CE3ABoMb+Vlizhz6kCziTM3FHPDucALbbiym7WlJ74E=;
 b=TH6R2PBqopJHMIZwWDkOgiqtPoh69xDZ5w0YhUeH8TNYblKWrIhLDkbKAtwPvUJdCF
 1AE5gb8WGdJJElbzSM3/BE8KgEW305buVNmmF0Pjb+tACgBpVqcvdcI5sBB5rWoDce5B
 kFaeng4c0XzFWJz0Cl7tuXtqyVzuIPlb+On4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767815147; x=1768419947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CE3ABoMb+Vlizhz6kCziTM3FHPDucALbbiym7WlJ74E=;
 b=V8kUei7wfwNX8Jmo+FycMJivnc7Vlg53SO6Z7ACVNfgnnX/tvdBI8gBTBdP6e0rbN6
 0wLtQyTJqoKP20Ek5JUMBowp1/fPquQOe3UpvjzHvzKl8rnQXjqTt0Z9eL8PsTE6vlib
 375x0ZjL9rtT3q5YNlo4JTNIp4LSuv4GZDweUKyWaenWQlJCj1yyBQdeNep3yNAXqGiA
 ACB1IwrJAgHAxRxbMXUK2YrQawqJ4BrgreVh12SbxZEtOxz8ZbrOF3oSOAeFaniwuTk5
 mS5RdBdPBF8e7FH8dGQV9mCOFjl4kfSlV0i18pdm7y8COeZEoh43oBvCT5H/Z6yCUZZ8
 1zMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwQOqA76d3kxPfNtazYBD4tnNenPoykSBV4xLcyUD08IYZ6x5A/E+jXOcpGNwRFiyvd/4OZOD1ZBz1eg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YywCvOay1S8i23NVOUEyOkhlzOcW5bQjNcbTxUaOwwi4lNcXTKD
 68nAYy+4RB631M/Ukld3a4e9byNDyFoqlWzQ2I1g7QxTQmmn3f6tnc71Cfi7Su2D+oo=
X-Gm-Gg: AY/fxX6cS3UGOK0JJvv2JvpvDZsE2FJi8rKVluuBJ4Oat087N9nthQtogj50QdvTnz+
 49uHsc3gnIZkyMIHXJDo6qN/lft1AYbZ4R6W1lHuwx8O5t6VLJxad+p0GqMqFrXnroV0459aM4H
 Fp0jxlbw2IYlX6MZloao+m3PaZ4T9VO/RYyVHL+YIUYsRC+jxvFUCEy/5encYDigRJlX5Zkhqvg
 WpxFFWhxfnxv/Gl9Pn1XWGaY+GZzDUtKWKGQry0OQpAMPsqN5Vqp3/kQRI6ry1/jGwdP16T6WSe
 yU87sBAbODjVwQyOWVXgrledL/6qHNnD1GYa607XRyKxJTds3uwkqeuvkEXTmg9ydDhB6IzNUpZ
 2Nz7uvFPUnpmkLNkRqRIuHuX1Y4bOOVWVoprbqlhmUG/V4w5vsxozNfQnDBnY+2KfPMOFkQZQ0x
 4G3I/NXNb7C28Jl7jZhPYU6hqYwxqeYtvWXQp7yLpq48y79ndM0Y97/qlx6naT2Rk5RQ/2yRpjp
 CBbr2oXcqAWoxj5lE6jbdxoq81dlfLjDJg=
X-Google-Smtp-Source: AGHT+IFQ1zeeMjHCI/Trkv1q4PKObKTS13+fRskV7eQs/QQ1YzbP9PGEh8tMjNP2uYGa5sBa/tjusQ==
X-Received: by 2002:a17:907:d0a:b0:b76:d734:d459 with SMTP id
 a640c23a62f3a-b844506436fmr387336366b.57.1767815147362; 
 Wed, 07 Jan 2026 11:45:47 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a233fb3sm591201066b.12.2026.01.07.11.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 11:45:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  7 Jan 2026 20:45:33 +0100
Message-ID: <20260107194541.1843999-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] arm64: dts: st: add TAMP-NVRAM support
	for STM32MP25
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

Add the TAMP node along with its NVRAM child node and define the
fixed-layout for fwu_info and boot_mode registers.

The TAMP (Tamper and backup registers) block is a system controller that
provides access to backup registers as NVMEM storage that persists across
reboots.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..c7839e732f31 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2084,6 +2084,32 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					fwu_info: tamp-bkp@c0 {
+						reg = <0xc0 0x4>;
+					};
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+				};
+			};
+		};
+
 		pinctrl_z: pinctrl@46200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.43.0

base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
branch: stm32-tamp-nvram
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
