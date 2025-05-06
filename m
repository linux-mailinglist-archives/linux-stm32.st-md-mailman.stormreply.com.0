Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F3AABF94
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 11:33:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9412C78F83;
	Tue,  6 May 2025 09:33:26 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D78B7C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 09:33:25 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6e8fd49b85eso90410216d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746524005; x=1747128805;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aI4dRXqiKm6pX3kcqhFfwk5EZQ1NNLsZ7AEY1QlzP5o=;
 b=Jh5b3wZ8rafAtnubAZSaO0+oYpeFV8Z1qkGQ3eHF4or4jkiMacxERKfTJFr4jVv/kC
 raegVZK4N3iPvOywoKPxIq4FMcEM/H1FS9k5J+pkoAskrZb6nuFpeKD2Zk+3WpZnXCHX
 GIgLlGj4EOvFLjSXGNaNjKPTSp0d8t4+aLIZQKweCznVxk7UuSQHur3Vs6DGe2xX45Sx
 VRCOpLAVkV7IkcpteiKRr7Mqa4xOOjMolIE4QMdjOVfskEqypO8zv5ArFLBs4LgkJu2j
 I9/c9EWWMyDCx0H5Khn9rgBs11/Bz6dQuseoBnb6594tc2PkhvogoaY3TrhuhWdBjOO4
 eP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746524005; x=1747128805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aI4dRXqiKm6pX3kcqhFfwk5EZQ1NNLsZ7AEY1QlzP5o=;
 b=HiJnzFocWS/ZfTIo7Muip2GVtzzeyEfap1xJfdsVLp/FJmsolA8zEGU7buurPEq2wG
 NXSCNdZq6WoFjR+UJ6eUJsVu7PzAyUQAwbEdHJOOFbzjmMyH5qhJO3XMQE75sbFL4tl/
 queJzSBpBvp4OccKIFVtFgTDA9axf2L21A23PcYphMHW2HoY5+tb0nE6l9mJHGZGSeag
 x04QiyWSdYCFQbgPszzpjW1Q3yoFJvalib+UgON1as4U3AJUAxh8R35L0KpTfkQV7wDZ
 wQwb23cDuONRNGjRkgVUWM8i6e8NV9ogkPhrzAZcLh9fl0b7AUktevosoEFJoMOGXwMr
 iFiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmS2lOckGfE37392KIRg19i/FN7aLXkSu9wJWQxaDkgoqUvwWMdsNoFBOhAae8zuAFIAj//2aNV3Iwwg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyDYWEFOsvmPaJKi7Z1QVgQTgenYw1juRTi6vbdDFTfL83AM4ut
 rRgPNzhZqsGIch6trRk0apAFzhin2myDDyXe6zo5zi6pvK+/lyuM
X-Gm-Gg: ASbGnctCGtQdOydt/QSmuoKUcgDx84hxl8qfJ2CN8uZMkgW/wMOB4UfJjUtR1m12NmD
 QA7oVy6dbpCuEb/lQQdXuRC8TYb8PmsA/9D+PMDthyXE0dGFKC0peOdg62fyXggGj2WECVt5l39
 9Lyzd0H6M+jIM+pJVVHt4OH/ykSYK0jPFACguEZCeSBTj0Nw+uTVkp46on2XXVOq8m8NnG55UlS
 8MBj5pSBNPWZFJcFaxxmoN3/ekvbU2Mx9Cbr2rmnWKpNxNdkY+vnrMHRz5/iXbsxA0OtDk6DxWU
 mJ1Pw+/wPiPDcjQK
X-Google-Smtp-Source: AGHT+IHQ/VCvHq3Ers+/VvDGnzDvxmpNMck0lZ3995KP7lY9UpCWzOawDdcIMSjGwrUnb0SUUaU/qg==
X-Received: by 2002:a0c:d6c8:0:b0:6f5:3b8b:8d0d with SMTP id
 6a1803df08f44-6f53b8b8e44mr12554866d6.20.1746524004730; 
 Tue, 06 May 2025 02:33:24 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-6f50f3b1fbbsm67539166d6.15.2025.05.06.02.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 02:33:24 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  6 May 2025 17:32:51 +0800
Message-ID: <20250506093256.1107770-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: sophgo,
	sg2044-dwmac: Add support for Sophgo SG2042 dwmac
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

The GMAC IP on SG2042 is a standard Synopsys DesignWare MAC
(version 5.00a) with tx clock.

Add necessary compatible string for this device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 78b3030dc56d..f16b49da6dbf 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -30,6 +30,7 @@ select:
           - snps,dwmac-4.00
           - snps,dwmac-4.10a
           - snps,dwmac-4.20a
+          - snps,dwmac-5.00a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
           - snps,dwmac-5.30a
@@ -97,11 +98,13 @@ properties:
         - snps,dwmac-4.00
         - snps,dwmac-4.10a
         - snps,dwmac-4.20a
+        - snps,dwmac-5.00a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
         - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
+        - sophgo,sg2042-dwmac
         - sophgo,sg2044-dwmac
         - starfive,jh7100-dwmac
         - starfive,jh7110-dwmac
@@ -634,6 +637,7 @@ allOf:
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a
                 - snps,dwmac-4.20a
+                - snps,dwmac-5.00a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index 4dd2dc9c678b..112b0b2a1524 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -15,14 +15,19 @@ select:
       contains:
         enum:
           - sophgo,sg2044-dwmac
+          - sophgo,sg2042-dwmac
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - const: sophgo,sg2044-dwmac
-      - const: snps,dwmac-5.30a
+    oneOf:
+      - items:
+          - const: sophgo,sg2042-dwmac
+          - const: snps,dwmac-5.00a
+      - items:
+          - const: sophgo,sg2044-dwmac
+          - const: snps,dwmac-5.30a
 
   reg:
     maxItems: 1
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
