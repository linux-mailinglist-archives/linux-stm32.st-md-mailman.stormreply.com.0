Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BrfKLXH6U2oqggMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jul 2026 22:34:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62F745D86
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Jul 2026 22:34:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=sntech.de header.s=gloria202408 header.b=ctJpl8nT;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=sntech.de (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF68DC7A833;
	Sun, 12 Jul 2026 20:34:56 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE096C58D7B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Jul 2026 20:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Mv2WgGTz6WKIqtoJnLFA34PaD05R6doIbVvqCh8lFG4=; b=ctJpl8nTmjSPbLdy7AePVUSEcT
 4SU8EprP9Zha+ttcLt3cuQ6gy3de/Nx2IcCVXn+Ur2u9z3rvkl0k85qyLgLVY3Isde/CeUCrsd4Ib
 ZAGsRB5w4feaOa1KpOapEuzihotjFf4UAmebxw8jth2ErWFcLeLdICBSs/HxLxu2KT0bd2x1bhxgg
 kpH4XNgIxuS3CrTuDcD+ixXLw0+mOhmX5xqlIHxbMm3SO6YH9aSsJWzGv0yIRh+LfTPiJOofmOqCZ
 JkrEQUEinoNIaL5LVIdgrMSih1NbP47hsBTnsMKfF99I/HNZvJ/kFVEWuFx8sSe4knQanm+KgzRJ9
 jwHO712Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Wu <david.wu@rock-chips.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Yanan He <grumpycat921013@gmail.com>
Date: Sun, 12 Jul 2026 22:33:57 +0200
Message-ID: <178388833980.1396294.8103967667500299878.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH v2 0/5] ARM: rockchip: rv1126:
	Add support for Alientek ATK-DLRV1126
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[sntech.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sntech.de:s=gloria202408];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:david.wu@rock-chips.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:Frank.Sae@motor-comm.com,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:grumpycat921013@gmail.com,m:devicetree@vger.kernel.org,m:heiko@sntech.de,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,rock-chips.com,gmail.com,foss.st.com,motor-comm.com,armlinux.org.uk];
	DKIM_TRACE(0.00)[sntech.de:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:from_mime,sntech.de:email,sntech.de:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2B62F745D86


On Mon, 06 Jul 2026 17:14:40 +0800, Yanan He wrote:
> The ATK-DLRV1126 board consists of a CLRV1126F core module and a
> DLRV1126 carrier board. The core module contains the Rockchip RV1126
> SoC, eMMC and RK809 PMIC. The carrier board provides Gigabit Ethernet,
> SD card, AP6212 WiFi and Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and
> audio connectors.
> 
> This series adds the Alientek vendor prefix and board compatible, updates
> the Motorcomm PHY driver to consume an optional external PHY reference
> clock, adds missing RV1126 SoC description pieces, and finally adds the
> CLRV1126F core module and DLRV1126 carrier board device trees.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: vendor-prefixes: add alientek
      commit: 068a6bd57167cb97058b08f22db0584fabdaab95
[2/5] dt-bindings: arm: rockchip: Add Alientek DLRV1126
      commit: f1522feb72aa5231532c9f69e7f5cc91972697e1
[4/5] ARM: dts: rockchip: Add RV1126 I2C5
      commit: 17bee9ee734e56d512ec7803eb7948adb56d1d9c
[5/5] ARM: dts: rockchip: Add Alientek DLRV1126
      commit: 44045aa7a9a9e6484617f44f77a3efb2d8e78565

Please double-check the sorting on future patches :-) .
The dtsi was perfect, but I did some re-sorting on the carrier-dts.


Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
