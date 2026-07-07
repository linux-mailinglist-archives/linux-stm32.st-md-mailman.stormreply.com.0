Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iVsPLlU7TWqYxAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:45:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F41271E5F8
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 19:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b="se/0Ogn5";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E754C7A836;
	Tue,  7 Jul 2026 17:45:57 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 922C0C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:45:56 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260707174556euoutp027e8d7fce9749fea57d596f3617dc068f~AEwMMvEn91975119751euoutp02w
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 17:45:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260707174556euoutp027e8d7fce9749fea57d596f3617dc068f~AEwMMvEn91975119751euoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783446356;
 bh=WgQu9L7j9OBb7t7iHJoxCQB38xuGz728zo4Ep+7BnWw=;
 h=From:To:Cc:Subject:Date:References:From;
 b=se/0Ogn5oNOEXZQx8AQFkm4+U8AuS8l9SYu8JX+QgNIu7r5Ro3bB3qFMtm1RQs6iX
 R6U51xqYZZPvumwdzPupFz9o8j8Wt3agUP3fj7gRsAmtpnGt03TZf5toMoWG5sEZVq
 pUwKhk3umqPCqnZTzhg80tY+3Ylrd0DecKa5Bl0c=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c~AEwLZVOtI2928229282eucas1p24;
 Tue,  7 Jul 2026 17:45:55 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
 [106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260707174554eusmtip2eb6f48a3c36fb6ce749dd9fd23dd9ab7~AEwKvfykK1463414634eusmtip2Q;
 Tue,  7 Jul 2026 17:45:54 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Date: Tue,  7 Jul 2026 19:45:49 +0200
Message-Id: <20260707174551.1264558-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c
X-Msg-Generator: CA
X-RootMTR: 20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c
X-EPHeader: CA
X-CMS-RootMailID: 20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c
References: <CGME20260707174555eucas1p231d122ef4cc791f59dd36cb78378954c@eucas1p2.samsung.com>
Cc: Jakub Raczynski <j.raczynski@samsung.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 k.domagalski@samsung.com, k.tegowski@samsung.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v3 0/2] net/stmmac: Fix panic during
 interface shutdown & apply STMMAC_DOWN flag
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,samsung.com:mid,samsung.com:from_mime,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F41271E5F8

When testing interface shutdown during XDP operation using stmmac driver,
we have encountered kernel panics, either poison overwritten or wrong
memory access, caused by XDP processing data after shutting down NAPI.

To fix this problem:
- Add STMMAC_DOWN handling to all XDP paths
- Change location of synchronize_rcu() to proper place
- Apply STMMAC_DOWN flag on interface open()/release().
  This flag is used for XDP only and does improve handling in edge cases

Proper order of ensuring proper XDP shutdown is already present in functions
from stmmac_xdp.c during xdp_disable_pool(), since XDP can still have
data with NAPI disabled, as disabling NAPI does not ensure XDP finish.
synchronize_rcu() must be executed after IRQ's & DMA channels are disabled to
flush data.

---
Changes in v3:
- Discard almost all changes from v2.
  This was a mistake as napi_disable() does ensure napi_synchronize() and
  it didn't fix anything in the end.
- Return STMMAC_DOWN flag set/clear
- Create new function that executes synchronize_rcu() and call it from
  proper places
- Remove synchronize_rcu() from stmmac_disable_all_queues()
- Remove barren stmmac_disable_all_queues() and replace it with
  __stmmac_disable_all_queues()
- Fix memory leak in STMMAC_DOWN handling in modified XDP paths

Changes in v2:
- Split patch into two: one for XDP paths and second for general fix
- Change commit messages & title
- Fix all cases of NAPI release, not only XDP, via modyfying
  stmmac_disable_all_queues() instead of separate later call
- Drop setting/clearing of STMMAC_DOWN flag in release()/open()

Link to v2:
https://lore.kernel.org/all/20260601163258.554300-3-j.raczynski@samsung.com
Link to v1:
https://lore.kernel.org/all/20260511165045.3091475-1-j.raczynski@samsung.com


Jakub Raczynski (2):
  net/stmmac: Check for STMMAC_DOWN flag in all XDP paths
  net/stmmac: Fix free-after-use panic when interface goes does with XDP

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 ++++++++++++++-----
 1 file changed, 31 insertions(+), 9 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
