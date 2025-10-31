Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B778AC22DE3
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Oct 2025 02:24:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84735C62D8F;
	Fri, 31 Oct 2025 01:24:58 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5EDFAC1A977
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Oct 2025 01:24:57 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7a4176547bfso1685576b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 18:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761873896; x=1762478696;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x3s1Pf2chIyJ4GtiDiT2mhsesiDGOlvUaZYqYIQFp28=;
 b=DCy40Ec4duNARAiQvgOOYIc3ZcmmOeZLh5jFnJCu0wNvbEljnYpX6QI0MADQCsJecN
 Qjnd0Dy4IrO4qjzWePqmSB0qS/ONqxJMqubVZ9KL1K9yb6RqbyWoVHeZOYhB1XU31i7a
 zlhSmQ9VaHm0gmEPZ8qzo/8Py3epZp7G6fkLtYrOpQWo+BhcBKdIdTq8kLoYBuXJHuWD
 FA3l9TQWkaLfF+5J2zw/gxvqgAFVGqsi+02A3OoPtCyxLy3GLz1C3/Bl6q2USjf95BZX
 ZvP+hNVqGKSD107FFDCo08bCUM2XRh/YiT5CBRrlPT8tZ7GTDPRlReXn4E+NO9Om7NZ/
 8DMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761873896; x=1762478696;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x3s1Pf2chIyJ4GtiDiT2mhsesiDGOlvUaZYqYIQFp28=;
 b=gpa1mwg3ZPRFf9QO4JFtKrVP4lDrfWatsace5ofhvBaJPJTXmsc4N9Ic8zrhS7A9OQ
 U7tidq61x3IkR+n5HNAxqVkPh+NkKD2jx6SiH3khFM3NdDYLHW6VV8sbM1i1oDItBkNo
 FD8JtUMH4+wK8dkhIiX4HQNmets+P2HW6ORvfDtmbA840B9olVFdMjAfqogLElz/wAzp
 pGZANo6piyt43b3St8I6sFlCTCO7mTnKhG+wR7q0ez3GcxzYmdbKJKDBPo6CAKHmTMMG
 cIZ86KKxBDD80EHYVyY8hJFs8Ot6BQQ90R8hgP2ggkiFPFSjT8P2L8NeIBJKYGo11dxv
 MDqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfJahHTG/kvoDou+DGVPBJw315pN89evgVrEO7KrYtSyhTB8UWMPhbVFNbuFWbqKFvtxc13PYrgmsdew==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzJrLW0vVzuOUrRQ2sM1f1sH2CYzM17pnt8jup7qMZ2CD41Piki
 Gxz9MXsQqpdQSWy6Stubg6tmMMXoD+Xao8C0shARiCl3ftoRLq+SPnKd
X-Gm-Gg: ASbGncvuWdxuBSno7jUntVPPDKoFpwqx0OvU1L3lUWsxOBsgxyRk1nO7YVYJwGRTUIN
 rvqUkf/MeUvV6iWlAZ+klduDmzThyoXDvZ8jMQrbaflTlnXCRdByZz7GsNuXTXf3S23n6tNb1AD
 MS3jlcNmBZXIvECySISgKq0sy7Sj+y3YfgJU/X7VIt4G4afk9jDVTlEwJBCC2Xkv+KefNfQjJ8T
 Rs4K/hf00SrdKkE/RvOR2SdYwWSo540OI+/KNZgFN5UFKKaUMjRo6J2dbbGaVK4lem2XH7waNwo
 ThptsBEUSFu/GCAg29AFVeqdH0ANMm4f3OPvgoMuAAW2k0gLFMeZQDIEDN7SPwVwsyTl4yRQfbC
 VJ664DdDjCgl5F6syzVJMAH09KEe6jQkgEnpuSfy5hFTdgkHjQI9HWKX/sU6SNfp4c3CvHThCje
 GV7PDAGdNPkA==
X-Google-Smtp-Source: AGHT+IEQpxdK7nDSwTz1wkNW6JuGLevqLFpUO9kj409rzEmnNWQoF0aH834gvH8ZTJyvDlZYvh+hhA==
X-Received: by 2002:a05:6a20:7290:b0:344:a607:5548 with SMTP id
 adf61e73a8af0-348cde0a4e6mr2555602637.58.1761873895775; 
 Thu, 30 Oct 2025 18:24:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3407f09fb16sm534423a91.5.2025.10.30.18.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 18:24:55 -0700 (PDT)
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
Date: Fri, 31 Oct 2025 09:24:26 +0800
Message-ID: <20251031012428.488184-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251031012428.488184-1-inochiama@gmail.com>
References: <20251031012428.488184-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 1/3] dt-bindings: net: sophgo,
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
2.51.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
