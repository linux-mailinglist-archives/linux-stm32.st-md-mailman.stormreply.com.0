Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C26FB3F176
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 02:13:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4036CC3FACC;
	Tue,  2 Sep 2025 00:13:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C4F3C32E92
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 00:13:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b8e28b3c5so8081055e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Sep 2025 17:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756771987; x=1757376787;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9AzoOdR6sJDHEcKW2yNQOC2NaWtXxFSPPgG0odQCnsE=;
 b=ePiupkslRlixmByIEofSF+ivP6J0f14w7xVQkb9+GxNknzfWLEQt+AC0d/ruqBsNHg
 SfZvXWV4vPXaNNVwdUmpyN1Ls7z0zyI9URF9z+aFR/v09/a2je39y/sAMeEUinBr/327
 F7sY6MoURdyUVjNOgOkZ8JYC5NbN3P2VZKhjEom1QfYlNt4Xo29pjXgwBrIMmARvk31c
 C+v2ryl+TMxfe5UujusGrKCyIWGX6gCfkDqvwkzmUBY5OBiWbnxtg9HvG6WPLvnm/oSV
 S/ObA/JKcBxHCYTE4oWfX8X7RCQFjh2HHdwqL9eLvT/U8TDA/bCX73Iv96jL8FWMN6Qu
 D86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756771987; x=1757376787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9AzoOdR6sJDHEcKW2yNQOC2NaWtXxFSPPgG0odQCnsE=;
 b=PbHBjkew/Y6QAqT0sFdN6oV5Il1jjCYOywbZd0SFZ1oI+jtqA8TFz5JbMCsuH0OXNa
 8U7AlYV1DWvrcXbJjYv962P6t9vZQznjtRtiKsMxRrEZ1zfQzkcdFecW/6ffBc/DeLPW
 k4E5PJIo53TAOWEoNEUwaaqatYa/tkHnpGWld/tWJtpOkpH+c9bfPzxwSDlz2DJr9zog
 nEV5ZSenvIG1hvlUlLPdj62VxZFs+1kTilrOTQ23kNewvSPHnzHGjif0hT7cTNuwDT4K
 Qm3ncrYLscKL37SUKxxSnSY7zUCk0ODXoEWyK4PmYHA/OutYZjUJqh8e+ZHevSExaYl8
 Xd2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbhw5FRyg4jlsN0D1XFL10aHsuKKuo3ofMkGjvH2qcAEFsMPpOSd4vrX9nCtb8CFDX8UtAlVajWFoJ9A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwpAqW5Gg/8QJhhyMQTANK6vrQvTxJiKiYOLKOFv28Uqpsr+tBY
 eXAWTFiRqjEzya9zlXB72UjjrB3O8fgzaU1/wpbc+pSDThbaxnONRa8O
X-Gm-Gg: ASbGncu35mDRUoL2iz4aCO2Iu6csq83v9AGlStj6Z14yWZ7PgKKIRkhoKziBlSaC9sj
 sOrmGZRKGAKKjaNvZP+rnZBHQ3yR/bkMRrnu2xu9/PRLZQxaIdnFv4lnTOwBXrVJk0yhOEgfyCb
 dDYpRochroguXUp6EUrTPhssmpM86YT/kGXhFPvJPbwsLvm6WkPt4gD/52TJrjs9iWxSH71P+7Q
 5+uowTXN7NIVDol054j4fmopLkHUAiZSfEBThpN1O45gTSvACYi2OCIaVLwZH1gHgszI8wrNW2c
 j3NpqkNuHUiyGDR6XOV0+Zu62pWD0GHzC+wkXVfkJILDnnOZJi31R7EpyP8BESJEcqMgu4q8FgC
 9Nw7HUPlfReVYHWRnu6ritnzhqLTvyXvaV0Cvx+NCPbF8CmuP6mmaLkqy
X-Google-Smtp-Source: AGHT+IE3uKhYEY1h+tUV59URGGBQIgTcoq1CY3L+zPFZ/Z3aqPfVSo0apPvIpocUjyJSk/XhqU4+ug==
X-Received: by 2002:a05:6000:248a:b0:3d9:a7b3:1b05 with SMTP id
 ffacd0b85a97d-3d9a7b31bfamr745722f8f.25.1756771986610; 
 Mon, 01 Sep 2025 17:13:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 17:13:05 -0700 (PDT)
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
 Russell King <linux@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Date: Tue,  2 Sep 2025 01:12:59 +0100
Message-ID: <20250902001302.3823418-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: dwmac:
	Increase 'maxItems' for 'interrupts' and 'interrupt-names'
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

Increase the `maxItems` value for the `interrupts` and `interrupt-names`
properties to 19 to support additional per-channel Tx/Rx completion
interrupts on the Renesas RZ/T2H SoC, which features the
`snps,dwmac-5.20` IP with 8 Rx queues and 8 Tx queues.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 4e3cbaa06229..578553840c9e 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -118,11 +118,11 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
 
   interrupt-names:
     minItems: 1
-    maxItems: 11
+    maxItems: 19
     items:
       oneOf:
         - description: Combined signal for various interrupt events
@@ -134,9 +134,9 @@ properties:
         - description: The interrupt that occurs when HW safety error triggered
           const: sfty
         - description: Per channel receive completion interrupt
-          pattern: '^rx-queue-[0-3]$'
+          pattern: '^rx-queue-[0-7]$'
         - description: Per channel transmit completion interrupt
-          pattern: '^tx-queue-[0-3]$'
+          pattern: '^tx-queue-[0-7]$'
 
   clocks:
     minItems: 1
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
