Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 368FDAA7281
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 14:47:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8F05C78025;
	Fri,  2 May 2025 12:47:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66616C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 12:47:08 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so1445487f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 05:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746190028; x=1746794828;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyZ+eLudmHh2VnqIodF574m3pdc+SuHZ5uWsOFJLCKI=;
 b=jQhJVb43J8xOaZHNG4ilaNSHjPHaxKezNQTxA8SDn9dmj5Ug2CI7DDcvEO0u64RLQB
 SxDwN3KdRjCgQtE3QrraIGxkqy7dN6tBsqvUxucuVMSAr+9+LY0sw3C7HIlDbc2Olv8J
 WtUucxJmjwb/K58n81F4v7I14P0P3hcFcVviBihUKj1yTjRb9POQ4EHTP96oihPsspT6
 eHvR82YoGOqR3wFTlBB3BYtkEWYGMxSsk5ZVCF2XKyM6fj/t3/O/MyCOt+4PBTvXZj4C
 YDcQydMEEoRhQ5yr/PfdhPLiQdo0yXEKKYY/5R/TLDsnTBPl8XkqxlzFP2HfLGWqYcs9
 9INA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746190028; x=1746794828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyZ+eLudmHh2VnqIodF574m3pdc+SuHZ5uWsOFJLCKI=;
 b=LaDGR8td2+qG0Y+VT0t4IiBx2YsO69mgYEYw4GORtX/KzQqcAlUmzEc61lT4dIaFYR
 43zsBF3nVn86e+RXRnLCyBb2G79cp9+pJch3HdHyM5yEoSMZZ3zzZLCD1qGNnPICECxQ
 oGtu4DLAmQCWvzrTidvNsm2b2PWFuAA5n2lkwmgmURNrzibGBq1wXrA9CsKWLKrgi0Pd
 Ol6xiwEesrp0dqrX0Kmgne4aFJ/9zla/cwnYvjmDgiES84HXwXgVayN5lNnKebFaCGoc
 NVYRjjSVDPhkZjbqdMBp2hc15KMI52a+gvyS0XHjkswnyPK/4et4pawLRbgDtH5edXsw
 o4WA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTxmyfTCldzYX6iUBVkZL8XCpQGSl6z47xoRfP+nBI05MR4jcCO/Ou7ZLkxctTOE/pkbVoQzueJDbb5g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwK9QDRD62KGRmYYqvibRIEwcYkr/O+EzdJ+RuaHr0aTp3fBBGG
 h0VB61K2DmOy7ZgYKiyGcXI+GOopRT+be4c5YT5qJ9/8Z4EzPhV7BwoAIy4z
X-Gm-Gg: ASbGnctyuTutvdWmBIth7kbicVBfXi+3V8qqjykykJjI7VCeKzSgQaWkMqqvp+SB9Zv
 r8JElVn7NBAh37axU2/YCGWLZbPywaE1IhmWlQkc9x4qTE4X++nXcvGuXcZlUT+IzCR1yVWDcQ7
 cLfIOvGQTQclcfYyw7tuu5QgCxYoh2hvPtP/6563sVZStfYL7M2qH3c70u3RnGCBJAbWfpNIOUJ
 cN/24DQsj58zg2+Zu93W471q6guwJ/ZB3bHgc6M6OYS8eS5i4lSY9IPAA353qvch9il3m/nFw3Q
 oQ1QIdy9JYEtI95rHKy3SVKWwrVq7orNp9NZMgx9pjQ3FnFO/J2SHX6DwfoJRZdE
X-Google-Smtp-Source: AGHT+IF6Cpj3okvDc4iC/5uUndp+JjODJdaRzI6e7QeAzCIjmBfAW7UuXi1BOJlw8WNGiV0/o+enjQ==
X-Received: by 2002:a5d:64e6:0:b0:390:e62e:f31f with SMTP id
 ffacd0b85a97d-3a099ad2f9cmr2204754f8f.3.1746190027748; 
 Fri, 02 May 2025 05:47:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 05:47:06 -0700 (PDT)
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
Date: Fri,  2 May 2025 13:46:27 +0100
Message-ID: <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/2] clocksource/drivers/renesas-ostm:
	Enable reprobe for all ARM64 SoCs
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

Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
platform driver will defer and reprobe on any ARM64 Renesas SoC once its
reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
were covered.

By matching on `CONFIG_ARM64`, this avoids adding a new config entry
for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
are unaffected-they still use OSTM but do not define a resets property,
so the deferred reprobe mechanism is unnecessary.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert,
I've restored the Reviewed-by tag from v1 with your suggestions applied.
I hope you're okay with this.
Cheers, Prabhakar
 
v1->v2:
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..6a5785f9c9c1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
+#if defined(CONFIG_ARM64)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
