Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFXkBLWLnWn5QQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 12:29:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBC818649A
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 12:29:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 30319C8F286;
	Tue, 24 Feb 2026 11:29:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7E7C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 11:29:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C20E6132D;
 Tue, 24 Feb 2026 11:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 736CBC116D0;
 Tue, 24 Feb 2026 11:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771932592;
 bh=qae+KiV0H06twWryyZRy7nDOgPhLMz/Ho0BGykyklJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JDh5Dx0EpWIZ64bcRaZ27qvAnJXequ/LMJZm4dN0Hcri0QTx6R3nsCe/hglXvzRlr
 WsV9QiFJFmNxwfDwP+P9MdJWbU/RbK+hH2+Ajz+kDBw5bG1foZM5utHkfNHuIdEzYZ
 j1hxzKVTMDL19wu+McDjN2CYQ7kIPaf9m2E+UDGxMj6e1fcWAMkfNFBu6kqG0QKInx
 u2mOO18OtXEeSGxB2iFubpjCXq4Sf1Epo+TT75cKEoVtuInl1p6SJqZJv5aeFuTlCz
 QI5xiYYfC3bo/CXqbw/m+pJrOJohUKOS8BVi6dS3dGbypYKAfAjFi9hrKN/ZUDuX5r
 EiSqkp9FOe2aw==
Date: Tue, 24 Feb 2026 11:29:48 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aZ2LrDLPTR61TfQP@horms.kernel.org>
References: <E1vuUvf-0000000AfhS-0lJR@rmk-PC.armlinux.org.uk>
 <aZ1uxX_fddwO7UYD@horms.kernel.org>
 <aZ13Gjav_5PYNGEN@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZ13Gjav_5PYNGEN@shell.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: ptp: limit n_per_out
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:Jose.Abreu@synopsys.com,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.785];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8BBC818649A
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 10:02:02AM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 24, 2026 at 09:26:29AM +0000, Simon Horman wrote:
> > On Mon, Feb 23, 2026 at 12:20:47PM +0000, Russell King (Oracle) wrote:

...

> > > This could be a user exploitable bug (although one has to be root
> > > so the gun is already pointing at one's foot.) This is the commit
> > > which introduced the problem:
> > 
> > Hi Russell,
> > 
> > From the description I assumed that for this problem to manifest
> > out-of-range values would need to be turned by hardware.
> > But maybe I misunderstand things.
> > 
> > Could you elaborate on the vector you have in mind?

...

> Either code should care about values > 4, or it shouldn't. The current
> code cares about it in one place but then ignores it in all other
> places where the index is under userspace control, allowing the
> potential for array overrun.

Hi Russell,

Thanks for the clarification.

Personally I think it would be best if the Kernel took a robust approach
and assumed that hw may provide out of range values. But in my experience
this is generally not the approach taken by drivers. And it's not a hill I
which to spend too much time occupying.

IOW, I don't think the current practice is to treat such cases as bugs.

On the other hand, I agree that the code should be consistent.
And I would lean towards verifying rather than not, although again,
I don't think that one can find plenty of cases where the Kernel
doesn't do that.

Which is to say that I agree with the approach taken by your patch.
But I lean towards it not being a fix.

Reviewed-by: Simon Horman <horms@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
