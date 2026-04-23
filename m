Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AxVIaOG72lPCAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDBE4759E5
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E85E8C5EC44;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5C97C8F26B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2026 09:08:29 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260423090828euoutp02614ccf7f9e12facce8eacb844150adb6~o8T_w4bGt0346703467euoutp02u
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Apr 2026 09:08:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260423090828euoutp02614ccf7f9e12facce8eacb844150adb6~o8T_w4bGt0346703467euoutp02u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1776935308;
 bh=wDBCWCKH25r3rzgbP56Jfhz7Hk9W93MZ0Xv826+RJBw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N00BaMEHjfQ8ysK/zJO0guD2i953Z2z8NHQqo5I2qmfPJrM9w5C539OBF6OFyef5E
 d6TnEiVWxfHYQ1ztF5WqbkkDa+A9KMVyzjkS7a+cfGkfgsl2w76a+RPB/bAFiYHo9Z
 Ehn/Js6B/jr+nyAGlWIYhnM403tgH2ym0Wv/R1m0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260423090828eucas1p204606b1be37253296ac938bad852e8f4~o8T_JYoD82360223602eucas1p2l;
 Thu, 23 Apr 2026 09:08:28 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
 [106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260423090827eusmtip2f7824fdaa66107f46994835bd820dac6~o8T9sjupi0699706997eusmtip2L;
 Thu, 23 Apr 2026 09:08:27 +0000 (GMT)
Date: Thu, 23 Apr 2026 11:08:24 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <aenhiHCZge2dMBFw@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <52b06f0a-8283-4903-9d8a-2bbdf637dd5d@lunn.ch>
X-CMS-MailID: 20260423090828eucas1p204606b1be37253296ac938bad852e8f4
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_"
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
 <20260421115008.2690541-1-j.raczynski@samsung.com>
 <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
 <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
 <f1d51362-ca8f-481a-b9c1-400ab6422686@lunn.ch>
 <aejYCYObZyFPpLat@AMDC4622.eu.corp.samsungelectronics.net>
 <52b06f0a-8283-4903-9d8a-2bbdf637dd5d@lunn.ch>
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq'
 -> 'tx_underflow_irq'
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
X-Rspamd-Queue-Id: 3EDBE4759E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[102];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[samsung.com:s=mail20170921];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[samsung.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.771];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,AMDC4622.eu.corp.samsungelectronics.net:mid]

------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 22, 2026 at 06:15:20PM +0200, Andrew Lunn wrote:
> On Wed, Apr 22, 2026 at 04:15:37PM +0200, Jakub Raczynski wrote:
> > On Wed, Apr 22, 2026 at 02:47:38PM +0200, Andrew Lunn wrote:
> > > > I don't see anything wrong with it?
> > > > - naming is correct, same as stmmac_extra_stats from common.h, as it
> > > >   wouldn't compile otherwise
> > > > - string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
> > > >   not close
> > > > - ethtool just polls data from driver and in my tests it is ok
> > > > - all instances of 'undeflow' are changed
> > > > - 'underflow' semantic is ok, 'undeflow' is just not correct
> > > > 
> > > > Please correct me if I am wrong, but imo no issues with this patch.
> > > 
> > > ABI
> > > 
> > > This name is published as part of the kAPI. You are changing its
> > > name. User space could be looking for this name, even thought it has a
> > > typo in it.
> > > 
> > >      Andrew
> > >
> > I don't think it is? This part of extra stats (struct stmmac_extra_stats) and
> > is not part of standard ABI from
> > Documentation/ABI/testing/sysfs-class-net-statistics
> > nor is mentioned in
> > Documentation/networking/device_drivers/ethernet/stmicro/stmmac.rst
> > 
> > These extra stats are specific to stmmac driver and most of these are more
> > than standard
> > https://www.kernel.org/doc/html/v7.0/networking/statistics.html#c.rtnl_link_stats64
> > This name does not exist outside stmmac driver, so while some application may
> > expect this (stmmac specific app), question is should this typo stick?
> 
> 47dd7a540b8a0 drivers/net/stmmac/stmmac_ethtool.c                  (Giuseppe Cavallaro      2009-10-14 15:13:45 -0700   81)     STMMAC_STAT(tx_undeflow_irq),
> 
> It has been exposed to user space for 17 years. In that time, there
> could well be stmmac specific apps using it.
> 
> Just because it is not documented as ABI does not make it not ABI.
> 
>      Andrew
>

Sure, up to you whether NAK or ACK this change.

IMO this name is specific to stmmac and should not be part of any app,
as monitoring tools should be more universal. When monitoring interface this
field will show some other way, via dropped packets and then you would use
driver specific fields for debugging.

Problem is, quick search on github shows this change propagated through
hundreds of Linux forks or different RTOS. But no public app using this found,
at least C app (but well, I didn't browse everything for obvious reasons).
Funny how typo will live everywhere and not be fixed.
So this change would make it differ from all the forks/RTOS'es that will
probably never fix this. So thats the downside.

Question is whether this should then remain that way forever?
And was it really part of some ABI if no one noticed?

Regards
Jakub Raczynski

------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_
Content-Type: text/plain; charset="utf-8"


------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_--
