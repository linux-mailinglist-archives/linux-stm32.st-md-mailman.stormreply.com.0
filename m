Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33331737B4D
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jun 2023 08:33:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3C5FC6B459;
	Wed, 21 Jun 2023 06:33:57 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3890FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jun 2023 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=yv++Yf2ZbIGL3PF2oiPv+AG+uNMkGKrSh2PCdGHPRfk=; b=U9PpIuwYivPyeZkZkAWTfmRv9I
 WBTLF4fGFH8wfdaRNRL4ROOoYzAwP9U8ORxtyQnIn2mcS0oPcmCZlcGsr85APJhh9ggdG7raq30vC
 QwJPXhKgxXMtvUkuZ7Cd1pK+moQqo5LPgkwVA5jD8JnbXdHjmYIsgiXSAxl4XQfK3qEKr+TvfrBIg
 311OSpjhqxcTHZ0FktdUfEi49yEDNjojT87HLhWO58Js/6QhNV8iqnjVx0LozPGEZEoX1fg32yeTg
 C8/HsP9M7j86ynIge+ahhC76wgmR4zb2sqOR2M+h8OMfORQxN6yf5vvrQ4i2RAbBxHHJWj/gyLCQ0
 j+VzJruQ==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qBrPc-000MdK-N2; Wed, 21 Jun 2023 08:33:52 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qBrPc-0008i1-3E; Wed, 21 Jun 2023 08:33:52 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: a.fatoum@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 21 Jun 2023 08:33:34 +0200
Message-Id: <20230621063339.1361073-4-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230621063339.1361073-1-sean@geanix.com>
References: <20230621063339.1361073-1-sean@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26945/Tue Jun 20 09:30:24 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/8] ARM: dts: stm32: osd32: fix ldo1 not
	required to be always-on
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

According to the OSD32MP1 Power System overview[1] there is no hard
requirement for the ldo1 to be always-on.

[1]: https://octavosystems.com/app_notes/osd32mp1-power-system-overview/#connections

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 arch/arm/boot/dts/stm32mp15xx-osd32.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
index a43965c86fe8..eb43a1e3a0c9 100644
--- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
@@ -117,9 +117,7 @@ v1v8_audio: ldo1 {
 				regulator-name = "v1v8_audio";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-always-on;
 				interrupts = <IT_CURLIM_LDO1 0>;
-
 			};
 
 			v3v3_hdmi: ldo2 {
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
