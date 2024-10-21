Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321A9AE505
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE562C78F65;
	Thu, 24 Oct 2024 12:39:12 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A38ADC78036
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 10:36:50 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-7d4fa972cbeso3358177a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Oct 2024 03:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729507009; x=1730111809;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
 b=YsV82xtkyAQyve/WsjK0/gyw0mFCXebrvrNc9c7UpFpmIHrqN6ZTU2/5Jiwe9BwoUM
 LLcSahX4CsUAz61mkuM2mB89OqslQjxnViqvmm+eQviPRlE2LkYy3MTh0n+PpXay2Hzf
 MnK11uOqGoDlr6fJ7JxPCXWYnsBgfSs4muDJWkCf8RHXDy9JM+Qqd7Y/gzKgybQgtjQu
 SKjCGEnnWa/Wlg3DQkgQWxW9NLIJIzoTSilAVrIpZIDC6jOCslT9DbqTsbNS1odNZ6tN
 FhxmAR6wTk60w3RDuuRT6ovtPYJdMv5w8qMMGE3uLOhcmzSN/6gicr6oBi4OfJ4ih1YM
 WuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729507009; x=1730111809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
 b=ZYFATBE+iZNlo1yzBIFN7X6mPuPDhjy/k9Fe4ZRX7BzyjvaJWNVyEcui0tl1W0J4lw
 JZrMzlr7XwTjV2LDI6o8wdFLfiFNYvv0kLvpbdwJLse1MlEqhZYU6Tt/8Kv+xGEOaiFF
 obq0wrnk1sLGUAYhobEXhYJ6Mp5+SBF+Eo+ZR3aMc7SnyOxw/2FduYoCkgm1SJvLMIH2
 taJ3bP6ryxy8kSd6umigk5wv/K2LSdsetkm7WdsvuGeGijmOq2I7m4PdZoUS0za6K/go
 8lPzVT7SPEsDYjiOWUjPMwcuR3xh/L+OxuUYGMT+pYCn9PBOQd1c6wm0gXMtT6kfFDfN
 VbNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe8Y1ap+6oDbawYa2PTmudVi9gcx7Z9X3Hqm/YMZVogjYAyNnSQjBoKC7nowWW683teRC6H/1kdFU6DA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzoBHZaQaPTiDRcRELz22CSf7FYiC9IvM3XNsvGMGcpoN+ibV/p
 Ow6DZQ7vTJcBuNunnX/1UYyidyD+fJk4Le0yNKjG1VnBbpstOjom
X-Google-Smtp-Source: AGHT+IHcfOB8KvzIPdr/4gmQUpcTvuERKiXFCsr6Yz6aTePpzQBGy3C9mW284sw41jWu8/yv/Ub+BA==
X-Received: by 2002:a05:6300:44:b0:1d8:a759:525c with SMTP id
 adf61e73a8af0-1d92c572670mr15063786637.39.1729507009210; 
 Mon, 21 Oct 2024 03:36:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7eee63a1sm23044785ad.18.2024.10.21.03.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 03:36:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Mon, 21 Oct 2024 18:36:14 +0800
Message-ID: <20241021103617.653386-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021103617.653386-1-inochiama@gmail.com>
References: <20241021103617.653386-1-inochiama@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/4] dt-bindings: net: snps,
	dwmac: Add dwmac-5.30a version
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

Add compatible string for dwmac-5.30a IP.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e2ba1bf788c..3c4007cb65f8 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -31,6 +31,7 @@ select:
           - snps,dwmac-4.20a
           - snps,dwmac-5.10a
           - snps,dwmac-5.20
+          - snps,dwmac-5.30a
           - snps,dwxgmac
           - snps,dwxgmac-2.10
 
@@ -95,6 +96,7 @@ properties:
         - snps,dwmac-4.20a
         - snps,dwmac-5.10a
         - snps,dwmac-5.20
+        - snps,dwmac-5.30a
         - snps,dwxgmac
         - snps,dwxgmac-2.10
         - starfive,jh7100-dwmac
@@ -627,6 +629,7 @@ allOf:
                 - snps,dwmac-4.20a
                 - snps,dwmac-5.10a
                 - snps,dwmac-5.20
+                - snps,dwmac-5.30a
                 - snps,dwxgmac
                 - snps,dwxgmac-2.10
                 - st,spear600-gmac
-- 
2.47.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
