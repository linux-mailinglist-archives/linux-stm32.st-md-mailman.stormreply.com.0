Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNHsG+I6k2mV2gEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 16:42:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 041EF145B9D
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Feb 2026 16:42:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 804EFC8F273;
	Mon, 16 Feb 2026 15:42:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A9C3C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Feb 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtQGx8JaIvXg61aL8RGWRy89nLOrlWoGMW1moSYdF4U=; b=qgb3v+Vtq+yIqIbp+EvMyer2d5
 aOqdWJwZ9wUpJHfFUZg/NtJFsYcn/IHj3N2S1wrjFCYxQXNLsM8BItrnXAGIbqG4X2KQ/8IFu1yXS
 +LZDKwysogk6ieqLtopJz7trniT9lskIKGT8X/CsHCOX84pP8XxLP1HxAMdxEd14HLYzKLiinKjC9
 OPe2deRHvKTMwuR0v+6bHA2Sk/VpIV7ycJZxjZbC5uC121xwaPqGdUNIyXi6tm2NoiZWUybjBiNwv
 JbPEOk44dfUlk60GIKz7RGCa3DxR5B3JXaWpI5c3zUvC+ZJcijQXdPm8U/W6gn9SFnZH2cenlVfqM
 kY2cNW4Q==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39088)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vs0jl-0000000075q-0Ygn;
 Mon, 16 Feb 2026 15:42:13 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vs0jh-000000000MC-0xiX; Mon, 16 Feb 2026 15:42:09 +0000
Date: Mon, 16 Feb 2026 15:42:09 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Vinod Koul <vkoul@kernel.org>
Message-ID: <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <aY95qbcG2BLGVzHy@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aY95qbcG2BLGVzHy@oss.qualcomm.com>
Cc: imx@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC net-next 0/9] net: stmmac:
 qcom-ethqos: cleanups and re-organise SerDes handling
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:imx@lists.linux.dev,m:pabeni@redhat.com,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 041EF145B9D
X-Rspamd-Action: no action

SGksCgpPbiBTYXQsIEZlYiAxNCwgMjAyNiBhdCAxMjo1MToxM0FNICswNTMwLCBNb2hkIEF5YWFu
IEFud2FyIHdyb3RlOgo+IEhlbGxvIFJ1c3NlbGwsCj4gCj4gVGhpbmdzIGxvb2sgcHJldHR5IHN0
YWJsZSBvbiB0aGUgUUNTOTEwMCBSaWRlIFIzIGJvYXJkICh3aXRoIHRoZSBBUVIxMTVDCj4gUEhZ
KS4gSSB3b3VsZCBsaWtlIHRvIHRlc3QgYSBiaXQgbW9yZSBhbmQgc2hvdWxkIGJlIGhhcHB5IHRv
IHByb3ZpZGUgYQo+IFRlc3RlZC1ieSBvbmNlIHRoYXQncyBjb21wbGV0ZS4KPiAKPiBJIG1heSBh
bHNvIGdldCBhY2Nlc3MgdG8gYSBib2FyZCB3aXRoIGFuIFJHTUlJIFBIWSBvbiBNb25kYXksIHNv
IEnigJltCj4gaG9waW5nIHRvIHZlcmlmeSB0aGUgY2hhbmdlcyB0byBldGhxb3NfcmdtaWlfbWFj
cm9faW5pdCBhcyB3ZWxsIGFzIHlvdXIKPiBwYXRjaCBmcm9tIHRoZSBwcmV2aW91cyBzZXJpZXMg
KOKAnG5ldDogc3RtbWFjOiBxY29tLWV0aHFvczogY29udmVydCB0bwo+IHNldF9jbGtfdHhfcmF0
ZSgpIG1ldGhvZOKAnSkgc29vbi4KCkxvb2tpbmcgZm9yd2FyZCB0byBoZWFyaW5nIHRoZSByZXN1
bHRzLCB0aGFua3MhCgpBcyB5b3Ugc2VlbSB0byBiZSBmYWlybHkgYWN0aXZlIHdpdGggdGhlIHFj
b20tZXRocW9zIHN0dWZmLCBwbGVhc2UKY29uc2lkZXIgYWRkaW5nIHlvdXJzZWxmIHRvIHRoZSAi
UVVBTENPTU0gRVRIUU9TIEVUSEVSTkVUIERSSVZFUiIKbWFpbnRhaW5lcnMgZW50cnkuIFRoYW5r
cy4KClZpbm9kLCBhcmUgeW91IHN0aWxsIGFjdGl2ZWx5IGludm9sdmVkIHdpdGggdGhpcywgYW5k
IGlmIG5vdCwKc2hvdWxkIE1vaGQgcmVtb3ZlIHlvdSBmcm9tIHRoZSBlbnRyeSBmb3IgdGhlIGR3
bWFjLXFjb20tZXRocW9zCmRyaXZlcj8KClRoYW5rcy4KCi0tIApSTUsncyBQYXRjaCBzeXN0ZW06
IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBo
ZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25uZWN0aXZpdHkgYXQgbGFzdCEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
