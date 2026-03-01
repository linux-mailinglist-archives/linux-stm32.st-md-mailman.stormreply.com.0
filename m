Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJ4YByKJo2kzGQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 01:32:34 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 857CF1C9D09
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 01:32:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F6E0C030CD;
	Sun,  1 Mar 2026 00:32:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 18851C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 00:32:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EF3E6600AD;
 Sun,  1 Mar 2026 00:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029FDC19421;
 Sun,  1 Mar 2026 00:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772325150;
 bh=TrV9WuauQIJMEiV5wFKqcBZhdXyHXR+OiLKPj6LkgY8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=n4FjocUsnH9ow+vG/caTVCBGsupj6baiby6R9/+J+554TwP7pfoCJg40d9fDBNtOY
 XV1FPy1wsDXHW7KlsFpZC01/W+Q9U5c9qdGb35+moXGWpXYyJAkDhTQHRG7aCCSUjq
 Y+ieR7hrNTDCeKNsfkyboHf34BS+4i0QNL1UmbeRCJZJaxOsYJRZ3ltBT87QhxGEM1
 JNDk67+eFNZYojXj4Qqbrt1c/P3RIJDDmfzHUUFsPCXuCc0Fkai0btjP+JOK+DV4ot
 Pgd6HtPRocHRezXUG3WrNXogy0QDgm2VXB93PRcQMr9mR33qLcClaZNHYqszPGIhko
 eLqwxJfzZEXQg==
Date: Sat, 28 Feb 2026 16:32:29 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Message-ID: <20260228163229.1024f263@kernel.org>
In-Reply-To: <20260301001453.lpd2rawy7bqxyivp@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 0/8] net: stmmac:
 qcom-ethqos: further serdes reorganisation
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
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:olteanv@gmail.com,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.180];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 857CF1C9D09
X-Rspamd-Action: no action

On Sun, 1 Mar 2026 02:14:53 +0200 Vladimir Oltean wrote:
> > > Yes, that's what I thought but then I saw the other thread..  
> > 
> > Trying to apply this now but stmmac parts don't apply on Linus's tree,
> > and Vinod wants a tag :( What do we do? 
> > 
> > Could you, perhaps, send us a PR with this on top of Linus's tree 
> > (a resolution of the inevitable conflict with net-next would be helpful
> > too).
> > 
> > Or do we give up on the tag?  
> 
> Actually, I think it's mainly me who wants a stable tag. 

Ah :)

> I'm working on a series for phy-next which will conflict with this 
> hunk from Russell's patch 1:
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> index 5b1c82459c12..4ea3dce7719f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> @@ -7,6 +7,7 @@
>  #include <linux/ethtool.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/phy.h>
>  #include <linux/phy/phy.h> // this gets renamed to <linux/phy/phy-provider.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>

That's not too bad.. if that's the extent of the conflict (which is
probably hard to predict at rc2?) we could let linux-next handle it. 
Of course assuming Vinod is okay with us merging Russell's entire
series.

> If there's no other way to provide a stable tag other than on v7.0-rc1
> (like for example a snapshot of current net-next/main), which I didn't
> know wouldn't be possible, then I think going with the route of fewer/
> more trivial merge conflicts makes sense.

To be clear, it's only about having a common ancestor, I wasn't actually
planning on making y'all a tag. I'd just apply the series on top of
v7.0-rc1 and merge them in. Then anyone can tag the relevant commit 
in net-next or use as a base for their own work.

I haven't looked how bad the conflict would be if Russell's work was
rebased on Linus's tree. If the delta is not too bad, and we can just
resolve the merge conflict when pulling it into net-next. That's
probably the cleanest.

I don't recall us ever making a "dirty tag" on net-next which would
propagate few 100s of netdev patches into someone else's tree :S
IDK how Linus would react. It's the least good option IMO.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
