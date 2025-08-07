Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F74B1D24D
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 08:09:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A21DEC3F93E;
	Thu,  7 Aug 2025 06:09:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9016EC3F93E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 06:09:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1ujtou-0001W6-Vg
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 07 Aug 2025 08:09:44 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1ujtou-00CKXP-2F
 for linux-stm32@st-md-mailman.stormreply.com;
 Thu, 07 Aug 2025 08:09:44 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 5EDA545250D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 06:09:44 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id D72C74524EF;
 Thu, 07 Aug 2025 06:09:41 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 0258dc56;
 Thu, 7 Aug 2025 06:09:39 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 07 Aug 2025 08:09:30 +0200
MIME-Version: 1.0
Message-Id: <20250807-stm32mp15-m_can-add-reset-v2-1-f69ebbfced1f@pengutronix.de>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
In-Reply-To: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=767; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=iej0cdjc27k6Bz33u+4F6cGRHPmWzI4nQIndAd+/u4o=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBolEMeg2lxWTBq3MMvHt25j9u6XXC9I/VkjDdGX
 k/6brPbb9eJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaJRDHgAKCRAMdGXf+ZCR
 nDcfB/46rZcF18AjrXct7AOwzpzUrbFpJPu1JY0dGrhO/g5HBMLJSzpesMYyGxb563gu1Zmh1mR
 xx4xFP3yX7WGilhlxg6wBNSLjoTcMZPy9Tkjuzp55DukC9ZzGJ9DZupfM5ShEykfDIX5VhkkHsM
 mkxUjouLtJt7nt7+M5B9ce0TVLayuf+7BA+cfz4rF9gSdosCXLp5iAwSzxvuvS298zbX2SNxVOX
 M/sqxqPmllLpRIRXKHLiDsvzlEoOSX9dTon8FZZU7PMdz/k7heI8SAOfNBvKg2zJpphKQjSUNLj
 EUwxPLtVM1zI3NvftYu2DsX3zRjSFdknETy1ahWklUxW2Ie6
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-binding: can: m_can: add optional
 resets property
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

The m_can IP core has an external reset line. Add it to the bindings
documentation.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index c4887522e8fe..61ef60d8f1c7 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -50,6 +50,9 @@ properties:
       - const: hclk
       - const: cclk
 
+  resets:
+    maxItems: 1
+
   bosch,mram-cfg:
     description: |
       Message RAM configuration data.

-- 
2.47.2


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
