Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gKX1FUavTmp+SQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 22:12:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF372A1FE
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 22:12:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=l17znRXq;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A78FC7A832;
	Wed,  8 Jul 2026 20:12:53 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 160F5C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 20:12:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260708201251euoutp02810a89166fc8dd9d245149e2898e00c9~AaZv3IE-t2611226112euoutp026
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 20:12:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260708201251euoutp02810a89166fc8dd9d245149e2898e00c9~AaZv3IE-t2611226112euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783541571;
 bh=sWv5LKxiCTQpIMVM+IVYcM4I7ORaawMDktpdHx4zPLU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l17znRXqJBIpPf6cjjGr1Q32ku3S781rc6bjt782uZXTBbEmU3c53fkGu8k+TsCC9
 P0h7MIxa8mP4QLutbd8hUVPvLNwK0yT2/EGv74rIq74fB/xOOYYgflbJ8IHmvBF5wc
 5Be2k21DK3b0BSfIzh/CqTNx+4hrbPsGswNll2Zs=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260708201249eucas1p1cabc72998ab7481e285fda2a90c938dd~AaZuwfJNL2208522085eucas1p1G;
 Wed,  8 Jul 2026 20:12:49 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
 [106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260708201249eusmtip220a824c2b3b58cd1a50f3f593e7a9924~AaZuEZM9B2195521955eusmtip2B;
 Wed,  8 Jul 2026 20:12:49 +0000 (GMT)
Date: Wed, 8 Jul 2026 22:12:45 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Message-ID: <ak6vPffCx2OYqWYW@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260707174551.1264558-2-j.raczynski@samsung.com>
X-CMS-MailID: 20260708201249eucas1p1cabc72998ab7481e285fda2a90c938dd
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_"
X-RootMTR: 20260707174556eucas1p141142a61e5669032194f9eedf6393895
X-EPHeader: CA
X-CMS-RootMailID: 20260707174556eucas1p141142a61e5669032194f9eedf6393895
References: <20260707174551.1264558-1-j.raczynski@samsung.com>
 <CGME20260707174556eucas1p141142a61e5669032194f9eedf6393895@eucas1p1.samsung.com>
 <20260707174551.1264558-2-j.raczynski@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, k.domagalski@samsung.com, k.tegowski@samsung.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 1/2] net/stmmac: Check for
 STMMAC_DOWN flag in all XDP paths
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
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[samsung.com:s=mail20170921];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:k.domagalski@samsung.com,m:k.tegowski@samsung.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,samsung.com,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[samsung.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,samsung.com:from_mime,samsung.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DEDF372A1FE

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 07:45:50PM +0200, Jakub Raczynski wrote:
> Currently STMMAC_DOWN flag is only set/cleared by stmmac_reset_subtask(),
> to notify driver to stop processing of TX/RX frames. One of these processing
> paths is for XDP, but it is only ever checked in stmmac_xdp_xmit(), which
> leaves all other XDP paths vulnerable to processing data while interface is
> restarting.
> 
> Make verification of STMMAC_DOWN flag consistent by applying check to
> all XDP paths.
> 
> Fixes: 8b278a5b69a22 ("net: stmmac: Add support for XDP_REDIRECT action")
> Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
> Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
> Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
> ---

Sashiko AI gave review that has valid points, patch needs changes.
Please drop it

--
pw-bot: cr

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_
Content-Type: text/plain; charset="utf-8"


------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

------eLQjSWLrXY9-oLo2Anxe58pGrKtOPid212nTY8jU3vRtfcwP=_13ad52_--
