Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8CD8CD771
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2024 17:42:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49E44C6C838;
	Thu, 23 May 2024 15:42:21 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94027C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2024 15:42:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2F6BDCE1787;
 Thu, 23 May 2024 15:42:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E2EC32782;
 Thu, 23 May 2024 15:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716478934;
 bh=OtxukrI3lmyoMlT+l5Ie/gSVMik7bPQsqTVX7bxFcZ8=;
 h=From:To:Cc:Subject:Date:From;
 b=TmTOoMyjoDLo+ENuTeUkDEt6IzrGwVU7KAAkBBXE4Dz3Wx8insM0cZGNIDQc8vYDp
 kucJWipukZvKjZYEzdEAbI968h51Q+tWTIYJo0oj+zeXvOOoO8xxIlmoxva7TAOLf0
 N74FlMW2BbZ0xhQPpSM6zrPLB/pjzrdn+eo9ZQWweJ4endQV+ThtABs75DMy2hkF7N
 O821UKg5s4JqhsV80bEUc2EUe3lH85csw5sfIPjDEYFT4zfD8/JyMORGV6SVlpLhrl
 sWCZ3WXa81vne1n2zlkI1Xt456DO9J6lWr9+L58hhrWKiDLsYj/y3W+h2P1ZWdlMEq
 CCk8frkxQIQ4Q==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Date: Thu, 23 May 2024 10:42:07 -0500
Message-ID: <20240523154208.2457864-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: arm: stm32: st,
	mlahb: Drop spurious "reg" property from example
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

"reg" is not documented nor used for st,mlahb, so drop it from the
example to fix the warning:

Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@38000000: Unevaluated properties are not allowed ('reg' was unexpected)
        from schema $id: http://devicetree.org/schemas/arm/stm32/st,mlahb.yaml#

Since "reg" is dropped, the unit-address must be as well.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
index d2dce238ff5d..3e996346b264 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml
@@ -54,11 +54,10 @@ unevaluatedProperties: false
 
 examples:
   - |
-    mlahb: ahb@38000000 {
+    ahb {
       compatible = "st,mlahb", "simple-bus";
       #address-cells = <1>;
       #size-cells = <1>;
-      reg = <0x10000000 0x40000>;
       ranges;
       dma-ranges = <0x00000000 0x38000000 0x10000>,
                    <0x10000000 0x10000000 0x60000>,
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
