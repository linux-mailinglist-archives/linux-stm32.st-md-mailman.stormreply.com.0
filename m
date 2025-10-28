Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF2FC122EA
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Oct 2025 01:39:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 908CAC628AC;
	Tue, 28 Oct 2025 00:39:13 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DBF1C60495
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Oct 2025 00:39:12 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-29488933a91so50123265ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 17:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761611951; x=1762216751;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKnShh97FzAXK9uF4JYbivS+DlO0bX3Ab4FUiZA04Ec=;
 b=BYobgyjlbc071WJZWf2n9200S2Ee3gfgSlzXz1OINLvGG5SMV7zJOOHOdb0CMZ0MBn
 Ozil6wOAoOoegA8f0m10340I3O/AYaM+NZjv2D2vue76JrelwgkhEfDVl9bDbq9vnPXP
 Dhj+MuYGF52HFmC58srHI/Zk5jlTzA/46X1oiC7lss0RKDAQPc0tdTKJackwGBEtbg07
 hNdFY3yfY85ciwrDwMp0L8FkBbJzwgbcqRY5B7FAm0trtqFpqM6zrvf9zYk9Ok0wvd2S
 9FoMYeXh8rmw0tZPNN91y6UNtEwtuG7WQCEuD+cspUVEgITBoBsOg68cEGymSkm1/nOV
 80Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761611951; x=1762216751;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKnShh97FzAXK9uF4JYbivS+DlO0bX3Ab4FUiZA04Ec=;
 b=BNDXV0Bq5rwRpX/aGUgbGl+peFvkV3IrS9jyAA8indkhA4wyskqFnFPjniqht9doIi
 7kcGgYDGzehjFBuFz9WKas6cE4z7J7EX5hSW7NzRpQSBlTf0Ix5VnihLjL5ql8ojjPW6
 NcoeJiu3EIzrBHaVjzv/whZFhj4o9JXWLiydMCPBS+68e6XqDrmyKbRO7In3Q80444pX
 /5JK5AINYw5vUNCWRH/burCj1AFuM+HIT5s4cSJKOC3utIyhtAnw9JdqNgBAyfNVWqyd
 m/72fxMMS0Pv+RqNujCc5hsCYozcF7zTkBfkoo5vlBUDTiARcIujgKipAciqEgJnhGn4
 9vuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRXGRwu9obSVCL8jbVOmO1Y6/ZpxF/a6/mI5XFRh5nHwcgQSPEkHkHZNAr6a1PmaTRA29BeeuAOSV2ow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx/A680MObtsG6kvcbTnE2RpdA5c8RR3JHnspu7CCBFM6ld2Zzv
 PYAVNV86t8FPX042dNxJBj0NeXEZxNH4tXmsXfvRk9vym1os599AKsPc
X-Gm-Gg: ASbGncuMc9KtnqZo6SIl/Sp6Wxo2BNkc0n1CgBUekAHFJmJTUyPPbxKqgwS6b2ZiRfr
 IfjnisootkDuKb/+KNd5J5la3aJRdG4vkXAV0g5T7uhmNplBniH2yjUz2yRXrDfSFtRw6XzaMHK
 L2fKgENmNiwm5MO+BC6Z7yoM1NQSCRq9J7wPOCezXT3Q5PK1viUvDbFeq+zpvf6DVe8fWphREzS
 8VFoHJBbP/Bvuql2EQ7vb0AjhT7NKSn1URzzJKw7mHRK7Jznzz8CCL1xeS07keZGYD7W+8SDQFd
 fmDnELslZx0bjkxu1Zoo7pk3iHDUDVI6scxhVsUAUsxlSZ4/r9sRVU5eiM2gZjRlYOGDYuVBds3
 JJ1HsFNAeIEBTnr4/zKNnPXAdQlYrzHMLqm2p1r9tRO0UmEQzQ1hSVB3NxqWRrRxsUN3ixrhDr0
 g=
X-Google-Smtp-Source: AGHT+IGDgRzXqJUJJkrtAaCEFJyXOr4mEl+07Z2j/3J+/i5aKBpQqqv/TIGwi4eyT7fk5HkXcUBq3g==
X-Received: by 2002:a17:903:244d:b0:24c:b39f:baaa with SMTP id
 d9443c01a7336-294cb65f7f9mr16976795ad.49.1761611950502; 
 Mon, 27 Oct 2025 17:39:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33fed7e7039sm10005885a91.12.2025.10.27.17.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 17:39:10 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Tue, 28 Oct 2025 08:38:56 +0800
Message-ID: <20251028003858.267040-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251028003858.267040-1-inochiama@gmail.com>
References: <20251028003858.267040-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/3] dt-bindings: net: sophgo,
	sg2044-dwmac: add phy mode restriction
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..916ef8f4838a 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,26 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii-txid
+            - rgmii-id
+    else:
+      properties:
+        phy-mode:
+          enum:
+            - rgmii
+            - rgmii-rxid
+            - rgmii-txid
+            - rgmii-id
+
 
 unevaluatedProperties: false
 
-- 
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
