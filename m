Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JXNsCccdU2rqXQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jul 2026 06:53:27 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A495743E74
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jul 2026 06:53:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=dxQi2WTu;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C79DC9AE40;
	Sun, 12 Jul 2026 04:53:26 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A782C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jul 2026 04:53:24 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2c6b67d5fa1so34850635ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Jul 2026 21:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783832003; x=1784436803;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Vtqux2brqZY3L9xWBvozGrzsW9R7W5/4mbtliRjhCrk=;
 b=dxQi2WTuWexL7mR4mGX5VbIHYuLlpkdrFOM1IExTIuVJekqqnA2j3H8rIKT5ie7usS
 rzqOHM8HksE8T26PWUlez1TLqjffqVg+YxlBD2AOtoQyceUS+yZg7KPXHfuHEO3lNqjd
 1/MhNI8/znx0AUdnnRQ4ZM1Ldg7REOlpn9AexIkxlDq9Z/+61Yp232+7TWOEHsNCz3MP
 EN3PMu0eNTOF+qRm8Evg95Dw1daOfgHA+G0nWtbU+BQpWP5a+q+raBw5fhcz8FZeTnU7
 7X5+8PhwQYXLm9w7w5A6/+n7xi9PO4jJHftpoIHbKVuO5/1hHiJCp7AMf+RXvbpDWJXk
 NPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783832003; x=1784436803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Vtqux2brqZY3L9xWBvozGrzsW9R7W5/4mbtliRjhCrk=;
 b=jcya701RTH8HSc+UfDI+dwLgHIZMQvThX4Jzw6NWyfMmfR1IIBjgKhGl3teIG9rRls
 6V/u2dAL2d3CIlRsapJdSoX8Kx/dAzqB8N0inoDuPeHpYrfR1J5Hn8Z31ZMvJ4tZmcyO
 TBnN7whp6Kdu3DwlCUFCHDNdSlgsvxy3+wG7IPvRDTT9Dz2gXdXFRzCqb4UQGm57Bk5/
 mCM+JQrKA88XUOPLKz53g5KtbnEvV5PrJSQYAfPAI28z++TXuqkJeKfTCraS7iNve0if
 GrVuHhfH/4io033xDOYAAyJ10wThbOBjNR4l2nWf8V+jzFvNTORK04eT075Dq1ijhvLY
 5BaQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqc4XokU6cWZ9Qp5pL79nDkT5sXQ+bBdy5X7IhyAJPN4okzHnsgbvB+Wc1EJtLkC/z9iV6Wfj4L3qww7w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5gJ6CQMLnHHqFQfjt5RN4fI8N+zfxJhZZc2brefCG8stXyZB+
 3RN+u8E0W3cStJC9o2oba9DH69+C52JrNiR4D+kHVB3KuilhxhwCOdDw
X-Gm-Gg: AfdE7cna1hZ+DK2IS1sYuo+BLtneyGDNVSX1P7l5FVakqR+SVmyhvnv2x6uZIulVO6u
 iJ64gJONuThdZuHcOwRdN8WpIJ0JmLN6n2DS17kjZB2fOaP1Z5I7fcNV7S2NqkNMEyLC7ZITWGz
 j/hxmbthZjGtox2JtWYyIOCNjzoHM55Ui0Av3xfBRxtsXb7pgIzebiJmH5AlXKBzPwaUaWTe6+H
 sp+ncvsaU7DVNuO6V+hqVezmBccj7c0xbk8tbm4IPsQR9X2LvBT8eXCq7s13lEpTAB9h29agJGa
 JgiAhmw21P3T6K0Bl4qNpbEqubtDn/3xv568WWzuLXtD6AaVq7nRWXAiOkLwWvT+SmyHit+iN3M
 Hd9yof/5cWqJWqV0Yy+QWHC19Qh+IlxlQ1nPXiOw7WdAXhpTLbsltUPXydHl2lKEEtR1CEW0BXE
 E=
X-Received: by 2002:a17:902:f68b:b0:2ca:1eef:5096 with SMTP id
 d9443c01a7336-2ce9f15ccacmr45287845ad.36.1783832002767; 
 Sat, 11 Jul 2026 21:53:22 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3da55sm81624355ad.71.2026.07.11.21.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 21:53:22 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Sun, 12 Jul 2026 12:52:33 +0800
Message-ID: <20260712045233.800748-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Cc: E Shattow <e@freeshell.de>, netdev@vger.kernel.org,
 Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Failed to reinit phy of spacemit-dwmac when
	reset-gpio is present
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:inochiama@gmail.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:davem@davemloft.net,m:kuba@kernel.org,m:pabeni@redhat.com,m:dlan@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:e@freeshell.de,m:netdev@vger.kernel.org,m:gaohan@iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,google.com,davemloft.net,kernel.org,redhat.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A495743E74

TL;DR:

The DWMAC on Spacemit K3 is failled to register phy after the reload
the driver module (rmmod then insmod). Because the reset-gpio is
asserted while unloading the driver and is not desserted before reading
the c22 id, which leads to a fault.

Description

In a few days ago, E Shattow reports he has sufferred the a weird issue,
when unloading the spacemit-dwmac driver and then reloading it, he got
the following error:

[   60.713071] mdio_bus stmmac-0: MDIO device at address 1 is missing.

This only occurs when reloading the driver but the first initialization
successed. After some function tracking, I found it is failed at reading
c22 id. The call graph is as the follows:

stmmac_mdio_register
	mdiobus_alloc
	of_mdiobus_register
		__of_mdiobus_register
		__mdiobus_register
		__of_mdiobus_parse_phys
			of_mdiobus_child_is_phy
			of_mdiobus_register_phy
				fwnode_mdiobus_register_phy
					get_phy_device
						get_phy_c22_id

By checking the difference between the initialization process and the
reloading process, I found the reset gpio is asserted in the function
mdiobus_unregister(). And there is no any function desserted this reset
gpio in the loading stage. And in the initialization process, the reset
goio is deasserted.

This bug report is sent as I found it is hard to solve this problem
and ask for help to fix this issue as it is related to the framework
instead of a specific driver.

The possible workaround I found is as the following, just use the phy
id in the compatible string (Confirmed by dlan):
---
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -196,7 +196,8 @@ &eth0 {

 	mdio {
 		phy0: phy@1 {
-			compatible = "ethernet-phy-ieee802.3-c22";
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
 			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
---
An interesting thing is, moving the reset-gpio to the MDIO bus level
does not solve this problem. Only setting the right phy id can mitigate
the problem.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
