Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHmoMpND4WlErAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 22:16:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 781E0414840
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 22:16:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25E7DC8F264;
	Thu, 16 Apr 2026 20:16:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE977C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 20:16:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 86A4860127;
 Thu, 16 Apr 2026 20:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FA1C2BCAF;
 Thu, 16 Apr 2026 20:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776370576;
 bh=R/+DzOdGIK0mO9G5ivghTZXgfvc47/DKlFbEl1raOVI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pK43roZiQcqiQnjSJT7dagBUZfApCSNmUvHNa9llT8HcqXlgYEzYyd27qrRJrPD7X
 GXXLXxW+1p7EiiEFBTUCM1p/1lcQrFPDjrJJ35VNM7jh6Y/fk1dgcmGPYMMMAu/FLA
 szCyku3OH1MpQZrV7jsY1vacIUOavd1rD71L8pqSOCnztWZI5BSfn+4xdkXBsEonrk
 1p038auIwS7gTKSHpjKTfERlvzpuB5+vyATcjVIJXo81z8ygfL5+eRsi7L38eYixwz
 Ue03sIH+igCURCBehG83I9Qrp3CHojxZexJ2XgXeVZH838Vm7r4BVgtM00nEVXJBG9
 4CDX3fZdXcGtQ==
Date: Thu, 16 Apr 2026 13:16:10 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260416131610.1bf3bce2@kernel.org>
In-Reply-To: <aeE8mpXy9FRHvN9q@shell.armlinux.org.uk>
References: <aNKDqqI7aLsuDD52@shell.armlinux.org.uk>
 <5987484.DvuYhMxLoT@steina-w>
 <aeC-tc2CooYDoBok@shell.armlinux.org.uk>
 <2410317.ElGaqSPkdT@steina-w>
 <aeDSTIS9-TDSihbX@shell.armlinux.org.uk>
 <aeDojTdDTELfpT0X@shell.armlinux.org.uk>
 <20260416090826.1c5ca018@kernel.org>
 <aeE8mpXy9FRHvN9q@shell.armlinux.org.uk>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexander Stein <alexander.stein@ew.tq-group.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: move PHY
 handling out of __stmmac_open()/release()
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,ew.tq-group.com,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:alexander.stein@ew.tq-group.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.836];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 781E0414840
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 16 Apr 2026 20:46:34 +0100 Russell King (Oracle) wrote:
> On Thu, Apr 16, 2026 at 09:08:26AM -0700, Jakub Kicinski wrote:
> > On Thu, 16 Apr 2026 14:47:57 +0100 Russell King (Oracle) wrote:  
> > > The next problem will be netdev's policy over reviews vs patches
> > > balance which I'm already in deficit, and I have *NO* *TIME*
> > > what so ever to review patches - let alone propose patches to
> > > fix people's problems.
> > > 
> > > So I'm going to say this plainly: if netdev wants to enforce that
> > > rule, then I won't be fixing people's problems.
> > 
> > Do you have a better proposal?
> > I'm under the same pressure of million stupid projects from my employer
> > as you are. Do y'all think that upstream maintainers have time given by
> > their employers to do the reviews? SMH.  
> 
> Are you really under the same pressure? I have one of my parents in
> hospital right now, and was in A&E yesterday afternoon through into
> the evening. I've been down at the hospital since 2pm today, only
> just come back to feed the other parent and head back down for what
> could be a long night. Then there's supposed to be an appointment
> that will take up to 3 hours tomorrow morning...
> 
> Yea, I'm sure you have the same pressures and worry from your
> employer - except my pressures are medical, looking after my parents.
> 
> Thank you for your lack of understanding.

Not my point. Sorry to hear about the issues you're facing.

I don't think making vague complaints about the development process
is going to make anything better.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
