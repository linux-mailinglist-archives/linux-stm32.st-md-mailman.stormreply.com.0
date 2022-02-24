Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 013894C2D65
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Feb 2022 14:41:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA855C5F1D7;
	Thu, 24 Feb 2022 13:40:59 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6985EC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Feb 2022 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1645710059;
 x=1677246059; h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yj/Kubo401FMKbYI1pppYqnrVxPghG1puNDBjNlL3v4=;
 b=Ra+fdEorLZb12Zd8GZyWu5YpSrfod8a8ONsZmHhhI/w9q4HnzJYzIsv6
 n5snJmlk9oOvf5iJZRRwEFc4I08LCtCKHVeqnKhbjZcmdOnAorc5E5mre
 rQRaErw7jSrfPQL8rPhdbQ0rVdr98/dO/axEiRKhwuzo0xbJRV335Wso0
 nmS46IJlGjftuFVaTfYnoRGDiV10ugnVJXYCKgrFQtpSUX2Q6WxN8KyE8
 zyG5fit4xFBgZlVZV6vJvThhKWgQ8bON7/8DcvMu8cdhQ/g1FPhwpusWe
 AGEvg1a7Nnb5LA/0IjToQ0z08Kwr5Xz9nG0VoZBelL1lh7v0m+qF3zeIG A==;
Date: Thu, 24 Feb 2022 14:40:57 +0100
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: Denis Kirjanov <dkirjanov@suse.de>
Message-ID: <20220224134057.GA4994@axis.com>
References: <20220224113829.1092859-1-vincent.whitchurch@axis.com>
 <f62148d7-6f7a-3557-e3ca-3a261b61ac9d@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f62148d7-6f7a-3557-e3ca-3a261b61ac9d@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@st.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 kernel <kernel@axis.com>, Lars Persson <Lars.Persson@axis.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: only enable DMA
	interrupts when ready
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

T24gVGh1LCBGZWIgMjQsIDIwMjIgYXQgMDE6NTM6MzNQTSArMDEwMCwgRGVuaXMgS2lyamFub3Yg
d3JvdGU6Cj4gMi8yNC8yMiAxNDozOCwgVmluY2VudCBXaGl0Y2h1cmNoINC/0LjRiNC10YI6Cj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFj
X21haW4uYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMKPiA+IGluZGV4IDY3MDhjYTJhYTRmNy4uNDM5Nzg1NThkNmMwIDEwMDY0NAo+ID4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4gKysr
IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ID4g
QEAgLTIyNjAsNiArMjI2MCwyMyBAQCBzdGF0aWMgdm9pZCBzdG1tYWNfc3RvcF90eF9kbWEoc3Ry
dWN0IHN0bW1hY19wcml2ICpwcml2LCB1MzIgY2hhbikKPiA+ICAgCXN0bW1hY19zdG9wX3R4KHBy
aXYsIHByaXYtPmlvYWRkciwgY2hhbik7Cj4gPiAgIH0KPiA+ICAgCj4gPiArc3RhdGljIHZvaWQg
c3RtbWFjX2VuYWJsZV9hbGxfZG1hX2lycShzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYpCj4gPiAr
ewo+ID4gKwl1MzIgcnhfY2hhbm5lbHNfY291bnQgPSBwcml2LT5wbGF0LT5yeF9xdWV1ZXNfdG9f
dXNlOwo+ID4gKwl1MzIgdHhfY2hhbm5lbHNfY291bnQgPSBwcml2LT5wbGF0LT50eF9xdWV1ZXNf
dG9fdXNlOwo+ID4gKwl1MzIgZG1hX2Nzcl9jaCA9IG1heChyeF9jaGFubmVsc19jb3VudCwgdHhf
Y2hhbm5lbHNfY291bnQpOwo+ID4gKwl1MzIgY2hhbjsKPiA+ICsKPiA+ICsJZm9yIChjaGFuID0g
MDsgY2hhbiA8IGRtYV9jc3JfY2g7IGNoYW4rKykgewo+ID4gKwkJc3RydWN0IHN0bW1hY19jaGFu
bmVsICpjaCA9ICZwcml2LT5jaGFubmVsW2NoYW5dOwo+ID4gKwkJdW5zaWduZWQgbG9uZyBmbGFn
czsKPiA+ICsKPiA+ICsJCXNwaW5fbG9ja19pcnFzYXZlKCZjaC0+bG9jaywgZmxhZ3MpOwo+ID4g
KwkJc3RtbWFjX2VuYWJsZV9kbWFfaXJxKHByaXYsIHByaXYtPmlvYWRkciwgY2hhbiwgMSwgMSk7
Cj4gPiArCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjaC0+bG9jaywgZmxhZ3MpOwo+ID4gKwl9
Cj4gPiArfQo+ID4gKwo+ID4gICAvKioKPiA+ICAgICogc3RtbWFjX3N0YXJ0X2FsbF9kbWEgLSBz
dGFydCBhbGwgUlggYW5kIFRYIERNQSBjaGFubmVscwo+ID4gICAgKiBAcHJpdjogZHJpdmVyIHBy
aXZhdGUgc3RydWN0dXJlCj4gPiBAQCAtMjkwMiw4ICsyOTE5LDEwIEBAIHN0YXRpYyBpbnQgc3Rt
bWFjX2luaXRfZG1hX2VuZ2luZShzdHJ1Y3Qgc3RtbWFjX3ByaXYgKnByaXYpCj4gPiAgIAkJc3Rt
bWFjX2F4aShwcml2LCBwcml2LT5pb2FkZHIsIHByaXYtPnBsYXQtPmF4aSk7Cj4gPiAgIAo+ID4g
ICAJLyogRE1BIENTUiBDaGFubmVsIGNvbmZpZ3VyYXRpb24gKi8KPiA+IC0JZm9yIChjaGFuID0g
MDsgY2hhbiA8IGRtYV9jc3JfY2g7IGNoYW4rKykKPiA+ICsJZm9yIChjaGFuID0gMDsgY2hhbiA8
IGRtYV9jc3JfY2g7IGNoYW4rKykgewo+ID4gICAJCXN0bW1hY19pbml0X2NoYW4ocHJpdiwgcHJp
di0+aW9hZGRyLCBwcml2LT5wbGF0LT5kbWFfY2ZnLCBjaGFuKTsKPiBEaWQgeW91IG1pc3MgdG8g
dGFrZSBhIGNoYW5uZWwgbG9jaz8KCkkgZGlkbid0IGFkZCBpdCBvbiBwdXJwb3NlLiAgQXQgdGhp
cyBwb2ludCBkdXJpbmcgaW5pdGlhbGl6YXRpb24gdGhlcmUKaXMgbm8tb25lIHdobyBjYW4gcmFj
ZSB3aXRoIHRoZSByZWdpc3RlciB3cml0ZSBpbgpzdG1tYWNfZGlzYWJsZV9kbWFfaXJxKCkuICBU
aGUgY2FsbCB0byBzdG1tYWNfaW5pdF9jaGFuKCkgKGluIHRoZQpleGlzdGluZyBjb2RlKSB3cml0
ZXMgdGhlIHNhbWUgcmVnaXN0ZXIgd2l0aG91dCB0aGUgbG9jay4gCgo+ID4gKwkJc3RtbWFjX2Rp
c2FibGVfZG1hX2lycShwcml2LCBwcml2LT5pb2FkZHIsIGNoYW4sIDEsIDEpOwo+ID4gKwl9Cj4g
PiAgIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
