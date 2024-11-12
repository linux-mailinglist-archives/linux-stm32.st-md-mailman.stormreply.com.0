Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 576539C5B82
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 16:12:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09E1CC78F84;
	Tue, 12 Nov 2024 15:12:27 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CF62C78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 15:12:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AAF7240006;
 Tue, 12 Nov 2024 15:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1731424339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7/ZZ+GzA9JnknmCSiZ4KAoFAxIWZALm0qPy9dvBIJSk=;
 b=gN8R0y5rBADWu+wo+lGHeMRwjS1282FydlI9vD3kgvpHQWTYsItwv0ODr3pyxeUUL9/IZL
 szxsyvU9qROe3EZH29OPtqpzNY1CGgw47LbshgwpkgUVX6VO2bWsajgC4TmMcGHH7r9LlY
 G33EvbRmjGx8br4vfR0EeyZkdPYjWhhRewSY/WUDxk+ZEvI08pmAojF8qfmADEABnJxIG+
 qoyc+4hqVEjd2XnEyLTv/JnKdPv8cfU++ryF0rzS0cTh8FTuDEnlZfczRSAd+U2jb3EZf+
 mfFl/EYf15RQtHk91p5j5TX+qAfHgPZIWoTiawRO5TblLOHnhgPxrTSLqjvRdg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: cathycai0714@gmail.com, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Avi Fishman <avifishman70@gmail.com>
Date: Tue, 12 Nov 2024 16:12:17 +0100
Message-ID: <7732873.EvYhyI6sBW@fw-rgant>
In-Reply-To: <CAKKbWA6zRee9Rzee-ebLnEAvwLqnmsPswGaUo_ineyzw-b=EgQ@mail.gmail.com>
References: <CAKKbWA7e0TmU4z4O8tHfwE=dvqPFaZbSPjxR-==fQSsNq6ELCQ@mail.gmail.com>
 <CAKKbWA6zRee9Rzee-ebLnEAvwLqnmsPswGaUo_ineyzw-b=EgQ@mail.gmail.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Arias Pablo <Pablo_Arias@dell.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, uri.trichter@nuvoton.com,
 Network Development <netdev@vger.kernel.org>, xuewen.yan94@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, "Silva,
 L Antonio" <Luis.A.Silva@dell.com>, Murali <murali.somarouthu@dell.com>,
 edumazet@google.com, zhiguo.niu@unisoc.com, cixi.geng1@unisoc.com,
 Somarouthu Murali <Murali_Somarouthu@dell.com>, mcoquelin.stm32@gmail.com,
 cathy.cai@unisoc.com, kuba@kernel.org, wade.shu@unisoc.com, pabeni@redhat.com,
 David Miller <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [Linux-stm32] [RFC PATCH] net: stmmac: Fix the problem about
	interrupt storm
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

