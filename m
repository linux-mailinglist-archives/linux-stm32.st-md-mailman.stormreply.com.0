Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id glR4OBJsTWojzwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 23:13:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B322571FB15
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 23:13:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=g+Ed3nNy;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=samsung.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67C55C8F264;
	Tue,  7 Jul 2026 21:13:53 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46E39C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 21:13:52 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260707211351euoutp01466f112c9126c5dbe46c955a3a2a68fc~AHlujqoMV2240622406euoutp01L
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 21:13:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260707211351euoutp01466f112c9126c5dbe46c955a3a2a68fc~AHlujqoMV2240622406euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1783458831;
 bh=f6dDVyB9psyNYoQa6fpOddWiAy4i5cRkpJCqDed3Ch0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g+Ed3nNyo5M80NkQfw4jAOTolFRfSoCAZrGKYdeQZ5srfwWVfaMd4reXeEstc1Azb
 b8L6XWcV9buiqK5GEAIf8XG0g+VolaZoBhzREGML5sQnoI+Cba6uTW/I6hsTE7c679
 gDI+2R5xkDNpwOoBSX5x36ODkRHE/2Cmwm/zxymY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1~AHlt4_tXc2809828098eucas1p2g;
 Tue,  7 Jul 2026 21:13:50 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
 [106.120.77.34]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260707211349eusmtip17f0e062b7abdf62ff97e46a43741acb5~AHlsxBQqi0242002420eusmtip1L;
 Tue,  7 Jul 2026 21:13:49 +0000 (GMT)
Date: Tue, 7 Jul 2026 23:13:46 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <ak1rseUKTWFKzBib@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <20260707195425.405989-1-stefan@agner.ch>
X-CMS-MailID: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_"
X-RootMTR: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
X-EPHeader: CA
X-CMS-RootMailID: 20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1
References: <message-id-of-your-v1-mail>
 <20260707195425.405989-1-stefan@agner.ch>
 <CGME20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1@eucas1p2.samsung.com>
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, "Russell King
 \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: resume PHY before
 hardware setup when opening the interface
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
	FORGED_RECIPIENTS(0.00)[m:stefan@agner.ch,m:regressions@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,st-md-mailman.stormreply.com,armlinux.org.uk,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
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
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B322571FB15

------z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Please read
https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
in this case 'don’t repost your patches within one 24h period'

Because:
- you have two patches now processing and no changes requested yet,
  nor did you get AI review that is currently employed
  https://patchwork.kernel.org/project/netdevbpf/patch/20260707195425.405989-1-stefan@agner.ch/
  and
  https://patchwork.kernel.org/project/netdevbpf/patch/20260707162146.73823-1-stefan@agner.ch/
- This change is actually broken - in previous patch rtnl_lock() was asserted
  by dev_ioctl(), but in this version it is not asserted anywhere and will
  trigger WARN_ONCE().
- Full tests within an hour is possible, but no need to rush patches
- Please spend time reviewing patches, as I spent few minutes to make sure
  you (or rather Fable AI) is correct that rtnl_lock() was asserted, so my
  review would be accurate (previous patch was ok, this is not).
- Please respond yourself to comments, take time to understand codebase.
  I would prefer not getting copy-paste answer from AI,
  we have Sashiko review for that.
- Missing link to previous thread, shown below
- Moving code to other lines does not justify dropping "Assisted by AI"

I am not maintainer, just random reviewer. Some maintainer will give input
surely soon.

But rule of thumb, do not repost patches till your patch gets
'Changes requested' in patchwork or like 2 weeks have passed
(maybe during vacation even longer, as currently there are >600 patches
pending review).

On Tue, Jul 07, 2026 at 09:54:25PM +0200, Stefan Agner wrote:
> Changes in v2:
> - Move the PHY resume from stmmac_change_mtu() into __stmmac_open() so
>   that it also counters the PHY suspend caused by __stmmac_release()
>   (suggested by Andrew Lunn), placed before stmmac_reset_queues_param()
>   to match the ordering used in stmmac_resume()

Missing link to previous thread

> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>

BR
Jakub Raczynski 

------z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_
Content-Type: text/plain; charset="utf-8"


------z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

------z0KHaxdBtqrNA0Il2CW.z4n_bpDWqNzZNiGZPVyhi_2U0Kf4=_8fd81_--
