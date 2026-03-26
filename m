Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOqwGtOkxGmZ1wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 04:15:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CD832EAB7
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 04:15:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FF2AC8F273;
	Thu, 26 Mar 2026 03:15:30 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [207.46.229.174])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C868C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2026 03:15:28 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 26 Mar 2026 11:14:45 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 26 Mar 2026 11:14:45 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Simon Horman" <horms@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260325180330.GL111839@horms.kernel.org>
References: <20260324073017.376-1-lizhi2@eswincomputing.com>
 <20260324073408.439-1-lizhi2@eswincomputing.com>
 <20260325180330.GL111839@horms.kernel.org>
MIME-Version: 1.0
Message-ID: <2a12c839.5e64.19d28232537.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXOlpMRpqdYLAA--.3593W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgERDGnEDooA3QADsp
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 ningyu@eswincomputing.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
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
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:horms@kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:pritesh.patel@einfochips.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,einfochips.com,eswincomputing.com,ghiti.fr,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: C7CD832EAB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiU2ltb24gSG9ybWFuIiA8
aG9ybXNAa2VybmVsLm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMy0yNiAwMjowMzozMCAo5pif
5pyf5ZubKQo+IOaUtuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTog
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1A
ZGF2ZW1sb2Z0Lm5ldCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2Jo
QGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0
ZGV2QHZnZXIua2VybmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBn
bWFpbC5jb20sIGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGlu
dXgub3JnLnVrLCBwandAa2VybmVsLm9yZywgcGFsbWVyQGRhYmJlbHQuY29tLCBhb3VAZWVjcy5i
ZXJrZWxleS5lZHUsIGFsZXhAZ2hpdGkuZnIsIGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcsIGxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20sIGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZywg
bWF4aW1lLmNoZXZhbGxpZXJAYm9vdGxpbi5jb20sIG5pbmd5dUBlc3dpbmNvbXB1dGluZy5jb20s
IGxpbm1pbkBlc3dpbmNvbXB1dGluZy5jb20sIHBpbmtlc2gudmFnaGVsYUBlaW5mb2NoaXBzLmNv
bSwgcHJpdGVzaC5wYXRlbEBlaW5mb2NoaXBzLmNvbSwgd2Vpc2hhbmdqdWFuQGVzd2luY29tcHV0
aW5nLmNvbQo+IOS4u+mimDogUmU6IFtQQVRDSCBuZXQtbmV4dCB2NSAzLzNdIHJpc2N2OiBkdHM6
IGVzd2luOiBlaWM3NzAwLWhpZml2ZS1wcmVtaWVyLXA1NTA6IGVuYWJsZSBFdGhlcm5ldCBjb250
cm9sbGVyCj4gCj4gT24gVHVlLCBNYXIgMjQsIDIwMjYgYXQgMDM6MzQ6MDhQTSArMDgwMCwgbGl6
aGkyQGVzd2luY29tcHV0aW5nLmNvbSB3cm90ZToKPiA+IEZyb206IFpoaSBMaSA8bGl6aGkyQGVz
d2luY29tcHV0aW5nLmNvbT4KPiA+IAo+ID4gRW5hYmxlIHRoZSBvbi1ib2FyZCBHaWdhYml0IEV0
aGVybmV0IGNvbnRyb2xsZXIgb24gdGhlCj4gPiBIaUZpdmUgUHJlbWllciBQNTUwIGRldmVsb3Bt
ZW50IGJvYXJkLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGkgTGkgPGxpemhpMkBlc3dpbmNv
bXB1dGluZy5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZHRzL2Vzd2luL2VpYzc3MDAtaGlmaXZlLXBy
ZW1pZXItcDU1MC5kdHMgfCA0MiArKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L2Vzd2luL2VpYzc3MDAuZHRzaSAgICAgICAgfCA2NiArKysrKysrKysrKysrKysrKysrCj4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9ucygrKQo+IAo+IFVuZm9ydHVuYXRlbHkgdGhp
cyBkb2VzIG5vdCBjb21waWxlOgo+IAo+ICQgQVJDSD1yaXNjdiBtYWtlIGFsbG1vZGNvbmZpZyBk
dGJzCj4gLi4uCj4gICBEVEMgICAgIGFyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1o
aWZpdmUtcHJlbWllci1wNTUwLmR0Ygo+IGFyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcw
MC5kdHNpOjMwMC4yOC0zMzAuNTogRVJST1IgKHBoYW5kbGVfcmVmZXJlbmNlcyk6IC9zb2MvZXRo
ZXJuZXRANTA0MDAwMDA6IFJlZmVyZW5jZSB0byBub24tZXhpc3RlbnQgbm9kZSBvciBsYWJlbCAi
Y2xrIgo+IC4uLgo+IAo+IC0tIAo+IHB3LWJvdDogY2hhbmdlcy1yZXF1ZXN0ZWQKCkhpIFNpbW9u
LAoKVGhhbmtzIGZvciB5b3VyIHJldmlldy4KCllvdSdyZSByaWdodCwgdGhpcyBidWlsZCBmYWls
dXJlIGlzIGR1ZSB0byBhbiBpbnZhbGlkIGNsb2NrIHJlZmVyZW5jZQooImNsayIpIGluIHRoZSBF
dGhlcm5ldCBub2RlLCB3aGljaCBkb2VzIG5vdCBjb3JyZXNwb25kIHRvIGFuIGV4aXN0aW5nCmNs
b2NrIHByb3ZpZGVyIGxhYmVsIGluIHRoZSBjdXJyZW50IERUUy4KCkZvciBjb250ZXh0LCB0aGlz
IHdhcyBkaXNjdXNzZWQgZHVyaW5nIGFuIGVhcmxpZXIgcmV2aXNpb246Cmh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvNWRlYThjZTAuNDQzNS4xOWM0NzEyMzFmNS5Db3JlbWFpbC5saXpoaTJA
ZXN3aW5jb21wdXRpbmcuY29tLwoKVGhlIEVJQzc3MDAgY2xvY2sgY29udHJvbGxlciBzdXBwb3J0
IGhhcyBzaW5jZSBiZWVuIGFwcGxpZWQsIHNvIEkgd2lsbAp1cGRhdGUgdGhlIERUUyB0byByZWZl
cmVuY2UgdGhlIGNvcnJlY3QgY2xvY2sgcHJvdmlkZXIgYW5kIGVuc3VyZSB0aGUKYnVpbGQgcGFz
c2VzIGNsZWFubHkuCgpJIHdpbGwgZml4IHRoaXMgaW4gdGhlIG5leHQgcmV2aXNpb24gKHY2KS4K
ClRoYW5rcywKWmhpIExpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
