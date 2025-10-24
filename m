Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86028C040D4
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Oct 2025 03:55:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DC27C5EC7E;
	Fri, 24 Oct 2025 01:55:43 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 804C8C5EC79
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Oct 2025 01:55:41 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-29488933a91so6220515ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 18:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761270940; x=1761875740;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hnPNWSYL8/32Ip+DCAgHjLLC5ALgmJeNiRp9bOMc41g=;
 b=KEZ3uvrV994GQWqJNi2R0BdnjGgxHUFHVTa4pSlcEbSm2Gnm6gjX2H+xv4UBfloh6X
 KmWfQtRiMpJpty8wNHy3GoqHW64M+6ujTNZTzUVBM18MDkkDf97WLNYsMdterK67/BR+
 m7lz64TY4+eGNeJg8IGuBU9ZedW1mwV+Yu8cEvM9R7NxeE3zF6PwCgN4AwPwlI951PdP
 SauuwIqqwkZU+ZrIzJB9sXYQysg1x2AGjrVfjHIICyb4dCKPXZ8j7cB9lRIZYNmPidUc
 1RDxoOINQo1XZ5SgSrqI6o80L9YEuPQapbwFt3SNPB9pVzBjPPccs1+fjE6xXnncsTQ5
 K/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761270940; x=1761875740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hnPNWSYL8/32Ip+DCAgHjLLC5ALgmJeNiRp9bOMc41g=;
 b=QuI1Qw/sJUIFQ3OXCA6bwT/oR3B8csg6z0zADm5GCsHCNCYK5VNw0Z165H8ebZSCfB
 QDo6n00h4EOIrmpIJDmIzUu6kRArzFNChE8JMJdb1GuoN/+J19WpdDgv5Ry+JCeb/7MD
 3dkr1N3ILNdbAy74Yhg2rMsiSW+DQFjkZ7IdJZ4CBSWqwTHtdY9XD7ZaBFUq7HPPs2a8
 ZwD7gEcbGyYBSgW38PTnYnQWVv7LKIOT1XPVZYiNO8gPN9B7CoW6P/hRnu87Apgb80w5
 fm6xWAafdDKUmQ3GMvHH0jcau3k+FcU+s6sLbqLfNhc00hwuhHWaaeJY0dIWGFi8Z15K
 lrdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiw0lu+N0pCDUm0ZavIjVjiG+4Rnjpq6N9j04HJgywKkuHe2W6hciBhg+s/lNn+K8KaDRa7Sh1kfTHQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw8SKtai1+Ka6lxoxd9VaaeVMLIIRZLdvt0YofToba+OWAvZpIB
 46KGhvwTqVx5pSSLnCwliZ3RjilJ4n1vEM5/ut1oGmJpjObnVoqkEXSs
X-Gm-Gg: ASbGncvlHt4BwW8ikrxUEAnY1DquvyUYx0k1KsHm3ug2P7xMhXDDtFGCovh6mAk5sW4
 GbO0VY0kPuHVYs8Jb/lDW4juaagMOmjK/m7e3LV7yotUYU5R7rlJLaSIS44QrYb5awpfXQFAQfw
 905eWjmgUXeknJrLMrpsyCY1ddTreea8hMxuffz9vTwZx0PnZFub9LHdxVYtJElmeUV5fi02WF1
 P9WLhf9cFTlwT8TDmoDvQYRcw6+MeQSiQal7tDoY5BECt4BWAhuoJgULOQ0+BbznaRlXWDtpUeQ
 JgNJyZ8jM0BKMgzxHiCh/uz5rZY/NjhFJfzCaywlPGssOqLsgJZl0tVZBqhi03wb344R/CUczEx
 EN0016HKkdnzG5edoOZuF0U77arSSeLacwciD5/JljL9m0o20Ak4QM3EgEd1eYuCO6VxBMfBeQB
 A=
X-Google-Smtp-Source: AGHT+IEvrwCV3AqeaXcBCGHkmVsO9zDXt6O5hUjk/JLZSn4FLKu2VrTulSCz8MIwR6RtZ00/qylMQw==
X-Received: by 2002:a17:902:cec7:b0:290:afe9:76ef with SMTP id
 d9443c01a7336-290caf8505bmr346295515ad.40.1761270939983; 
 Thu, 23 Oct 2025 18:55:39 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946ddeb51asm37483385ad.32.2025.10.23.18.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 18:55:39 -0700 (PDT)
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
Date: Fri, 24 Oct 2025 09:55:22 +0800
Message-ID: <20251024015524.291013-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024015524.291013-1-inochiama@gmail.com>
References: <20251024015524.291013-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/3] dt-bindings: net: sophgo,
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
 .../bindings/net/sophgo,sg2044-dwmac.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..0f1523dc0e36 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,13 @@ properties:
   interrupt-names:
     maxItems: 1
 
+  phy-mode:
+    enum:
+      - rgmii
+      - rgmii-rxid
+      - rgmii-txid
+      - rgmii-id
+
   resets:
     maxItems: 1
 
@@ -70,6 +77,16 @@ required:
 
 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      phy-mode:
+        enum:
+          - rgmii-txid
+          - rgmii-id
 
 unevaluatedProperties: false
 
-- 
2.51.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
