Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB2AA5E7A
	for <lists+linux-stm32@lfdr.de>; Thu,  1 May 2025 14:37:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F224C78F88;
	Thu,  1 May 2025 12:37:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CBB99C78F99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 May 2025 12:37:19 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so5311965e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 01 May 2025 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746103039; x=1746707839;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgNFNroZGE50So2AWpgZdGIy0x5cNaOcuHUkn58CMQw=;
 b=c2bWIErwvYXNLwkvCR9Slq6Q7MFeJlEjDwapyoGK1pWNT40Ep4qzQMKuXXtrtvESFm
 gAkMV3xPqR7Omvxp3u++91LoZ7TYoyDvNto4AFvHXby2y5whHiZ2t7q/Fw7I3ME8l/hH
 7mng8tJh4+yDY15HfQ7Pi0AHuVz9GUXUaYGNSQdYqXZCVnNT8kO3k09DE1hXXrkl9IK5
 dSI+4ggMq2szYJ61HI3t+d4O7RZVSAmSiI7LYjnkVjO8khgofOcyess/67AnhGOLhIBw
 ymqhJPR3GZC4DMMA5mVOxowjiJA+PRFwkLTF6WlfdI2xnpJH5V3OylWw0ELk47Ee/cPi
 hzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746103039; x=1746707839;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgNFNroZGE50So2AWpgZdGIy0x5cNaOcuHUkn58CMQw=;
 b=L0GEybXxknRRgvw5pk/aIjPYsTwwhmcIoPfAxiVlgmke/2fPOOjHe118nfcYqsQsiu
 RvOH40foinUp+s9DsoI7XNrbpx0M73sSRVRlbsppPui5tuCN/zMAzihG06XznLOhl+ne
 AJcyi8AOykGAUO+rKd3tHz/CBh0mxuFkZIogzosXfVhlrQhFCGpY5aLjpT+fFpqA2PR6
 qWzRya5tKLc+6drsa3BCp3PrKh/6/PLKWwXeQdAbefQJjRsLxoRzz4Zre4iP+QKEzoUv
 e6iZdJVlywmfY7kTMyLa/8WnkO6YL48ACIPlPrmgWUkOvrWnFoVcn6RMppxxHpZQ8RG3
 g9tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVq1PMxJPuJwUCxVtanQmwRFTantmCYUyGAFPgVT6MrAA7ocKcFXwPtSOUGOKXa42kRJnNf60TiU1BI7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywy5kOoQo0xKhbSuoIWhnsqsdQITLWuHOIMmmsPNqK4EQj3emLQ
 +IR2mrXNQm5ey7Jeuj2CJRjk/vS54BwpoB6M5qdugI5JMRiKkKEw
X-Gm-Gg: ASbGncv2YEKnEtEFXZpRiDjTm+BWw80zUaeti8ejz595ZO66++EJTO1zAXo8yqPDylo
 rRzTO1AUYdtRGiA9VGnHaA3BwHUYeXIGSPCQuUWUoQIWdxSWu52N43wHSpXlDApQmCfUguS23xK
 kSNKEiESpx03yliQF8ijStSaXUydBsnrwBwyfs0NkssEGljVeCa9p2z+VuBT8Lt7h70K6AV6Lwa
 +6j8ku2rW3tfJsZoFUxGYxpmHlLNtg+SXHPFHFwXCbiK0wo7KU6b1yZpNibetioc06V0koPaVvv
 tk9TemwW7yVvqx9TQXsMzD6pnUSxzHU8aqlMoafOPrl8BOGkt11OXEcGx0qn0lOvde4WUNwMeJQ
 =
X-Google-Smtp-Source: AGHT+IGZmSJD1oy0UDx7tiBsVyBgeklEmdSHp8LD1zMwNv+uQkPtE63Em2e0OxJJDKeaXfUi9AR2yw==
X-Received: by 2002:a05:600c:5128:b0:43c:e6d1:efe7 with SMTP id
 5b1f17b1804b1-441b705a882mr13841645e9.26.1746103039065; 
 Thu, 01 May 2025 05:37:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 05:37:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Thu,  1 May 2025 13:37:09 +0100
Message-ID: <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm: Enable
	OSTM reprobe for RZ/V2N SoC
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

Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so that
the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Like
RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OSTM)
which requires its reset to be deasserted before any register access.
Enabling the platform_device probe path ensures the driver defers until
resets are available.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..c9919811542e 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
+#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || defined(CONFIG_ARCH_R9A09G056)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
