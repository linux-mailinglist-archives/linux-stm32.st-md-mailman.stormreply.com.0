Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8730CFFD18
	for <lists+linux-stm32@lfdr.de>; Wed, 07 Jan 2026 20:45:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66C77C8F282;
	Wed,  7 Jan 2026 19:45:47 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 910C4C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jan 2026 19:45:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-6505cbe47d8so3935879a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jan 2026 11:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1767815146; x=1768419946;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=quK5ciOPGpJvzJstcVp2ODwhOQdezz2oTPhzvAyikRU=;
 b=ly5qlwQT92GfLPffO9agiNE7ufkteUqoYu05ihKoe2r4g8G6hUy/U5yhOrqO6PvurI
 rH6Ref7jSuP4ufxuPQsZjC5rNBjVj6qclrp949fOB3/BAa9fBJ87bq+YxG3kBXS9tfot
 DINXogY+Q9AwpLSDC/vyV3J3ug/N5R7nBzwYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767815146; x=1768419946;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=quK5ciOPGpJvzJstcVp2ODwhOQdezz2oTPhzvAyikRU=;
 b=Ud6zmwD5Gst4lHjJ1UWwGNTXbT/ptbgmLH7Za2OdE3f4lOO3hgQJ55uaRShvgq4E+5
 muViQLUTuKlOV+nU4vqJk7gYWtfGew4xYwcXbSoXUES/GHZFPSROLKjIuXHBgqPgMRpr
 DUJrdT6yHGHE6CLPma6s+4ClCTkev0m6QvWGDdaKgcJRpC2rqoqGnGEPb5nDVhA3EwNa
 kfQMmtuUxO7/f5gzIEVQ5ejoSIorebEY2kwaTLAJGksU/vpLZUSi6hK1G6zI3QsmExK+
 D9WKERp3QILll5YdjAhb9zQIwQ82jGRuT6wbecV29mUADZkrbylSRrPMVIjYMZ7fTeKq
 luLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX80iZyopzILDoABPe0lHOO1JV6+GyciNLywHbpXiS7vViXajdJNIdbrvKG4nlGZrBrELI2lynTiJMlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YznuyG9eJgvhZvHGLxCa3AOSOyTsP8y9gmcr355If+KVKScqcBM
 mXDh/DD2YjBg5cal+LDSRvkg9vUgxhZV5lDci77byxPh5RYo2IjZIED5WKIgIv7NeRk=
X-Gm-Gg: AY/fxX6naqh3wlk3K7g2VZQ0P+ww9e5dlH0ieG4ioSA+mOZJgQGaeQUpmn18P//xGoc
 7d9AVL30DH4Wfv0lSM1lAMUuFqTBor/nrl2VmMpEUiKyP8aC4mbN7BApb6BSN90R5fKR8lol6m6
 MonhszQHczLeZiHDj3bf3RRkkBDkQ43UEc8Z2ss6lypcPMUoasMg6kXIwdNv138C4uAZmH3UgOz
 KMbL2X/GlJppJDhjEVaBhEzYgx0ShN97tMwT3icBnouVJuPxegz9zJQ1XEunbJGzb//g+6y4+qc
 psj6F5n//5ulmIVrkXAClxb4ke/TgPxGYD8RDZdZgB/9/+LtLFGQQURtyhLosqbPfRme5r3so9f
 Hrh3AKarneERkKH3kjldvBEA3BVwpr7/A5IVFva/LKK0N90gTnEABU/inb3hJBygbdIefoCwTzU
 pJ8qiDRa+QUplDIrI++ljDnyU/yNMwtWLPDbPaZbF5pVu0F4ANuXeU4Opll1GVmWK4Kys6LQij6
 tCnRP/dwFZb/8wsQuV37RnNidCirQo9mEc=
X-Google-Smtp-Source: AGHT+IGPqFKHO54fO/GR6RYjVaM2n4PRACshjmo9Oi88osBBrk9H6SPRXC5Q0NmPtbSj+MniyrTglA==
X-Received: by 2002:a17:907:1b21:b0:b73:6f8c:6127 with SMTP id
 a640c23a62f3a-b8445031bf9mr384207966b.12.1767815145741; 
 Wed, 07 Jan 2026 11:45:45 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.41.122])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a233fb3sm591201066b.12.2026.01.07.11.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 11:45:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed,  7 Jan 2026 20:45:32 +0100
Message-ID: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: nvmem: add STM32 TAMP NVRAM
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

Add devicetree bindings for TAMP backup registers. These 32-bit
registers are retained in all low-power modes and in VBAT mode. As a
result, they can also be used to store sensitive data because their
content is protected by a tamper detection circuit.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../bindings/nvmem/st,stm32-tamp-nvram.yaml   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
new file mode 100644
index 000000000000..e03469fbe436
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-tamp-nvram.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/st,stm32-tamp-nvram.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32 TAMP's NVRAM
+
+description: |
+  The TAMP peripheral integrates, amongst others, Non Volatile RAM
+  (NVRAM) with 32/128 32-bit backup registers which can be used by
+  software to store information or communicate with a boot loader.
+
+maintainers:
+  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
+allOf:
+  - $ref: nvmem.yaml#
+
+properties:
+  compatible:
+    enum:
+      - st,stm32mp15-tamp-nvram
+      - st,stm32mp25-tamp-nvram
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nvram: nvram@46010100 {
+        compatible = "st,stm32mp25-tamp-nvram";
+        reg = <0x46010100 0x200>;
+
+        nvmem-layout {
+            compatible = "fixed-layout";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            fwu_info: tamp-bkp@c0 {
+                reg = <0xc0 0x4>;
+            };
+
+            boot_mode: tamp-bkp@180 {
+                reg = <0x180 0x4>;
+            };
+        };
+    };
+...
-- 
2.43.0

base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
branch: stm32-tamp-nvram
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
