Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FRXpEHztUGpu8gIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 15:02:52 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5CD73B043
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jul 2026 15:02:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=zohomail header.b="kl+P/qm1";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:zohomail.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D69F6C8F262;
	Fri, 10 Jul 2026 13:02:43 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6703C7A836
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jul 2026 13:02:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783688516; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ISZa+ManoF2nBvi4nTAyJ9DU4BKNlYwz03LQvMQkHYoUe0CwahrjMdN6U40+peTpQQ62bK6+WOGP17oT+XPbcLcrh8Hn1R6MOMRmn4J74SQnPKFKCxGUyo5QXKvWhVFZrYh0VfB/73o34hOVp8PEXIWG7wNrYskfac7SuNCJZzA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783688516;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=FDOpiS3Kf0XVsCPqWZd9Util7kCEb/QH0STMK5AmhRc=; 
 b=QyeMUJQmgEDpJB8FNwljqg+k3ypIDZtIs/RdRCBtRNEK28Ciobf2XD4oogYedBz0PKHHvr2cHcd6No0X/6F3AXDZF3wMCqlCksRSxyAMqrlYXBzhoqkuUlrSgCSdkz55F19UAqu+pPi80OEfetVSqwxIyiKdpfyTVY9JpxBdODQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783688516; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=FDOpiS3Kf0XVsCPqWZd9Util7kCEb/QH0STMK5AmhRc=;
 b=kl+P/qm1h+PtSgnueLSQiYD9lJMQ0FTQXGx1Pu47QyxBVoGT416mmNHWriG4olj+
 Yr8Fb2awyfmKajDd5G3P08ShGRUlUQdo7heCbwQImMDLmm82t4ZLm/by/Hv0CHLePS6
 bQccwDOnwqPU0+euCr2nA2PGYxdWj6M8y1DdTYi8=
Received: by mx.zohomail.com with SMTPS id 1783688513797335.15709494826183;
 Fri, 10 Jul 2026 06:01:53 -0700 (PDT)
Message-ID: <f85e08cf5e119e30ab4513e78ffa833fbe0832b7.camel@collabora.com>
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 10 Jul 2026 15:01:46 +0200
In-Reply-To: <6ea11726-8d50-411e-afab-da346e09ab9b@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-1-17f345eaaca3@collabora.com>
 <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
 <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
 <6ea11726-8d50-411e-afab-da346e09ab9b@lunn.ch>
Organization: Collabora Ltd
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: Eric Dumazet <edumazet@google.com>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 maxime.chevallier@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Biao Huang <biao.huang@mediatek.com>,
 Richard Cochran <richardcochran@gmail.com>, rmk+kernel@armlinux.org.uk,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] dt-bindings: net:
 mediatek-dwmac: add support for MT8189 SoC
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:zohomail.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[collabora.com:s=zohomail];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[louisalexis.eyraud@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:edumazet@google.com,m:kernel@collabora.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:biao.huang@mediatek.com,m:richardcochran@gmail.com,m:rmk+kernel@armlinux.org.uk,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,collabora.com,st-md-mailman.stormreply.com,kernel.org,bootlin.com,redhat.com,vger.kernel.org,mediatek.com,gmail.com,armlinux.org.uk,lists.infradead.org,lunn.ch,davemloft.net];
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
	RSPAMD_EMAILBL_FAIL(0.00)[linux-stm32-bounces@st-md-mailman.stormreply.com:query timed out];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C5CD73B043

