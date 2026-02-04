Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OeyJ1PCg2mbuAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 23:04:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3587DECE98
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 23:04:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC161C87ECD;
	Wed,  4 Feb 2026 22:04:02 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AB61C87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 22:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=sjPwyNGA9xy8POgiuW0Tq0QzH0cSNVPVKMgCL48PxsA=; b=QX8FJnswsoHYefLJ2uxQ9cSJdv
 Ct7M/Ce3CQEZOx/pMyy8ZhYfHLFD5QUUNGFRvi3xXcRIFiN1o8D0V1cOhCKgfc31bzbLOxMRiM0cv
 rNEgb3KmbBBE+QrZtzh6+pVAoW5d43BCoKPCc+dni1OQfT7Kd+/jro0rbIt8ZNSvrebbDjIyVVX6y
 Q9MpyLZo95PnPlSFE3bePul4W5Uo+DZ0v+3AQqyIXgkGYpclY4FgxQBEMkhQOj5hjQ/Gi7NvaKneT
 FKh93TtRfz00xQZY6kCekx9qcI3QW/pyqyCtMRvNX3jtbc+5AC5+LPgtv7LGGYj9B+M0Ouq+2Nu47
 pTQ5b9FQ==;
Received: from i53875ac7.versanet.de ([83.135.90.199] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vnkyV-0071Wm-Sl; Wed, 04 Feb 2026 23:03:52 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Date: Wed, 04 Feb 2026 23:03:51 +0100
Message-ID: <20297648.sWSEgdgrri@diego>
In-Reply-To: <E1vnYy6-00000007hp9-1AJM@rmk-PC.armlinux.org.uk>
References: <aYMN2gZMfLPKuukG@shell.armlinux.org.uk>
 <E1vnYy6-00000007hp9-1AJM@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Cc: linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH net-next 5/6] net: stmmac: rk: use
 rk_encode_wm16() for clock selection
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
X-Spamd-Result: default: False [3.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sntech.de:s=gloria202408];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sntech.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:rmk+kernel@armlinux.org.uk,m:linux-rockchip@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[sntech.de:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:email,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3587DECE98
X-Rspamd-Action: no action

QW0gTWl0dHdvY2gsIDQuIEZlYnJ1YXIgMjAyNiwgMTA6MTQ6MzggTWl0dGVsZXVyb3DDpGlzY2hl
IE5vcm1hbHplaXQgc2NocmllYiBSdXNzZWxsIEtpbmcgKE9yYWNsZSk6Cj4gVXNlIHJrX2VuY29k
ZV93bTE2KCkgZm9yIFJNSUkgY2xvY2sgZ2F0aW5nIGNvbnRyb2wsIGFuZCBhbHNvIGZvciB0aGUK
PiBpb19jbGtzZWwgYml0IHVzZWQgdG8gc2VsZWN0IHRoZSB0cmFuc21pdCBjbG9jayBiZXR3ZWVu
IENSVS1kZXJpdmVkCj4gYW5kIElPLWRlcml2ZWQgY2xvY2sgc291cmNlcy4KPiAKPiBCb3RoIG9m
IHRoZXNlIHdlcmUgY29uZmlndXJlZCB2aWEgdGhlICJzZXRfY2xvY2tfc2VsZWN0aW9uIiBtZXRo
b2QgaW4KPiB0aGUgU29DIHNwZWNpZmljIG9wZXJhdGlvbnMsIGJ1dCB0aGVyZSBpcyBubyByZXF1
aXJlbWVudCB0byBjaGFuZ2UgdGhlCj4gaW9fY2xrc2VsIGV4Y2VwdCB3aGVuIGVuYWJsaW5nIGNs
b2Nrcy4KPiAKPiBJdCBpcyBhbHNvIHBvc3NpYmxlIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byB1bmdh
dGUgdGhlIFJNSUkgY2xvY2sgaWYgd2UKPiBhcmUgb3BlcmF0aW5nIGluIFJHTUlJIG1vZGUsIGJ1
dCB0aGlzIGNvbW1pdCBtYWtlcyBubyBjaGFuZ2UgdGhlcmUuCj4gCj4gU3BsaXQgdXAgdGhlIGNv
bmZpZ3VyYXRpb24gb2YgdGhlc2UgYXMgc2VwYXJhdGUgZnVuY3Rpb25zLCBhbmQgcmVtb3ZlCj4g
dGhlIHNldF9jbG9ja19zZWxlY3Rpb24oKSBtZXRob2QuIFNpbmNlIHRoZXNlIGNsb2NraW5nIGJp
dHMgYXJlIGluIHRoZQo+IHNhbWUgcmVnaXN0ZXIgdGhhdCB3ZSBjYWxsIHRoZSAic3BlZWQiIHJl
Z2lzdGVyLCBtb3ZlIHRoZSBsb2dpYyBmb3IKPiB3cml0aW5nIHRoYXQgcmVnaXN0ZXIgaW50byBy
a193cml0ZV9zcGVlZF9ncmZfcmVnKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5n
IChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4Lm9yZy51az4KPiAtLS0KPiAgLi4uL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5jICAgIHwgMTc0ICsrKysrKysrLS0tLS0t
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgOTkgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXJrLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5j
Cj4gaW5kZXggNDA5OWNiYzVkMGRlLi5lZDlhZGFjNzBmMGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPiBAQCAtMjcsOCArMjcsMTcg
QEAKPiAgc3RydWN0IHJrX3ByaXZfZGF0YTsKPiAgCj4gIHN0cnVjdCBya19jbG9ja19maWVsZHMg
ewo+ICsJLyogaW9fY2xrc2VsX2NydV9tYXNrIC0gaW9fY2xrc2VsIGJpdCBpbiBjbG9jayBHUkYg
cmVnaXN0ZXIgd2hpY2gsCj4gKwkgKiB3aGVuIHNldCwgc2VsZWN0cyB0aGUgdHggY2xvY2sgZnJv
bSBDUlUuCj4gKwkgKi8KPiArCXUxNiBpb19jbGtzZWxfY3J1X21hc2s7Cj4gKwkvKiBpb19jbGtz
ZWxfaW9fbWFzayAtIGlvX2Nsa3NlbCBiaXQgaW4gY2xvY2sgR1JGIHJlZ2lzdGVyIHdoaWNoLAo+
ICsJICogd2hlbiBzZXQsIHNlbGVjdHMgdGhlIHR4IGNsb2NrIGZyb20gSU8uCj4gKwkgKi8KCm5p
dDogY29tbWVudCBzdGlsZSBkb2VzIG5vdCBzZWVtIHRvIGZvbGxvdyB0aGUga2VybmVsIGNvZGlu
ZyBzdHlsZQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3MvY29kaW5nLXN0eWxl
LnJzdCNuNjIyCgo+ICsJdTE2IGlvX2Nsa3NlbF9pb19tYXNrOwo+ICAJdTE2IGdtaWlfY2xrX3Nl
bF9tYXNrOwo+ICAJdTE2IHJtaWlfY2xrX3NlbF9tYXNrOwo+ICsJdTE2IHJtaWlfZ2F0ZV9lbl9t
YXNrOwo+ICAJdTE2IG1hY19zcGVlZF9tYXNrOwo+ICB9OwoKWy4uLl0KCj4gKwkvKiBUaGUgaW9f
Y2xrc2VsIGNvbmZpZ3VyYXRpb24gY2FuIGJlIGVpdGhlcjoKPiArCSAqICAwPUNSVSwgMT1JTyAo
cmszNTA2LCByazM1MjAsIHJrMzU3Nikgb3IKPiArCSAqICAwPUlPLCAxPUNSVSAocmszNTg4KQo+
ICsJICogd2hlcmUgQ1JVIG1lYW5zIHRoZSB0cmFuc21pdCBjbG9jayBjb21lcyBmcm9tIHRoZSBD
UlUgYW5kIElPCj4gKwkgKiBtZWFucyB0aGUgdHJhbnNtaXQgY2xvY2sgY29tZXMgZnJvbSBJTy4K
PiArCSAqCj4gKwkgKiBIYW5kbGUgdGhpcyBieSBoYXZpbmcgdHdvIG1hc2tzLgo+ICsJICovCgpu
aXQ6IHNhbWUgYXMgYWJvdmUKCk90aGVyIHRoYW4gdGhlc2UgMiBuaXRzLCB0aGlzIGxvb2tzIGdv
b2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4K
VGVzdGVkLWJ5OiBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiAjcHgzMCxyazMzMjgs
cmszNTY4LHJrMzU4OAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
