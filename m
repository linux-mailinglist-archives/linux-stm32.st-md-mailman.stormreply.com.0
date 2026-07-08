Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QV4zGpdCTmpQJwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:29:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E55BC7264F2
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 14:29:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=zohomail header.b=h6bRTRdC;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:zohomail.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91197C8F283;
	Wed,  8 Jul 2026 12:29:10 +0000 (UTC)
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9AFEC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 12:29:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783513718; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=dmk5QtOSqylrvj1O3kiWrYo5jOBHtMdHnLgwpkgK/OeYJcaygEFc908bdEjJcwFL8duOUKfqaBXGOC+SRZSCHufdPYaYi9PLGNM8bRxhcFLFnofEyRbsoTBNyULAcUmy14ns31kQof4IQPKzXk0XT8RQSPfV+HzfwpBImuFSjoI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783513718;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=QCvu92owlqFigfn30SNdUxyYgy9yaDdYJCfmb5B8+hA=; 
 b=TUVE5cAWvaUKOL/7VkXKNsheZFAnqsjFihWOVi5E8/Lf3tOGzoa/GO+f4zkq6Tnoe+IopkOelUVU/gUR72HtIh4Cuvzg1DGca0jE5//B0m0MTT5dIGFCJ1yRRuscfQIB3dWcW5Zc8zDQl5E1y6DCGRw/JiBf04r8cl6BSbEceZo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783513718; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=QCvu92owlqFigfn30SNdUxyYgy9yaDdYJCfmb5B8+hA=;
 b=h6bRTRdCEfGpTsXUdZushp4txBmx8lAJ2sgujTR/sAo9JJSBSlceJfhV4vZkaYkY
 rtrySVIeuYT8F3dzrFdpWNZza1RcYhMupJRR8ITAYN7hBDSSyKEo6vz8FjpFDY09sUP
 Nkn2iZd7+RFWywEK1Pwpr2rr8GIUn8Cc/b1GUQZQ=
Received: by mx.zohomail.com with SMTPS id 1783513715946883.1743690151607;
 Wed, 8 Jul 2026 05:28:35 -0700 (PDT)
Message-ID: <e390664dc439043a43b6ded3c50c9a2bb5bbd2f6.camel@collabora.com>
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
Date: Wed, 08 Jul 2026 14:28:30 +0200
In-Reply-To: <2a421449-01eb-4066-8c19-d554ff8e4f6e@bootlin.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-5-17f345eaaca3@collabora.com>
 <2a421449-01eb-4066-8c19-d554ff8e4f6e@bootlin.com>
Organization: Collabora Ltd
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, rmk+kernel@armlinux.org.uk,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: mediatek: add
 support for TX deallocation adjustment feature
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:email,collabora.com:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E55BC7264F2

