Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J9gDAS8n2ktdgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 04:20:36 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D22181A073E
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 04:20:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 652CCC87EC3;
	Thu, 26 Feb 2026 03:20:35 +0000 (UTC)
Received: from sgoci-sdnproxy-4.icoremail.net (sgoci-sdnproxy-4.icoremail.net
 [129.150.39.64])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45495C87EC2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 03:20:33 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 26 Feb 2026 11:20:02 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 26 Feb 2026 11:20:02 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Marcel Ziswiler" <marcel@ziswiler.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
 <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
MIME-Version: 1.0
Message-ID: <6137cd6a.4859.19c97f5eb67.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgBn_HDiu59pn6YDAA--.351W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgEKDGmfJIYS1AAAsX
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: ganboing@gmail.com, edumazet@google.com,
 linux-stm32@st-md-mailman.stormreply.com, dongxuyang@eswincomputing.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
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
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[eswincomputing.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:marcel@ziswiler.com,m:ganboing@gmail.com,m:edumazet@google.com,m:linux-stm32@st-md-mailman.stormreply.com,m:dongxuyang@eswincomputing.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[gmail.com,google.com,st-md-mailman.stormreply.com,eswincomputing.com,kernel.org,einfochips.com,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,lunn.ch,davemloft.net];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.702];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: D22181A073E
X-Rspamd-Action: no action