SGVsbG8sCgpPbiBkaW1hbmNoZSAzIG5vdmVtYnJlIDIwMjQgMjA6MDA6NTQgaGV1cmUgbm9ybWFs
ZSBk4oCZRXVyb3BlIGNlbnRyYWxlIEF2aSAKRmlzaG1hbiB3cm90ZToKPiBIaSBhbGwsCj4gCi4u
Lgo+ID4gIFllcy4gSXQgY291bGQgYWxzbyBoYXBwZW4gYmV0d2VlbiB0aGUgZGV2X29wZW4oKSBh
bmQKPiA+IAo+ID4gY2xlYXJfYml0KFNUTU1BQ19ET1dOKSBjYWxscy4KPiA+IEFsdGhvdWdoIHdl
IGRpZCBub3QgcmVwcm9kdWNlIHRoaXMgc2NlbmFyaW8sIGl0IHNob3VsZCBoYXZlIGhhcHBlbmVk
Cj4gPiBpZiB3ZSBoYWQgaW5jcmVhc2VkCj4gPiB0aGUgbnVtYmVyIG9mIHRlc3Qgc2FtcGxlcy4g
SW4gYWRkaXRpb24sIEkgZm91bmQgdGhhdCBvdGhlciBwZW9wbGUgaGFkCj4gPiBzaW1pbGFyIHBy
b2JsZW1zIGJlZm9yZS4KPiA+IFRoZSBsaW5rIGlzOgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjEwMjA4MTQwODIwLjEwNDEwLTExLVNlcmdleS5TZW1pbkBiYWlrYWxlbGUKPiA+
IGN0cm9uaWNzLnJ1Lz4gCj4gPiA+IE1vcmVvdmVyLCBpdCBzZWVtcyBzdHJhbmdlIHRvIG1lIHRo
YXQgc3RtbWFjX2ludGVycnVwdCgpCj4gPiA+IHVuY29uZGl0aW9ubmFsbHkKPiA+ID4gaWdub3Jl
cyBpbnRlcnJ1cHRzIHdoZW4gdGhlIGRyaXZlciBpcyBpbiBTVE1NQUNfRE9XTiBzdGF0ZS4gVGhp
cyBzZWVtcwo+ID4gPiBsaWtlCj4gPiA+IGRhbmdlcm91cyBiZWhhdmlvdXIsIHNpbmNlIGl0IGNv
dWxkIGNhdXNlIElSUSBzdG9ybSBpc3N1ZXMgd2hlbmV2ZXIKPiA+ID4gc29tZXRoaW5nIGluIHRo
ZSBkcml2ZXIgc2V0cyB0aGlzIHN0YXRlLiBJJ20gbm90IHRvbyBmYW1pbGlhciB3aXRoIHRoZQo+
ID4gPiBpbnRlcnJ1cHQgaGFuZGxpbmcgaW4gdGhpcyBkcml2ZXIsIGJ1dCBtYXliZSBzdG1tYWNf
aW50ZXJydXB0KCkgY291bGQKPiA+ID4gY2xlYXIgaW50ZXJydXB0cyB1bmNvbmRpdGlvbm5hbGx5
IGluIHRoZSBTVE1NQUNfRE9XTiBzdGF0ZT8KPiA+IAo+ID4gQ2xlYXIgaW50ZXJydXB0cyB1bmNv
bmRpdGlvbmFsbHkgaW4gdGhlIFNUTU1BQ19ET1dOIHN0YXRlIGRpcmVjdGx5Cj4gPiBjZXJ0YWlu
bHkgd29uJ3QgY2F1c2UgdGhpcyBwcm9ibGVtLgo+ID4gVGhpcyBtYXkgYmUgdG9vIHJvdWdoLCBt
YXliZSB0aGlzIGRlc2lnbiBoYXMgb3RoZXIgY29uc2lkZXJhdGlvbnMuCj4gCj4gQnV0IHRoZW4g
YWZ0ZXIgdGhlIGRldl9vcGVuKCkgeW91IG1pZ2h0IG1pc3MgaW50ZXJydXB0LCBubz8KCkluZGVl
ZCwgYnV0IGluIGFueSBjYXNlLCB1bmNvbmRpdGlvbmFsbHkgcmV0dXJuaW5nIGZyb20gYW4gSVJR
IGhhbmRsZXIgd2l0aG91dCAKY2xlYXJpbmcgYW55IGludGVycnVwdCBmbGFncyBzZWVtcyBsaWtl
IHZlcnkgc3RyYW5nZSBiZWhhdmlvciB0byBtZS4KCkRpc2FibGluZyBhbmQgcmVlbmFibGluZyBp
bnRlcnJ1cHRzIGFzIHlvdSBzdWdnZXN0ZWQgZG9lcyBzZWVtIGxpa2UgYQpnb29kIHNvbHV0aW9u
IGZvciB0aGlzIHBhcnRpY3VsYXIgc2NlbmFyaW8sIGJ1dCBpdCBkb2Vzbid0IHNvbHZlIHRoZSBt
b3JlCmdlbmVyYWwgaXNzdWUgb2YgdGhlIGRhbmdlcm91cyB3YXkgc3RtbWFjX2ludGVycnVwdCBo
YW5kbGVzIHRoaXMuCgpNYXliZSB0aGUgc2V0dGluZyBhbmQgY2xlYXJpbmcgb2YgdGhpcyBTVE1N
QUNfRE9XTiBiaXQgc2hvdWxkCmJlIHdyYXBwZWQgaW4gc29tZSBraW5kIG9mIGhhbmRsZXIgd2hp
Y2ggYWxzbyBkaXNhYmxlcyBhbGwgaW50ZXJydXB0cz8KCkJlc3QgUmVnYXJkcwoKLS0gClJvbWFp
biBHYW50b2lzLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcK
aHR0cHM6Ly9ib290bGluLmNvbQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
