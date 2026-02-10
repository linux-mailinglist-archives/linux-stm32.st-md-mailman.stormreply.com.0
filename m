Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBp6IPski2mTQQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 13:30:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E111AD7C
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 13:30:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17B11C87EBF;
	Tue, 10 Feb 2026 12:30:51 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34486C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jQMAkiZGrqwSgr5mZ517weGZSWnKuFxc8IpWTd0MF0M=; b=G0IXE74WnLyWWegVxKpGZ9+KWe
 5EyQBMB4xTnAyP8jXnvWO7G/S1j2pDUelSQrb4jhmR0b0tk+xHy9vKXWKzP7SpFOM2EYJN65QDqTS
 CEV/UsrU1wA4L0Go1kVbZR/i8WeuAb1PzYg+vwI9hZPrdfDux0Jzza/T0zhVp6BXttvR6cvorAvH5
 2iIPbkIzZUYIii9jb6FBQD+JZtKTIcz1Uu6d7BFKgxMxc5M1mFcOX3GaApNV+cWf5oX6iwB0txSKI
 RVTa24Vm7/YEuppdiupb8HaEyKl/KD7gN1e8JQ4uP4X5KoznLNk3USPLSMM13fMpFbruKO2FO7ZjF
 HhMONwBw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39224)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vpmsz-000000002YE-3X4B;
 Tue, 10 Feb 2026 12:30:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vpmsw-000000002mM-2Z9r; Tue, 10 Feb 2026 12:30:30 +0000
Date: Tue, 10 Feb 2026 12:30:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Message-ID: <aYsk5pnzVswdl_tf@shell.armlinux.org.uk>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch>
 <aYnvwAK3gpxBs-EF@shell.armlinux.org.uk>
 <5dea8ce0.4435.19c471231f5.Coremail.lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5dea8ce0.4435.19c471231f5.Coremail.lizhi2@eswincomputing.com>
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linmin@eswincomputing.com,
 devicetree@vger.kernel.org, ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700
 eth1 RX sampling timing
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:lizhi2@eswincomputing.com,m:robh@kernel.org,m:andrew@lunn.ch,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,vger.kernel.org,eswincomputing.com,st-md-mailman.stormreply.com,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org,einfochips.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 5D7E111AD7C
X-Rspamd-Action: no action

