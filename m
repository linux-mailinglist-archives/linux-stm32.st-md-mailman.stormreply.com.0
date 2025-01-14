Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570EA10FD0
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 19:20:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EBF4C78F70;
	Tue, 14 Jan 2025 18:20:34 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4301CC78F64
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 18:20:29 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so66668945e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 10:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736878829; x=1737483629;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zpzT+aUzJ1Q97S7iT1IDWutNkzHMdDAlflIDJCmxtro=;
 b=Gsnl28W/LEx8X5LfkMxvAoPnL5diyJCBY8lu9PIA42F4IrcQJ0MhCDaRCaazjFFQD/
 QENYSyIBracR61FtkVwQK0YPJ3UiA0SgCMJehxT+e8MQXQWdLO2RXvVVgbDzghiIFVEB
 nh2SI+pg7POwjtD55ktnPR4/YJijltExIlby8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736878829; x=1737483629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zpzT+aUzJ1Q97S7iT1IDWutNkzHMdDAlflIDJCmxtro=;
 b=WhUe0roZIZSl4lekQYRILCZNfZDvmIfsLjbcRTf3i3lloiSOkW3bfwSF3RkWqXl1Fm
 OW8OU2rd064XMC2/CLHUfe3ZdFYz2BrtFBo5qUboshTKpsgskkufO5hYZSzu75x6NZXb
 HhpsQGpOoX7PUmqK9L4/dtSm/H58DX8Mf7rwi7UtksgPmopk9C0ErAe3xpAy/5h7A/PS
 UFR6Zp4/F3KBHWqVQa0hjjbj9Wyr4RAtd1lrSjLcGPQeOm2iARXIQK+My0OE+v6e3RFA
 mwBSZvAr7a5goGXE3ISj7Ep3xp8vBsN35HRLtI7/ejPtvh8Ej+WH37eTutZ1DzuOWink
 gOxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXohUKhEeP6K86Rmo0HMc6vdXp7sy6tuE6PbarIhC+Htv+PIRTAjDzMr9Nw7LVfxxhdy6TTuXeoi5wkIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxAyQ6AvjoHpbIRphiDlt210XKwrtRJMKLDIJwg4Hqt3tIx7DA5
 yZUinTsY/u+lXT2ghf6FOIAE1KBTHJVM4RtULh51pRBZjnJ9Uy8YIvvdFQ0cYTg=
X-Gm-Gg: ASbGncs+PLyGBu2hzeSVeNh+7Zs1yr0yLsBAfunpeJ2bm/4gnp2XDYJ2fUazTMjDnnV
 gKT4iGGzBVQuBUS1+vQph8SImkn5YdenkNRJDqmHM2Es9hOc4b6jNp13DtC8MN05yJ/yBe8y4EP
 ucgEBNCPpgZl5oVfnV0MXhvQjbnGV7p9CFmyir5d5YP1oURBU8X4Bh0XPPYJkfeC7tyf7FEF2Fl
 lFuiyODwtpsOAcr2NitbkHdTQiinvNWB8o7413gqC+FVg6b0YdAcU4C+TJdAeZwKRwixoCigsjE
 tSs8QnNCurW6f/mzS1TfmQ==
X-Google-Smtp-Source: AGHT+IHnG0SooqxUeZ0EsULhwv0RsoU3JoPUI7vSBUDQG3JQ9VKYcmjmgQ2ZhBW1LT60TAvEZ1greg==
X-Received: by 2002:a5d:6da2:0:b0:385:fc70:7f6 with SMTP id
 ffacd0b85a97d-38a872fadf3mr22273830f8f.7.1736878828905; 
 Tue, 14 Jan 2025 10:20:28 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 10:20:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 19:19:47 +0100
Message-ID: <20250114182021.670435-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 2/4] dt-bindings: clock: st,
	stm32-rcc: support spread spectrum clocking
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

The addition of DT bindings for enabling and tuning spread spectrum
clocking generation is available only for the main PLL of stm32f{4,7}
platforms.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v3)

Changes in v3:
- Add 'Reviewed-by' tag of Krzysztof Kozlowski

Changes in v2:
- Update the commit message
- Change st,ssc-modmethod type from non-unique-string-array to string

 .../bindings/clock/st,stm32-rcc.yaml          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index 8f2494a0b28e..f83a6120d65a 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -53,6 +53,26 @@ properties:
       Phandle to system configuration controller. It can be used to control the
       power domain circuitry.
 
+  st,ssc-modfreq-hz:
+    description:
+      The modulation frequency for main PLL (in Hz)
+
+  st,ssc-moddepth-permyriad:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
+    minimum: 25
+    maximum: 200
+
+  st,ssc-modmethod:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The modulation techniques for main PLL.
+    items:
+      enum:
+        - center-spread
+        - down-spread
+
 required:
   - compatible
   - reg
@@ -78,6 +98,10 @@ allOf:
             - description: high speed external (HSE) clock input
             - description: low speed external (LSE) clock input
             - description: Inter-IC sound (I2S) clock input
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -95,6 +119,18 @@ additionalProperties: false
 
 examples:
   # Reset and Clock Control Module node:
+  - |
+    clock-controller@40023800 {
+        compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
+        reg = <0x40023800 0x400>;
+        #clock-cells = <2>;
+        #reset-cells = <1>;
+        clocks = <&clk_hse>, <&clk_i2s_ckin>;
+        st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
+    };
   - |
     clock-controller@58024400 {
         compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
