Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7FA59429
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 13:24:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F04C7802E;
	Mon, 10 Mar 2025 12:24:25 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68734C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 12:24:24 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so733982366b.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 05:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1741609464; x=1742214264;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=33CK6psrpblH2CgU9WWzzRrMa5nOu4Xr746XCaWV3tk=;
 b=AbSn3RoZrqgnfAPAyJ7FzsE79vAM9vmTAcRUihuk58bG81QD52IT9ukLX0MevN+ssn
 z7E8hGw993lonjZmHXWDTEIaGw1sNxZPN47NA0S7wPk0uEidZZQbp6bOjhCcjZZ7Kh3A
 Hrd7704fTuCYQCajHTDFpzgzJmkf0gc8/v3Z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741609464; x=1742214264;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33CK6psrpblH2CgU9WWzzRrMa5nOu4Xr746XCaWV3tk=;
 b=lHlZbr6txhwG1RF9/VSEKz4UnU44yjm5BpAFmf1DvSCoIB4G4U/O+Z2dbMMKbuXkaU
 74UwHoWQ60gfCR4hCcNhhF5Q31nIfwQVHFFTyhMC/WfQjXSUvnsZEe09TvQdc4svqW8N
 sqQ5U618EYSwu4ZB/rWf3PFM8MSfCn8KfSfT7mE4MaT5OOOiuli6Lex9ONIW9s77hx+y
 ieaMHY7T2NPPCd4RXTQ7xyRZs/HC2KZMRYbVGAgcTaZfWgnoumvzFLdJu99mkpIJkPKn
 TjlKNkWnoIbFnVJ4aqxxzp8RPxhk9hsGl+252nzSCdVjMwrifwScx+Kdgxwtj0RSI805
 ZpBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJdlfOPT7b58fZhs+Hm4u9QtPU1rtpocVp2QxfPcUidnxukMLJekvXWPoJ2Ld8bZ35pyEkQYFLEahHfA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YydsLtOkrZH2OmFzY0CCc0jOkic2CbmWXw57vIB8XBFwbk9ODur
 a85TUF+9bCKKEcK3Da4xqlb75sguF6ZEbWm2+rjbugnwlnLxK7LzPbSOkc9NyWQ=
X-Gm-Gg: ASbGncuSerY0K1aQnpUj1cwVLcPkdMwbPXRFbiDgpDyaT9/qfc7bmFi/eWOhDBL3Dyx
 MpHVnRMI03yZJ7jlsns9nVaI2FPBeClGQkMMVox0vlrzhIVMdYN7oj97qe8avLKW+ZHPEnD9YHa
 I2nB1Q4szs9EO46T95dSJhaea5gSFmtomhA+eruoo7guUp4HStTrrztDEzSdGXKVBXUQHLaCBkI
 jj8V/HveijyugI8agn3LAYKsvPiOhAswrroNoTMXkpyA4/2JrIHyAHK1nf5uRB+JsLZQ4Pswihi
 D/oBzyYoeLkSi/tXESD9XEIbv1hrVS6aqcBwCVP6pZ6DgXSAqKPvE0rmFOpRlhQWRc4qIlFd0O9
 mOmNplZZdTb5PDQ==
X-Google-Smtp-Source: AGHT+IFVCn4XgPQmS6e/eeO8AkfoYCUAhXlWOW9B7DhCMb0sWF1pzA0CXrrJ6W16xDN20EJF7h5N2A==
X-Received: by 2002:a17:907:9490:b0:ab7:c893:fc80 with SMTP id
 a640c23a62f3a-ac252b573bbmr1608210966b.24.1741609463722; 
 Mon, 10 Mar 2025 05:24:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([213.208.157.109])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac2817467f4sm361656366b.172.2025.03.10.05.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 05:24:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 10 Mar 2025 13:23:56 +0100
Message-ID: <20250310122402.8795-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2] ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING
	on stm32mp157c-dk2
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

Replace the number 2 with the appropriate numerical constant defined in
dt-bindings/interrupt-controller/irq.h.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

---

Changes in v2:
- Drop inclusion of dt-bindings/interrupt-controller/irq.h header
- Add Reviewed-by tag of Antonio Borneo

 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 5f9c0160a9c4..324f7bb988d1 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -67,7 +67,7 @@ &i2c1 {
 	touchscreen@38 {
 		compatible = "focaltech,ft6236";
 		reg = <0x38>;
-		interrupts = <2 2>;
+		interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
 		interrupt-parent = <&gpiof>;
 		touchscreen-size-x = <480>;
 		touchscreen-size-y = <800>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
