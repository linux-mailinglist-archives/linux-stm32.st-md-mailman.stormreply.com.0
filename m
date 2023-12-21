Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86081B02C
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 09:20:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 93B6BC6B477;
	Thu, 21 Dec 2023 08:20:21 +0000 (UTC)
Received: from out28-38.mail.aliyun.com (out28-38.mail.aliyun.com
 [115.124.28.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22B23C6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 07:16:58 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1523255|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0672332-0.00579752-0.926969;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=fuyao@sjterm.com; NM=1; PH=DS;
 RN=19; RT=16; SR=0; TI=SMTPD_---.Vpa1iLw_1703143015; 
Received: from localhost(mailfrom:fuyao@sjterm.com
 fp:SMTPD_---.Vpa1iLw_1703143015) by smtp.aliyun-inc.com;
 Thu, 21 Dec 2023 15:16:56 +0800
Date: Thu, 21 Dec 2023 15:16:54 +0800
From: fuyao <fuyao@sjterm.com>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Message-ID: <ZYPmZj8l01eQsDS5@debian.cyg>
Mail-Followup-To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
References: <ZYKvCQBD-SY9uVLF@debian.cyg>
 <2370947.NG923GbCHz@jernej-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2370947.NG923GbCHz@jernej-laptop>
Organization: work_work_work
X-Mailman-Approved-At: Thu, 21 Dec 2023 08:20:21 +0000
Cc: linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>,
 Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] gmac: sun8i: r40: add gmac tx_delay
	support
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMDY6MDQ6MjhQTSArMDEwMCwgSmVybmVqIMWga3JhYmVj
IHdyb3RlOgo+IERuZSBzcmVkYSwgMjAuIGRlY2VtYmVyIDIwMjMgb2IgMTA6MDg6MjUgQ0VUIGpl
IGZ1eWFvIG5hcGlzYWwoYSk6Cj4gPiByNDAgY2FuIHN1cHBvcnQgdHhfZGVsYXksIHNvIHdlIGFk
ZCBpdC4KPiAKPiBJIGRvbid0IHNlZSBob3cuIFVzZXIgbWFudWFsLCAzLjMuNC42NC4gR01BQyBD
bG9jayBSZWdpc3RlciB0YWxrcyBvbmx5Cj4gYWJvdXQgUlggZGVsYXkuCj4gCgpJIGRvbid0IHNl
ZSBpdCBpbiB0aGUgdXNlciBtYW51YWwgYWxzby4KCml0IHdvcmtzIGZpbmUgaW4gMTAwTSwgYnV0
IGl0IGRvZXNuJ3Qgd29yayBnb29kIGluIDFHIHdpdGhvdXQgdHhfZGVsYXkKaW4gbXkgYm9hcmQu
CgpSZWFkIHRoZSBzZGsgZnJvbSBhbGx3aW5uZXIgSSBmb3VuZCBpbjoKCmh0dHBzOi8vc291cmNl
Z3JhcGguY29tL2dpdGh1Yi5jb20vdGluYWxpbnV4L2xpbnV4LTMuMTAvLS9ibG9iL2FyY2gvYXJt
L2Jvb3QvZHRzL3N1bjhpdzExcDEuZHRzaT9MMTgyNgpodHRwczovL3NvdXJjZWdyYXBoLmNvbS9n
aXRodWIuY29tL3RpbmFsaW51eC9saW51eC0zLjEwQHI0MC12MS55Ly0vYmxvYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9hbGx3aW5uZXIvc3VueGktZ21hYy5jP0w4NzcKCkFuZCBJIGFkZCBpdCB0byBt
eSBib2FyZCwgaXQgd29ya3MgZmluZS4KClNvLCBJIHRoaW5rIGl0IG1heSBiZSBleGlzdCByZWdp
c3RlciBidXQgbm90IGRvY3VtZW50ZWQuCgpCZXN0IHJlZ2FyZHMsCmZ1eWFvCgo+IEJlc3QgcmVn
YXJkcywKPiBKZXJuZWoKPiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogZnV5YW8gPGZ1eWFvMTY5
N0BjeWcuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtc3VuOGkuYyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWMtc3VuOGkuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3
bWFjLXN1bjhpLmMKPiA+IGluZGV4IDEzNzc0MWI5NDEyMi4uZmQwNzU3M2FmYzliIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3VuOGku
Ywo+ID4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc3Vu
OGkuYwo+ID4gQEAgLTEyNyw2ICsxMjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGVtYWNfdmFy
aWFudCBlbWFjX3ZhcmlhbnRfcjQwID0gewo+ID4gIAkuc3VwcG9ydF9taWkgPSB0cnVlLAo+ID4g
IAkuc3VwcG9ydF9yZ21paSA9IHRydWUsCj4gPiAgCS5yeF9kZWxheV9tYXggPSA3LAo+ID4gKwku
dHhfZGVsYXlfbWF4ID0gNywKPiA+ICB9Owo+ID4gIAo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZW1hY192YXJpYW50IGVtYWNfdmFyaWFudF9hNjQgPSB7Cj4gPiAKPiAKPiAKPiAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
