Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7F3C29E8F
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 04:05:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB635C62D2C;
	Mon,  3 Nov 2025 03:05:49 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8B65C62D2C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 03:05:47 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b9a6ff216faso685586a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Nov 2025 19:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762139146; x=1762743946;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
 b=JVh6fbcz+JMtePc1LbgyYa6crTYLCdAI40MdKiXxAO3eggUoE2cpbM90/bhXPDqoVJ
 VlFDan0U6lrwGqY6Jtx6vit7zM83OAIwW6zjOUXs0gHu8VKPUrWQOyIR1sAUgd7bvJmj
 k4WDI7psJaTdlK4KuMcaQYgDLTk8CWE5/zFMnBUh27JdZ4cY7exSAIwG3B5QHbMbG2sR
 e+FtsDQ8zUwmvOcoRlXzZkP5oKZzCRz0NhHLRoY1PbEF3o4Lndkt1m8bYFobDUsJRGBX
 IHTMFQaS4OzDNafzYwcf5QGFFcf33B8x4hKYoIRPrGtC4qlBLNhyePvkVz5A33rtMLFJ
 A8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762139146; x=1762743946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+DZ/Hzt/Z4dyeSpA3JZAv4iA86Nxbb9HIqSS2XvFzQ8=;
 b=A90tpEMjQ0OJf2zRqJ2MYbNpbYhRV5saxIr+8IjLvq0yhsk3mGncFvmyCaN/0HnElt
 icUwNevIxDqE3DG3rWw/3rNFjmu/sPgYADwxwkchk3vumUvNV4bRZMfps9yN66uhhAtn
 ZbkNPK5HUAotXo3edgwJdtH6C4BpLFu10jsEFxXoIId6tNqVPPvs1DXiXmzA+dITmpui
 AMvHZo+BFnokPHblQdqX8lrlJNOAHvlaVRhPJ9NChniGl+GnGUaEA8vri8yJ90zmEsCy
 evAietl69GqYkZa+GB9ZgqnKQcEIK/bO3l9e5/kNgvk+/Mazv129xfq2QRhFuF3xqpGD
 LEoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZHpVpsjiki4Iq+ICXk0R1m1EqgK/wnZ2sSgbDEMHx1FmatB3TdopcSWIYxYBNtYXenvUm6VHLkrPSow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxJR6rxbgUW6ha3Oj3mR1qMkezyGaX/S7I1mVESoGCd44xgkMK8
 BDY6wa2KS4EPgUAReZjdtcDYvLKab9i+4xafkucMpFJBxpMw/RbB33Ls
X-Gm-Gg: ASbGncuWZzAq7DOze0cZZMenF6aWJG3nH8yuUohMAqW40r5U4k0rvjhCuNjppvmgf81
 QeNK91uvdosQBQ/d7TpJPgrqw6KEo78soeIKstSYju+c359nthAGo+ZmHhh0dTXWYjLjcBmJL+H
 YRiL/YINU9SR5BrC6lil3mS5JNopDvKHosgRorWSnG9uRD/U56EB4sZuLVCCFfRrMhJPJG7Ib29
 tUcKFqKHBDVJpKY0k8kqI+4+LDe9s517ylHADh+1/SvOtRbLPZjADwKq9cHhJDZncoKZ2Gnn/co
 Abfmt3fHIF+mGp2yVnqPM3C5+x3uKmmkOZJ0MYVa8gjEc4nmjetf2tGNTFGZggVbgkh7hQvmlzC
 /MkhMGjSMMJ71nfI0TfnLnRLSZfQ8Dt4jc8GbiZQbN+q4fbBZoakbbyNTspdF7O7mYwQ7NBZH3M
 zGAc/GxRqtkw==
X-Google-Smtp-Source: AGHT+IG+udK6Bhw4W8KPlkD75NTM1WqC0W+OR++Yhtjf/iYFIJkPzmpXbccgIuGWio8g01Hhjhz5ug==
X-Received: by 2002:a17:90b:4a43:b0:340:c64d:38d3 with SMTP id
 98e67ed59e1d1-340c64d3b78mr7086982a91.12.1762139146285; 
 Sun, 02 Nov 2025 19:05:46 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-340d1a4a587sm5157684a91.3.2025.11.02.19.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 19:05:46 -0800 (PST)
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
Date: Mon,  3 Nov 2025 11:05:24 +0800
Message-ID: <20251103030526.1092365-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251103030526.1092365-1-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 1/3] dt-bindings: net: sophgo,
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
