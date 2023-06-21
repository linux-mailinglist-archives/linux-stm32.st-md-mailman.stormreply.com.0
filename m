Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D944737B50
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 08:34:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1D3CC6B45D;
	Wed, 21 Jun 2023 06:33:59 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CA8DC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 06:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=4VOK7DbRONHBrk2qH/bZ3tJ1RkaOOLIfT9l5aIDojGQ=; b=Fip/siLDGW1yKysPmHmLu5kghR
 0j2eBehSajEkFsB60bwx4Gv22DCp4pkQY6hoAUaFGjl6SETJfIWTp6lZAPWYKO/sB2gwka7TgDOav
 8a29sSPN1rqa1Uu6vAWCp3/O1tO1PlNKi7f/zIxqb1feaGMkteoa4Qrh97/6K7cxbjPOZTqeiLS/C
 4tas14qeCxY2Ds/CpNZPOPnqsX3z0lTXEGzCiDRg5fPHOZwV1fQalXi/5swbfAMjTHhsRniDi7l5j
 K6r5Af/AEOP23wJdepFXGkSStIJI+F9K6lrWItbmH1UOxRT9u5MvBydILZDd8buQp+oChUMUkl0U4
 /+K+zQMA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qBrPf-000MdV-0l; Wed, 21 Jun 2023 08:33:55 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qBrPe-0008i1-C0; Wed, 21 Jun 2023 08:33:54 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: a.fatoum@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 21 Jun 2023 08:33:37 +0200
Message-Id: <20230621063339.1361073-7-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230621063339.1361073-1-sean@geanix.com>
References: <20230621063339.1361073-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26945/Tue Jun 20 09:30:24 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 7/8] dt-bindings: arm: stm32: add extra SiP
	compatible for oct, stm32mp157c-osd32-red
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

Add binding support for the Octavo OSD32MP1-RED development board.

General features:
 - STM32MP157C
 - 512MB DDR3
 - CAN-FD
 - HDMI
 - USB-C OTG
 - UART

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 13e34241145b..55e45db1af26 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -143,7 +143,8 @@ properties:
       - description: Octavo OSD32MP15x System-in-Package based boards
         items:
           - enum:
-              - lxa,stm32mp157c-mc1 # Linux Automation MC-1
+              - lxa,stm32mp157c-mc1       # Linux Automation MC-1
+              - oct,stm32mp157c-osd32-red # Octavo OSD32MP1 RED board
           - const: oct,stm32mp15xx-osd32
           - enum:
               - st,stm32mp157
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
