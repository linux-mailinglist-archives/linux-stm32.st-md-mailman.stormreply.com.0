Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F9789C9D
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Aug 2023 11:29:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0217C6B452;
	Sun, 27 Aug 2023 09:29:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52717C6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Aug 2023 09:29:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3947262AF4;
 Sun, 27 Aug 2023 09:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0200C433D9;
 Sun, 27 Aug 2023 09:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693128544;
 bh=3H/C787IUUTONRgCHUAFunTHHLv9u+5ZpTBnpCOyCHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TYKmeQgbEOQh8IKiqgQjAimBbboRM9Qxfu+NAuYNdwv+ig/vI2jwQ5Zc0Hb91OAKm
 yYIL06xUZp92dTRw8WqVlc0uDele9Nxdxq4eUXjhA9gMvqF0CewLSdBBy+OoBhpX72
 Vdx7evBjHKVyPXtoabWrPbq3rafGctKwQd+rFl/QuHJ+b4IRpVicq3PscxIRN4OL75
 4e7bHWcf4QgEz8Zat1wSHU8Q9dSZewA0KaugWGNT+dPNM6m9+G1Gy0RehOHpMv1pPF
 q3DfKfEcXPQj+nc84IWeLO1SaIHLW84K2qW8wMshHBGgKiPJosBO4IRb4unenXUx+h
 XgaeZOYPQN0rQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime@stm-ict-prod-mailman-01.stormreply.prv,
	Coquelin@stm-ict-prod-mailman-01.stormreply.prv,
	Simon Horman <simon.horman@corigine.com>
Date: Sun, 27 Aug 2023 17:17:08 +0800
Message-Id: <20230827091710.1483-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230827091710.1483-1-jszhang@kernel.org>
References: <20230827091710.1483-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 1/3] dt-bindings: net: snps,
	dwmac: allow dwmac-3.70a to set pbl properties
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

snps dwmac 3.70a also supports setting pbl related properties, such as
"snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddf9522a5dc2..b196c5de2061 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -586,6 +586,7 @@ allOf:
               - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
+              - snps,dwmac-3.70a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
               - snps,dwmac-5.20
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
