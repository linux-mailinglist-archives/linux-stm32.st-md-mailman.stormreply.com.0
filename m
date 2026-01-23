Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKX/JfhEc2lEuQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 10:52:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B13FF73A61
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 10:52:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A5DDC87EDF;
	Fri, 23 Jan 2026 09:52:55 +0000 (UTC)
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net
 [13.75.44.102])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5968DC030CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 09:52:53 +0000 (UTC)
Received: from lizhi2$eswincomputing.com ( [10.11.96.26] ) by
 ajax-webmail-app1 (Coremail) ; Fri, 23 Jan 2026 17:52:28 +0800 (GMT+08:00)
X-Originating-IP: [10.11.96.26]
Date: Fri, 23 Jan 2026 17:52:28 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
To: "Bo Gan" <ganboing@gmail.com>
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2024.2-cmXT6 build
 20241203(6b039d88) Copyright (c) 2002-2026 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
MIME-Version: 1.0
Message-ID: <29b8c4d2.3704.19bea44fe53.Coremail.lizhi2@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TAJkCgCn+2zcRHNpGxgFAA--.1620W
X-CM-SenderInfo: xol2xx2s6h245lqf0zpsxwx03jof0z/1tbiAQEQDGlyUQwdaAABsu
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
 CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
 daVFxhVjvjDU=
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linmin@eswincomputing.com,
 devicetree@vger.kernel.org, ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[21];
	DMARC_NA(0.00)[eswincomputing.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ganboing@gmail.com,m:robh@kernel.org,m:andrew@lunn.ch,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lunn.ch,vger.kernel.org,eswincomputing.com,st-md-mailman.stormreply.com,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org,einfochips.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lizhi2@eswincomputing.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	HAS_X_PRIO_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,kernel];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,infradead.org:email,davemloft.net:email,lunn.ch:email,einfochips.com:email,st.com:email]
X-Rspamd-Queue-Id: B13FF73A61
X-Rspamd-Action: no action

