Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aCDKJeyJRWrJBgsAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 23:43:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 236FE6F1E83
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Jul 2026 23:43:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=XZmWjkPn;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1761C56600;
	Wed,  1 Jul 2026 21:43:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83835C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Jul 2026 21:43:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D6286001D;
 Wed,  1 Jul 2026 21:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3321F000E9;
 Wed,  1 Jul 2026 21:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782942185;
 bh=vFwcgrMP51FdJfNWjgX6FQceDh7Uf7KWJsHpwmCExdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=XZmWjkPnZK3fkjIVsPg1IyLY5CsScRyUNdbZxQFLSIwscN+BYy+ERMpHK2ogQiuBz
 JeYxxPyvX+ovMYt6mij4IwrooXgbS3Hg7PYqCaRQVtdb+38SfNOWea/tNy7ipj9zTo
 de4wi6l5s5PfEFyoadMxTBRhuMOR60ag5jXs0CERFb8vZ5j77huBoi5sqWVSj2PH48
 UyIgW1Cts26zju64SNMXOLPN1dHnJ+LaZRTnLbREK9htdd5OnaDquZPMILdjsKthZt
 sXSaiHzHi/naigFUi+gLwh591pzvhUdUS/MwFSulvWA7aOJUWGIbJfoBcwOg/q6xJ5
 pz7IRow2H3DRQ==
Date: Wed, 1 Jul 2026 22:42:50 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Message-ID: <20260701214250.GD2108533@google.com>
References: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stm32-timers: depopulate child
 devices on populate failure
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
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 236FE6F1E83

On Mon, 15 Jun 2026, Pengpeng Hou wrote:

> stm32_timers_probe() releases the timer DMA resources when
> of_platform_populate() fails, but it does not depopulate any child
> devices that were created before the failure.
> 
> The remove path explicitly depopulates child devices before releasing
> DMA resources to avoid races with children using DMA.  Apply the same
> ordering on the populate failure path.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/mfd/stm32-timers.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> index b3dbc02aaf79..1f0aecae83a5 100644
> --- a/drivers/mfd/stm32-timers.c
> +++ b/drivers/mfd/stm32-timers.c
> @@ -329,8 +329,10 @@ static int stm32_timers_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, ddata);
>  
>  	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> -	if (ret)
> +	if (ret) {
> +		of_platform_depopulate(&pdev->dev);

It's strange to see an un-winder inside the error handling of its
original call.  We're used to seeing them called only on success during
a subsequent step.

Wouldn't devm_of_platform_populate() be better here instead?

>  		stm32_timers_dma_remove(dev, ddata);
> +	}
>  
>  	return ret;
>  }
> -- 
> 2.50.1 (Apple Git-155)
> 

-- 
Lee Jones
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
