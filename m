Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA797ED609
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 22:29:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B858EC6C837;
	Wed, 15 Nov 2023 21:29:17 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 286A9C6B47D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 21:29:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-408425c7c10so724025e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 13:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700083756; x=1700688556;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3p4zCP4pU6Jd5DKB3xx9Zwmjhwd0cEt27vibrvZH2uc=;
 b=Xkftw/NpkajggbkvhWPV+iIemAAtNDS8roE+1rdqBBAD45OqMtFkDfRfNV65Ko+uP5
 BHZQxTxKy0R/U10dCrVpYDj/FgpTjyI0pIH1UPzX8IunJIcBx6jVv3mZO/yIav4zEDvK
 N+22mXssF76dXBecCCXemsKjDvRNikIvFI3GehRo7EhHKmuU+4psOR/5XWYgDyn9sFMG
 zUEYapq1fQA0ID+FWge/V9wFg4I2N1Ito2wGB/QcqAKhPKhj0KyLfhhYdnkn1PvNMnvm
 7SJl7LrecEvqmLp5+q626d30y4eCT1QhQ9cWggm0KeqkR14EQmhEYExM9Cc/GiDsBXvX
 rrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700083756; x=1700688556;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3p4zCP4pU6Jd5DKB3xx9Zwmjhwd0cEt27vibrvZH2uc=;
 b=aAfcn4dzOLya4Um0V9RU46gr2fV/h+HS2K7A1QX40q27cJn6ljXjmy3ciX8Li7NsdD
 Kls0lM7gCjtUVQLciFP7uW6fSzhW9uEj/qrvGMx/aXXHpv0saXYEuYwHUn8zes/AUQ5w
 EJu5RvDZGDiCucGtmAf3VIYPOVuX/XhlvgzwHsdmt5avsNp3dhFe7AQxN47fusdHCZr5
 aqkwNRrY16p450d13L6H3xqNRBV+IuNusluwHppkVF9oVXGNNoPbvtSzq3D9xy4pg0L+
 JtB/y3noyFC08w4K5Yv2YReiBFUTauAmsrQM8execkYCpg/wusB1oKk4VJqm0OBpozBx
 Zsgg==
X-Gm-Message-State: AOJu0YzwicFKtm2nhlKTtcb08L09rtBGXLkFSa07VVGVeD0SVf2nucFS
 jYrkcVBgegBds1T9wPvGPEo=
X-Google-Smtp-Source: AGHT+IFlHfdE0QzX1nTBQOBcq9idiB3h4X5+9ha3O//W4lTlmpBYRnBfVQRYA0fF28aQCbzVoeEJxA==
X-Received: by 2002:a05:600c:6022:b0:409:c1e:7fe8 with SMTP id
 az34-20020a05600c602200b004090c1e7fe8mr11460736wmb.19.1700083756209; 
 Wed, 15 Nov 2023 13:29:16 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:e8e:4851:e049:93fd])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a7bca4a000000b00407b93d8085sm910631wml.27.2023.11.15.13.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 13:29:15 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Wed, 15 Nov 2023 21:29:08 +0000
Message-Id: <20231115212908.33131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm: Document
	RZ/Five SoC
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

The OSTM block on the RZ/Five SoC is identical to one found on the RZ/G2UL
SoC. "renesas,r9a07g043-ostm" compatible string will be used on the RZ/Five
SoC so to make this clear and to keep this file consistent, update the
comment to include RZ/Five SoC.

No driver changes are required as generic compatible string "renesas,ostm"
will be used as a fallback on RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 7207929e5cd6..8b06a681764e 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -23,7 +23,7 @@ properties:
       - enum:
           - renesas,r7s72100-ostm  # RZ/A1H
           - renesas,r7s9210-ostm   # RZ/A2M
-          - renesas,r9a07g043-ostm # RZ/G2UL
+          - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
       - const: renesas,ostm        # Generic
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
