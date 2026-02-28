Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKATNiw8o2nO+gQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Feb 2026 20:04:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AB1C68F8
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Feb 2026 20:04:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A11CC030CD;
	Sat, 28 Feb 2026 19:04:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21466C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Feb 2026 19:04:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 38530600AD;
 Sat, 28 Feb 2026 19:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C86EC116D0;
 Sat, 28 Feb 2026 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772305449;
 bh=zDXo0tm/VXl4ZESFurteuRBanIADwE9LLD324tu0poo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QIlPZS2fZrYutqz2v8HmVp4lM1V49xxMFqLSeyiZJ+6lS/r44DXU89p/gTisqL7GI
 ePvEPNAyVoGMdl3+/HFpO49Q6QT3HAaxK9EaUP3xOr8VW5OLXTsn1+Gb+Zi8DLA+QA
 yoMEyyD/tYvXTCkZDoEtfY+Yr7lO8+0CfomJWEFZa5uOlFHrWZFGBltQcTo52fwGdP
 25dQma90g2q296jWpA3ALn0pQMNX5FzNmUxoWHcF6eBDnp9+vM5Noufl6v1XCPELlL
 NJ+Zc4tSHp08Yd0appIYwZSG0bMs6OF+xZ7225kekwjVVWvB3YSvdWXgyhXS+Zr92y
 7/Vsm/rnHadzQ==
Date: Sat, 28 Feb 2026 11:04:08 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Message-ID: <20260228110408.384420e1@kernel.org>
In-Reply-To: <20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
References: <20260225142414.130144-1-ovidiu.panait.rb@renesas.com>
 <20260225142414.130144-5-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, kim.tatt.chuah@intel.com,
 hayashi.kunihiko@socionext.com, vladimir.oltean@nxp.com,
 linux-stm32@st-md-mailman.stormreply.com, rohan.g.thomas@altera.com,
 linux@armlinux.org.uk, andrew+netdev@lunn.ch, edumazet@google.com,
 boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
 boon.leong.ong@intel.com, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 4/5] net: stmmac: Add write_hw
 parameter to VLAN filter operations
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
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[vger.kernel.org,intel.com,socionext.com,nxp.com,st-md-mailman.stormreply.com,altera.com,armlinux.org.uk,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:ovidiu.panait.rb@renesas.com,m:linux-kernel@vger.kernel.org,m:kim.tatt.chuah@intel.com,m:hayashi.kunihiko@socionext.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:rohan.g.thomas@altera.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:boon.leong.ong@intel.com,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.989];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 718AB1C68F8
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 14:24:13 +0000 Ovidiu Panait wrote:
> Add a write_hw parameter to the VLAN add/delete HW filter functions and
> to stmmac_vlan_update(). This flag controls whether the actual hardware
> register accesses are performed. When set to false, only the software
> state is updated.
> 
> The next commit will use this to defer hardware writes when the
> interface is down.

I wonder if instead of passing attributes like this around the driver
shouldn't simply maintain a flag (or have other way to test) whether
the clock to block X is currently enabled? It feels more like a global
state / property than trickiness directly related to VLAN config.

Also any strong reason to post this for net-next? We take fixes via 
the net tree, so when you repost please use "PATCH net". And an
appropriate Fixes tag on the last patch would be great to have
(presumably just ed64639bc1e0 again?)
-- 
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
