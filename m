Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CE8GNUGi2kdPQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:22:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 051AB119937
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:22:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2A49C87EC0;
	Tue, 10 Feb 2026 10:22:12 +0000 (UTC)
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D477C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 10:22:11 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Tue, 10 Feb 2026 18:21:40 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Tue, 10 Feb 2026 18:21:40 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 "Andrew Lunn" <andrew@lunn.ch>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aYnvwAK3gpxBs-EF@shell.armlinux.org.uk>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch>
 <aYnvwAK3gpxBs-EF@shell.armlinux.org.uk>
MIME-Version: 1.0
Message-ID: <5dea8ce0.4435.19c471231f5.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDXMzm0BotpuZEEAA--.2117W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEODGmKDIMekQAAsi
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linmin@eswincomputing.com, devicetree@vger.kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,eswincomputing.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org,einfochips.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 051AB119937
X-Rspamd-Action: no action

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiUnVzc2VsbCBLaW5nIChP
cmFjbGUpIiA8bGludXhAYXJtbGludXgub3JnLnVrPgo+IOWPkemAgeaXtumXtDoyMDI2LTAyLTA5
IDIyOjMxOjI4ICjmmJ/mnJ/kuIApCj4g5pS25Lu25Lq6OiBsaXpoaTJAZXN3aW5jb21wdXRpbmcu
Y29tLCAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4KPiDmioTpgIE6IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5u
ZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3Jn
LCBrcnprK2R0QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtl
cm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBh
bGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcsIGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20sIGxpbm1p
bkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNvbSwgd2Vp
c2hhbmdqdWFuQGVzd2luY29tcHV0aW5nLmNvbQo+IOS4u+mimDogUmU6IFtQQVRDSCB2MiAwLzJd
IG5ldDogc3RtbWFjOiBlaWM3NzAwOiBmaXggRUlDNzcwMCBldGgxIFJYIHNhbXBsaW5nIHRpbWlu
Zwo+IAo+IE9uIE1vbiwgRmViIDA5LCAyMDI2IGF0IDAyOjM2OjExUE0gKzAxMDAsIEFuZHJldyBM
dW5uIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMDksIDIwMjYgYXQgMDU6NDY6MjhQTSArMDgwMCwg
bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+ID4gRnJvbTogWmhpIExpIDxsaXpo
aTJAZXN3aW5jb21wdXRpbmcuY29tPgo+ID4gPiAKPiA+ID4gdjEgLT4gdjI6Cj4gPiAKPiA+IEZv
ciB2ZXJzaW9uIDMsIHBsZWFzZSBpbmNsdWRlIGEgcGF0Y2ggdG8gdGhlIFNvQyAuZHRzaSBmaWxl
IGFkZGluZyB0aGUKPiA+IEV0aGVybmV0IG5vZGVzLiBXZSBsaWtlIHRvIHNlZSB1c2VycyBvZiBj
b2RlIGJlaW5nIGFkZGVkLgo+IAo+IEluIGFkZGl0aW9uIHRvIEFuZHJldydzIGNvbW1lbnRzLCBi
ZWZvcmUgcG9zdGluZyBhbm90aGVyIHNlcmllcywgcGxlYXNlCj4gcmV2aWV3IGh0dHBzOi8vZG9j
cy5rZXJuZWwub3JnL3Byb2Nlc3MvbWFpbnRhaW5lci1uZXRkZXYuaHRtbCwKPiBwYXJ0aWN1bGFy
bHkgc2VjdGlvbnMgMS40IGFuZCAxLjYuMS4KPiAKVGhhbmtzIGZvciB0aGUgY29tbWVudHMuCgpU
aGUgdjMgcGF0Y2ggd2lsbCB0YXJnZXQgdGhlIG5ldCBnaXQgdHJlZS4KCldlIHdpbGwgYWRkIHRo
ZSBldGhlcm5ldCBub2RlcyBhbmQgdGhlIGNvcnJlc3BvbmRpbmcgY2xvY2sgbm9kZSB0bwplaWM3
NzAwLmR0c2kgYW5kIGVpYzc3MDAtaGlmaXZlLXByZW1pZXItcDU1MC5kdHMgaW4gdjMgcGF0Y2gu
IAoKUGxlYXNlIG5vdGUgdGhhdCB0aGUgRUlDNzcwMCBjbG9jayBjb250cm9sbGVyIGJpbmRpbmcg
YW5kIGRyaXZlciBhcmUgbm90CnlldCBtZXJnZWQgdXBzdHJlYW0sIHNvIHRoZSBjbG9jayBub2Rl
cyB3aWxsIG5vdCBiZSBmdW5jdGlvbmFsIHVudGlsIHRoZQpjbG9jayBkcml2ZXIgaXMgYXZhaWxh
YmxlLiBBcyBhIHJlc3VsdCwgZHRic19jaGVjayB3aWxsIGN1cnJlbnRseSByZXBvcnQKc2NoZW1h
IHdhcm5pbmdzL2Vycm9ycyByZWxhdGVkIHRvIHRoZSBjbG9jayBub2Rlcy4gVGhpcyBpcyBhIGtu
b3duIGFuZAp0ZW1wb3JhcnkgbGltaXRhdGlvbiB1bnRpbCB0aGUgY2xvY2sgYmluZGluZyBhbmQg
ZHJpdmVyIGFyZSBhdmFpbGFibGUKdXBzdHJlYW0uCgpQbGVhc2UgbGV0IHVzIGtub3cgaWYgdGhp
cyBhcHByb2FjaCBpcyBhY2NlcHRhYmxlLgoKQmVzdCByZWdhcmRzLApaaGkgTGkKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
