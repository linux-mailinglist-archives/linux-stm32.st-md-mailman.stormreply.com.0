Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIL4NiJBlGlhBQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 11:21:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A614AC9B
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 11:21:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDF72C5A4C5;
	Tue, 17 Feb 2026 10:21:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64152C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 10:21:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 58F8060126;
 Tue, 17 Feb 2026 10:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901A1C4CEF7;
 Tue, 17 Feb 2026 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771323679;
 bh=nMYlB6mUz5sDcuGpH56QRUMJMtqJhSaGockFEPLWdMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fkoE9j9KHbNrGTrndFzyjoJvaPqvLr0OZT62+8iL4EAvfV5M3qkF4fnCubvw9ggpD
 Cw5m4WeuIiQfAqt8V67QEQl1CzjpDZK5Oo/Af0wbKoe6o4zSzM+0w2RxwOeRw2Jlb8
 uOgS4NRrqxZQEMuZojmApE+FV3H+FLDjLnzE4jRiIreaqoBahmQvEaU7fSKi1yJEtc
 lV85cvpvWyIme+Hx6p/jQZaIYH+YOuNJ77Ey1v/bUnNm6X6LSU5zPmwZfpcYOSoGNA
 YCfrp67I/2i784MMV+kALIVyYx3DpqKUVNINDHgn+zSPE3t10PWv6MvNw+yoO2rZ3c
 2bhQlM0JNuR5g==
Date: Tue, 17 Feb 2026 15:51:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aZRBG0h0HHSjc7tE@vaman>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <aY95qbcG2BLGVzHy@oss.qualcomm.com>
 <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZM60XiDOrgxHqeA@shell.armlinux.org.uk>
Cc: imx@lists.linux.dev, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <Frank.Li@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>,
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[vkoul@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:imx@lists.linux.dev,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:s.hauer@pengutronix.de,m:Frank.Li@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:pabeni@redhat.com,m:kernel@pengutronix.de,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[vkoul@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 768A614AC9B
X-Rspamd-Action: no action

T24gMTYtMDItMjYsIDE1OjQyLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gSGksCj4g
Cj4gT24gU2F0LCBGZWIgMTQsIDIwMjYgYXQgMTI6NTE6MTNBTSArMDUzMCwgTW9oZCBBeWFhbiBB
bndhciB3cm90ZToKPiA+IEhlbGxvIFJ1c3NlbGwsCj4gPiAKPiA+IFRoaW5ncyBsb29rIHByZXR0
eSBzdGFibGUgb24gdGhlIFFDUzkxMDAgUmlkZSBSMyBib2FyZCAod2l0aCB0aGUgQVFSMTE1Qwo+
ID4gUEhZKS4gSSB3b3VsZCBsaWtlIHRvIHRlc3QgYSBiaXQgbW9yZSBhbmQgc2hvdWxkIGJlIGhh
cHB5IHRvIHByb3ZpZGUgYQo+ID4gVGVzdGVkLWJ5IG9uY2UgdGhhdCdzIGNvbXBsZXRlLgo+ID4g
Cj4gPiBJIG1heSBhbHNvIGdldCBhY2Nlc3MgdG8gYSBib2FyZCB3aXRoIGFuIFJHTUlJIFBIWSBv
biBNb25kYXksIHNvIEnigJltCj4gPiBob3BpbmcgdG8gdmVyaWZ5IHRoZSBjaGFuZ2VzIHRvIGV0
aHFvc19yZ21paV9tYWNyb19pbml0IGFzIHdlbGwgYXMgeW91cgo+ID4gcGF0Y2ggZnJvbSB0aGUg
cHJldmlvdXMgc2VyaWVzICjigJxuZXQ6IHN0bW1hYzogcWNvbS1ldGhxb3M6IGNvbnZlcnQgdG8K
PiA+IHNldF9jbGtfdHhfcmF0ZSgpIG1ldGhvZOKAnSkgc29vbi4KPiAKPiBMb29raW5nIGZvcndh
cmQgdG8gaGVhcmluZyB0aGUgcmVzdWx0cywgdGhhbmtzIQo+IAo+IEFzIHlvdSBzZWVtIHRvIGJl
IGZhaXJseSBhY3RpdmUgd2l0aCB0aGUgcWNvbS1ldGhxb3Mgc3R1ZmYsIHBsZWFzZQo+IGNvbnNp
ZGVyIGFkZGluZyB5b3Vyc2VsZiB0byB0aGUgIlFVQUxDT01NIEVUSFFPUyBFVEhFUk5FVCBEUklW
RVIiCj4gbWFpbnRhaW5lcnMgZW50cnkuIFRoYW5rcy4KPiAKPiBWaW5vZCwgYXJlIHlvdSBzdGls
bCBhY3RpdmVseSBpbnZvbHZlZCB3aXRoIHRoaXMsIGFuZCBpZiBub3QsCj4gc2hvdWxkIE1vaGQg
cmVtb3ZlIHlvdSBmcm9tIHRoZSBlbnRyeSBmb3IgdGhlIGR3bWFjLXFjb20tZXRocW9zCj4gZHJp
dmVyPwoKWWVhaCBJIGFtIG5vdCBkb2luZyBhbnl0aGluZyBpbiB0aGlzIGFyZWEsIHBscyBkbyBk
cm9wIG1lIGZyb20gdGhpcwoKVGhhbmtzCi0tIAp+Vmlub2QKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