CgoKPiAtLS0tLeWOn+Wni+mCruS7ti0tLS0tCj4g5Y+R5Lu25Lq6OiAiQm8gR2FuIiA8Z2FuYm9p
bmdAZ21haWwuY29tPgo+IOWPkemAgeaXtumXtDoyMDI2LTAxLTIzIDE1OjM5OjI5ICjmmJ/mnJ/k
upQpCj4g5pS25Lu25Lq6OiAiQW5kcmV3IEx1bm4iIDxhbmRyZXdAbHVubi5jaD4sIOadjuW/lyA8
bGl6aGkyQGVzd2luY29tcHV0aW5nLmNvbT4KPiDmioTpgIE6IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnLCBhbmRyZXcrbmV0ZGV2QGx1bm4uY2gsIGRhdmVtQGRhdmVtbG9mdC5uZXQsIGVkdW1h
emV0QGdvb2dsZS5jb20sIGt1YmFAa2VybmVsLm9yZywgcm9iaEBrZXJuZWwub3JnLCBrcnprK2R0
QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcs
IHBhYmVuaUByZWRoYXQuY29tLCBtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tLCBhbGV4YW5kcmUu
dG9yZ3VlQGZvc3Muc3QuY29tLCBybWsra2VybmVsQGFybWxpbnV4Lm9yZy51aywgbGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSwgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBuaW5neXVAZXN3aW5j
b21wdXRpbmcuY29tLCBsaW5taW5AZXN3aW5jb21wdXRpbmcuY29tLCBwaW5rZXNoLnZhZ2hlbGFA
ZWluZm9jaGlwcy5jb20sIHdlaXNoYW5nanVhbkBlc3dpbmNvbXB1dGluZy5jb20KPiDkuLvpopg6
IFJlOiBbUEFUQ0ggdjEgMS8yXSBkdC1iaW5kaW5nczogZXRoZXJuZXQ6IGVzd2luOiBhZGQgY2xv
Y2sgc2FtcGxpbmcgY29udHJvbAo+IAo+IEhpIEFuZHJldywKPiAKPiBPbiAxLzIyLzI2IDE5OjE5
LCBBbmRyZXcgTHVubiB3cm90ZToKPiA+Pj4gWW91IHNheSBpbnRlcm5hbC4gU28gdGhlIHNrZXcg
aXMgZml4ZWQsIGl0IGlzIGEgcHJvcGVydHkgb2YgdGhlCj4gPj4+IHNpbGljb24/IElmIHNvLCB3
aHkgYSBEVCBwcm9wZXJ0eT8gV2h5IG5vdCBqdXN0IGhhcmQgY29kZSBpdCBpbiB0aGUKPiA+Pj4g
ZHJpdmVyPyBTaW5jZSBpdCBpcyBpbnRlcm5hbCwgZGlmZmVyZW50IGJvYXJkcyBzaG91bGQgbm90
IG5lZWQgaXQgc2V0Cj4gPj4+IGRpZmZlcmVudGx5Pwo+ID4+Pgo+ID4+IFRoYW5rcyBmb3IgdGhl
IHF1ZXN0aW9uLgo+ID4+Cj4gPj4gRUlDNzcwMCBoYXMgdHdvIEV0aGVybmV0IE1BQ3MuIE9ubHkg
ZXRoMSBoYXMgdGhpcyBpbnRlcm5hbCBSWEMvUlhEIHNrZXcsCj4gPj4gZXRoMCBkb2VzIG5vdC4K
PiA+Pgo+ID4+IFNvIHRoaXMgaXMgbm90IGEgY2hpcC13aWRlIGNvbnN0YW50IHRoYXQgY2FuIGJl
IGhhcmRjb2RlZCBpbiB0aGUgZHJpdmVyLgo+ID4+IFdlIG5lZWQgYSB3YXkgdG8gZGlzdGluZ3Vp
c2ggdGhlIHR3byBNQUMgaW5zdGFuY2VzLCB3aGljaCBpcyB3aHkgdGhpcyBpcwo+ID4+IGRlc2Ny
aWJlZCBwZXItcG9ydCBpbiBEVFMuCj4gPiAKPiA+IEkgYXNzdW1lIHRoZSBhZGRyZXNzIG9mIHRo
ZSBpbnRlcmZhY2UgaXMgZml4ZWQuIFNvIHlvdSBjYW4ganVzdCBrZXkKPiA+IG9mZiB0aGF0IHRv
IGRpc3Rpbmd1aXNoIHRoZSB0d28gaW5zdGFuY2VzLgo+ID4gCj4gPiBTaW5jZSB0aGlzIGlzIGFu
IGludGVybmFsIHByb3BlcnR5LCBub3QgYSBib2FyZCBwcm9wZXJ0eSwgaXQgaXMgbm90Cj4gPiBj
bGVhciBpdCBhY3R1YWxseSBiZWxvbmdzIG9uIERULgo+ID4gCj4gPiAgICAgIEFuZHJldwo+IAo+
IElNTywgdGhleSBzaG91bGQgYmUgaW4gRFQgdG8gcHJvdmlkZSBtYXhpbXVtIGZsZXhpYmlsaXR5
LiBUaGUgU29DIC5kdHNpCj4gY2FuIHByb3ZpZGUgc29tZSBzYW5lIGRlZmF1bHRzLCBhbmQgdGhl
IGJvYXJkIHZlbmRvciBjYW4gbGF0ZXIgb3ZlcnJpZGUKPiB0aGVtIGlmIHRoZSBtYWMvcGh5IHJl
cXVpcmVzIGZ1cnRoZXIgdHVuaW5nLiBBcHBseWluZyBzdWNoIHR1bmluZyBieQo+IHRoZSBhZGRy
ZXNzIG9mIE1BQyBzZWVtcyBtZXNzeSBhbmQgaXQgaGlkZXMgdGhlIHBhcmFtZXRlcnMgdXNlZCBi
ZWhpbmQKPiBkcml2ZXIuIFRocm91Z2ggRFQsIGV2ZXJ5dGhpbmcgYmVjb21lcyByZWFsbHkgY2xl
YXIuCj4gCj4gSSBhc3N1bWUgdGhpcyBpcyBub3QgdW5jb21tb246IEUuZy4sIHN0YXJmaXZlL2po
NzExMDoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzA3MTQxMDQ1MjEuMTg3NTEt
My1zYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbS8KPiAKPiBCVFcsIG5vIG5lZWQgdG8gd29ycnkg
YWJvdXQgYmFja3dhcmQgY29tcGF0LiBFU1dJTiBoYXNuJ3QgY2hlY2tlZC1pbiBhbnkKPiBEVCBm
b3IgZXRoIHlldC4gQXMgeW91IGFuZCBSdXNzZWxsIHNhaWQsIHRoZXkgbmVlZCB0byBkbyBpdCwg
cHJvbnRvLgo+IApZZXMsIHRoaXMgY2FuIGJlIGhhcmRjb2RlZCBmb3IgZXRoMSwgc2ltaWxhciB0
byB3aGF0IGlzIGRvbmUgaW4KZHdtYWMtbG9vbmdzb24xLmMuCgpIb3dldmVyLCBjb25zaWRlcmlu
ZyBFSUM3NzAyLCB3aGljaCBpbnRlZ3JhdGVzIHR3byBFSUM3NzAwIGRpZXMgYW5kIHRodXMKaGFz
IGZvdXIgTUFDcyBpbiB0b3RhbCwgd2UgYmVsaWV2ZSBkZXNjcmliaW5nIHRoaXMgdmlhIERUUyBp
cyBtb3JlCmFwcHJvcHJpYXRlLiBXZSBhcmUgY3VycmVudGx5IHdvcmtpbmcgb24gdXBzdHJlYW1p
bmcgdGhlIERUUyBzdXBwb3J0IGZvcgpFSUM3NzAyLgoKV2l0aCB0aGUgRFQgYXBwcm9hY2gsIHRo
ZSBpbnRlcm5hbCBSWEMvUlhEIHNrZXcgY2FuIGJlIGRlc2NyaWJlZCBleHBsaWNpdGx5CmZvciBn
bWFjMSBhbmQgZ21hYzMsIHdpdGhvdXQgcmVxdWlyaW5nIGNoYW5nZXMgdG8gZHdtYWMtZWljNzcw
MC5jIHdoZW4KYnJpbmdpbmcgdXAgRUlDNzcwMi4KCkFzIEJvIEdhbiBhbHNvIG1lbnRpb25lZCwg
dGhlcmUgYXJlIHZlbmRvcnMgaGFuZGxpbmcgc2ltaWxhciBpbnRlcm5hbApxdWlya3MgdGhyb3Vn
aCBEVCBjb25maWd1cmF0aW9uLgoKLS0KTGkgWmhpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
