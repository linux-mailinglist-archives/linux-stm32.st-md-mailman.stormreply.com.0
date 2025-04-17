Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14779A916A7
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 10:42:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE100C78F98;
	Thu, 17 Apr 2025 08:42:04 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7691C78F74
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 08:42:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43d0359b1fcso3398185e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744879323; x=1745484123;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
 b=hBO11bxJlhVVYzs3+4b5JlUA1THCqMApX2LMzD7mNeenEEEW0PFO/JHUUpI3GmZ607
 iXnKKJsTFruTcT3ahwbcNtwkZg9Ha+oaxyttWNAQc7pQuxhHAj3MaJwXNjUDMhU0unPo
 nG8JLrbcG0fmb6i/6mqt9NATFM1kWb+SkMnfov550w0+OAEBOQF7tPMzo5PQYGaZBD+c
 QXKIh+SDJ+nekJfRFsYcNGZku/+dJIcSK1h4ZRsuHVL5fKoIOFpX++41hebf5KBcafxm
 tx7sCIh6+L/iCFjFPHretGMy3a/Mlvv3Q8VsLsNvd6efIusEAySMUIl40rXSjoag4FSB
 fM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744879323; x=1745484123;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TBtNXmS8qjturrEwGtpAmFAuM6DgmNGXr8LZo+XU2no=;
 b=AeDGzzvzAxBvbp29UVJ8laUUVFcZjzj7BrQpSMXt4g61NhdI92sM8S7/oQhHwCJUkD
 SI4yXBdjjVF2iAAV4Jox0WnL3WNfYFgRUaexmySQCkdyIvLwei6sQI3BUv+jugL1B25Q
 Uj/kTptZeMpMaVH0p5FLiL8mP7NLM/vCIzbd/JYSX3TEs3mDihjwG/XsUlqbqi2HmERZ
 YJY0qgj+P72MsH05Caw4379Cgns7SfCVVg5+qUuCKSsd4xxbKlKf6s/5nHi442KBtV4u
 QNseoRVgdiqYkvQENjnK/WgTEbvGovAqDiiitv2rS4BTHeDdPTsnza0UIFH5VriNysez
 dq3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+G0lYCvsNPlOf1KoeZ3dtB5ziVv4W6AswLgs6CIddfGrrTJHspTHxu8gFdtuGVyoOR87ibHX3DsZz4Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YysJZRH8jtfHlfKUYF43fgPrF+pAnCLUPbJT3PU1be+xN0yuNzP
 L82KjoUdV5s0cYFlT8wij+0iQ0Z0VwbjkQpjIWRLI+kIaULQ+8ab
X-Gm-Gg: ASbGncuVTTH1TvVJ2aihX9YKscsTy5FrFmwZGpvX7tXVZGY8e0EuwKUMrJ+E9s4HsqK
 c9lKFTuT06rLTjSb0DbmW4RWitGTdqdrb64chfQUVAuRs7ZGTr5/CRUi3e8oyAmjt9TG/y2dPqs
 wUQt1xw5JNFRx4VjozgsBUvQIc4q/+Y3PGdG+UJ0OybscUgXo8OKBHmOdBWWgD4QzwqcUsIR6oz
 1P4M54Cxwdqrfs+EXc0se1DhOVU5b5OKIneaiGHSvgiU5m2k6tN3LMFGrPnrZn3aLfdhfk7cg01
 SdQVUKA/aG98Bib2cieY5OD4gp3vUNIh8C8TOxNZXv2oqGJVEJ28SqSqRjss2zTh
X-Google-Smtp-Source: AGHT+IFhbogSv22y1O3lHsGjfla1/G8RQGwFtOudU0ddZpLH9ImE2NvEPhJVSxI+e+uL8StCh9oEEA==
X-Received: by 2002:a05:600c:8711:b0:439:8490:d1e5 with SMTP id
 5b1f17b1804b1-440634ad300mr16770745e9.4.1744879323027; 
 Thu, 17 Apr 2025 01:42:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 01:42:02 -0700 (PDT)
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
Date: Thu, 17 Apr 2025 09:40:15 +0100
Message-ID: <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 4/4] MAINTAINERS: Add entry for
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
