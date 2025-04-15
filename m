Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27BA89EB7
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Apr 2025 14:56:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8E229C78F81;
	Tue, 15 Apr 2025 12:56:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0873EC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 12:56:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so37507845e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Apr 2025 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744721813; x=1745326613;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
 b=GEhWzn6Ap+01gG2/XEw1Uqd5N4v9LfU08qg3D652CIC5dY+x32dLO0nqDrDNAChmox
 FL2HoMnVGxXCvVBCEnv8DfY2rnNas5kvoQOyU2B2Bhd5ENcJmdkJvG7KNKHOyRNQ1QTJ
 QjV1NcmJRs6ykD0vb+DDXsFyEmVEZ1aCcCYu7/+P/UpWUZej/3bNJVAgZY3hNkQxaeUV
 Le9Lfl4rSFuldcKsKSK6RfAZ7sGffgTGaJsBBcVhF4p11mV2dTEXEgQxbIrHwNLAAUj7
 7kQ4P2AcuREiR112JmhHCbEq7PHQ0i9+r/OBk9bomJ+CmX6sDpp4YVQlVn98vZL2lP+d
 v6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744721813; x=1745326613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
 b=XpFAFtmqSl6NiyhHTmtyKF3H8Q/l6QjUkVsaOT/quAl2xx2c7wPQ7TV1QkqsA12J+f
 vUM42zZQGDJFrgFiB/o/riXZjnTAbm7j6JAxM4+3Il8Phse2DarMD9Q62aWEYAMYibV0
 y5JSLgzH5i/kDdcGlhVVD5kYzQQGNvCkB24HLo5I6LgOIq6VnqbZPaCtY/cboKUkIjhk
 Uepq0eZ24SlwWSqkiSGsG5OvzHEWtyrPb4c7wWa0p6YiozgS6Uc29aClnd7gGkS42qIA
 ok7BTZkAtAN7dV/b/4U6pzigvzSnj9lVaGMDaoHW/PtVL7hidenlA3qXFzSigv54Uh9v
 MT5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpPQmvHYrWiSuHPvQDLWBNLi21Z2OY7aNsAR8YxTLmETTp8/Dxn/+1Ome37dvrF1Tj/axmHEpe17yfRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YykbjEkatu+sMWshiUXH8WnR1FgExH5ou9nipYG6pP8jmyTN5Q2
 n2BRurLv0whwCrF7F00K4wiTaIrdAiFTbZrrxwLuZoQ9CjC081FL
X-Gm-Gg: ASbGnctZpzKC0QsS3sThEvsSwHmFkxXkaUcG47B/XniqqyTmytl+uJVeW2xDuhu9fgg
 BK7HUdHOSi7JBcLspL2TILdmYDluoNlHJt12kjiyage/J3//o0hLFJgu5RHS0eVJmQFlQSsZCRX
 CMVz5vNYYZUrOP6e0e/9OlZxoKSpNZ6yoI7eout+DnsdxUzRyqlGCEiDaMpQwu/czmgQnzCo/+Q
 RwcAIJj/6oRl5XpKreZXlJn9Q8nB6lnq9WeCH1ZcDsRi4CfUaGKCcEG3FuePxIwE5CUBc+DMpRn
 ztMhzlbqABqpaVeGKAqdrKjQG1T4lm/dHnOGAS6FBZSqIiLsr5xh4DPixIB4qZHF
X-Google-Smtp-Source: AGHT+IE0KqK5XyLGhc+pfdESGQ0FrYBws4qU9UQxP3mB+l7Lk+YFfa+Xsv3uUzwSyeT2UvIbstj7vg==
X-Received: by 2002:a05:600c:4704:b0:43b:d0fe:b8ac with SMTP id
 5b1f17b1804b1-43f3a9af837mr171329065e9.30.1744721813467; 
 Tue, 15 Apr 2025 05:56:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 05:56:52 -0700 (PDT)
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
Date: Tue, 15 Apr 2025 13:56:42 +0100
Message-ID: <20250415125642.241427-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 4/4] MAINTAINERS: Add entry for
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
