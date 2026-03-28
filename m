Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id f4L9MoxVyGmskQUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 23:26:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C073501E6
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Mar 2026 23:26:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9738C01FB5;
	Sat, 28 Mar 2026 22:26:19 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CF68C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Mar 2026 22:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ksn/ONXvwjFSl7uoWMydoUCTQ2n21ymYZkV8pvqF/8A=; b=IrbqNRvGeY9gFvxXGYjzBeb65D
 oyV0CIkcphy8AMq9OdHok9Wx2jkD+i8SPTdK44SuUZj++7tuLMzSf/8u/IibGJNzOskprqmp0TiCW
 UiiYtbkj4Yk+2XkiibEtMIdc++DkTFZXZ4stjxKKTZTkcOER3QXkWghjq5eH0f6Jae/UFPtSUPgj+
 AbHdISz6jIVhlHDqKlsJ9SJBWs2h3uelqwy3YjN9dO4s0EYnn0jzKoPGXXT//ZPr6js1sr2/0I+Fv
 hPqkENCp+Y8NJ4vDaCl64J2Zv9URbJvXvkQlc5yp82CpA9kCS/QlIVPkreSVOTuGXN2kHo1mCvwKB
 YuaeBQVA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32806)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1w6c6a-000000007W4-46Aa;
 Sat, 28 Mar 2026 22:26:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1w6c6X-0000000012S-1fvd; Sat, 28 Mar 2026 22:26:05 +0000
Date: Sat, 28 Mar 2026 22:26:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>
Message-ID: <achVffNlW_VPZu5W@shell.armlinux.org.uk>
References: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_833D2AD6577F21CF38ED1C3FE8814EB4B308@qq.com>
Cc: linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: Fix typo in comment
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Yeking@red54.com,m:linux-kernel@vger.kernel.org,m:heiko@sntech.de,m:andrew+netdev@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-rockchip@lists.infradead.org,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,sntech.de,lunn.ch,st-md-mailman.stormreply.com,lists.infradead.org,google.com,gmail.com,kernel.org,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.890];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[red54.com:email]
X-Rspamd-Queue-Id: 52C073501E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gU2F0LCBNYXIgMjgsIDIwMjYgYXQgMDE6NDM6MzFQTSArMDAwMCwg6LCi6Ie06YKmIChYSUUg
WmhpYmFuZykgd3JvdGU6Cj4gQ29ycmVjdCB0aGUgdHlwbyAicmszNTIwIiB0byAicmszNTI4IiBp
biBjb21tZW50Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IOiwouiHtOmCpiAoWElFIFpoaWJhbmcpIDxZ
ZWtpbmdAUmVkNTQuY29tPgoKUmV2aWV3ZWQtYnk6IFJ1c3NlbGwgS2luZyAoT3JhY2xlKSA8cm1r
K2tlcm5lbEBhcm1saW51eC5vcmcudWs+CgpUaGFua3MhCgotLSAKUk1LJ3MgUGF0Y2ggc3lzdGVt
OiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAgaXMg
aGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxhc3Qh
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
