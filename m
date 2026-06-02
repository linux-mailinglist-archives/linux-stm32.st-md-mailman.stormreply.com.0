Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKHJCb2iHmquDAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 11:30:37 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3E62B977
	for <lists+linux-stm32@lfdr.de>; Tue, 02 Jun 2026 11:30:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77E2CC8F271;
	Tue,  2 Jun 2026 09:30:36 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B477C57A50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
 Content-Type; bh=hwhnOXJquDTFrNkY3bAEDfh98xtmc3TROZSuwO/v1yg=;
 b=PkZPaK8/d2mnZxilpRJtFfxV62MDrsJQxMOAqjTDtXrR17I6Tw7SdKqlbt/Kjn
 jCQ1Q1ESIJeBmDvVND9XFFsMWM/Yqgbbd8yiUAJje2Gaw5TzOncrZgaytnxWgcLe
 Q/g6t7AjnhMetcsI6DsrEjz/7Z2lQULkt+p5bmmBHS2SY=
Received: from localhost.localdomain (unknown [])
 by gzsmtp5 (Coremail) with SMTP id QCgvCgCn8hoxoh5qnwk+AA--.6197S2;
 Tue, 02 Jun 2026 17:28:18 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: pabeni@redhat.com
Date: Tue,  2 Jun 2026 17:28:17 +0800
Message-Id: <20260602092817.929979-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528120203.245762-1-pabeni@redhat.com>
References: <20260528120203.245762-1-pabeni@redhat.com>
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgCn8hoxoh5qnwk+AA--.6197S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWfuw13AFy3tr13KrW5Awb_yoWruF47pF
 W7Aa1qkrykJr13Jw4UZw48uFy5Aay5tF4UCw13X3ZI9ayakr92vF4aqr45ua47Cr18Zw1S
 yF4UA3sxCF4DuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pihL08UUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0hLWA2oeojJeHwAA3w
