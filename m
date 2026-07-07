Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DMHuA1M6TWpwxAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:41:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6671E5A1
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:41:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b="L/Y3F9RT";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 345B2C7C7E8;
	Tue,  7 Jul 2026 17:41:38 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB47DC7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:41:36 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260707174135euoutp016e2a174c1a3388b16f3c7fb59b1e8e8f~AEsZXR2gK0163701637euoutp01W
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:41:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260707174135euoutp016e2a174c1a3388b16f3c7fb59b1e8e8f~AEsZXR2gK0163701637euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783446095;
 bh=Q5JM7bNL+vvD39sKvHstP3GgCnVUZ9CKB+B+yeWlQEg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=L/Y3F9RTlHLo98VkCsSuh+UtR71ATMVFANv9mPj2yDBHZrlpg6+aRld7uyr/joUN6
 v0g+wmPShDE3aSnGD9TvS7mUCx6NsMP/sPQ/Gmz9rN47FQvmvwmBu74VwRhRc8Wnt6
 ehtqLK3NID0EkXo+RsrvbYXXtq1HcjYzsVMDipk8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef~AEsYmDoRO2783027830eucas1p2n;
 Tue,  7 Jul 2026 17:41:34 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
 [106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260707174133eusmtip1f584699ca9032f159ed4a173781ce399~AEsX6Tayo1541815418eusmtip1L;
 Tue,  7 Jul 2026 17:41:33 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Date: Tue,  7 Jul 2026 19:41:13 +0200
Message-Id: <20260707174115.1264466-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef
X-Msg-Generator: CA
X-RootMTR: 20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef
X-EPHeader: CA
X-CMS-RootMailID: 20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef
References: <CGME20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef@eucas1p2.samsung.com>
Cc: Jakub Raczynski <j.raczynski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 k.domagalski@samsung.com, k.tegowski@samsung.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 0/2] net/stmmac: Secure against failures
 of DMA memory allocation
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83F6671E5A1

This series fixing two possible issues related to fails of
__alloc_dma_rx_desc_resources(). Original issue from 1st patch is related to
page_pool that has happened in testing env, while second was requested by
Sashiko to have similar change for DMA allocation. 
To have complete fix for all failures of __alloc_dma_rx_desc_resources(),
merge two fixes into series.

---
Note:
1st patch "Set Rx queue page_pool to NULL when freeing DMA resources" is
set to v2 while this series is v1. I know this is inconsistent, but this
series is not v2 and would be even more confusing.
Hopefully that doesn't break some CI, as second patch is v1.

Link to original:
https://lore.kernel.org/netdev/20260630100953.747868-1-j.raczynski@samsung.com/

Changes in v2 (in first patch):
- Added reviewed by Maxime
- Dropped null check as page_pool_destroy() does provide that
- Modified comment to reflect that

Jakub Raczynski (2):
  net/stmmac: Set Rx queue page_pool to NULL when freeing DMA resources
  net/stmmac: Prevent dma queue NULL free on allocation failure

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
