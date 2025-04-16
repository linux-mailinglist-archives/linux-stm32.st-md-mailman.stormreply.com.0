Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA82A8B6EA
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 12:40:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC880C78F83;
	Wed, 16 Apr 2025 10:40:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3DF5C78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 10:40:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso47193115e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 03:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744800029; x=1745404829;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
 b=bnaPg/cw1BqEUzUKCYFCVW2R0GQCPEliXBXdQpvYXkzbxybDb1fheza6A3nTRRUz+D
 vlDvMY45Cv2+xQZ1+vx+5xkGk4TCzPpqSl7qkVkQNjVl8/n/P/GL07UeJGJIZJDwCwbO
 DXd7gFvjPM5oiZOHxBgL95PXnIj9/o9aPuaWmxK4U86iJEaCsbe9AZ7EiDL1EQpjrREz
 iYIqC8hupZfYR55B/RXFBNDFU0kZ9Y50irkU/yUDpHQhca8AFMOtPyTgD8gjNh+Lula1
 rIquNvOvsd3m02AThBxfgfY5eKwx84WS+HFcvoJ6v+ANZW0ycZqlM/502k/YMmhmbSMh
 oJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744800029; x=1745404829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
 b=jQtdJvi07hMKKTYQJs2n2PgOzJ/KrDOg9YlDB7PZsBrjo+T+p7/AMGHln00C4qt9q9
 wls8qrs9m6eQqRK34N4yawssDn0zyC3cbsDIL0B6fm8NODRa7WwWrRMBBWoHmWQGT0IP
 C7PoQuLmq5U+zf87orVQ4yM9ylOwEF+WPUZORDjfLA7O+OWyPIzeHbH5AenaYeQHdo01
 MNkdH6CpIdivFyNBSAZEqjUipwQ1jsETIMLXrSqokhAS9zycbpRiXMKV30/scJjnG94o
 YCy7g+wrO3P+bY/nevXfQM5foisFeNlJ+HdgRO0a0QBxlk2X69VTc2QFuuuAe6hmfM/L
 FqGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8I8lSIzh7cyfUMXjy7qR0vXR3hW25jdGCsuCNPiFCpQf7Wy+Q3manbzUCXRslp+Z0kxTMcIxolYMwNw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz93iD4NQrqDb2vvDOI7PRdduXFW0ObdTLZOYiLFFcSdntYVTJX
 P6bw95QHd1YZRVkEnmnGqQ8t6Y8NmDqa4qGbnextFR2J5QNc7SJHzX8UO/Ik
X-Gm-Gg: ASbGncuBwAuTDIbp9eXbTWl1SMSKEgZzb9c40BsVDknNgiM0+HJcCMADXk1pby0aJcf
 e9/G1zxLWDJ2kK3QlP52VU/4yx2ddeXscKrBR4HGfBldJOoMhETrGqy4BjaCGPmtGVXatrHoNKE
 b8bWrztJDtnu5GV/syTnVAZs3NhU2k4KxrHM0xxxPR5lkOFfpCbeCUfQzZXLn0/S66B2MBWWTNY
 7wxuj+z8RbVhJZ6p+NOgfUG+IZ55S0ldVs8HEeVfjjTi8n3g+nTlNQ93Fr5AKSazY3dmBE3/lNn
 e+oWCSn1GiNUvwunf+U0VwzHk6PsdPgiiH/UudDGT4YrDwhOIkvibJhtlQnLLLLMMQ==
X-Google-Smtp-Source: AGHT+IFXW+hiPEBM9LjJCwMXPmS22EARA29oJ/ZIpi9JZFtxhf4t17LTXmG2ii+PAuY6ozJtD3xfEg==
X-Received: by 2002:a05:600c:1d2a:b0:43d:36c:f24 with SMTP id
 5b1f17b1804b1-4405d61ca24mr13567445e9.13.1744800028716; 
 Wed, 16 Apr 2025 03:40:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 03:40:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Wed, 16 Apr 2025 11:40:15 +0100
Message-ID: <20250416104015.47788-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v7 4/4] MAINTAINERS: Add entry for
	Renesas RZ/V2H(P) DWMAC GBETH glue layer driver
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new MAINTAINERS entry for the Renesas RZ/V2H(P) DWMAC GBETH
glue layer driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1248443035f4..f5141da4d509 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20606,6 +20606,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
+M:	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+L:	netdev@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
+
 RENESAS RZ/V2M I2C DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
