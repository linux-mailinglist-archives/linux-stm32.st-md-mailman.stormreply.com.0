Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJscDzfIu2leoQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 10:56:07 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D96D02C9220
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 10:56:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72CB8C87ED3;
	Thu, 19 Mar 2026 09:56:06 +0000 (UTC)
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12BADC87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 09:56:04 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Thu, 19 Mar 2026 17:55:31 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Thu, 19 Mar 2026 17:55:31 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: krzk+dt@kernel.org, "Conor Dooley" <conor@kernel.org>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <20260313-stiffness-item-c451eaef970d@spud>
References: <20260313075234.1567-1-lizhi2@eswincomputing.com>
 <20260313075351.1584-1-lizhi2@eswincomputing.com>
 <20260313-stiffness-item-c451eaef970d@spud>
MIME-Version: 1.0
Message-ID: <4d45d39b.591c.19d05858b58.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgDHaXMTyLtpTOUJAA--.3066W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAgELDGm61AkcbQAAs7
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW3Jw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: edumazet@google.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, ningyu@eswincomputing.com,
 pritesh.patel@einfochips.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu,
 rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, palmer@dabbelt.com,
 mcoquelin.stm32@gmail.com, pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/3] dt-bindings: ethernet:
 eswin: add clock sampling control
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
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_RECIPIENTS(0.00)[m:krzk+dt@kernel.org,m:conor@kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:ningyu@eswincomputing.com,m:pritesh.patel@einfochips.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:krzk@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
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
	FREEMAIL_CC(0.00)[google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,einfochips.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,armlinux.org.uk,lunn.ch,dabbelt.com,gmail.com,davemloft.net];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.937];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: D96D02C9220
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgS3J6eXN6dG9mLAoKQ291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCBDb25vcuKAmXMg
ZmVlZGJhY2sgb24gdGhlIGNvbXBhdGlibGUgbmFtaW5nPwoKQ29ub3IgaGFzIHJldmlld2VkIHRo
ZSBwYXRjaCBhbmQgcHJvdmlkZWQgaGlzIEFja2VkLWJ5LCBidXQgYWxzbyBub3RlZAp0aGF0IHRo
ZXJlIG1pZ2h0IGJlIGNvbmNlcm5zIHJlZ2FyZGluZyB0aGUgY29tcGF0aWJsZSBzdHJpbmcuCgpQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlIGN1cnJlbnQgbmFtaW5nIGlzIGFjY2VwdGFibGUsIG9y
IGlmIGFueSBjaGFuZ2VzCmFyZSByZXF1aXJlZC4KClRoYW5rcywKWmhpIExpCgoKPiAtLS0tLeWO
n+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQ29ub3IgRG9vbGV5IiA8Y29ub3JAa2VybmVs
Lm9yZz4KPiDlj5HpgIHml7bpl7Q6MjAyNi0wMy0xNCAwMTozOTo1OCAo5pif5pyf5YWtKQo+IOaU
tuS7tuS6ujogbGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbQo+IOaKhOmAgTogZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcsIGFuZHJldytuZXRkZXZAbHVubi5jaCwgZGF2ZW1AZGF2ZW1sb2Z0Lm5l
dCwgZWR1bWF6ZXRAZ29vZ2xlLmNvbSwga3ViYUBrZXJuZWwub3JnLCByb2JoQGtlcm5lbC5vcmcs
IGtyemsrZHRAa2VybmVsLm9yZywgY29ub3IrZHRAa2VybmVsLm9yZywgbmV0ZGV2QHZnZXIua2Vy
bmVsLm9yZywgcGFiZW5pQHJlZGhhdC5jb20sIG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20sIGFs
ZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20sIHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrLCB3
ZW5zQGtlcm5lbC5vcmcsIHBqd0BrZXJuZWwub3JnLCBwYWxtZXJAZGFiYmVsdC5jb20sIGFvdUBl
ZWNzLmJlcmtlbGV5LmVkdSwgYWxleEBnaGl0aS5mciwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZywgbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgt
YXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnLCBuaW5neXVAZXN3aW5jb21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29t
LCBwaW5rZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20sIHByaXRlc2gucGF0ZWxAZWluZm9jaGlw
cy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20KPiDkuLvpopg6IFJlOiBbUEFU
Q0ggbmV0LW5leHQgdjQgMS8zXSBkdC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xv
Y2sgc2FtcGxpbmcgY29udHJvbAo+IAo+IE9uIEZyaSwgTWFyIDEzLCAyMDI2IGF0IDAzOjUzOjUx
UE0gKzA4MDAsIGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20gd3JvdGU6Cj4gPiBGcm9tOiBaaGkg
TGkgPGxpemhpMkBlc3dpbmNvbXB1dGluZy5jb20+Cj4gPiAKPiA+IER1ZSB0byBjaGlwIGJhY2tl
bmQgcmVhc29ucywgdGhlcmUgaXMgYWxyZWFkeSBhbiBhcHByb3hpbWF0ZWx5IDQtNSBucwo+ID4g
c2tldyBiZXR3ZWVuIHRoZSBSWCBjbG9jayBhbmQgZGF0YSBvZiB0aGUgZXRoMSBNQUMgY29udHJv
bGxlciBpbnNpZGUKPiA+IHRoZSBzaWxpY29uLgo+ID4gCj4gPiBGb3IgMTAwME0sIHRoZSBSWCBj
bG9jayBtdXN0IGJlIGludmVydGVkIHNpbmNlIGl0IGlzIG5vdCBwb3NzaWJsZSB0bwo+ID4gbWVl
dCB0aGUgUkdNSUkgdGltaW5nIHJlcXVpcmVtZW50cyB1c2luZyBvbmx5IHJ4LWludGVybmFsLWRl
bGF5LXBzIG9uCj4gPiB0aGUgTUFDIHRvZ2V0aGVyIHdpdGggdGhlIHN0YW5kYXJkIDIgbnMgZGVs
YXkgb24gdGhlIFBIWS4gVGhlcmVmb3JlLAo+ID4gZXZlbiBvbiBhIHByb3Blcmx5IGRlc2lnbmVk
IGJvYXJkLCBldGgxIHN0aWxsIHJlcXVpcmVzIFJYIGNsb2NrCj4gPiBpbnZlcnNpb24uCj4gPiAK
PiA+IFRoaXMgYmVoYXZpb3VyIGVmZmVjdGl2ZWx5IGJyZWFrcyB0aGUgUkdNSUkgdGltaW5nIGFz
c3VtcHRpb25zIGF0IHRoZQo+ID4gU29DIGxldmVsLgo+ID4gCj4gPiBGb3IgdGhlIFRYIHBhdGgg
b2YgZXRoMSwgdGhlcmUgaXMgYWxzbyBhIHNrZXcgYmV0d2VlbiB0aGUgVFggY2xvY2sKPiA+IGFu
ZCBkYXRhIG9uIHRoZSBNQUMgY29udHJvbGxlciBpbnNpZGUgdGhlIHNpbGljb24uIFRoaXMgc2tl
dyBoYXBwZW5zCj4gPiB0byBiZSBhcHByb3hpbWF0ZWx5IDIgbnMuIFRoZXJlZm9yZSwgaXQgY2Fu
IGJlIGNvbnNpZGVyZWQgdGhhdCB0aGUKPiA+IDIgbnMgZGVsYXkgb2YgVFggaXMgcHJvdmlkZWQg
YnkgdGhlIE1BQywgc28gdGhlIFRYIGlzIGNvbXBsaWFudCB3aXRoCj4gPiB0aGUgUkdNSUkgc3Rh
bmRhcmQuCj4gPiAKPiA+IEZvciAxMC8xMDAgb3BlcmF0aW9uLCB0aGUgYXBwcm94aW1hdGVseSA0
LTUgbnMgc2tldyBpbiB0aGUgY2hpcCBkb2VzCj4gPiBub3QgYnJlYWsgdGhlIHN0YW5kYXJkLiBU
aGUgUkdNSUkgdGltaW5nIHRhYmxlIChTZWN0aW9uIDMuMykgc3BlY2lmaWVzCj4gPiB0aGF0IGZv
ciAxMC8xMDAgb3BlcmF0aW9uIHRoZSBtYXhpbXVtIHZhbHVlIGlzIHVuc3BlY2lmaWVkOgo+ID4g
aHR0cHM6Ly9jb21tdW5pdHkubnhwLmNvbS9wd214eTg3NjU0L2F0dGFjaG1lbnRzL3B3bXh5ODc2
NTQvaW14LXByb2Nlc3NvcnMvMjA2NTUvMS9SR01JSXYyXzBfZmluYWxfaHAucGRmCj4gPiAKPiA+
IER1ZSB0byB0aGUgZXRoMSBzaWxpY29uIGJlaGF2aW9yIGRlc2NyaWJlZCBhYm92ZSwgYSBuZXcg
Y29tcGF0aWJsZQo+ID4gc3RyaW5nICJlc3dpbixlaWM3NzAwLXFvcy1ldGgtY2xrLWludmVyc2lv
biIgaXMgYWRkZWQgdG8gdGhlIGRldmljZQo+ID4gdHJlZS4gVGhpcyBhbGxvd3MgdGhlIGRyaXZl
ciB0byBoYW5kbGUgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gZXRoMQo+ID4gYW5kIGV0aDAgdGhy
b3VnaCBkZWRpY2F0ZWQgbG9naWMuCj4gPiAKPiA+IFRoZSByeC1pbnRlcm5hbC1kZWxheS1wcyBh
bmQgdHgtaW50ZXJuYWwtZGVsYXktcHMgcHJvcGVydGllcyBub3cgdXNlCj4gPiBtaW5pbXVtIGFu
ZCBtYXhpbXVtIGNvbnN0cmFpbnRzIHRvIHJlZmxlY3QgdGhlIGFjdHVhbCBoYXJkd2FyZSBkZWxh
eQo+ID4gcmFuZ2UgKDAtMjU0MCBwcykgYXBwbGllZCBpbiAyMCBwcyBzdGVwcy4gVGhpcyByZWxh
eGVzIHRoZSBiaW5kaW5nCj4gPiB2YWxpZGF0aW9uIGNvbXBhcmVkIHRvIHRoZSBwcmV2aW91cyBl
bnVtLWJhc2VkIGRlZmluaXRpb24gYW5kIGF2b2lkcwo+ID4gcmVncmVzc2lvbnMgZm9yIGV4aXN0
aW5nIERUQnMgd2hpbGUga2VlcGluZyB0aGUgc2FtZSBoYXJkd2FyZSBsaW1pdHMuCj4gPiAKPiA+
IFRyZWF0IHRoZSBSWC9UWCBpbnRlcm5hbCBkZWxheSBwcm9wZXJ0aWVzIGFzIG9wdGlvbmFsLCBi
b2FyZC1zcGVjaWZpYwo+ID4gdHVuaW5nIGtub2JzIGFuZCByZW1vdmUgdGhlbSBmcm9tIHRoZSBl
eGFtcGxlIHRvIGF2b2lkIGVuY291cmFnaW5nCj4gPiB0aGVpciB1c2UuCj4gPiAKPiA+IEluIGFk
ZGl0aW9uLCB0aGUgYmluZGluZyBub3cgaW5jbHVkZXMgYWRkaXRpb25hbCBiYWNrZ3JvdW5kIGlu
Zm9ybWF0aW9uCj4gPiBhYm91dCB0aGUgSFNQIENTUiByZWdpc3RlcnMgYWNjZXNzZWQgYnkgdGhl
IE1BQy4gVGhlIFRYRCBhbmQgUlhEIGRlbGF5Cj4gPiBjb250cm9sIHJlZ2lzdGVycyBhcmUgaW5j
bHVkZWQgc28gdGhlIGRyaXZlciBjYW4gZXhwbGljaXRseSBjbGVhciBhbnkKPiA+IHJlc2lkdWFs
IGNvbmZpZ3VyYXRpb24gbGVmdCBieSB0aGUgYm9vdGxvYWRlci4KPiA+IAo+ID4gQmFja2dyb3Vu
ZCByZWZlcmVuY2UgZm9yIHRoZSBIaWdoLVNwZWVkIFN1YnN5c3RlbSBhbmQgSFNQIENTUiBibG9j
ayBpcwo+ID4gYXZhaWxhYmxlIGluIENoYXB0ZXIgMTAgKCJIaWdoLVNwZWVkIEludGVyZmFjZSIp
IG9mIHRoZSBFSUM3NzAwWCBTb0MKPiA+IFRlY2huaWNhbCBSZWZlcmVuY2UgTWFudWFsLCBQYXJ0
IDQKPiA+IChFSUM3NzAwWF9Tb0NfVGVjaG5pY2FsX1JlZmVyZW5jZV9NYW51YWxfUGFydDQucGRm
KToKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9lc3dpbmNvbXB1dGluZy9FSUM3NzAwWC1Tb0MtVGVj
aG5pY2FsLVJlZmVyZW5jZS1NYW51YWwvcmVsZWFzZXMKPiA+IAo+ID4gVGhlcmUgYXJlIGN1cnJl
bnRseSBubyBpbi10cmVlIHVzZXJzIG9mIHRoZSBFSUM3NzAwIEV0aGVybmV0IGRyaXZlciwgc28K
PiA+IHRoZXNlIGNoYW5nZXMgYXJlIHNhZmUuCj4gPiAKPiA+IEZpeGVzOiA4ODhiZDBlY2E5M2Mg
KCJkdC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBEb2N1bWVudCBmb3IgRUlDNzcwMCBTb0Mi
KQo+ID4gU2lnbmVkLW9mZi1ieTogWmhpIExpIDxsaXpoaTJAZXN3aW5jb21wdXRpbmcuY29tPgo+
IAo+IEtyenlzenRvZiBtaWdodCBub3QgeWV0IGJlIGhhcHB5IHdpdGggdGhlIGNvbXBhdGlibGUg
bmFtaW5nLCBidXQgZnJvbSBteQo+IHBvdjoKPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
