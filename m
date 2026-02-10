Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHshEahci2mYUAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 17:28:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6793311D285
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 17:28:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9A59C87EC0;
	Tue, 10 Feb 2026 16:28:22 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net
 (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30ECEC87EBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 16:28:21 +0000 (UTC)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id
 20260210162820cebb7208300002074f
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 17:28:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=sPP0Oz/1LcJ2dWkaUHEgPKlZBEdmg2TasEBz6nxriO8=;
 b=NONzSL45uoyKbwE6fE25ZyReRDaU14KXJOY0/YgjzHltwU+kTEw75HtLOvhtfKQHF+JDxE
 o4iKZ9ER7dzKg2yPhdfGobB4aYRd88UurZwlmBodLXI7bJYReECE7Yz/9vkrSXuBmgDVDrCh
 yThCKRqT4+x8YoDhMhgLwt0OHYEYh5LnkxtT6/skKomfcxJJ6moYYdNTGJ4Cp12yL36wqdUv
 wnhO0xcNykoR+2y6B7PxSJvRmBdD7dQ61dM/OU55DMj6ESEUzxpGxncTcQELq4E7knU+NMFs
 yVWjrbi24U+am/S6JySCuIpp1HSXEQaanO0JKjzehFZf0t+7HiNJWPxw==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Tue, 10 Feb 2026 17:28:13 +0100
Message-Id: <20260210-flo-net-stmmac-default-affinity-core-v1-0-4e76612444e1@siemens.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ1ci2kC/x3NQQ6CQAyF4auQrm0CCCR6FeOizLTSZChmZiAYw
 t0dXf5v8b0DEkflBPfqgMibJl2sRHOpwE1kL0b1paGt26FumhtKWNA4Y8rzTA49C60hI4moaf6
 gWyKj6zuhrhcerh4KNVJiHCOZmwpmawhlfEcW3f/fD/iRxnuG53l+AQH/7CCVAAAA
X-Change-ID: 20260119-flo-net-stmmac-default-affinity-core-c54fa45fe63d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
Cc: netdev@vger.kernel.org, Florian Bezdeka <florian.bezdeka@siemens.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: Fix MSI vector leak,
 make stmmac NUMA aware
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[siemens.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[siemens.com:s=fm2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:boon.leong.ong@intel.com,m:weifeng.voon@intel.com,m:netdev@vger.kernel.org,m:florian.bezdeka@siemens.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,intel.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[florian.bezdeka@siemens.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[florian.bezdeka@siemens.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,siemens.com:mid,siemens.com:email]
X-Rspamd-Queue-Id: 6793311D285
X-Rspamd-Action: no action

Hi all,

This are some fallouts of a quick stmmac "review", while trying to
understand some issues that we have around the IRQ spreading implemented
by stmmac.

The root cause turned out to be something more generic, so not limited
to stmmac. I will try to prepare a discussion starting point later. This
is more a RT specific problem, so I have to bring in more people.

Meanwhile I think it's worth to share some first findings.

---
Florian Bezdeka (2):
      net: stmmac: intel: Fix IRQ vector leak
      net: stmmac: Use cpumask_local_spread() for IRQ spreading

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 41 +++++++++++++++++++----
 3 files changed, 39 insertions(+), 6 deletions(-)
---
base-commit: 6d2f142b1e4b203387a92519d9d2e34752a79dbb
change-id: 20260119-flo-net-stmmac-default-affinity-core-c54fa45fe63d

Best regards,
-- 
Florian Bezdeka <florian.bezdeka@siemens.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
