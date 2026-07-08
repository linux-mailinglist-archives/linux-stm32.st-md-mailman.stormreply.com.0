Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EmtfJCg9TmoOJgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:06:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A53726214
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:06:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=zohomail header.b="EL8T/+B7";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:zohomail.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C16FBC8F271;
	Wed,  8 Jul 2026 12:05:59 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DA28C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 12:05:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783512307; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=KvgWjgnVrtF6+ZkBWicFziVYuQdsIssCDuicOCsak8yQIYN7+5NGdf+ouUluqMO+Ev9SpCAtLa9UAT0ZMlgXiSB9fnXQvS3VTwuC0nWRDjuzSKl2xyNx2lP4/AACMn9OXW18m83oYXQSvoABm1Md5du7KWpgypvrj/KL/C/BvOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783512307;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wGYZTikwg2rXaLxaDX2K7Y9au6mX/qYf21+84FQdF+0=; 
 b=i+SFhQOt8b7X+gb4HX6jliFLSEB9iWLysvFJn85UUCNPBSUlqm6LfKn81LjB2ZHGWpqst9XokiDCZIokBV4eByx9ip9FUP+H/CCPbfSzyqN+p47WVR2x96GqZ1hz6NZyIuQ+FKj317l4DDPoEhyS7bJN1g38dA+n5857+d9hjZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783512307; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=wGYZTikwg2rXaLxaDX2K7Y9au6mX/qYf21+84FQdF+0=;
 b=EL8T/+B7liCUlfZVaMPg9+sHHWJLi6JR1rw48kEi/26KZG9GVaSE91tpGn8QaUwq
 zOQx89xA1YldfIIOlBnXMApdwV0+nR1dNcGKgWuVRwjL5ACuITyd4pP7q5KXz7I3mqp
 3q+Jp1BO50LeAAOOYScLmdFpi7obyJAdCFf/uy1o=
Received: by mx.zohomail.com with SMTPS id 1783512305076652.4555392247563;
 Wed, 8 Jul 2026 05:05:05 -0700 (PDT)
Message-ID: <658a04060e5c415af97dcc84284ab8962d1b7348.camel@collabora.com>
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran	 <richardcochran@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Biao Huang
 <biao.huang@mediatek.com>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 08 Jul 2026 14:04:59 +0200
In-Reply-To: <5dbd217b-8df5-42cd-9197-36e0fb91ffe7@bootlin.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-3-17f345eaaca3@collabora.com>
 <5dbd217b-8df5-42cd-9197-36e0fb91ffe7@bootlin.com>
