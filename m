Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hWg9Ks/7TWrNBAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 09:27:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5857229FB
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 09:27:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b="C8KSUpY/";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBB95C8F274;
	Wed,  8 Jul 2026 07:27:10 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 603A9C1A979
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 07:27:09 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260708072708euoutp01ee108455f1cb4f293a37afbe6b876d95~AP9MeCZFN0211302113euoutp01I
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 07:27:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260708072708euoutp01ee108455f1cb4f293a37afbe6b876d95~AP9MeCZFN0211302113euoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783495628;
 bh=AAT0vxHvZGnQFghigS3BsjoKQVyxGb6u1tpbTaYnWoA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C8KSUpY/JfVGmDRu7STwuADaSziCHaNIIg1/sjBVa/o2LhIGB2vi/x8rLiSD37/+P
 AsJTC2cxhc9t7lo1v9hzAt5Wbf5vAiBxaBUMYDdJYBxwHVSlg8iYZiuKIVnnITnGV5
 uWFPg3H7vc9UzQq6aaST3GlttX+WpMuJlX4wjFVc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260708072707eucas1p2dce9de593df0be3855839c4f41f61f2c~AP9Lj3STQ0421304213eucas1p2m;
 Wed,  8 Jul 2026 07:27:07 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
 [106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260708072706eusmtip1a9d4958030b6902d17d42dbb46221419~AP9KjxNiX1151911519eusmtip1i;
 Wed,  8 Jul 2026 07:27:06 +0000 (GMT)
Date: Wed, 8 Jul 2026 09:27:06 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ak37yhQjA32gI0kr@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <ee504cab-b1da-4584-8693-70ed5cd943c7@lunn.ch>
X-CMS-MailID: 20260708072707eucas1p2dce9de593df0be3855839c4f41f61f2c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_"
X-RootMTR: 20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056
X-EPHeader: CA
X-CMS-RootMailID: 20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
 <CGME20260707174439eucas1p153ea592df5c1c7a50e947022a80a1056@eucas1p1.samsung.com>
 <20260707174431.1264520-3-j.raczynski@samsung.com>
 <ee504cab-b1da-4584-8693-70ed5cd943c7@lunn.ch>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, andrew+netdev@lunn.ch,
 edumazet@google.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 k.domagalski@samsung.com, k.tegowski@samsung.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 2/2] net/stmmac: Verify provided DTS
	AXI setup
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:k.domagalski@samsung.com,m:k.tegowski@samsung.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,samsung.com,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[samsung.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[AMDC4622.eu.corp.samsungelectronics.net:mid,samsung.com:from_mime,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B5857229FB

------FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 07, 2026 at 09:04:00PM +0200, Andrew Lunn wrote:
> On Tue, Jul 07, 2026 at 07:44:31PM +0200, Jakub Raczynski wrote:
> > During parsing of AXI setup, there are few issues:
> > - 'axi_blen' array is uninitialized value on stack without zero-init stack
> >   configured. This can result in random AXI burst length config if
> >   DTS config provides shorter array than AXI_BLEN.
> 
> What does the DT blinding say about the length? Is it allowed to be
> short?
> 
> Are we talking about:
> 
>       snps,blen:
>         $ref: /schemas/types.yaml#/definitions/uint32-array
>         description:
>           this is a vector of supported burst length.
>         minItems: 7
>         maxItems: 7
> 
> So it should be 7. Are there any in kernel DT blobs which don't pass
> 7? Can we just error out when it is not 7?

Erroring would be fine, as wrong amount will pass.
Same as previous answer, I start to agree more and more that code should give
more errors rather silent fix stuff.
This is mostly Sashiko complaining but I have seen this being incorrect in
some internal forks.
But, as a code is currently written, this does not have to be 7 and
documentation is merely a suggestions. I doubt wrong DTS would pass to
mainline linux so it is merely 'internal' fix.

> 
> > - In case of failed memory allocation for AXI and error, there is no handling
> >   of that. Fix it by checking if AXI config is error and return if so,
> >   as this can only lack of memory. No AXI config, although is probably
> >   wrong in most cases, is not treated as error, as generic config is mostly
> >   provided in drivers.
> 
> This seems like a different fix. Maybe put it into a patch of its own.
> 

Got that.

> > Fixes: afea03656add ("stmmac: rework DMA bus setting and introduce new platform AXI structure")
> 
> Again, does this bother anybody? At least axi_blen issue seems to be
> that the DT blob is broken, so i doubt it actually does. Are there
> reports of memory allocation error and resulting Opps.
> 

Only internal and quickly fixed. No public reports.

BR
Jakub Raczynski

------FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_
Content-Type: text/plain; charset="utf-8"


------FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

------FoLMw5K6Fe9t5vMBf.HRV6LBdzA_42JMttv_zc4dtfIAKr8-=_130f8b_--
