Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id og+UJQg7TWqDxAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:44:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 227B571E5D2
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:44:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=KsmoXaci;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC1EDC01FB6;
	Tue,  7 Jul 2026 17:44:39 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 385DCC01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:44:39 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260707174438euoutp01c0554bbcc48f47d4d307148157c714ff~AEvEIAUQ52780127801euoutp01U
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:44:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260707174438euoutp01c0554bbcc48f47d4d307148157c714ff~AEvEIAUQ52780127801euoutp01U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783446278;
 bh=/V3IDsSnQjAP3/DFshVE1YPFZDzJBaRoz5Q/CBJ2mdU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=KsmoXaciTtDB6sClKMx7k4Z4SHwRLTGPVL+/+u6L9lm0XADBbKPkwOn6BgeK9PMT1
 wdh7CHhaqNtdraJ11IukdHnqO27Sf3gh3hU03aSjDEPBqzdOAV6yrpWT3Aa7+5bGnL
 yhHUMC3VDjFNigem6uE4oD5r+QIK72cm9bcjzz4g=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53~AEvDKjXIQ2942329423eucas1p2d;
 Tue,  7 Jul 2026 17:44:37 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
 [106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260707174436eusmtip2f88fbdd78f52216b16d2a8d14239ea38~AEvCEQoaf1514515145eusmtip2F;
 Tue,  7 Jul 2026 17:44:36 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Date: Tue,  7 Jul 2026 19:44:29 +0200
Message-Id: <20260707174431.1264520-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53
X-Msg-Generator: CA
X-RootMTR: 20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53
X-EPHeader: CA
X-CMS-RootMailID: 20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53
References: <CGME20260707174437eucas1p2cedaa017eea6cd5696535b17925a3b53@eucas1p2.samsung.com>
Cc: Jakub Raczynski <j.raczynski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 k.domagalski@samsung.com, k.tegowski@samsung.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/2] net/stmmac: Verify more wrong DTS
	configuration
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
	R_DKIM_REJECT(1.00)[samsung.com:s=mail20170921];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[samsung.com,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:j.raczynski@samsung.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:k.domagalski@samsung.com,m:k.tegowski@samsung.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[samsung.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:mid,samsung.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 227B571E5D2

Commit 8a7bca6de6de protected against possible wrong number of TX/RX queues,
which could happen with new XGMAC hardware that has more supported queues than
currently available in driver.
Sashiko mentioned that there should also be protection against zero input
and some AXI related config, as these are possible kernel panics too.
While this series has lower value than original patch, since this
misconfiguration should not happen by pure mistake, there is no reason not
to fix it.

Jakub Raczynski (2):
  net/stmmac: Protect against zero queue DTS config
  net/stmmac: Verify provided DTS AXI setup

 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