SGksCgpPbiBUdWUsIEZlYiAxMCwgMjAyNiBhdCAwNjoyMTo0MFBNICswODAwLCDmnY7lv5cgd3Jv
dGU6Cj4gPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4gPiDlj5Hku7bkuro6ICJSdXNzZWxsIEtp
bmcgKE9yYWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gPiDlj5HpgIHml7bpl7Q6MjAy
Ni0wMi0wOSAyMjozMToyOCAo5pif5pyf5LiAKQo+ID4g5pS25Lu25Lq6OiBsaXpoaTJAZXN3aW5j
b21wdXRpbmcuY29tLCAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4KPiA+IOaKhOmAgTog
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1A
ZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2Jo
QGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0
ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIGxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywgbmluZ3l1QGVzd2luY29tcHV0aW5n
LmNvbSwgbGlubWluQGVzd2luY29tcHV0aW5nLmNvbSwgcGlua2VzaC52YWdoZWxhQGVpbmZvY2hp
cHMuY29tLCB3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tCj4gPiDkuLvpopg6IFJlOiBb
UEFUQ0ggdjIgMC8yXSBuZXQ6IHN0bW1hYzogZWljNzcwMDogZml4IEVJQzc3MDAgZXRoMSBSWCBz
YW1wbGluZyB0aW1pbmcKPiA+IAo+ID4gT24gTW9uLCBGZWIgMDksIDIwMjYgYXQgMDI6MzY6MTFQ
TSArMDEwMCwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gPiA+IE9uIE1vbiwgRmViIDA5LCAyMDI2IGF0
IDA1OjQ2OjI4UE0gKzA4MDAsIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20gd3JvdGU6Cj4gPiA+
ID4gRnJvbTogWmhpIExpIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gPiA+IAo+ID4g
PiA+IHYxIC0+IHYyOgo+ID4gPiAKPiA+ID4gRm9yIHZlcnNpb24gMywgcGxlYXNlIGluY2x1ZGUg
YSBwYXRjaCB0byB0aGUgU29DIC5kdHNpIGZpbGUgYWRkaW5nIHRoZQo+ID4gPiBFdGhlcm5ldCBu
b2Rlcy4gV2UgbGlrZSB0byBzZWUgdXNlcnMgb2YgY29kZSBiZWluZyBhZGRlZC4KPiA+IAo+ID4g
SW4gYWRkaXRpb24gdG8gQW5kcmV3J3MgY29tbWVudHMsIGJlZm9yZSBwb3N0aW5nIGFub3RoZXIg
c2VyaWVzLCBwbGVhc2UKPiA+IHJldmlldyBodHRwczovL2RvY3Mua2VybmVsLm9yZy9wcm9jZXNz
L21haW50YWluZXItbmV0ZGV2Lmh0bWwsCj4gPiBwYXJ0aWN1bGFybHkgc2VjdGlvbnMgMS40IGFu
ZCAxLjYuMS4KPiA+IAo+IFRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLgo+IAo+IFRoZSB2MyBwYXRj
aCB3aWxsIHRhcmdldCB0aGUgbmV0IGdpdCB0cmVlLgoKV2hpbGUgaXQgbWF5IGJlIGEgZml4LCBn
aXZlbiB0aGF0OgoKPiBXZSB3aWxsIGFkZCB0aGUgZXRoZXJuZXQgbm9kZXMgYW5kIHRoZSBjb3Jy
ZXNwb25kaW5nIGNsb2NrIG5vZGUgdG8KPiBlaWM3NzAwLmR0c2kgYW5kIGVpYzc3MDAtaGlmaXZl
LXByZW1pZXItcDU1MC5kdHMgaW4gdjMgcGF0Y2guIAo+IAo+IFBsZWFzZSBub3RlIHRoYXQgdGhl
IEVJQzc3MDAgY2xvY2sgY29udHJvbGxlciBiaW5kaW5nIGFuZCBkcml2ZXIgYXJlIG5vdAo+IHll
dCBtZXJnZWQgdXBzdHJlYW0sIHNvIHRoZSBjbG9jayBub2RlcyB3aWxsIG5vdCBiZSBmdW5jdGlv
bmFsIHVudGlsIHRoZQo+IGNsb2NrIGRyaXZlciBpcyBhdmFpbGFibGUuIEFzIGEgcmVzdWx0LCBk
dGJzX2NoZWNrIHdpbGwgY3VycmVudGx5IHJlcG9ydAo+IHNjaGVtYSB3YXJuaW5ncy9lcnJvcnMg
cmVsYXRlZCB0byB0aGUgY2xvY2sgbm9kZXMuIFRoaXMgaXMgYSBrbm93biBhbmQKPiB0ZW1wb3Jh
cnkgbGltaXRhdGlvbiB1bnRpbCB0aGUgY2xvY2sgYmluZGluZyBhbmQgZHJpdmVyIGFyZSBhdmFp
bGFibGUKPiB1cHN0cmVhbS4KCkkgZG9uJ3Qgc2VlIG11Y2ggcG9pbnQgdG8gcHV0dGluZyBpdCBp
biB0aGUgbmV0IHRyZWUgLSB5b3UncmUgYWRkcmVzc2luZwpwcm9ibGVtcyB3aXRoIGEgZHJpdmVy
IHRoYXQgaXMgY3VycmVudGx5IG5vdCBpbiBhIHVzYWJsZSBzdGF0ZSBpbgptYWlubGluZSwgc28g
dGhlcmUncyBubyBuZWVkIHRvIHJ1c2ggdG8gaGF2ZSB0aGlzIGNoYW5nZSBpbiBtYWlubGluZS4K
SSB0aGluayB0aGUgbmV0LW5leHQgdHJlZSB3aWxsIGRvIG9uY2UgaXQgcmUtb3BlbnMgYWZ0ZXIg
djcuMC1yYzEgaGFzCmJlZW4gcmVsZWFzZWQuCgpUaGFua3MuCgotLSAKUk1LJ3MgUGF0Y2ggc3lz
dGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAg
aXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxh
c3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