SGkgQW5kcmV3LAoKT24gV2VkLCAyMDI2LTA3LTA4IGF0IDE2OjM1ICswMjAwLCBBbmRyZXcgTHVu
biB3cm90ZToKPiA+IE9uIFR1ZSwgMjAyNi0wNy0wNyBhdCAxNDo0MiArMDIwMCwgQW5kcmV3IEx1
bm4gd3JvdGU6Cj4gPiA+ID4gK8KgIC0gaWY6Cj4gPiA+ID4gK8KgwqDCoMKgwqAgcHJvcGVydGll
czoKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZToKPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbnRhaW5zOgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW06
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTg5LWdt
YWMKPiA+ID4gPiArwqDCoMKgIHRoZW46Cj4gPiA+ID4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoK
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqAgY2xvY2tzOgo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqAgaXRlbXM6Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNjcmlwdGlvbjog
TUFDIE1haW4gY2xvY2sKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0
aW9uOiBQVFAgY2xvY2sKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGRlc2NyaXB0
aW9uOiBSTUlJIHJlZmVyZW5jZSBjbG9jayBwcm92aWRlZCBieQo+ID4gPiA+IE1BQwo+ID4gPiAK
PiA+ID4gU2luY2UgdGhpcyBpcyBhIE1BQywgaXQgc291bmRzIGxpa2UgaXQgaXMgY29uc3VtaW5n
IGl0cyBvd24KPiA+ID4gY2xvY2s/Cj4gPiAKPiA+IEluIHRoZSBkcml2ZXIgKFsxXSksIHRoaXMg
Y2xvY2sgaXMgZGVzY3JpYmVkIGFzIGJlaW5nIG9ubHkgdXNlZCBhbmQKPiA+IG5lZWRlZCBpbiBS
TUlJIHdoZW4gTUFDIHByb3ZpZGVzIHRoZSByZWZlcmVuY2UgY2xvY2ssIGFuZCB1c2VsZXNzCj4g
PiBvdGhlcndpc2UgKFJHTUlJL01JSSBvciBSTUlJIHdoZW4gUEhZIHByb3ZpZGVzIHRoZSByZWZl
cmVuY2UKPiA+IGNsb2NrKS4KPiAKPiBTbyBpdCBzb3VuZHMgbGlrZSB0aGlzIGlzIGEgY2xvY2sg
b3V0cHV0LCBnb2luZyB0byB0aGUgUEhZLCBhcyBpdHMKPiByZWZlcmVuY2UgY2xvY2sgaW5wdXQu
IFNvIGlkZWFsbHksIHRoZSBQSFkgc2hvdWxkIGNvbnN1bWUgdGhpcyBjbG9jaywKPiBub3QgdGhl
IE1BQy4KPiAKPiA+IEl0cyB1c2UgYW5kIGNvbmZpZ3VyYXRpb24gYWxzbyBkZXBlbmRzIG9uIHRo
ZSAibWVkaWF0ZWsscm1paS1jbGstCj4gPiBmcm9tLQo+ID4gbWFjIiB2ZW5kb3IgcHJvcGVydHkg
KFsyXSkgcHJlc2VuY2UgaW4gZGV2aWNldHJlZS4KPiAKPiBUaGlzIG1ha2VzIGl0IHNvdW5kcyBs
aWtlIGl0IGlzIGhpc3RvcmljYWxseSB3cm9uZywgYW5kIHRoZSBwYXRjaCBpcwo+IGp1c3QgZXh0
ZW5kaW5nIHRoaXMgdG8gdGhlIG5ldyBkZXZpY2UuCj4gCj4gRG8geW91IGhhdmUgYSBib2FyZCB1
c2luZyBSTUlJPyBDYW4geW91IGxpc3QgdGhlIGNsb2NrIGluIHRoZSBQSFkKPiBub2RlLCBub3Qg
dGhlIE1BQywgYW5kIHNlZSBpZiBpdCBzdGlsbCB3b3Jrcz8KPiAKCkkgZG9uJ3QuwqAKQWxsIHRo
ZSBNVEsgR2VuaW8gYm9hcmRzICg1MTAsIDUyMCwgNzIwLCAxMjAwIEVWSykgSSBoYXZlIGFyZSB1
c2luZwpSR01JSSBvbmx5LgoKPiBJZGVhbGx5LCBmb3IgYSBuZXcgZGV2aWNlLCB3ZSBzaG91bGQg
bm90IHJlcGVhdCBwYXN0IGVycm9ycy4KClNvLCBkbyB5b3Ugd2FudCBJIHJlbW92ZSB0aGlzIGNs
b2NrIGZyb20gbXQ4MTg5IGNsb2NrcyBsaXN0IGZvciB2Mj8KClJlZ2FyZHMsCkxvdWlzLUFsZXhp
cwoKPiAKPiAJIEFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
