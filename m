Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E0C5ACB2
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Nov 2025 01:38:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51C81C628B7;
	Fri, 14 Nov 2025 00:38:39 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9B74C1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Nov 2025 00:38:37 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-bc0e89640b9so1010361a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Nov 2025 16:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763080716; x=1763685516;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C/tU3ToM4CkL60i1rTuRB0FRIV+HElBhBmwOezkh+nI=;
 b=T35tTz1tMtKr4KhHXKHj10Z2INhRgwQlyu4tcMUeNwGKDPyVsKDRlj8k4yJZTm8oOB
 /l6BTnG9ynBV2g6RoQmr+dagGdM98KuHqzMoORHuglOfSv15bPRm0ybAbxCu+I/JxFed
 zSqbOV/6p4Zgrj5LZnKe0jZLafe5Ms5nkuJCRS1UZbB28/C69CGQb+jqTOfKGQfd97gL
 X2E+Q4J0KrNNa2Won+4xjbHUnNG1YkDul57F/08A4TGexeY+ySyWx1X8blZ+G7L6xHIy
 BFYxq6JD+gvPcvhkStlC5IW4EDRYMRzLv+rTou2N0ITZo9nlOVhTZS9ZNMYL1CrfvxbO
 2mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763080716; x=1763685516;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=C/tU3ToM4CkL60i1rTuRB0FRIV+HElBhBmwOezkh+nI=;
 b=PMEygGNxGf4U0PrmkeoLcMsOGdDkpicH8y0eyQcWdoPvVGMlynYTwwNN9/PlMxevjA
 ldkQyVI1QNLWZ1epaht6CF5+i9Mo2+BVlf71tss9tt6HM3z9lx9KvfDrPXQeG7LpQz8T
 4yifYkRBxkaUmnDegQAJsqFEr9ok6Vhnrdk0plZwaULNVNLT+DMnlN48qm2VHEZ1juYQ
 ZRzdyPOb2U64BfWX8/07YV8XPvhTcr0rZNLQGIOFyxkEPN3aUGJzw8XdD3bpJD3RICTj
 3XaIWQsPih7wcf6axXvIOhkvYYbnH2T8tkUY5wFd7IyOJyWkeU6PfRQ2usVhAcJAPGQT
 KZnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYsK33FVwpCbS/c3EWmBp6mXZ2/Px4M5GajeYuvh0lrsjb5eKYf6zwxeEKScYa0GYEWSYp6Mpmn//xdw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywae4gO4hlq7XiCQXFoo18Jwav8seIYJi0OcPXI9tfED/JB6ij7
 J63p/AwYCYWNxZ0mPYkpXLB2HrzdEpXmAvHY7nonc6UUR1x1/gIe7RIX
X-Gm-Gg: ASbGncurGJEDvlM3ZDo2Cu6Cs1cAPoarUw/FM+h8yFb3FaSF3Cn3SwEWr17J5ic9Xj8
 VLSHABJFrnmwd27jnWNnL4SusujWc7EPPmc5AYeskQwbYC+wL6uXEhU64Y5D6PNiV7dmVqJubSl
 4YnO2UKZRhcN3v+eTB8MTYyLmi0AYLAWKH1L8rGMuCq6CXKHrpplFvheiXXsNb74l+L+fY5hycV
 i+9JBcYHzDFtlfx0IAMWI2Y4dl/8L+U85C5AYxBFo6ep9MppirU0JwlXCeoQfU4mwr6wF1zsPT+
 ViYtGnpsI6bhCZfUkPK+p8UhORwi1CTHfdQWmKCGFx2pISYv6ECB7Bo9VjdD3nMFhpyYDEUxmDz
 odJO4P9NQLAekSc5ow/lMvVRfhOOtV4h8MxgD0ukT5gDX6UIR0Ff4TZeNCNrzMQ9m4xyboXX4qV
 g=
X-Google-Smtp-Source: AGHT+IHOi5i8OOkvh07viYVMPYkqSx80JGxGxStktEkqORfwNsnc52iYhiMNXrcmkKVdUboZXQ8H9w==
X-Received: by 2002:a05:7022:ea51:b0:119:e56c:18ab with SMTP id
 a92af1059eb24-11b41504d44mr212238c88.19.1763080716287; 
 Thu, 13 Nov 2025 16:38:36 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11b06088604sm3636365c88.7.2025.11.13.16.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 16:38:35 -0800 (PST)
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
Date: Fri, 14 Nov 2025 08:38:03 +0800
Message-ID: <20251114003805.494387-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114003805.494387-1-inochiama@gmail.com>
References: <20251114003805.494387-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v8 1/3] dt-bindings: net: sophgo,
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
index ce21979a2d9a..e8d3814db0e9 100644
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
+            - rgmii-rxid
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
