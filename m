Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V4ZXIm82TmpxJAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:37:19 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBDF725EB7
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:37:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=zohomail header.b=SgpZaz1L;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:zohomail.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C11A4C8F271;
	Wed,  8 Jul 2026 11:37:18 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1E91C712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 11:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783510592; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fiM838OSJXxgoJdBoSWbg9eOpW3CqgvOWxKDidB7HrEtGzON8fr84bpH54/eWTMokKJGeHDcDC3nnYVk4PXKtWKRZ8YuoHs69TJbi8n1og/TFEs+dgzdDAJ2+0DE/KcqDXEHYoeEU9AYTGFqDed3+FOib+ScgGx/A8oJGBRFiak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783510592;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=gcY7T0lP5le5CCNf+zhfFY+iI1N5QvSyJZnptU0Oys8=; 
 b=Gb1vx0D3oEAGSswxky62uf/lSq8w8KZrVtlO0xcj6NALwgSI8elGNHJix84Q3+ITAfHFzoZc9fEBQyukiWVOJkdmrVr0HuZauE7AYvG2itYZUaKYdFplRrq4EReb8NcMpzEkeZeiDqIab3npvRk3Fr2+SKleQLi0R6yMI711yaI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783510592; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=gcY7T0lP5le5CCNf+zhfFY+iI1N5QvSyJZnptU0Oys8=;
 b=SgpZaz1LyvYikKA5/5BCe443LYNenKVSqHw4XguZa+HpuQiaQYXH8hvKhF1ve3KN
 ZZoSo3RXdwCGd6wE8gqO29opjDcsyyTT+lqZyJ5l1iegYaA+7VTNePrzVIX43pIzAZs
 LmElpjbQ+VBGQ+Mc7vZhhZGbSXxNb2Y7Y6gzMLQI=
Received: by mx.zohomail.com with SMTPS id 1783510588746822.2863328296761;
 Wed, 8 Jul 2026 04:36:28 -0700 (PDT)
Message-ID: <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 08 Jul 2026 13:36:21 +0200
In-Reply-To: <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-1-17f345eaaca3@collabora.com>
 <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[collabora.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:edumazet@google.com,m:kernel@collabora.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:biao.huang@mediatek.com,m:richardcochran@gmail.com,m:rmk+kernel@armlinux.org.uk,m:linux-mediatek@lists.infradead.org,m:matthias.bgg@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:angelogioacchino.delregno@collabora.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:matthiasbgg@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[louisalexis.eyraud@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:-];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[louisalexis.eyraud@collabora.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,collabora.com,st-md-mailman.stormreply.com,kernel.org,bootlin.com,redhat.com,vger.kernel.org,mediatek.com,gmail.com,armlinux.org.uk,lists.infradead.org,lunn.ch,davemloft.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0EBDF725EB7

SGkgQW5kcmV3LAoKT24gVHVlLCAyMDI2LTA3LTA3IGF0IDE0OjQyICswMjAwLCBBbmRyZXcgTHVu
biB3cm90ZToKPiA+ICvCoCAtIGlmOgo+ID4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPiA+ICvC
oMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCBjb250YWlu
czoKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW06Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODktZ21hYwo+ID4gK8KgwqDCoCB0aGVuOgo+ID4g
K8KgwqDCoMKgwqAgcHJvcGVydGllczoKPiA+ICvCoMKgwqDCoMKgwqDCoCBjbG9ja3M6Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBk
ZXNjcmlwdGlvbjogTUFDIE1haW4gY2xvY2sKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
ZGVzY3JpcHRpb246IFBUUCBjbG9jawo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBkZXNj
cmlwdGlvbjogUk1JSSByZWZlcmVuY2UgY2xvY2sgcHJvdmlkZWQgYnkgTUFDCj4gCj4gU2luY2Ug
dGhpcyBpcyBhIE1BQywgaXQgc291bmRzIGxpa2UgaXQgaXMgY29uc3VtaW5nIGl0cyBvd24gY2xv
Y2s/CgpJbiB0aGUgZHJpdmVyIChbMV0pLCB0aGlzIGNsb2NrIGlzIGRlc2NyaWJlZCBhcyBiZWlu
ZyBvbmx5IHVzZWQgYW5kCm5lZWRlZCBpbiBSTUlJIHdoZW4gTUFDIHByb3ZpZGVzIHRoZSByZWZl
cmVuY2UgY2xvY2ssIGFuZCB1c2VsZXNzCm90aGVyd2lzZSAoUkdNSUkvTUlJIG9yIFJNSUkgd2hl
biBQSFkgcHJvdmlkZXMgdGhlIHJlZmVyZW5jZSBjbG9jaykuCgpJdHMgdXNlIGFuZCBjb25maWd1
cmF0aW9uIGFsc28gZGVwZW5kcyBvbiB0aGUgIm1lZGlhdGVrLHJtaWktY2xrLWZyb20tCm1hYyIg
dmVuZG9yIHByb3BlcnR5IChbMl0pIHByZXNlbmNlIGluIGRldmljZXRyZWUuCgpEbyB5b3Ugd2lz
aCB0aGlzIGNsb2NrIGRlc2NyaXB0aW9uIGJlIHJld29yZGVkIGluIHRoZSBkdC1iaW5kaW5ncyBm
b3IKYm90aCBvY2N1cnJlbmNlcz8KClsxXToKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL2RyaXZlcnMvbmV0L2V0
aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLW1lZGlhdGVrLmMjbjQ4MApbMl06Cmh0dHBzOi8v
Z2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5n
aXQvdHJlZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L21lZGlhdGVrLWR3
bWFjLnlhbWwjbjEwOAoKUmVnYXJkcywKTG91aXMtQWxleGlzCj4gCj4gCUFuZHJldwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
