Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C5BAFC2E6
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jul 2025 08:41:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 622ABC3F930;
	Tue,  8 Jul 2025 06:41:09 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60D54C3F92F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jul 2025 06:41:08 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-313bb9b2f5bso3572108a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Jul 2025 23:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751956867; x=1752561667;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N3j/1wK63BWsGUKsDNrpQgGtCBr1VsAlvbOLyb+XR7k=;
 b=AZIxbbYoLHqfoXazpbdSn2dK6Ml4oS84Rrd4rA7Gmp+gIbbWg7B/1Wfhvs8ghLsKJR
 FFrrHe2gp/T15NCoKJRK9d9z7a92mYWUU5ituAurm+qyAMOjcKm+S0ss+G8hX7iQG1+d
 4HhqETy/T86YgdNvsCJlpJCShHUJrw2hcaTxZqm2AtrR3FNwagVGvx4Mno1eGqbeXbJR
 pbInnRLA0z4iSwJFI/POnVTqVgBjIFDo8JZRCFn2bs2yF8X8q0VVlsLWT+5uMjHFOa5L
 kTo6NNYgxFTTIdo58ld5OanIBfJh9EAUiBXxqyx3+LTgjNhNMqFw/flQSu9V2t4k2q8R
 4YhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751956867; x=1752561667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N3j/1wK63BWsGUKsDNrpQgGtCBr1VsAlvbOLyb+XR7k=;
 b=kf064MyixLIiNBqrEMW++QmcKtQhBuif2hsvai8D1JMLcz99NWuPSOo467ufUFLRu5
 QDVIPEh9u8S6QPeYdtuyBQT0uU46JxxtLFIj2wfbT7o8wfsVCqAAKEd7mL1Z+S2ASk3+
 kkNbAd52Zp1T9TSM99pwpUK9dh6/sKz5ZCh/FkO9w76QkjPxOKlyj6ucIumuGxnY5VS5
 R0FdVZGUpSr8bZ4efM5NqfKUQOMCZju7f6PM1rjTJRUdXQ4J7EhEZ53lZS7FtFW7Ig9M
 GoF/VWLk4j13H6/kTvdORR1uc3kaQ9YWz8p4PK/XoBK54V35tWRNKwr2YylELsKmtFvY
 JiZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvtpr9m86sK4uTiHBRg19wvFKmfxlZaMAfqJ6QZk3omapGS/8qELGvYWMrwoeuUu4PMbCdfV1XLNPE8A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwXgq9L1baT1SRB+Z5Yk7pOFoC562B/Xm0ox4AeVW55253nbORM
 bXdeijV2jwDx10KAOjoEqh1CDT0NdRNp3PdqM/zpseR9eweNeV9vVeff
X-Gm-Gg: ASbGnctFdq5GAp/kkZGjRRudQ9qTElx1+9gGu+aylByRy99+OTvAyXk9dOepMXlA46u
 dneJpi4zrHKh60oygkAaKsCjsd7VXKA6+W2qFSDYAU8fncHUM7Lc1x+1TpGtRwq5jWjuTA4ARF4
 qTzjK8lujTtVY9IUGtS3An1Nbs/4Iu2sqbr7pb+vuL01n+kMChj7VNFz875udh1UmfctmegU139
 y2ApjaSgbj3+GGtYfG2t2cycZU7f1+L0WVmb/eFujPY1uOycGEy7TbXnzcegQP/+QJKZ6cryyJs
 wrQ7YHW0brI8YigAJKRMIe7i/HxS3Np2kzUSmLWfRjLkYaqiDrOa3Ar5+qmrE+gAPoyOXdfS
X-Google-Smtp-Source: AGHT+IFucR+T9yvI79HtHogx0QhFDSYy7llkys4A780hO83hxrf2HV5i0axwF+kJgvPkACEuBN1BIw==
X-Received: by 2002:a17:90a:d00f:b0:31c:15d9:8a5 with SMTP id
 98e67ed59e1d1-31c21d8adbfmr2332382a91.19.1751956866836; 
 Mon, 07 Jul 2025 23:41:06 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-31c21d2e948sm1323277a91.5.2025.07.07.23.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 23:41:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Lothar Rubusch <l.rubusch@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  8 Jul 2025 14:40:49 +0800
Message-ID: <20250708064052.507094-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 sophgo@lists.linux.dev, Han Gao <rabenda.cn@gmail.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/3] dt-bindings: net: sophgo,
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml |  4 ++++
 .../devicetree/bindings/net/sophgo,sg2044-dwmac.yaml  | 11 ++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 90b79283e228..4e3cbaa06229 100644
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
@@ -98,11 +99,13 @@ properties:
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
@@ -641,6 +644,7 @@ allOf:
                 - snps,dwmac-4.00
                 - snps,dwmac-4.10a
                 - snps,dwmac-4.20a
+                - snps,dwmac-5.00a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
                 - snps,dwmac-5.30a
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index 8afbd9ebd73f..ce21979a2d9a 100644
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
2.50.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
