Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F22DB1D24C
	for <lists+linux-stm32@lfdr.de>; Thu,  7 Aug 2025 08:09:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2D3BC3F943;
	Thu,  7 Aug 2025 06:09:46 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92472C3F93F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Aug 2025 06:09:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1ujtou-0001W5-S0
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 07 Aug 2025 08:09:44 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1ujtou-00CKXM-1r
 for linux-stm32@st-md-mailman.stormreply.com;
 Thu, 07 Aug 2025 08:09:44 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 476EA45250C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Aug 2025 06:09:44 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id B6DFC4524EE;
 Thu, 07 Aug 2025 06:09:41 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id b287dab0;
 Thu, 7 Aug 2025 06:09:39 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 07 Aug 2025 08:09:29 +0200
Message-Id: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABlDlGgC/42NQQ6CMBBFr0Jm7RhaLIIr72GIqe0UZkEhbSUYw
 t2tnMDle8l/f4NIgSnCrdgg0MKRJ59Bngowg/Y9IdvMIEupyqasMaaxkuMsFI5Poz1qazFQpIT
 GOHO5SlG9dAV5PwdyvB7tR5d54Jim8DmuFvGz/1QXgQJb2wjXGtnaWt1n8v07hcnzerYE3b7vX
 52D6/3HAAAA
X-Change-ID: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=dBTy/8+JrxokQ4xSHmojU5rylaxcvQQGcenu7LFj3ss=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBolEMbBIwx6KTVCmP4+ZFkh+ZEXOfVGQsPsSk9e
 1NTWpn+9HWJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaJRDGwAKCRAMdGXf+ZCR
 nAzLB/4xr+zbeYmKkhfYMQD6E2ANXZMEPkDKdmNqom6qvgZYi0qOEmKhoZZR5W37ozkQnS0ZmLn
 iKTOvy8wBaYFn+Dy7pgSAuO5BX5U/98rf65NjFFrb8WxXKJJxPND+qPZqDlp2+RD3zI06RVvIw8
 z5I8XcF/CGyzGCz6GVnYXcWof5cUQAn//BqJ5zPUHR73TYoLHjLCPMHDeVw6Pqfy7/7dbVcna/i
 7JoC3puZ1dvpou6HkEyzDm4dudhdhi/yAc0oypJVZrw7YnibPZxLuVfOP+tgKRtiEO5KgAv/NZV
 oXc2y239HSTb8zQPSj5+alBkj5y2UFZWmX/Zwtsk6EDGz2tX
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
Subject: [Linux-stm32] [PATCH v2 0/2] can: m_can: document and add external
	reset
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

The m_can IP core has an external reset line. Update the DT bindings
documentation accordingly and add it to the stm32mp153 device tree.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
Changes in v2:
- add dt-bindings update as 1st patch
- move stm32mp153.dtsi update to 2nd patch
- Link to v1: https://patch.msgid.link/20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de

---
Marc Kleine-Budde (2):
      dt-binding: can: m_can: add optional resets property
      ARM: dts: stm32: add resets property to m_can nodes in the stm32mp153

 Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 3 +++
 arch/arm/boot/dts/st/stm32mp153.dtsi                       | 2 ++
 2 files changed, 5 insertions(+)
---
base-commit: 1a32f7427eb3d1248bc64cd745b93f88cc838933
change-id: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3

Best regards,
--  
Marc Kleine-Budde <mkl@pengutronix.de>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