SGkgTWFyY2VsLAoKVGhhbmtzIGZvciBzaGFyaW5nIHRoZSBkZXRhaWxzLgoKMS4gSSBjaGVja2Vk
IHlvdXIgbG9nIGFuZCBub3RpY2VkIHRoYXQgdGhlIGtlcm5lbCBjbWRsaW5lIGFscmVhZHkgaW5j
bHVkZXMKICAgImNsa19pZ25vcmVfdW51c2VkIi4gVGhlcmVmb3JlLCB5b3VyIGlzc3VlIGRvZXMg
bm90IGFwcGVhciB0byBiZSB0aGUKICAgc2FtZSBhcyB0aGUgb25lIHByZXZpb3VzbHkgcmVwb3J0
ZWQgYnkgQm8gR2FuLgoKMi4gSSBhbHNvIHZlcmlmaWVkIHRoYXQgdjYuMTkuMiBhbHJlYWR5IGNv
bnRhaW5zIHRoZSB0d28gZU1NQyBmaXggcGF0Y2hlczoKICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsL0NBUER5S0ZxY015TS09eCsyRldOTGhIWT1ndTVBcEhOUFFocDB4QktESkdyN0JoRXg0
UUBtYWlsLmdtYWlsLmNvbS8KICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBUER5S0Zy
a0VaRHVNYkdwZnhpc21jeD12SmtTU0tfWGJ0Qjc2MitzVUZvY3VwVDYzd0BtYWlsLmdtYWlsLmNv
bS8KCiAgIEEgbGlrZWx5IGNhdXNlIGlzIHRoYXQgdGhlIGVNTUMgRFRTIG5vZGUgaXMgbWlzc2lu
ZyB0aGUgQVhJIGNsb2NrIGRlZmluaXRpb24uCiAgIFBsZWFzZSByZWZlciB0byB0aGUgRFRTIHVw
ZGF0ZXMgaW4gdGhlIGZvbGxvd2luZyBwdWxsIHJlcXVlc3QgZm9yIHJlZmVyZW5jZToKICAgaHR0
cHM6Ly9naXRodWIuY29tL2Vzd2luY29tcHV0aW5nL2xpbnV4LW5leHQvcHVsbC8yMAoKMy4gSW4g
YWRkaXRpb24sIHBsZWFzZSBjaGVjayB3aGV0aGVyIENPTkZJR19HUElPX0RXQVBCPXkgaXMgZW5h
YmxlZCBpbiB5b3VyCiAgIGtlcm5lbCBjb25maWd1cmF0aW9uLiBTaW5jZSBHTUFDIGlzIGJ1aWx0
LWluIGJ5IGRlZmF1bHQsIGl0IGRlcGVuZHMgb24KICAgR1BJTyBiZWluZyBhdmFpbGFibGUgZHVy
aW5nIGVhcmx5IGluaXRpYWxpemF0aW9uLgoKSG9wZSB0aGlzIGhlbHBzIG5hcnJvdyB0aGluZ3Mg
ZG93bi4gUGxlYXNlIGxldCBtZSBrbm93IHdoYXQgeW91IGZpbmQuCgpCZXN0IHJlZ2FyZHMsClpo
aSBMaQoKCj4gLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQo+IOWPkeS7tuS6ujogIk1hcmNlbCBaaXN3
aWxlciIgPG1hcmNlbEB6aXN3aWxlci5jb20+Cj4g5Y+R6YCB5pe26Ze0OjIwMjYtMDItMjEgMDI6
Mzc6NTcgKOaYn+acn+WFrSkKPiDmlLbku7bkuro6IGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20s
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVt
QGRhdmVtbG9mdC5uZXQsIGVkdW1hemV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9i
aEBrZXJuZWwub3JnLCBrcnprK2R0QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5l
dGRldkB2Z2VyLmtlcm5lbC5vcmcsIHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJA
Z21haWwuY29tLCBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxp
bnV4Lm9yZy51aywgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCj4g5oqE6YCBOiBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5j
b21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVh
bkBlc3dpbmNvbXB1dGluZy5jb20sIGRvbmd4dXlhbmdAZXN3aW5jb21wdXRpbmcuY29tCj4g5Li7
6aKYOiBSZTogW1BBVENIIHYyIDAvMl0gbmV0OiBzdG1tYWM6IGVpYzc3MDA6IGZpeCBFSUM3NzAw
IGV0aDEgUlggc2FtcGxpbmcgdGltaW5nCj4gCj4gSGkgWmhpIExpCj4gCj4gU29ycnksIHRvIHN0
ZWFsIHRoaXMgdGhyZWFkLCBidXQgSSBkbyBoYXZlIGEgcXVpY2sgcXVlc3Rpb24gY29uY2Vybmlu
ZyBFdGhlcm5ldCBvbiB0aGUgRUlDNzcwMC4gRXZlcnkgdGltZSBJCj4gZW5hYmxlIGdtYWMwIGlu
IHRoZSBkZXZpY2UgdHJlZSBteSBFQkM3NzAwIHN0b3BzIGJvb3RpbmcgKGUuZy4gU0QgY2FyZCBp
cyBubyBsb25nZXIgZGV0ZWN0ZWQpIHdoaWxlIEV0aGVybmV0Cj4gZG9lcyBzZWVtIHRvIGF0IGxl
YXN0IGdldCBkZXRlY3RlZC4gVGhpcyBoYXMgYmVlbiBzZWVuIHVzaW5nIG5leHQtMjAyNjAyMTks
IHN0YWJsZSB2Ni4xOS4yIFsxXSBhcyB3ZWxsIGFzCj4gNi4xOC4wLXJjNiBbMl0uIEFueSBpZGVh
IHdoYXQgY291bGQgYmUgZ29pbmcgd3Jvbmc/Cj4gCj4gSSBhZG1pdCBzbyBmYXIgSSBvbmx5IGRv
IGhhdmUgb25lIHNpbmdsZSBFQkM3NzAwIGF0IGhhbmQgd2hpbGUgd2FpdGluZyBmb3IgZnVydGhl
ciBoYXJkd2FyZSB0byBhcnJpdmUuCj4gCj4gVGhhbmtzIQo+IAo+IFsxXSBodHRwczovL2dpdGh1
Yi5jb20vcmlzY3YvbWV0YS1yaXNjdi9wdWxsLzYwMQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20v
ZXN3aW5jb21wdXRpbmcvbGludXgtbmV4dC90cmVlL2Rldi90ZXN0LXVwc3RyZWFtLXY2LjE4LXJj
Ngo+IAo+IENoZWVycwo+IAo+IE1hcmNlbAo+IAo+IFtzbmlwXQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
