Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B32DC3FB0C
	for <lists+linux-stm32@lfdr.de>; Fri, 07 Nov 2025 12:17:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7B24C5F1FF;
	Fri,  7 Nov 2025 11:17:43 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B90A8C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Nov 2025 11:17:41 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-ba4874edb5dso397525a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Nov 2025 03:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762514260; x=1763119060;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
 b=Plj2HBg+WH/zt+7Bdh021y79GYxe9Uedlww+oJRmEEdx9dlyflt2rcQVT3l1DEnKFh
 oqoKIdRkMfp+L5Iy9aNjB7Axbc4V3wFpamiGAP3YqCVx5IoMsTgnK5Wp3cvaI8UAbSec
 7jNaDIHjfyzNEUGu2exofmLfJB+nHHslrmueKcGoYKcR4dIcr9Ct/4hWuJylOjWWX7ev
 x1Xu6J4IlZLS1lQ1uGda8c7wk8BjI2IeVD4ZTIIDVgZsn8s9nnRyaoMoEaBOf3A7wngm
 S2Sj8IOUWV7SoNDEVy0ASOwYko+V8vLLQCcn+S0hmEQJpCsU8YFz0nG6nzlgzidM5fzY
 INKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762514260; x=1763119060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
 b=OHCUZDd8eono5lA2YsAjjxKWsdFFeqt4ozNV/8381IfcMqhGssF3xRJk7qnrntmo54
 YHrJCkh9KYqmcoXjdSzulFd48tEnCN4U2YOuwhaumpcRIDZr0ccotizYIkLk3kCXqilV
 IOo4EWfWpr4vUA9KZRlB64PKtRvhhR2MSB7uW3tAiz2fGRwkuvFUp4HDoyohFcSM4Cli
 YLdiDJKAZl+kEE65F3QPYMMgYzedO0QcHjcQziTtYyChMcZZhqjefdPz5qp2Pw3e9k3F
 1RSno4spPjLqVY2l9Q1rI1K3JKgLKk2BfNraF0xYWSQahGPZ47IeOEcSUsYOeqW+2p6n
 Vp9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8HzRwGucNExH1SUEV4qNbTNpWY7Qp4V9hjBz63n1J3spbhI6b1iAlAGBu99mn4zlbCHqMw8Zo1am+mQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx0pmqfdsfgNzVeeT3Pj8x29ChvCSNlDuLHkvqhRIlXnWqKRRAS
 +Bghxz0kvsrUBos4B1lGfHO111cE7nreHaGu2pvnSjjLFrpP6+Vx5QLk
X-Gm-Gg: ASbGncvdGD57Yl9DQXjaYGwZpKevv/i7vn3VvujEYggwphPPyFnUIoV02zh9b2uXiKO
 4IvS9RDx//kwp5LwlbGc9OPXxbnAnO8DPqKBekYproKn8k7bOvJt97eNyhmQxoYsC1PruGZj5VQ
 MxYhvIyBBc0eDb3vIR0xv7DUnYxot5SytXIp4XE6HLSD+kNFhTdi+DJSjlWnf6pk/aQO/P/BSmT
 E7RKbfD0ULH57QnH7VnFLS2oc9kGwLF7GNbF1uXNJ24MAsc5M0pzmiezHQ2ki3MuA/0Akzf+gFs
 tkqtvgpQ7SmAJtz+9c4sHQC/eYtZ/APH0KVqceZ7DrUCcZQ0CW8kjl0zDDURQHe5dwmcfVo+EMJ
 J0yMiQNk5iuwuV/KnyMNvb5wlIerqqxayRecNSSMQFZf8yzmcLU0gfA6L4EfuJ7Rt13uHzqxukR
 k=
X-Google-Smtp-Source: AGHT+IHjf5f+YuLvxkmcrd3cJvkmjsyY1yheeW5iHSKdbzLJ/p2M1xTgPY5ean6VA+ewJk0yolgl8w==
X-Received: by 2002:a17:902:ec90:b0:24b:1625:5fa5 with SMTP id
 d9443c01a7336-297c03b66b9mr44655785ad.11.1762514260220; 
 Fri, 07 Nov 2025 03:17:40 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba8ffe3616fsm5131381a12.19.2025.11.07.03.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 03:17:39 -0800 (PST)
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
Date: Fri,  7 Nov 2025 19:17:13 +0800
Message-ID: <20251107111715.3196746-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107111715.3196746-1-inochiama@gmail.com>
References: <20251107111715.3196746-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v7 1/3] dt-bindings: net: sophgo,
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

Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..ce6fc458be61 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -70,6 +70,25 @@ required:
 
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
 
 unevaluatedProperties: false
 
-- 
2.51.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
