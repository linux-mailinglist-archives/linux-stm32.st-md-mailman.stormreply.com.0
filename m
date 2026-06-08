Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hOBVM0qOJmq/YgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 11:41:30 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C945654ACD
	for <lists+linux-stm32@lfdr.de>; Mon, 08 Jun 2026 11:41:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=CtDu0a8c;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08D16C5F1D4;
	Mon,  8 Jun 2026 09:41:30 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE7A5C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 09:41:28 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20260608094127euoutp027e4bd63feaa270a3da25959ba3cf84bf~3Eb6RRdWZ1369013690euoutp02R
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2026 09:41:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20260608094127euoutp027e4bd63feaa270a3da25959ba3cf84bf~3Eb6RRdWZ1369013690euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1780911687;
 bh=obEQVdyJXAFkEI0Je/LnT9feisCX7gXrGWaTmDNS/as=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CtDu0a8cImy5JxUjV9LlIN1j5eGanH+PqXyibLEZXNH9fJe274NoQAk/Q2h19A2Im
 7QyqlhJENEB6aMlSbzDiBLNNr6vHhfJ3ksGVoYNZQy2OCt9DlE9s9uTni76Rni1MPt
 LbC0RGfORp+p2SBwZJHvG/Z6YosO+MwklwkJR46I=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260608094127eucas1p1c139d6aec7fe2c8dd308e1885033ff6e~3Eb56fxPn2011920119eucas1p1x;
 Mon,  8 Jun 2026 09:41:27 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
 [106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20260608094126eusmtip2229735d838ef62408503f8ed036fe734~3Eb4yXZk_2588725887eusmtip2-;
 Mon,  8 Jun 2026 09:41:26 +0000 (GMT)
Date: Mon, 8 Jun 2026 11:41:25 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Ding Hui <dinghui1111@163.com>
Message-ID: <aiaORbb0lZVxDg8L@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260604144557.3175399-1-dinghui1111@163.com>
X-CMS-MailID: 20260608094127eucas1p1c139d6aec7fe2c8dd308e1885033ff6e
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_"
X-RootMTR: 20260604144752eucas1p180b6c1b783450a11e78584257e023f69
X-EPHeader: CA
X-CMS-RootMailID: 20260604144752eucas1p180b6c1b783450a11e78584257e023f69
References: <CGME20260604144752eucas1p180b6c1b783450a11e78584257e023f69@eucas1p1.samsung.com>
 <20260604144557.3175399-1-dinghui1111@163.com>
Cc: open list <linux-kernel@vger.kernel.org>, xiasanbo@lixiang.com,
 Ding Hui <dinghui@lixiang.com>, "open
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
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: fix fatal bus error on
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
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lixiang.com,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS(0.00)[m:dinghui1111@163.com,m:linux-kernel@vger.kernel.org,m:xiasanbo@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:yangchen11@lixiang.com,m:mcoquelin.stm32@gmail.com,m:liuxuanjun@lixiang.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[163.com];
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
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:from_mime,samsung.com:email,lixiang.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C945654ACD

------ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 04, 2026 at 10:45:54PM +0800, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> +	for (queue = 0; queue < priv->plat->rx_queues_to_use; queue++) {
> +		ret = stmmac_reinit_rx_descriptors(priv, &priv->dma_conf,
> +						   queue);
> +		if (ret) {
> +			netdev_err(priv->dev,
> +				   "%s: rx desc reinit failed on queue %u\n",
> +				   __func__, queue);
> +			mutex_unlock(&priv->lock);
> +			rtnl_unlock();
> +			return ret;
> +		}
> +	}

This is not directly related to the patch, but rather stmmac_resume() itself,
but doesn't this return and hw_setup one leave bunch of descriptor memory
hanging and effectively leaked?

> +
>  	ret = stmmac_hw_setup(ndev);
>  	if (ret < 0) {
>  		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
> -- 

Other than that, I don't see any obvious issues.

Reviewed-by: Jakub Raczynski <j.raczynski@samsung.com>

------ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_
Content-Type: text/plain; charset="utf-8"


------ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

------ri_B_5NHaOs85FNcStlWAa-YkdjA1OEu4E44JRLWFc1KTRWK=_126c1_--