Organization: Collabora Ltd
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 3/6] net: stmmac: mediatek:
 rename MT2712 and MT8195 variant methods
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[collabora.com:s=zohomail];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:zohomail.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:biao.huang@mediatek.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[louisalexis.eyraud@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[bootlin.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,collabora.com,mediatek.com,foss.st.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[louisalexis.eyraud@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:email,collabora.com:mid,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15A53726214

SGkgTWF4aW1lLAoKT24gVHVlLCAyMDI2LTA3LTA3IGF0IDExOjA1ICswMjAwLCBNYXhpbWUgQ2hl
dmFsbGllciB3cm90ZToKPiAKPiAKPiBPbiA3LzcvMjYgMTA6MjEsIExvdWlzLUFsZXhpcyBFeXJh
dWQgd3JvdGU6Cj4gPiBJbiBwcmVwYXJhdGlvbiBvZiBuZXdlciBTb0Mgc3VwcG9ydCwgcmVuYW1l
IE1UMjcxMiBhbmQgTVQ4MTk1Cj4gPiB2YXJpYW50Cj4gPiBtZXRob2RzIGFuZCBzdWIgZnVuY3Rp
b25zIHRvIG1vcmUgZ2VuZXJpYyBuYW1lcy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTG91aXMt
QWxleGlzIEV5cmF1ZAo+ID4gPGxvdWlzYWxleGlzLmV5cmF1ZEBjb2xsYWJvcmEuY29tPgo+ID4g
LS0tCj4gPiDCoC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsu
Y8KgwqAgfCAzMgo+ID4gKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gwqAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jCj4g
PiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMK
PiA+IGluZGV4IDBjYWJhYjRmZDg5YS4uMjhlODc5OTBiMGExIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYwo+ID4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsuYwo+
ID4gQEAgLTExMCw3ICsxMTAsNyBAQCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10ODE5NV9k
d21hY19jbGtfbFtdCj4gPiA9IHsKPiA+IMKgCSJheGkiLCAiYXBiIiwgIm1hY19jZyIsICJtYWNf
bWFpbiIsICJwdHBfcmVmIgo+ID4gwqB9Owo+ID4gwqAKPiA+IC1zdGF0aWMgaW50IG10MjcxMl9z
ZXRfaW50ZXJmYWNlKHN0cnVjdCBtZWRpYXRla19kd21hY19wbGF0X2RhdGEKPiA+ICpwbGF0LAo+
ID4gK3N0YXRpYyBpbnQgc2V0X3BoeV9pbnRlcmZhY2VfdjEoc3RydWN0IG1lZGlhdGVrX2R3bWFj
X3BsYXRfZGF0YQo+ID4gKnBsYXQsCj4gPiDCoAkJCQl1OCBwaHlfaW50Zl9zZWwpCj4gCj4gV2hh
dCBkb2VzIHRoaXMgbmFtaW5nIG9mICJ2MSAvIHYyIiByZWZlciB0byA/Cj4gCj4gSSBwZXJzb25h
bGx5IGRvbid0IGZpbmQgaXQgbXVjaCBiZXR0ZXIgdGhhbiB0aGUgY3VycmVudCBvbmUgcHJlZml4
ZWQKPiBieSB0aGUgU29DCj4gbmFtZS4gWW91IHN0aWxsIGVuZC11cCB1c2luZyByZWdpc3RlcnMg
dGhhdCBoYXZlIHRoZSAiTVQ4MTk1XyIgcHJlZml4Cj4gaW4gdGhlaXIKPiBuYW1lcyBpbiB0aGUg
J3YyJyB2YXJpYW50cyBvZiB0aGVzZSBmdW5jdGlvbnMsIHNvIGl0IHN0aWxsIHNvdW5kIFNvQy0K
PiBmYW1pbHkgc3BlY2lmaWMgOikKPiAKSSBhZ3JlZS4KCkluIGEgd29yayBpbiBwcm9ncmVzcyB2
ZXJzaW9uIG9mIHRoaXMgc2VyaWVzLCBJIGhhZCByZW5hbWVkIGFsbApyZWdpc3RlciBkZWZpbml0
aW9ucyBhcyB3ZWxsICh0byByZW1vdmUgdGhlIG10ODE5NV8gcHJlZml4KSBidXQgZHJvcHBlZAp0
aGUgY2hhbmdlcyBiZWNhdXNlIHRvbyBtdWNoIGRpZmZlcmVuY2UgZm9yIGxpdHRsZSBnYWluLgpJ
IGtlcHQgdGhpcyBwYXRjaCBidXQgaXQgZG9lcyBub3QgcmVhbGx5IGltcHJvdmUgdGhlIGNvZGUu
Cgo+IEknZCBzYXkgeW91IGNhbiBrZWVwIHRoZSBvcmlnaW5hbCBuYW1lcyBhcy1pcywgb3IgaWYg
eW91IHJlYWxseSB3YW50Cj4gYSByZW5hbWUsCj4gbWF5YmUgdXNlIHRoZSBtdDgxeHhfIHByZWZp
eCBmb3IgTVQ4MTk1IGFuZCBNVDgxODkgPwpJJ2xsIGRyb3AgdGhpcyBwYXRjaCBpbiB2MiB0byBr
ZWVwIHRoZSBleGlzdGluZyBuYW1lcyAoYW5kIHNtYWxsZXIKY2hhbmdlcykuCgpSZWdhcmRzLApM
b3Vpcy1BbGV4aXMKCj4gTWF4aW1lCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
