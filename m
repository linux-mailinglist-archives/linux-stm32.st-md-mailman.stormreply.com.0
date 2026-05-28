Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FywEulXGGoQjQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 16:57:45 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D52345F4078
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2026 16:57:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F49EC8F28E;
	Thu, 28 May 2026 14:57:44 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1AF6C87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2026 14:57:43 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260528145743euoutp02f83da26316059220c5c78d6eb67df6e5~zwp5Vsd2m3003530035euoutp02h
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2026 14:57:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260528145743euoutp02f83da26316059220c5c78d6eb67df6e5~zwp5Vsd2m3003530035euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1779980263;
 bh=r8mIV8ufMduGj/medyNOciSStQq0smXmRTboOYXyU58=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HDHcRRS+zBXh2RyGK8RBYXremq7uAMsJQPT3ALuD+w8siSGtXzjDaQ3bhWruX197O
 xyC4J3YkYQMuit/XJ4C+eTuvlS2dPdLil4iPMY3wYKrFX5Qxb36g/cyBUghhkZPUZC
 6QX0MguYU47hlos0PTUkTPeJfHoX/iLbe0+stZdg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7~zwp5GPv8W2557225572eucas1p2s;
 Thu, 28 May 2026 14:57:42 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
 [106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260528145741eusmtip2de8ddf36bc1db3efa926a8877ed46464~zwp4P6Aw61359913599eusmtip2b;
 Thu, 28 May 2026 14:57:41 +0000 (GMT)
Date: Thu, 28 May 2026 16:57:38 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Ding Hui <dinghui1111@163.com>
Message-ID: <ahhX4lIpHwhVekMc@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260526022620.501229-1-dinghui1111@163.com>
X-CMS-MailID: 20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="-----ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_"
X-RootMTR: 20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7
X-EPHeader: CA
X-CMS-RootMailID: 20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7
References: <20260526022620.501229-1-dinghui1111@163.com>
 <CGME20260528145742eucas1p25c5d23dd93d0946689a8867fd95c5db7@eucas1p2.samsung.com>
Cc: andrew@lunn.ch, open list <linux-kernel@vger.kernel.org>,
 xiasanbo@lixiang.com, Ding Hui <dinghui@lixiang.com>, "open
 list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 yangchen11@lixiang.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 liuxuanjun@lixiang.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix fatal bus error on
 resume by reinitializing RX buffers
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[samsung.com:s=mail20170921];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dinghui1111@163.com,m:andrew@lunn.ch,m:linux-kernel@vger.kernel.org,m:xiasanbo@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:yangchen11@lixiang.com,m:mcoquelin.stm32@gmail.com,m:liuxuanjun@lixiang.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,lixiang.com,st-md-mailman.stormreply.com,bootlin.com,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
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
	NEURAL_HAM(-0.00)[-0.496];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D52345F4078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

-------ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 26, 2026 at 10:26:17AM +0800, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> +		} else {
> +			/* Theoretically unreachable: napi_disable() in
> +			 * stmmac_suspend() ensures all initialized slots
> +			 * have a valid page before we get here.
> +			 * Defensive check only.
> +			 */
> +			if (!buf->page)
> +				continue;
> +
> +			stmmac_set_desc_addr(priv, p, buf->addr);
> +			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
> +						 priv->sph_active &&
> +						 buf->sec_page);

It this generally sufficient?  Or, in fact, isn't that overkill?
stmmac_rx_refill() generally does a bit more preparation of descriptors.
The issue seems to be that during suspend there is mismatch,
caused by writeback format, between rx_dirty and rx_cur pointers and
there is bad handling of this case, since there is no verification
of leftover stuff and there will be leftover bad address crashing platform.
So stmmac needs to refill/reinit descriptors that were consumed but not
refilled. So isn't going through whole dma_rx_size overkill?
Wouldn't it be better to iterate over buffer from cur_rx as long as descriptors
are 0 and only apply refill to those corrupted?

Could you paste panic that occurs during this issue?
You mention "fatal bus error" which I would assume is system panic?

Thanks

BR
Jakub Raczynski

-------ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_
Content-Type: text/plain; charset="utf-8"


-------ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

-------ovPTPTVSqDshbadlcck0r4M7-N_rZ7qlFcbt45lvJNOWX_g=_b9169_--
