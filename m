Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH4NJOLt32lEagAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 21:58:26 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0561B4077EC
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 21:58:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F097C3F944;
	Wed, 15 Apr 2026 19:58:25 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16B0DC36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zzfItcPbm51n9sUCqPS3pMEdP67XndcXm/lQ9tFu+D0=; b=WRxrdmIsc4eRiptzsUaHuJhBKe
 +UVOxQ0GJxULMlm3Gx+I9D42waGwzfpRMjNhf4nurL3eYPd1HdhdlvmLK71QFhp0NqOqCtdkcrrqZ
 KAQhYz+iCGUUYGP4vm66y5hr6xtILN/vce8MNQ5ihZahNRmB90D3K3p5wokjUq1X27a42va07e2AE
 VbYPoGKiDBDRBJXwHicnFlufKVEmimawsz2detW0wGLMlD5hmTaefp64z1J/ORfEQDff6kEnmuVOV
 aEbLNlCkIXAzRAWynK05SMR4CFYa9jXTmb6kqUCBaFr9jIU0r5fFUjp2Xw0tQMYWxTGtQE2QtPVcz
 H6quAEaA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40820)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wD6NJ-000000002SU-0s9z;
 Wed, 15 Apr 2026 20:58:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wD6NG-000000002VN-0Po4; Wed, 15 Apr 2026 20:58:10 +0100
