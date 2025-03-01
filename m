Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8927A4AAD4
	for <lists+linux-stm32@lfdr.de>; Sat,  1 Mar 2025 12:51:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0A48C78034;
	Sat,  1 Mar 2025 11:51:23 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4723C78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  1 Mar 2025 11:51:22 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5dedd4782c6so5554605a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 01 Mar 2025 03:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1740829882; x=1741434682;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NdjO+gXNbFswOlU5mvEFI+zF9XideHYOKEcG+ZI2j5U=;
 b=GLRa9iOJhNbjbAbGeOZ1HwClMuPRiOwGMu+2vibeL68SIASgOotTfycisUAq7Wfoxk
 zRoBxq2e8GkFVpDUo18VmajJr6j/GXgMLbUfvc/FpKwaykvepmclcIlKqHdouVxN0c0r
 MwQ166/0Sek+u8+acri9p6mfHZQrz/6+LXI04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740829882; x=1741434682;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NdjO+gXNbFswOlU5mvEFI+zF9XideHYOKEcG+ZI2j5U=;
 b=M/E1dnl/COKvqiN7DlRpDM4T6bkRxz7DK6Acb1bHRdcYSjsEQ6cVPkOKTaEeRs2tv9
 rKWR3hVEPMYkvgOf1O9BQPgKkupZQ0WQLHTmiRN++s82xmG3f8oNC/bamxQUC7vF5a1K
 LXe60KZNBdEHQQWI7MtSdVzG/lZyPmMiaSALb65AzYu/K7GyHLkrjDdqWDFUROjvNrlH
 J5Z6pHRot637AxY8bvX0qQdPhET80Tv2aP9JFHe+oPyJJRApnQf+u6LKCYIc9AQ6m1vR
 fzCknYOPzT41gHmKalXpTyfN1F2qoVmKYZ0oT+o7O7pvbDumU1+qg95EGdcFksI1fFNv
 vrVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9rLQLr2dE+rgB6ogxgaNGKdtkMv3JL2j4pvmkhoY0J/Xt2SvxCmRjH0KrwA2O+TS8t28f78VXdeNYuw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzzo+KeQ5dwRjWb2MSJYBd46eNmUoVObCA7+gFFbp0zGTtZt9sj
 jzTZEt1mSFsjOAMGLyk2ILu4kYh07yKTkFE/dcF3WDXyWBRBxeHibtxRRo30LI8=
X-Gm-Gg: ASbGncsCG8rmJ47fxWjC87OGdLBfxqQHVZq3Qz4RSbWmJQDZoNtNBL6AxGlHNp8Jpbl
 fEqUGhP492Uy6C5y/x7dgourDyi7PXMAcBrl9Jq11kZK+fXvXgQFze0N2GwY+CnZoQFppOAt28f
 TVdleIeT0VRVY6d1NZQm+DfS6KabZlCSOabpSIoHnxcgTbi9IEYOzDcOX4+gArFSFj8JcJGPhZL
 atyqOeaf3QLEb5DoBcbPqTovmi5TRhOZ6C0Pk/TtzFVjVS3n6mtq64OyY9lD10/Q9ihXgdgf04q
 sShSnSMiNolixy6+dw8x1nbhe7YbzeoqTPkA+R8NO91kxoixk1l8bV0a8FcMO6LhhOX/1PH8yc9
 tDflG0YQ79cKsOVoZgpklA4Wr+05KKfSoC6vKBzT6QJ9WyW3cK4rZcl4+BTDNmk2f6AEskJ8YqH
 xiNo31vgGvcPKeJA==
X-Google-Smtp-Source: AGHT+IFx+Y86kAQg3tCp+lkyRYenJ1ns51tOtXrb2wDfJ/ON7EhmhRzo9A+jgX7mXFnhM4YOd6kA8g==
X-Received: by 2002:a17:907:96a2:b0:abe:eebf:ae54 with SMTP id
 a640c23a62f3a-abf25fdbdb3mr715780466b.20.1740829881379; 
 Sat, 01 Mar 2025 03:51:21 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-102-201.retail.telecomitalia.it. [79.25.102.201])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf0c75d8e8sm460994866b.146.2025.03.01.03.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 03:51:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat,  1 Mar 2025 12:51:09 +0100
Message-ID: <20250301115116.2862353-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: use IRQ_TYPE_EDGE_FALLING on
	stm32mp157c-dk2
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

---

 arch/arm/boot/dts/st/stm32mp157c-dk2.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
index 5f9c0160a9c4..dcf17c493022 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-dk2.dts
@@ -11,6 +11,7 @@
 #include "stm32mp15-pinctrl.dtsi"
 #include "stm32mp15xxac-pinctrl.dtsi"
 #include "stm32mp15xx-dkx.dtsi"
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "STMicroelectronics STM32MP157C-DK2 Discovery Board";
@@ -67,7 +68,7 @@ &i2c1 {
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