Cc: andrew@lunn.ch, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 dinghui@lixiang.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, liuxuanjun@lixiang.com,
 mcoquelin.stm32@gmail.com, rmk+kernel@armlinux.org.uk, kuba@kernel.org,
 maxime.chevallier@bootlin.com, dinghui1111@163.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: fix fatal bus error on
	resume by reinitializing RX buffers
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
X-Rspamd-Queue-Id: BFC3E62B977
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[163.com:s=s110527];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[163.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_FROM(0.00)[163.com];
	FORGED_SENDER(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:pabeni@redhat.com,m:andrew@lunn.ch,m:xiasanbo@lixiang.com,m:yangchen11@lixiang.com,m:dinghui@lixiang.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:liuxuanjun@lixiang.com,m:mcoquelin.stm32@gmail.com,m:rmk+kernel@armlinux.org.uk,m:kuba@kernel.org,m:maxime.chevallier@bootlin.com,m:dinghui1111@163.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[lunn.ch,lixiang.com,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,armlinux.org.uk,kernel.org,bootlin.com,163.com,davemloft.net,lists.infradead.org];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dinghui1111@163.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DKIM_TRACE(0.00)[163.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

QXQgMjAyNi0wNS0yOCAyMDowMjowMiwgIlBhb2xvIEFiZW5pIiA8cGFiZW5pQHJlZGhhdC5jb20+
IHdyb3RlOgoKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19tYWluLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9z
dG1tYWNfbWFpbi5jCj4+IGluZGV4IDM1OTE3NTVlYTMwYi4uMGRjMjdkOGM2NmEwIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5j
Cj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMKPj4gQEAgLTE2NDIsNiArMTY0Miw3OSBAQCBzdGF0aWMgdm9pZCBzdG1tYWNfY2xlYXJfZGVz
Y3JpcHRvcnMoc3RydWN0IHN0bW1hY19wcml2ICpwcml2LAo+PiAgCQlzdG1tYWNfY2xlYXJfdHhf
ZGVzY3JpcHRvcnMocHJpdiwgZG1hX2NvbmYsIHF1ZXVlKTsKPj4gIH0KPj4gIAo+PiArLyoqCj4+
ICsgKiBzdG1tYWNfcmVpbml0X3J4X2Rlc2NyaXB0b3JzIC0gcmUtcHJvZ3JhbSBSWCBkZXNjcmlw
dG9ycyBmcm9tIGV4aXN0aW5nCj4+ICsgKgkJCQkgICBidWZmZXJzIChhbGxvY2F0aW9uLWZyZWUp
Cj4KPlsgLi4uIF0KPgo+PiArc3RhdGljIHZvaWQgc3RtbWFjX3JlaW5pdF9yeF9kZXNjcmlwdG9y
cyhzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYsCj4+ICsJCQkJCSBzdHJ1Y3Qgc3RtbWFjX2RtYV9j
b25mICpkbWFfY29uZiwKPj4gKwkJCQkJIHUzMiBxdWV1ZSkKPj4gK3sKPj4gKwlzdHJ1Y3Qgc3Rt
bWFjX3J4X3F1ZXVlICpyeF9xID0gJmRtYV9jb25mLT5yeF9xdWV1ZVtxdWV1ZV07Cj4+ICsJaW50
IGk7Cj4+ICsKPj4gKwlmb3IgKGkgPSAwOyBpIDwgZG1hX2NvbmYtPmRtYV9yeF9zaXplOyBpKysp
IHsKPj4gKwkJc3RydWN0IHN0bW1hY19yeF9idWZmZXIgKmJ1ZiA9ICZyeF9xLT5idWZfcG9vbFtp
XTsKPj4gKwkJc3RydWN0IGRtYV9kZXNjICpwID0gc3RtbWFjX2dldF9yeF9kZXNjKHByaXYsIHJ4
X3EsIGkpOwo+PiArCj4+ICsJCWlmIChyeF9xLT54c2tfcG9vbCkgewo+PiArCQkJZG1hX2FkZHJf
dCBkbWFfYWRkcjsKPj4gKwo+PiArCQkJLyogVGhlIFhTSyBwb29sIG1heSBub3QgYmUgZnVsbHkg
cG9wdWxhdGVkIChlLmcuCj4+ICsJCQkgKiB4ZHBzb2NrIFRYLW9ubHkpOyBza2lwIGVtcHR5IHNs
b3RzLgo+PiArCQkJICovCj4+ICsJCQlpZiAoIWJ1Zi0+eGRwKQo+PiArCQkJCWNvbnRpbnVlOwo+
Cj5bSGlnaF0KPkRvZXMgdGhlIGNvbnRpbnVlIGhlcmUgcmVncmVzcyB0byB0aGUgc2FtZSBmYXRh
bCBidXMgZXJyb3IgdGhpcyBwYXRjaAo+c2V0cyBvdXQgdG8gZml4Pwo+Cj5XaGVuIHRoZSBzbG90
IGlzIHNraXBwZWQsIGl0cyBkZXNjcmlwdG9yIGFkZHJlc3MgZmllbGRzIGtlZXAgd2hhdGV2ZXIK
PkhXIHdyaXRlYmFjayBsZWZ0IGJlaGluZC4gVGhlbiBzdG1tYWNfY2xlYXJfZGVzY3JpcHRvcnMo
KSBydW5zIHJpZ2h0Cj5hZnRlciBzdG1tYWNfcmVpbml0X3J4X2Rlc2NyaXB0b3JzKCkgaW4gc3Rt
bWFjX3Jlc3VtZSgpIGFuZCB1bmNvbmRpdGlvbmFsbHkKPnJlLWFybXMgT1dOIG9uIGV2ZXJ5IHNs
b3QuIEZvciBkd21hYzQgdGhhdCBpcyBkd21hYzRfc2V0X3J4X293bmVyKCk6Cj4KPglwLT5kZXMz
IHw9IGNwdV90b19sZTMyKFJERVMzX09XTiB8IFJERVMzX0JVRkZFUjFfVkFMSURfQUREUiB8Cj4J
CQkgICAgICAgUkRFUzNfSU5UX09OX0NPTVBMRVRJT05fRU4pOwo+Cj5hbmQgZm9yIGVuaF9kZXNj
IC8gbmRlc2MgdGhlIGVxdWl2YWxlbnQgT1Igb2YgUkRFUzBfT1dOIC8gUkRFUzEgZmllbGRzLgo+
Tm9uZSBvZiB0aGVzZSBjbGVhciB0aGUgYWRkcmVzcyBmaWVsZHMuCj4KPldoZW4gc3RtbWFjX2h3
X3NldHVwKCkgcmVzdGFydHMgdGhlIERNQSwgdGhlIGNvbnRyb2xsZXIgc2VlcyBhbiBvd25lZAo+
ZGVzY3JpcHRvciB3aXRoIFZBTElEX0FERFIgc2V0IGFuZCBhIHN0YWxlIGFkZHJlc3Mg4oCUIHRo
ZSBleGFjdCBmYWlsdXJlCj5tb2RlIHRoZSBjb21taXQgbWVzc2FnZSBkZXNjcmliZXMuIENvdWxk
IHRoZSBza2lwcGVkIHNsb3RzIGJlIGNsZWFyZWQKPihzdG1tYWNfY2xlYXJfZGVzYygpIG9yIHpl
cm9pbmcgZGVzMC9kZXMxL2RlczIpIGluc3RlYWQgb2YgbGVmdCBpbnRhY3QsCj5vciBhcnJhbmdl
ZCBzbyBjbGVhcl9kZXNjcmlwdG9ycygpIGRvZXMgbm90IGFybSBPV04gb24gdGhlbT8KCkl0J3Mg
cmlnaHQgdGhhdCB0aGUgc2tpcHBlZCBzbG90cyBtdXN0IGJlIGNsZWFyZWQgaW5zdGVhZCBvZiBs
ZWZ0IGludGFjdC4KVGhpcyBjaGFuZ2Ugd2lsbCBiZSByZWZsZWN0ZWQgaW4gdmVyc2lvbiB2My4K
Cj4KPj4gKwo+PiArCQkJZG1hX2FkZHIgPSB4c2tfYnVmZl94ZHBfZ2V0X2RtYShidWYtPnhkcCk7
Cj4+ICsJCQlzdG1tYWNfc2V0X2Rlc2NfYWRkcihwcml2LCBwLCBkbWFfYWRkcik7Cj4+ICsJCQlz
dG1tYWNfc2V0X2Rlc2Nfc2VjX2FkZHIocHJpdiwgcCwgMCwgZmFsc2UpOwo+PiArCQl9IGVsc2Ug
ewo+PiArCQkJLyogVGhlb3JldGljYWxseSB1bnJlYWNoYWJsZTogbmFwaV9kaXNhYmxlKCkgaW4K
Pj4gKwkJCSAqIHN0bW1hY19zdXNwZW5kKCkgZW5zdXJlcyBhbGwgaW5pdGlhbGl6ZWQgc2xvdHMK
Pj4gKwkJCSAqIGhhdmUgYSB2YWxpZCBwYWdlIGJlZm9yZSB3ZSBnZXQgaGVyZS4KPj4gKwkJCSAq
IERlZmVuc2l2ZSBjaGVjayBvbmx5Lgo+PiArCQkJICovCj4+ICsJCQlpZiAoIWJ1Zi0+cGFnZSkK
Pj4gKwkJCQljb250aW51ZTsKPgo+W0hpZ2hdCj5JcyB0aGUgY29tbWVudCAiVGhlb3JldGljYWxs
eSB1bnJlYWNoYWJsZTogbmFwaV9kaXNhYmxlKCkgaW4KPnN0bW1hY19zdXNwZW5kKCkgZW5zdXJl
cyBhbGwgaW5pdGlhbGl6ZWQgc2xvdHMgaGF2ZSBhIHZhbGlkIHBhZ2UiCj5hY2N1cmF0ZT8KPgo+
c3RtbWFjX3J4KCkgYXNzaWducyBidWYtPnBhZ2UgPSBOVUxMIGF0IG11bHRpcGxlIHBvaW50cyB3
aGVuIGhhbmRpbmcgdGhlCj5wYWdlIG9uIHRvIHRoZSBzdGFjayBvciB0byBYRFAsIGZvciBleGFt
cGxlOgo+Cj4JYnVmLT5wYWdlID0gTlVMTDsKPgo+aW4gc3RtbWFjX3J4KCkgYWZ0ZXIgdGhlIHBh
Z2UgaGFzIGJlZW4gY29uc3VtZWQuCj4KPnN0bW1hY19yeF9yZWZpbGwoKSBhbGxvY2F0ZXMgd2l0
aCBHRlBfQVRPTUlDIHwgX19HRlBfTk9XQVJOIGFuZCBicmVha3MKPm9uIGFsbG9jYXRpb24gZmFp
bHVyZSB3aXRob3V0IGFkdmFuY2luZyBkaXJ0eV9yeCwgbGVhdmluZyB0aGUgZmFpbGluZwo+c2xv
dCAoYW5kIGFueSBzdWJzZXF1ZW50IHNsb3RzKSB3aXRoIGJ1Zi0+cGFnZSA9PSBOVUxMOgo+Cj4J
aWYgKCFidWYtPnBhZ2UpIHsKPgkJYnVmLT5wYWdlID0gcGFnZV9wb29sX2FsbG9jX3BhZ2VzKHJ4
X3EtPnBhZ2VfcG9vbCwgZ2ZwKTsKPgkJaWYgKCFidWYtPnBhZ2UpCj4JCQlicmVhazsKPgkJLi4u
Cj4JfQo+Cj5zdG1tYWNfZGlzYWJsZV9hbGxfcXVldWVzKCkgb25seSBkb2VzIHN5bmNocm9uaXpl
X3JjdSgpIGFuZAo+bmFwaV9kaXNhYmxlKCkg4oCUIGl0IGRvZXMgbm90IHJldHJ5IHJlZmlsbHMu
IFVuZGVyIHRoZSBtZW1vcnktcHJlc3N1cmUKPnNjZW5hcmlvIHRoaXMgcGF0Y2ggaXMgZXhwbGlj
aXRseSBkZXNpZ25lZCB0byBtYWtlIHNhZmUsIGEgcHJpb3IKPkdGUF9BVE9NSUMgZmFpbHVyZSBj
YW4gbGVhdmUgdGhlIHJpbmcgd2l0aCBOVUxMLXBhZ2Ugc2xvdHMgYXQgdGhlCj5tb21lbnQgc3Vz
cGVuZCBoYXBwZW5zLgo+Cj5JZiBzdWNoIGEgc2xvdCBpcyB0aGVuIHNraXBwZWQgaGVyZSwgdGhl
IHNhbWUgT1dOLXdpdGgtc3RhbGUtYWRkcmVzcwo+Y29uZGl0aW9uIGRlc2NyaWJlZCBhYm92ZSBh
cHBsaWVzIG9uIHJlc3VtZS4gU2hvdWxkIHRoZSBwYWdlX3Bvb2wgcGF0aAo+YWxzbyBjbGVhciB0
aGUgZGVzY3JpcHRvciBmb3Igc2tpcHBlZCBzbG90cywgb3IgYWxsb2NhdGUgYSByZXBsYWNlbWVu
dAo+YnVmZmVyIHJhdGhlciB0aGFuIGxlYXZlIGEgc3RhbGUtYWRkcmVzcyBkZXNjcmlwdG9yIGZv
cgo+c3RtbWFjX2NsZWFyX2Rlc2NyaXB0b3JzKCkgdG8gYXJtPwo+Cj4+ICsKPj4gKwkJCXN0bW1h
Y19zZXRfZGVzY19hZGRyKHByaXYsIHAsIGJ1Zi0+YWRkcik7Cj4+ICsJCQlzdG1tYWNfc2V0X2Rl
c2Nfc2VjX2FkZHIocHJpdiwgcCwgYnVmLT5zZWNfYWRkciwKPj4gKwkJCQkJCSBwcml2LT5zcGhf
YWN0aXZlICYmCj4+ICsJCQkJCQkgYnVmLT5zZWNfcGFnZSk7Cj4+ICsKPj4gKwkJCWlmIChkbWFf
Y29uZi0+ZG1hX2J1Zl9zeiA9PSBCVUZfU0laRV8xNktpQikKPj4gKwkJCQlzdG1tYWNfaW5pdF9k
ZXNjMyhwcml2LCBwKTsKPj4gKwkJfQo+PiArCX0KPgo+WyAuLi4gXQo+Cj4+ICt9Cj4+ICsKClNh
bWUgYXMgYWJvdmUsIHRoZSBza2lwcGVkIHNsb3RzIG11c3QgYmUgY2xlYXJlZCBpbnN0ZWFkIG9m
IGxlZnQgaW50YWN0LgpUaGlzIGNoYW5nZSB3aWxsIGJlIHJlZmxlY3RlZCBpbiB2ZXJzaW9uIHYz
LgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJIHdpbGwgdXBsb2FkIHRoZSB2MyB2ZXJzaW9uIHNv
b24uCgpEaW5nIEh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
