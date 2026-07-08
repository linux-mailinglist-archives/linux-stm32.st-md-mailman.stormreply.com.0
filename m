Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 94DHBE44TmrmJAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:45:18 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC39725FB8
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 13:45:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=collabora.com header.s=zohomail header.b=hHGodoC5;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=collabora.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:zohomail.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BB38C8F274;
	Wed,  8 Jul 2026 11:45:17 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2621CC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 11:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1783511084; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BbzfzKxqbvPnrvyVyHOhzb8iD20zR3d66/NJqDevEdeclatBqZjVOp40FJJBVUGAkZDBYHC3ODWdArm/rrjpPI/IYXPshf4P9TSy6xjx5FerLYq09rVpkQAzZ0wtIsSdxbEgl7L1HfDSB20xpPNMSd/B5CoQVlqmup2BYQWPqWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1783511084;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=10jNbGRvZsPmWMGouxLK8UHxoLr85rz2aRkumx5Y9/A=; 
 b=LLI7sW882jTnhgaNd1popR55mSPsaxMbsW7mOffkw42FDSe0VycSQiGZ6O64cH0tHIQxND9to8OpnJaDzWBoOpCCdbMpAlocI3IZmYvw7TkOJqvBGqRvPyB3UW/jSL7WMfvBv+qkEAA9ROigdTLXPBOSp/QugRRqThk+tJqbR9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
 dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783511084; 
 s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=10jNbGRvZsPmWMGouxLK8UHxoLr85rz2aRkumx5Y9/A=;
 b=hHGodoC5rNtt9ao4ZOa0g7TQj9LXm/mPnD0kmSkHKFrfpnRPy4Mnq1S3IQjvaToI
 LBIjBPD3bgr6htQpPURhrwg7UUMeCeGicaNuGHnfvGhRuM4zF2kDIcjqD0IrVq3NnNs
 mazulxdQPHJYyp46a0hAfQktOenapwaW2mdU/4ms=
Received: by mx.zohomail.com with SMTPS id 1783511083198326.6815554898435;
 Wed, 8 Jul 2026 04:44:43 -0700 (PDT)
Message-ID: <3c22fe68c08c414b789c79144ae569840e1ba6a9.camel@collabora.com>
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 08 Jul 2026 13:44:36 +0200
In-Reply-To: <3e135fe0-4ef9-45be-a962-d131c8a2e9e0@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-2-17f345eaaca3@collabora.com>
 <3e135fe0-4ef9-45be-a962-d131c8a2e9e0@lunn.ch>
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
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: mediatek: add
 PERI_ETH_CTRLx register offset in platform data
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
X-Rspamd-Queue-Id: 8FC39725FB8

SGkgQW5kcmV3CgpPbiBUdWUsIDIwMjYtMDctMDcgYXQgMTQ6NDUgKzAyMDAsIEFuZHJldyBMdW5u
IHdyb3RlOgo+ID4gKwkucGVyaV9ldGhfY3RybF9vZmZzZXQgPSBNVDgxOTVfUEVSSV9FVEhfQ1RS
TF9CQVNFLAo+IAo+IG5pdHBpY2s6Cj4gCj4gQ291bGQgdGhlIG5hbWluZyBiZSBtb3JlIGNvbnNp
c3RlbnQ/IG9mZnNldCB2cyBiYXNlPwo+IAo+IAlBbmRyZXcKCkFjay7CoAoKVGhlIGNvbW1pdCBk
ZXNjcmlwdGlvbiBhbmQgc3ViamVjdCBhbHNvIHVzZSBvZmZzZXQgdGVybWlub2xvZ3kgYW5kIG5v
dApiYXNlIHNvIGJldHRlciBrZWVwIHRoZSBjb25zaXN0ZW5jeS4KCkknbGwgcmVuYW1lIHRoaXMg
ZGVmaW5lIHRvIE1UODE5NV9QRVJJX0VUSF9DVFJMX09GRlNFVCBpbiB0aGUgdjIKdmVyc2lvbiBh
bmQgZG8gdGhlIHNhbWUgZm9yIHRoZSBNVDgxODkgb25lIGluIHBhdGNoIDYuCgpSZWdhcmRzLApM
b3Vpcy1BbGV4aXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
