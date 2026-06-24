Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7hqWAE3EO2o9cggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 13:49:33 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D736BDD2E
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2026 13:49:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=sntech.de header.s=gloria202408 header.b=u+3l0513;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=sntech.de (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37B25C8F292;
	Wed, 24 Jun 2026 11:49:32 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BA72C87EDE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=Js+56ANKxPxs/46/PFzp/qZpp2mD0OpgfX8pfIomZwQ=; b=u+3l0513/jiVxcbyjkOiqN809G
 2FAxCcySH/27vGu51RIwGdzd7RdgsJzIElKLg5bvVdTYm5QR7ZuKjBe569yP2AMIi8NDorLSrXCjl
 +8EQngoG7F2CYbr6uBNs0PzsaEvGa9M3L/unrNeyXQxmck47zQB5//XBCQVNNSKWassX+h8GXcbom
 NU74uh7PQGCZvPUQD5k+n1KOp0Aho5ASE8t9dsdQQif1MKnvK5F70scLZSG1ntG+48DX0PbLuGVah
 7w2yjr982EGHwzmGmO/raYZ8htGjQmOSy4ovTLsfZepdyc6fOdag4SZtfNmsLJd5cYO1RBg8Il9Nr
 N4iyrrhQ==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Wu <david.wu@rock-chips.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 13:49:12 +0200
Message-ID: <4954560.rnE6jSC6OK@diego>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-4-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
 <20260624-rv1126-alientek-dlrv1126-v1-4-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/7] net: stmmac: dwmac-rk: Enable refout
	clock for RGMII
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[sntech.de : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sntech.de:s=gloria202408];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:david.wu@rock-chips.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:grumpycat921013@gmail.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,rock-chips.com,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sntech.de:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[diego:mid,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84D736BDD2E

SGksCgpBbSBNaXR0d29jaCwgMjQuIEp1bmkgMjAyNiwgMTA6NDQ6NDEgTWl0dGVsZXVyb3DDpGlz
Y2hlIFNvbW1lcnplaXQgc2NocmllYiBZYW5hbiBIZToKPiBTb21lIFJvY2tjaGlwIEdNQUMgaW50
ZWdyYXRpb25zIHVzZSBjbGtfbWFjX3JlZm91dCBhcyBhbiBleHRlcm5hbCBQSFkKPiByZWZlcmVu
Y2UgY2xvY2sgZXZlbiB3aGVuIHRoZSBNQUMgaXMgY29uZmlndXJlZCBmb3IgUkdNSUkuCj4gCj4g
UlYxMTI2IGJvYXJkcyBjYW4gcm91dGUgQ0xLX0dNQUNfRVRIRVJORVRfT1VUIHRvIHRoZSBleHRl
cm5hbCBQSFkgYXMgYQo+IDI1IE1IeiByZWZlcmVuY2UgY2xvY2suIElmIHRoZSBkcml2ZXIgZG9l
cyBub3QgYWNxdWlyZSBhbmQgZW5hYmxlIHRoaXMKPiBjbG9jayBpbiBSR01JSSBtb2RlLCB0aGUg
Y29tbW9uIGNsb2NrIGZyYW1ld29yayBtYXkgZGlzYWJsZSBpdCBhcyB1bnVzZWQKPiBhbmQgdGhl
IFBIWSBjYW4gbG9zZSBpdHMgcmVmZXJlbmNlIGNsb2NrLgo+IAo+IEVuYWJsZSB0aGUgcmVmb3V0
IGNsb2NrIGhhbmRsaW5nIGZvciBSR01JSSBpbiBhZGRpdGlvbiB0byBSTUlJLgoKdGhlIGNsb2Nr
IHlvdXIgcmVmZXJlbmNpbmcgaXMgbm90IGxpbWl0ZWQgdG8geW91ciBydjExMjYgYnV0IGluc3Rl
YWQKcHJlc2VudCBvbiBtb3N0IChhbGw/KSBSb2NrY2hpcCBTb0NzLgoKQW5kIGl0IGlzIGFuIGlu
cHV0IGNsb2NrIGZvciB0aGUgcGh5IGl0c2VsZiwgc28gc2hvdWxkIGJlIGhhbmRsZWQgdGhlcmUu
CgpTZWUgZm9yIGV4YW1wbGUKICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cm9ja2NoaXAvcmszNTg4LXRpZ2VyLmR0c2kjbjMxMwphcyBhIHJlZmVyZW5jZS4KCgpIZWlrbwoK
PiBTaWduZWQtb2ZmLWJ5OiBZYW5hbiBIZSA8Z3J1bXB5Y2F0OTIxMDEzQGdtYWlsLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYyB8IDYg
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXJrLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yay5j
Cj4gaW5kZXggOGQ3MDQyZTY4OTI2Li5mNmZkYzBjNWI0NzUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtcmsuYwo+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLXJrLmMKPiBAQCAtMTExMiw3ICsxMTEy
LDggQEAgc3RhdGljIGludCBya19nbWFjX2Nsa19pbml0KHN0cnVjdCBwbGF0X3N0bW1hY2VuZXRf
ZGF0YSAqcGxhdCkKPiAgCWJzcF9wcml2LT5jbGtfZW5hYmxlZCA9IGZhbHNlOwo+ICAKPiAgCWJz
cF9wcml2LT5udW1fY2xrcyA9IEFSUkFZX1NJWkUocmtfY2xvY2tzKTsKPiAtCWlmIChwaHlfaWZh
Y2UgPT0gUEhZX0lOVEVSRkFDRV9NT0RFX1JNSUkpCj4gKwlpZiAocGh5X2lmYWNlID09IFBIWV9J
TlRFUkZBQ0VfTU9ERV9STUlJIHx8Cj4gKwkgICAgcGh5X2lmYWNlID09IFBIWV9JTlRFUkZBQ0Vf
TU9ERV9SR01JSSkKPiAgCQlic3BfcHJpdi0+bnVtX2Nsa3MgKz0gQVJSQVlfU0laRShya19ybWlp
X2Nsb2Nrcyk7Cj4gIAo+ICAJYnNwX3ByaXYtPmNsa3MgPSBkZXZtX2tjYWxsb2MoZGV2LCBic3Bf
cHJpdi0+bnVtX2Nsa3MsCj4gQEAgLTExMjMsNyArMTEyNCw4IEBAIHN0YXRpYyBpbnQgcmtfZ21h
Y19jbGtfaW5pdChzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2RhdGEgKnBsYXQpCj4gIAlmb3IgKGkg
PSAwOyBpIDwgQVJSQVlfU0laRShya19jbG9ja3MpOyBpKyspCj4gIAkJYnNwX3ByaXYtPmNsa3Nb
aV0uaWQgPSBya19jbG9ja3NbaV07Cj4gIAo+IC0JaWYgKHBoeV9pZmFjZSA9PSBQSFlfSU5URVJG
QUNFX01PREVfUk1JSSkgewo+ICsJaWYgKHBoeV9pZmFjZSA9PSBQSFlfSU5URVJGQUNFX01PREVf
Uk1JSSB8fAo+ICsJICAgIHBoeV9pZmFjZSA9PSBQSFlfSU5URVJGQUNFX01PREVfUkdNSUkpIHsK
PiAgCQlmb3IgKGogPSAwOyBqIDwgQVJSQVlfU0laRShya19ybWlpX2Nsb2Nrcyk7IGorKykKPiAg
CQkJYnNwX3ByaXYtPmNsa3NbaSsrXS5pZCA9IHJrX3JtaWlfY2xvY2tzW2pdOwo+ICAJfQo+IAo+
IAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
