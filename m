Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C890947794
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Aug 2024 10:54:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00F64C7801D;
	Mon,  5 Aug 2024 08:54:16 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CEE0AC712A1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 17:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1722620301;
 bh=yAlTnGU4w8bJ9MfhSOqijWWEGEsFRjOGvMDeEAH/2lU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B2M71UeZS/1//8rW6T+vwT/iJ4wzxF3WXs00mOj/ck41ays+0tyBdWmetLcPcAten
 8sT17r3likqY6OidqjZa6hRTa7s6xdFnlfj1KfpvXMssOQQjFMJwN2vgDjvq93s3qO
 pMZ2LalbxvemDJZNicYObGNekIH82E76mxwi8GdcBD/+dwWgn7K9FlGqKUACHjPMw0
 rxeMpifLYMtJ9Tz9eOgymQINNS3zj4AOHKtRHixFvs8TgTcsCogFReCQIQF7EMjQAo
 iBxfo1PAZmifB2YmHCyQkxsuDau5J0L+EUsm0lvXRYZiCH87xFL6xAsM4O77jR5ay7
 WYRudslX+Bswg==
Received: from trenzalore.hitronhub.home (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: detlev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 75617378221B;
 Fri,  2 Aug 2024 17:38:18 +0000 (UTC)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  2 Aug 2024 13:38:03 -0400
Message-ID: <20240802173918.301668-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240802173918.301668-1-detlev.casanova@collabora.com>
References: <20240802173918.301668-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 05 Aug 2024 08:54:13 +0000
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 linux-rockchip@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Wu <david.wu@rock-chips.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] dt-bindings: net: Add rk3576 dwmac
	bindings
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

Add a rockchip,rk3576-gmac compatible for supporting the 2 gmac
devices on the rk3576.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 6bbe96e352509..f8a576611d6c1 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -25,6 +25,7 @@ select:
           - rockchip,rk3368-gmac
           - rockchip,rk3399-gmac
           - rockchip,rk3568-gmac
+          - rockchip,rk3576-gmac
           - rockchip,rk3588-gmac
           - rockchip,rv1108-gmac
           - rockchip,rv1126-gmac
@@ -52,6 +53,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3568-gmac
+              - rockchip,rk3576-gmac
               - rockchip,rk3588-gmac
               - rockchip,rv1126-gmac
           - const: snps,dwmac-4.20a
-- 
2.46.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