Date: Wed, 15 Apr 2026 20:58:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <ad_t0aOKdC6f5Ja8@shell.armlinux.org.uk>
References: <20260415023947.7627-1-CFSworks@gmail.com>
 <ad-LAB08-_rpmMzK@shell.armlinux.org.uk>
 <ad-8q4OrOm-VtGrO@shell.armlinux.org.uk>
 <CAH5Ym4gy6g8d88-vGhe1zxoV7jNH_fXHsDSdDWC4x00H7s-3=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH5Ym4gy6g8d88-vGhe1zxoV7jNH_fXHsDSdDWC4x00H7s-3=w@mail.gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v5] net: stmmac: Prevent NULL deref
 when RX memory exhausted
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
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.271];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,bootlin.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,armlinux.org.uk:email,shell.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 0561B4077EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgMTA6NTM6MTVBTSAtMDcwMCwgU2FtIEVkd2FyZHMgd3Jv
dGU6Cj4gT24gV2VkLCBBcHIgMTUsIDIwMjYgYXQgOToyOOKAr0FNIFJ1c3NlbGwgS2luZyAoT3Jh
Y2xlKQo+IDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgQXBy
IDE1LCAyMDI2IGF0IDAxOjU2OjMyUE0gKzAxMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90
ZToKPiA+ID4gTG9jYWxseSwgd2hpbGUgZGVidWdnaW5nIG15IGlzc3VlcywgSSB1c2VkIHRoaXMg
dG8gcHJldmVudCBjdXJfcngKPiA+ID4gY2F0Y2hpbmcgdXAgd2l0aCBkaXJ0eV9yeDoKPiA+ID4K
PiA+ID4gICAgICAgICAgICAgICAgIHN0YXR1cyA9IHN0bW1hY19yeF9zdGF0dXMocHJpdiwgJnBy
aXYtPnhzdGF0cywgcCk7Cj4gPiA+ICAgICAgICAgICAgICAgICAvKiBjaGVjayBpZiBtYW5hZ2Vk
IGJ5IHRoZSBETUEgb3RoZXJ3aXNlIGdvIGFoZWFkICovCj4gPiA+ICAgICAgICAgICAgICAgICBp
ZiAodW5saWtlbHkoc3RhdHVzICYgZG1hX293bikpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgbmV4dF9lbnRyeSA9IFNUTU1B
Q19ORVhUX0VOVFJZKHJ4X3EtPmN1cl9yeCwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwcml2LT5kbWFfY29uZi5kbWFfcnhfc2l6ZSk7Cj4gPiA+
ICAgICAgICAgICAgICAgICBpZiAodW5saWtlbHkobmV4dF9lbnRyeSA9PSByeF9xLT5kaXJ0eV9y
eCkpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPgo+ID4gPiAgICAg
ICAgICAgICAgICAgcnhfcS0+Y3VyX3J4ID0gbmV4dF9lbnRyeTsKPiA+ID4KPiA+ID4gSWYgd2Ug
Y2FyZSBhYm91dCB0aGUgY29zdCBvZiByZWxvYWRpbmcgcnhfcS0+ZGlydHlfcnggb24gZXZlcnkK
PiA+ID4gaXRlcmF0aW9uLCB0aGVuIEknZCBzdWdnZXN0IHRoYXQgdGhlIGNvc3Qgd2UgYWxyZWFk
eSBpbmN1ciByZWFkaW5nIGFuZAo+ID4gPiB3cml0aW5nIHJ4X3EtPmN1cl9yeCBpcyBzb21ldGhp
bmcgdGhhdCBzaG91bGQgYmUgYWRkcmVzc2VkLCBhbmQKPiA+ID4gZWxpbWluYXRpbmcgdGhhdCB3
b3VsZCBjb3VudGVyIHRoZSBjb3N0IG9mIHJlYWRpbmcgcnhfcS0+ZGlydHlfcnguIEkKPiA+ID4g
c3VzcGVjdCwgaG93ZXZlciwgdGhhdCB0aGUgY29zdCBpcyBtaW5pbWFsLCBhcyBjdXJfdHggYW5k
IGRpcnR5X3J4IGFyZQo+ID4gPiBsaWtlbHkgaW4gdGhlIHNhbWUgY2FjaGUgbGluZS4KPiAKPiBO
bywgbm8sIEkgbGlrZSB5b3VyIGFwcHJvYWNoIGJldHRlci4gOikgSXQgYWxzbyByZW1vdmVzIHRo
ZSBuZWVkIGZvcgo+IHRoZSBgbGltaXRgIGNsYW1wIGF0IHRoZSB0b3Agb2YgdGhlIGZ1bmN0aW9u
LCBzbyBsYXRlciBjb2RlIGNhbiBhc3N1bWUKPiBsaW1pdD09YnVkZ2V0Lgo+IAo+ID4gPiBJdCBs
b29rcyBsaWtlIGFueSBmaXggdG8gc3RtbWFjX3J4KCkgd2lsbCBhbHNvIG5lZWQgYSBjb3JyZXNw
b25kaW5nCj4gPiA+IGZpeCBmb3Igc3RtbWFjX3J4X3pjKCkuCj4gCj4gSSBhZ3JlZSB0aGF0IHN0
bW1hY19yeF96YygpIGlzIGxpa2VseSBhbHNvIGJyb2tlbiAoaW4gYSBzaW1pbGFyIHdheSwKPiBi
dXQgbm90IHNpbWlsYXIgZW5vdWdoIHRvIHBlcm1pdCBhICJjb3JyZXNwb25kaW5nIiBmaXgpLCBi
dXQgSSBkb24ndAo+IGFncmVlIHRoYXQgdGhlcmUncyBhIGRlcGVuZGVuY3kgcmVsYXRpb25zaGlw
IGhlcmUuIFRoaXMgcGF0Y2ggaXMKPiBhZGRyZXNzaW5nICMyMjEwMTAsIHdoaWNoIGFmZmVjdHMg
dGhlIGdlbmVyaWMvbm9uLVpDIGNvZGVwYXRoOyBJJ20KPiBhZnJhaWQgdGhlIFpDIGNvZGVwYXRo
IHdhcnJhbnRzIGl0cyBvd24gaW52ZXN0aWdhdGlvbi4KClRoZSBjb2RlIHN0cnVjdHVyZSBpcyBp
ZGVudGljYWwuIFRoZSBvbmx5IGRpZmZlcmVuY2UgaXMgd2hhdCBoYXBwZW5zCnRvIHRoZSBwYWNr
ZXRzLgoKQm90aCBwYXRocyB0YWtlIHRoZSBOQVBJIGxpbWl0LiBCb3RoIHBhdGhzIHByb2Nlc3Mg
dXAgdG8gdGhhdCBsaW1pdCBvZgpkZXNjcmlwdG9ycy4gVGhlIHN0YXRlIHNhdmluZyAvIHJlc3Rv
cmluZyBpcyBzaW1pbGFyLiBUaGUgcmVhZF9hZ2FpbgpsYWJlbCBpcyB0aGUgc2FtZSwgdGhlIGNv
bmRpdGlvbiBhZnRlciBpcyB0aGUgc2FtZS4KClRoZSBaQyBwYXRoIGRpZmZlcnMgYXQgdGhpcyBw
b2ludCBpbiB0aGF0IGl0IHdpbGwgYXR0ZW1wdCB0byByZWZpbGwKZXZlcnkgMTYgZGVzY3JpcHRv
cnMgdGhhdCBoYXZlIGJlZW4gcHJvY2Vzc2VkLgoKQm90aCBwYXRocyB0aGVuIHJlYWQgdGhlIGRl
c2NyaXB0b3IgYW5kIGNoZWNrIHRoZSBvd25lcnNoaXAuCkJvdGggcGF0aHMgdGhlbiBpbmNyZW1l
bnQgY3VyX3J4IHRvIHBvaW50IHRvIHRoZSBuZXh0IGVudHJ5IGFyb3VuZAp0aGUgcmluZy4KQm90
aCBwYXRocyB0aGVuIGdldCB0aGUgZm9sbG93aW5nIGRlc2NyaXB0b3IgcG9pbnRlciBhbmQgcHJl
ZmV0Y2gKaXQuCkJvdGggcGF0aHMgdGhlbiBnZXQgdGhlIGV4dGVuZGVkIHN0YXR1cyBpZiB3ZSdy
ZSB1c2luZyBleHRlbmRlZApkZXNjcmlwdG9ycy4KQm90aCBwYXRocyB0aGVuIGhhbmRsZSBmcmFt
ZSBkaXNjYXJkLgpCb3RoIHBhdGhzIHRoZW4ganVtcCBiYWNrIHRvIHJlYWRfYWdhaW4gaWYgdGhp
cyBpc24ndCB0aGUgbGFzdApzZWdtZW50IGFuZCB3ZSBoYXZlIGFuIGVycm9yLgpCb3RoIHBhdGhz
IHRoZW4gY2hlY2sgZm9yIGVycm9yLgouLi4gYW5kIHNvIGl0IGdvZXMgb24uCgpUaGUgWkMgcGF0
aCB0byBtZSBsb29rcyBsaWtlIGEgY29weS1wYXN0ZS1hbmQtdHdlYWsgYXBwcm9hY2ggdG8KYWRk
aW5nIHN1cHBvcnQuIFRoZSBkaWZmZXJlbmNlIHNlZW1zIHRvIGJlIGNlbnRlcmVkIG9ubHkgYXJv
dW5kCnRoZSBoYW5kbGluZyBvZiB0aGUgZGF0YSBidWZmZXJzIGluIHRoZSBkZXNjcmlwdG9ycy4g
VGhlIG92ZXJhbGwKbWVjaGFuaXNtIG9mIHByb2Nlc3NpbmcgdGhlIGRlc2NyaXB0b3JzIGZvbGxv
d3MgdGhlIHNhbWUgbGF5b3V0CmluIGJvdGggZnVuY3Rpb25zLgoKPiA+IEkgaGF2ZSBzb21lIGZ1
cnRoZXIgaW5mb3JtYXRpb24sIGJ1dCBhIG5ldyBjdXJ2ZWJhbGwgaGFzIGp1c3QgYmVlbgo+ID4g
Y2h1Y2tlZC4uLiBhbmQgSSd2ZSBubyBpZGVhIHdoYXQgdGhpcyB3aWxsIG1lYW4gYXQgdGhpcyBz
dGFnZS4gSnVzdAo+ID4gdGFrZSBpdCB0aGF0IEkgd29uJ3QgYmUgcmVzcG9uZGluZyBmb3IgYSB3
aGlsZS4KPiAKPiBJIHRoaW5rIEkgZm9sbG93IHlvdXIgbWVhbmluZy4gR29vZCBsdWNrIGdldHRp
bmcgaXQgc3RyYWlnaHRlbmVkIG91dCEKCkl0IGxvb2tzIGxpa2UgZnVydGhlciBjdXJ2ZWJhbGxz
IGhhdmUgYmVlbiB0aHJvd24gYXMgYSByZXN1bHQsCmRlc3Ryb3lpbmcgYWxsICJwbGFucyIgZm9y
IHRoZSBuZXh0IGRheXMvd2Vlay4gSSBoYXZlIGFib3NsdXRlbHkKbm8gaWRlYXMgaG93IG11Y2gg
dGltZSBvciB3aGVuIEknbGwgYmUgYWJsZSB0byBsb29rIGF0IGFueXRoaW5nCmF0IHRoZSBtb21l
bnQsIHNvIGRvbid0IGFzc3VtZSB0aGF0IGJlY2F1c2UgSSBmaW5kIGFuIG9wcG9ydHVuaXR5CnRv
IHNlbmQgYW4gZW1haWwsIGV2ZXJ0aGluZyBpcyBiYWNrIHRvIG5vcm1hbC4KCkknbGwgYWxzbyBu
b3RlIHRoYXQgb3ZlciB0aGUgbGFzdCB0d28gZGF5cyBJJ3ZlIHdyaXR0ZW4gc2V2ZXJhbAplbWFp
bHMgb24gdGhpcywgc3BlbnQgbWFueSBob3VycyBvbiB0aGVtLCBvbmx5IHRvIGRpc2NhcmQgdGhl
bQphcyBvdGhlciBpZGVhcy9yZXNlYXJjaCBhbmQgbWF5YmUgZXZlbiB0aGUgcGFzc2FnZSBvZiB0
aW1lIG1lYW5zCnRoZXkncmUgbm8gbG9uZ2VyIGFwcHJvcHJpYXRlIHRvIHNlbmQuCgpKYWt1Yjog
c29ycnksIEkganVzdCAqY2FuJ3QqIHJldmlldyBzdHVmZiBvbiBuZXRkZXYgd2l0aCBldmVyeXRo
aW5nCnRoYXQgaXMgZ29pbmcgb24sIG5vdCB3aGVuIC4uLi4gY25hJ3QgY29tcGxldGUgdGhpcy4K
Ci0tIApSTUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZl
bG9wZXIvcGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2Vu
dCBjb25uZWN0aXZpdHkgYXQgbGFzdCEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
