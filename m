Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EE59AF670
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 03:10:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC772C78F6C;
	Fri, 25 Oct 2024 01:10:34 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B46E6C78F69
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 01:10:29 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20ca388d242so12617575ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Oct 2024 18:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729818627; x=1730423427;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
 b=CgykEo+Sh1a5xuc5n17bSHlXPC926vKGgS+JBcgLYrlbEga73dZDBalSHm5iW00GzX
 4xvve6rvUFbIfuXQZdz5IWv6zVqWn0buGxXtgHc0QatS5MOXb16ePEuxT85DYyjQ3qRp
 SFBNnoAM3L/emxJeg8K/a/1/16WW1JFnK7OpCX2+qsxrcAisMT1pgTPwl6pf5SNyYk09
 KWTeBCTpO6flDhFoMxKvyQ4J8bisZx4ag4pqkPTeMCCDHewjOCQpHFtEiDB9bWLoz+NL
 6SifqnjATqtMQbvnrfqjLg54lxaxOQysMylveqXZWoRP+Ki0CuXbH6eKSDO9zBkF/n/K
 mSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729818627; x=1730423427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zgTXpRaa0CS94DWebND0XpyXT65bwzGX/MVLfeTayUc=;
 b=LT3FPca8znds4FdxxBkX2xEDgtsCCb9hTAEM+YUtxpfH1loxrAhV5ALZtKat9SUXME
 BekqGnCb2hOozypOzQiYlVwauPRUkdNHok0InPdGcjj76v9uHXzzdynM7PdUb5DrRjL6
 kHbb2zOTmmzd/DKYTZZzPV5w8sSmhSxy8+bwO9N3GGB0GIdzA18Dqo2oHTYuPGo/j5Zr
 C7GpFULIsMY1p4eMN5p/0NBSJr0gDJd5CneG6qV7ggNXrLT1c/PGdu0z0WJHW6ha6KY/
 qsCdwK/w/Ofq+pc7Ez0nO5PtAWB1FKvi7ljHjGTK5X9mwCGlJ5jNGvzDKyh1ErHU6hf/
 I4mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyW4jLfg2LOvRMTWwafuHphIPCqghgiiw+/aXWhM+XTGBevmvles71LigzEbkEOEKOUbVBff0HPiuLtg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5gfXmPuvXvqPB0b0sgleND2IHi0nS6e1iLlqTaQ7VRSDeK94E
 mNfl/YrOYraM96QQpfMSrPBKRXB+9spy67ZNPhnsRMfPY2XXJUEG
X-Google-Smtp-Source: AGHT+IFuYgb27DRjo53S1PNy4oCfKnzd8OhJaIYDcpXqGHoe0olM8cbsYPvMtmxuGJEtJGwjOabQfw==
X-Received: by 2002:a17:903:22c9:b0:20c:b090:c87 with SMTP id
 d9443c01a7336-20fa9e5e485mr115146405ad.29.1729818627304; 
 Thu, 24 Oct 2024 18:10:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc08676csm557015ad.304.2024.10.24.18.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 18:10:26 -0700 (PDT)
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
Date: Fri, 25 Oct 2024 09:09:57 +0800
Message-ID: <20241025011000.244350-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025011000.244350-1-inochiama@gmail.com>
References: <20241025011000.244350-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/4] dt-bindings: net: snps,
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
