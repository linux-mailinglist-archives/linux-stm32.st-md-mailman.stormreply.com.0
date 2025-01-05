Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F905A01B4C
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Jan 2025 19:15:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 173D3C78F72;
	Sun,  5 Jan 2025 18:15:41 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F3DFC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Jan 2025 18:15:39 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5d437235769so4637853a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Jan 2025 10:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1736100939; x=1736705739;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DBSWyldngVnQclvBLd3GqHALlVJ1Kxh3yvgFvrg0xjA=;
 b=M0j1QgW8PIXsbd/3Br/27teIDEVlV4yQnsxpxPTZ2gOdDFioy1c/2CIJ2TS1mBJEvi
 JusqYWN9FGB4kfqXh4RmmKbHngO4hWnEqT2Kr8O2rseFu2Cvqqh8wUNrRA7GDS6JBmj8
 Zu93zvn7EW56ZrKBa47ZpnjfvHsw5gVIsbxvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736100939; x=1736705739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DBSWyldngVnQclvBLd3GqHALlVJ1Kxh3yvgFvrg0xjA=;
 b=cUUrXO6JYksOYihd896p13cn9sxdW9q6i5q5V5cnKPjwixGjJD3r22tTNNt2/aeyJj
 yWtoMxlKzEV8kZgVz3jEXRqBOJa08p6eMU/NQBVwuq1pSURNsfpEslVqfzn23DcWZF4H
 Aw7QDcPjJr1k+7r6B0lFC5ojaOcvMvepMQb+yHP4LwDSHhJu8sAm/3RJgLpSxPsNR9Sd
 9Bu6Y5L2vqWkJL58kQz4jKRAgAAllO8bfkkPVDXILx3lv8NrC/mDLgjJ034kwh++d0VI
 5Nyydpl2I+7Ee1Pm5/HSolJC1U/9oGRAa6up8kdPyJmD47M8z6yv7eTE+B64JIgZeXOr
 5b4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXy3YSpxSsZVmZWhARIyIond0PyI9XouRISyqEq4/UNVYORWaQ8clOjYZgk7u27e81FbXZ2xisxRd1gTw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwKtOJPe0JAKIaFiIghIDNjCnEkGY7hNVRpUs4HQAvqV/PaCb2T
 tc2axQlelMXIka4oIDRThPmeb11q15Yb7vLbApj4Sdz4D+Xyyc/cJHLmtl3hyLs=
X-Gm-Gg: ASbGncszBEyMjQgtPz3DERGiXxZKEbDSCVhNK/zCZ/bO1xsSp+UfJp071kB7GrgzAgL
 tkdRSgGhnStoGdgt+3v1Qk85Q6D3Cbp6zyHx8agoAA2WdD2ZiVtmhEa0EeXo41Ifu0Nxm/nV/eJ
 uW69Dau3s5Ka836vVjkBfbGsFA689yYDcYMFlDRbDgg/gpNvsCskD4PvHcJxM6GUrnYbUZxreZk
 +VVJ+1CU1wgeD2zeLyacDTijA7CI90UIlYRSU6aTneJvuXw8OBJnn47+EyLxWHjF5RoiwFPt7Vk
 OL8vhSOYjP+AwwAgE2yEwc4urvpkRXnhG3E3XFf/e2ccxZMUYqfe4AHAogKe9dsVuh8Xg52rzrv
 jKT13iF4aZPmXH3YzXw==
X-Google-Smtp-Source: AGHT+IEouP5DBWHZTHTQqFEZUf+3uEYRS8Zu6JvRBqEkbBu3GJtaa/Q5Qj6PinpQXdyRMCSrqc9f7w==
X-Received: by 2002:a17:907:3e90:b0:aa6:abb2:be12 with SMTP id
 a640c23a62f3a-aac3354ff4dmr3925314866b.37.1736100938804; 
 Sun, 05 Jan 2025 10:15:38 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f178sm2138185066b.38.2025.01.05.10.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2025 10:15:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  5 Jan 2025 19:14:16 +0100
Message-ID: <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 4/6] dt-bindings: clock: st,
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
clocking generation is available only for the main PLL.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
index ae9e5b26d876..c345d3ff3fc4 100644
--- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
+++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
@@ -77,6 +77,26 @@ properties:
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
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
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
@@ -97,6 +117,10 @@ allOf:
           const: 1
           description: |
             The clock index for the specified type.
+        st,ssc-modfreq-hz: false
+        st,ssc-moddepth-permyriad: false
+        st,ssc-modmethod: false
+
     else:
       properties:
         '#clock-cells':
@@ -118,6 +142,9 @@ examples:
         reg = <0x40023800 0x400>;
         clocks = <&clk_hse>, <&clk_i2s_ckin>;
         st,syscfg = <&pwrcfg>;
+        st,ssc-modfreq-hz = <10000>;
+        st,ssc-moddepth-permyriad = <200>;
+        st,ssc-modmethod = "center-spread";
     };
 
   - |
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
