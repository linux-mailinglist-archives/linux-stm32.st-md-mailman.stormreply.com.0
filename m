Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LOsfJRlMTWpGxwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 20:57:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C67671EC89
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 20:57:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=agner.ch header.s=dkim header.b=VwgDDaMG;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=agner.ch (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C09D0C8F262;
	Tue,  7 Jul 2026 18:57:28 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB01DC7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 18:57:27 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B379F5C53A1;
 Tue,  7 Jul 2026 20:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1783450646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydta7jlti9j4LmIExsQGl//hnKkqR/izt7WQIkW8wSk=;
 b=VwgDDaMGjWsUqJunxOtrOFCt44wvbqum4Kq9eG2b5+LsgfyrmGES1P+nzQLAsMnLbDZVbi
 heOXAVXP0PMW0lVmjqKmCACcMKv6fJRCvlHJT4IAoaHFh+UYMRmVoCici37dfthuAyQpWB
 qiGsWVx+hibrDeatdSYGaoS4B163lJ4=
MIME-Version: 1.0
Date: Tue, 07 Jul 2026 20:57:26 +0200
From: Stefan Agner <stefan@agner.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
In-Reply-To: <ak01QZhCKkq2FM33@AMDC4622.eu.corp.samsungelectronics.net>
References: <20260707162146.73823-1-stefan@agner.ch>
 <CGME20260707172005eucas1p2fdf3255132201e4e2c6fcc835fd2e805@eucas1p2.samsung.com>
 <ak01QZhCKkq2FM33@AMDC4622.eu.corp.samsungelectronics.net>
Message-ID: <75d9132549fce2298f581318e2d2e80f@agner.ch>
X-Sender: stefan@agner.ch
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, "Russell King
 \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: resume PHY before
 reopening the interface on MTU change
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[agner.ch:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[agner.ch : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:j.raczynski@samsung.com,m:regressions@lists.linux.dev,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefan@agner.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,st-md-mailman.stormreply.com,armlinux.org.uk,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefan@agner.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[agner.ch:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,agner.ch:mid,agner.ch:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C67671EC89

T24gMjAyNi0wNy0wNyAxOToyMCwgSmFrdWIgUmFjenluc2tpIHdyb3RlOgo+IE9uIFR1ZSwgSnVs
IDA3LCAyMDI2IGF0IDA2OjIxOjQ2UE0gKzAyMDAsIFN0ZWZhbiBBZ25lciB3cm90ZToKPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4+
IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMK
Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4u
Ywo+PiBAQCAtNTg4NCw2ICs1ODg0LDE1IEBACj4+IAo+PiAgCQlfX3N0bW1hY19yZWxlYXNlKGRl
dik7Cj4+IAo+PiArCQkvKiBwaHlsaW5rX3N0b3AoKSBpbiBfX3N0bW1hY19yZWxlYXNlKCkgc3Vz
cGVuZHMgdGhlIFBIWS4KPj4gKwkJICogSUVFRSA4MDIuMyBhbGxvd3MgUEhZcyB0byBzdG9wIHRo
ZWlyIHJlY2VpdmUgY2xvY2sgd2hpbGUKPj4gKwkJICogcG93ZXJlZCBkb3duLCBidXQgdGhlIERN
QSBzb2Z0d2FyZSByZXNldCBwZXJmb3JtZWQgYnkKPj4gKwkJICogc3RtbWFjX2h3X3NldHVwKCkg
cmVxdWlyZXMgYSBydW5uaW5nIHJlY2VpdmUgY2xvY2suCj4+ICsJCSAqIFJlc3VtZSB0aGUgUEhZ
LCBhcyBvbiBzeXN0ZW0gcmVzdW1lLCB0byBlbnN1cmUgaXRzIGNsb2Nrcwo+PiArCQkgKiBhcmUg
cnVubmluZyBiZWZvcmUgcmVvcGVuaW5nIHRoZSBpbnRlcmZhY2UuCj4+ICsJCSAqLwo+PiArCQlw
aHlsaW5rX3ByZXBhcmVfcmVzdW1lKHByaXYtPnBoeWxpbmspOwo+IAo+IERvZXMgaXQgd29yayB3
aXRob3V0IHdhcm5pbmdzPyBOb3RoaW5nIGluIGRtZXNnPwoKV2l0aCB0aGlzIHBhdGNoIGFwcGxp
ZWQsIHRoaXMgaXMgdGhlIGRtZXNnIGxvZyBvbiBNVFUgY2hhbmdlOgpbICAgNTYuNzYxMTc1XSBy
a19nbWFjLWR3bWFjIGZlMDEwMDAwLmV0aGVybmV0IGVuZDA6IFJlZ2lzdGVyCk1FTV9UWVBFX1BB
R0VfUE9PTCBSeFEtMApbICAgNTYuNzYyNzY5XSBya19nbWFjLWR3bWFjIGZlMDEwMDAwLmV0aGVy
bmV0IGVuZDA6IExpbmsgaXMgRG93bgpbICAgNTYuODAxMzI3XSBkd21hYzQ6IE1hc3RlciBBWEkg
cGVyZm9ybXMgYW55IGJ1cnN0IGxlbmd0aApbICAgNTYuODAxMzY4XSBya19nbWFjLWR3bWFjIGZl
MDEwMDAwLmV0aGVybmV0IGVuZDA6IE5vIFNhZmV0eSBGZWF0dXJlcwpzdXBwb3J0IGZvdW5kClsg
ICA1Ni44MDE0MDldIHJrX2dtYWMtZHdtYWMgZmUwMTAwMDAuZXRoZXJuZXQgZW5kMDogSUVFRSAx
NTg4LTIwMDgKQWR2YW5jZWQgVGltZXN0YW1wIHN1cHBvcnRlZApbICAgNTYuODAxNzgwXSBya19n
bWFjLWR3bWFjIGZlMDEwMDAwLmV0aGVybmV0IGVuZDA6IHJlZ2lzdGVyZWQgUFRQCmNsb2NrClsg
ICA1Ni44MDE4MDRdIHJrX2dtYWMtZHdtYWMgZmUwMTAwMDAuZXRoZXJuZXQgZW5kMDogY29uZmln
dXJpbmcgZm9yCnBoeS9yZ21paSBsaW5rIG1vZGUKWyAgIDYxLjAzMjk4NV0gcmtfZ21hYy1kd21h
YyBmZTAxMDAwMC5ldGhlcm5ldCBlbmQwOiBMaW5rIGlzIFVwIC0KMUdicHMvRnVsbCAtIGZsb3cg
Y29udHJvbCBvZmYKCj4gcGh5bGlua19wcmVwYXJlX3Jlc3VtZSgpIGRvZXMgaGF2ZSBBU1NFUlRf
UlROTCgpIHdoaWNoIGlzIG5vdCBjYWxsZWQgYW55d2hlcmUuCgpJIGFtIG5vdCB2ZXJ5IGZhbWls
aWFyIHdpdGggdGhlIGNvZGViYXNlLCBidXQgRmFibGUgc3RhdGVzOgoKPiBSVE5MIGlzIGhlbGQg
aGVyZTogbmRvX2NoYW5nZV9tdHUgaXMgaW52b2tlZCBmcm9tIG5ldGlmX3NldF9tdHVfZXh0KCks
Cj4gd2hpY2ggY2FsbHMgbmV0ZGV2X29wc19hc3NlcnRfbG9ja2VkKCkg4oCUIGZvciBhIGRyaXZl
ciB3aXRob3V0IGluc3RhbmNlCj4gbG9ja2luZyBzdWNoIGFzIHN0bW1hYyB0aGF0IGlzIEFTU0VS
VF9SVE5MKCkg4oCUIHJpZ2h0IGJlZm9yZSBjYWxsaW5nIHRoZQo+IGRyaXZlciBvcC4gCgpXaGF0
IEkgY2FuIGRlZmluaXRlbHkgY29uZmlybSBpcyB0aGF0IHdpdGhvdXQgdGhpcyBwYXRjaCBhcHBs
aWVkLCBhIE1UVQpjaGFuZ2UgZG9lcyBub3Qgc3VjY2VlZCwgd2l0aCBpdCBhcHBsaWVkIE1UVSBj
aGFuZ2Ugd29ya3MgYW5kIHRoZQpuZXR3b3JrIGludGVyZmFjZSByZW1haW5zIGZ1bmN0aW9uYWwu
CgotLQpTdGVmYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