SGkgTWF4aW1lLAoKT24gVHVlLCAyMDI2LTA3LTA3IGF0IDExOjExICswMjAwLCBNYXhpbWUgQ2hl
dmFsbGllciB3cm90ZToKPiBIaSwKPiAKPiBPbiA3LzcvMjYgMTA6MjEsIExvdWlzLUFsZXhpcyBF
eXJhdWQgd3JvdGU6Cj4gPiBUaGUgTVQ4MTg5IFNvQyBoYXMgaW4gdGhlIEV0aGVybmV0IGNvbnRy
b2wgMCByZWdpc3RlciBmcm9tIHRoZQo+ID4gcGVyaXBoZXJhbCBjb25maWd1cmF0aW9uIChwZXJp
Y2ZnKSBhZGRpdGlvbmFsIGJpdHMgdG8gYWRqdXN0IHRoZSBUWAo+ID4gZGVhbGxvY2F0aW9uLgo+
ID4gCj4gPiBJbiBwcmVwYXJhdGlvbiBvZiBNVDgxODkgU29DIHN1cHBvcnQsIGFkZCBpdHMgZGVm
aW5pdGlvbiwgdXNlIGluCj4gPiB0aGUKPiA+IHNldF9kZWxheV92MiBjYWxsYmFjaywgYW5kIGEg
c3VwcG9ydCBmbGFnIGluIHRoZSBwbGF0Zm9ybSBkYXRhLgo+IAo+IENhbiB5b3UgZWxhYm9yYXRl
IGEgYml0IG9uIHRoaXMgPyBJIGRvbid0IHF1aXRlIGdldCB3aGF0IHlvdSBtZWFuIGJ5Cj4gInR4
IGRlYWxsb2NhdGlvbiIsIHRoaXMgc2VlbXMgdG8gaGF2ZSB0byBkbyB3aXRoIFJHTUlJIHRpbWlu
Z3MgZnJvbQo+IHRoZSByZWdpc3RlciBhY2Nlc3MgcGF0dGVybiwgYnV0IHRoZSBsb2NhbCBib29s
ZWFuIGZsYWcgZm9yIHRoZQo+IGZlYXR1cmUKPiBpcyBuYW1lZCAidXNlX3N0YWdlX2ZpbmUiLCBJ
J20gZmFpbGluZyB0byBjb25uZWN0IGFsbCB0aGUgZG90cyBoZXJlCj4gd2l0aCB0aGUgZGlmZmVy
ZW50IHRlcm1pbm9sb2d5IGluIHVzZSA6KAo+IApUaGUgZGF0YSBzaGVldHMgSSBoYXZlLCBkb24n
dCBoYXZlIGluZm8gcmVnYXJkaW5nIHRoaXMgcmVnaXN0ZXIsIHNvCkknbGwgdHJ5IHRvIGdldCBt
b3JlIGFuZCBpbXByb3ZlIGNvbW1pdCBhbmQvb3IgY29kZSBkZXNjcmlwdGlvbi4KCkknbGwgYWxz
byBjaGVjayBpZiB0aGUgcmVnaXN0ZXIgZGVmaW5pdGlvbiBuYW1lIGlzIGNvbnNpc3RlbnQKKGRv
d25zdHJlYW0gZHJpdmVyIGFuZCB1cHN0cmVhbSB1LWJvb3QgdXNlIHRoaXMgc3RhZ2UgZmluZSB0
ZXJtKS4KClRoZSB1c2Vfc3RhZ2VfZmluZSBmZWF0dXJlIGZsYWcgY291bGQgYmUgcmVuYW1lZCBh
bnl3YXkgdG8gbWF0Y2ggd2hhdAppdCBkb2VzLgoKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTG91
aXMtQWxleGlzIEV5cmF1ZAo+ID4gPGxvdWlzYWxleGlzLmV5cmF1ZEBjb2xsYWJvcmEuY29tPgo+
ID4gLS0tCj4gPiDCoC4uLi9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0
ZWsuY8KgwqAgfCAyNQo+ID4gKysrKysrKysrKysrKysrKy0tLS0tLQo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMK
PiA+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtbWVkaWF0ZWsu
Ywo+ID4gaW5kZXggYmNjMGJhZWYzZjcxLi42YjBhNDJiNTgzOWYgMTAwNjQ0Cj4gPiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5jCj4gPiAr
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1tZWRpYXRlay5j
Cj4gPiBAQCAtMzcsNyArMzcsOCBAQAo+ID4gwqAjZGVmaW5lIEVUSF9GSU5FX0RMWV9SWEMJQklU
KDApCj4gPiDCoAo+ID4gwqAvKiBQZXJpIENvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgZm9yIG10ODE4
OSAqLwo+ID4gLSNkZWZpbmUgTVQ4MTg5X0NUUkwwX1RYQ19PVVRfT1AJCUJJVCgyMCkKPiA+ICsj
ZGVmaW5lIE1UODE4OV9DVFJMMF9UWENfT1VUX09QCQkJQklUKDIwKQo+IAo+IEV4dHJhIHdoaXRl
c3BhY2UgaW5zZXJ0ZWQgaGVyZSA6KQo+IApPb3BzLCB0byBiZSBmaXhlZCBpbiB2MgoKUmVnYXJk
cywKTG91aXMtQWxleGlzCgo+IFRoYW5rcywKPiAKPiBNYXhpbWUKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
