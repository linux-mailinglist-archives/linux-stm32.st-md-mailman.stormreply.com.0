Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7FE89D4C8
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 10:47:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 292D9C7128F;
	Tue,  9 Apr 2024 08:47:04 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B94A2C6C858
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Apr 2024 15:53:13 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a51d7213a42so125068166b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Apr 2024 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712591593; x=1713196393;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FaDQO9exJCzRg/8lU1QpCZomsB1mdrpwg8BXuiBSkkw=;
 b=DE94Lx4jbSorYZyIkQ4X3PopEFyjP31czc2j7OEnspTbB+uK4Gfl6wyUSyQVabtlWc
 tAvwzV3gDKRS8ldZWltgCx3l3utpmAQzHK91Zhbkgsf2m5tK20wUgFqraS7N8G0cqcWI
 D3T/OedCBUnAis6CEoP7d8dnr7rIGoHDnQa/hk1mFI1euGNwFfnolT6UaBUhUn5oScSg
 VEcm1163pLVcETav6itbMSNxUjVSvM2trlWfFHC4BSMiQO81v1atRWp/NfULh/ufS7b0
 hZa3Wc87oNd6wTwcjfE6GIHa/nKgDDCWBpm6MTcb6kOxVnQ8Wjsb34J+pXWM2AcN1Agn
 nMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712591593; x=1713196393;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FaDQO9exJCzRg/8lU1QpCZomsB1mdrpwg8BXuiBSkkw=;
 b=j4bMjdG+EbwFk+eR7LEZU9aZ0ZL/VxaxyAdt5m8Ef3C7w4M7cApoz/6PK9b26NNIYK
 Jh8yHj81qosT0sft/S+Rnfo94aMp03+7ds5mw4IZ1p8x3ckjZcmuLywj1XoCiVjmzLVB
 OAc2CjpI15wC38PPly/MWz7BF1f/mDoBzq4bNCr78lDIrBsj+U6Vlq/jVTguwTyj1GKU
 V6m1++Wk7UndKC3m6mJ+FbNIuSjMjGE2WOEp0HT9G6ic6VUldXTu8JDxe4fVC6M3sHZy
 aOO99xgTr1ZzcS+1QnKSj9D9A/p6DV3TysjjHvkS3WwCW0FT15FE0wzsybRFmeskxf18
 LcMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzga2ukgYHWnEF/LN0OckusZ0yna+UAjIIT0P2txeIiDHZa63V4qhmO8UBfpucp57UypVjaiVabxJtcFmvj6YnY7m4LO89cF8LPhvGqakOS8+CnT1PmYaA
X-Gm-Message-State: AOJu0Yys3mzfeYUR4llfOzRvLjsdyGcpGTzh8+usn9PFRX/ZwBvHSxAv
 7a52F3nB3XlmBltY0dhfzb8VbjnqBSxdcCa7vfMJR8XL1L0Ig5bt
X-Google-Smtp-Source: AGHT+IE/brPz33bAyXkLLx9/3k7uLX80nlW2dTvsRmtq/VzJ5UavkRJXVX2o3jP/+Rc4Wx3RPpCuEQ==
X-Received: by 2002:a17:907:e86:b0:a51:d204:d6bf with SMTP id
 ho6-20020a1709070e8600b00a51d204d6bfmr3422101ejc.10.1712591593166; 
 Mon, 08 Apr 2024 08:53:13 -0700 (PDT)
Received: from [127.0.1.1] ([213.208.157.67]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170906794d00b00a46a2779475sm4547849ejo.101.2024.04.08.08.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 08:53:12 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 08 Apr 2024 17:53:02 +0200
MIME-Version: 1.0
Message-Id: <20240408-rtc_dtschema-v1-2-c447542fc362@gmail.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
In-Reply-To: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712591586; l=1751;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=yqX/w81Ycb9hVyt/9HQKZXov7UsFMLnZ7nkrSKxqels=;
 b=nQu1d8ztJV2beU36YHMkXGrFhsTXDnsy8WQADo7Rpyj2BA9JfhN+W+nzzj5SHdSULv8HsoK8G
 JkFOsCM6XmSCJFwYt5mlM9kQzi2tSTNFnTOAjB50Z0RwcSmfJ/9+RHz
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Mailman-Approved-At: Tue, 09 Apr 2024 08:47:02 +0000
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/9] dt-bindings: rtc: google,
 goldfish-rtc: move to trivial-rtc
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

This RTC requires a compatible, a reg and a single interrupt,
which makes it suitable for a direct conversion into trivial-rtc.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../devicetree/bindings/rtc/google,goldfish-rtc.txt     | 17 -----------------
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml  |  2 ++
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt b/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
deleted file mode 100644
index 634312dd95ca..000000000000
--- a/Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Android Goldfish RTC
-
-Android Goldfish RTC device used by Android emulator.
-
-Required properties:
-
-- compatible : should contain "google,goldfish-rtc"
-- reg        : <registers mapping>
-- interrupts : <interrupt mapping>
-
-Example:
-
-	goldfish_timer@9020000 {
-		compatible = "google,goldfish-rtc";
-		reg = <0x9020000 0x1000>;
-		interrupts = <0x3>;
-	};
diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 5e63c8f7f618..b889b9317a41 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -41,6 +41,8 @@ properties:
       - epson,rx8571
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
       - epson,rx8581
+      # Android Goldfish Real-time Clock
+      - google,goldfish-rtc
       # Intersil ISL1208 Low Power RTC with Battery Backed SRAM
       - isil,isl1208
       # Intersil ISL1218 Low Power RTC with Battery Backed SRAM

-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
