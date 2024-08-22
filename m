Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A164995B203
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Aug 2024 11:45:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FDAAC6DD9D;
	Thu, 22 Aug 2024 09:45:03 +0000 (UTC)
Received: from aposti.net (aposti.net [89.234.176.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B16FFC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 09:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1724319649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZY5dFiAJk7yETMHVXjLcWFFsbtAbQnRW4YnkZswVf5s=;
 b=xeXdzUWYQCtBoEhvS7PBJPR2NvZrR4Ei8sdKFoTX+dZcbnAJnHN/CzxLTBYCDT49IGuXWs
 aQhsLgy+3PoefZiOk4X4lRCFp0yRLO3rrEu6pGTAIbYmXbV3qEVbnHYOd6qlXXEyZabuEY
 YxGAOzVrjLMBQUL9HZ9cy7v0yGB4y7Q=
Message-ID: <09d6a69610ccec161ad8e0f2df64d8264c0a64fe.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: Lei Liu <liulei.rjpt@vivo.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Thierry
 Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Geert Uytterhoeven
 <geert+renesas@glider.be>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 John Ogness <john.ogness@linutronix.de>, Jeff Johnson
 <quic_jjohnson@quicinc.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Valentin Caron <valentin.caron@foss.st.com>, Lino
 Sanfilippo <l.sanfilippo@kunbus.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-actions@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 22 Aug 2024 11:40:46 +0200
In-Reply-To: <20240822033924.32397-2-liulei.rjpt@vivo.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-2-liulei.rjpt@vivo.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFC
 qaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IWYXnd
 JO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN70
 62DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOt
 X0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEA
 AYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/
 Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmc
 Gu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2z
 McLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/
 7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2c
 LUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Aug 2024 09:45:03 +0000
Cc: opensource.kernel@vivo.com
Subject: Re: [Linux-stm32] [PATCH 1/8] tty: 8250_ingenic: Use
 devm_clk_get_enabled() helpers
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

SGkgTGVpIExpdSwKCkxlIGpldWRpIDIyIGFvw7t0IDIwMjQgw6AgMTE6MzkgKzA4MDAsIExlaSBM
aXUgYSDDqWNyaXTCoDoKPiBUaGUgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBoZWxwZXJzOgo+IMKg
wqDCoCAtIGNhbGwgZGV2bV9jbGtfZ2V0KCkKPiDCoMKgwqAgLSBjYWxsIGNsa19wcmVwYXJlX2Vu
YWJsZSgpIGFuZCByZWdpc3RlciB3aGF0IGlzIG5lZWRlZCBpbiBvcmRlcgo+IHRvCj4gwqDCoMKg
wqAgY2FsbCBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSB3aGVuIG5lZWRlZCwgYXMgYSBtYW5hZ2Vk
IHJlc291cmNlLgo+IAo+IFRoaXMgc2ltcGxpZmllcyB0aGUgY29kZSBhbmQgYXZvaWRzIGNhbGxz
IHRvIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IExlaSBMaXUg
PGxpdWxlaS5yanB0QHZpdm8uY29tPgo+IC0tLQo+IMKgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAv
ODI1MF9pbmdlbmljLmMgfCAyNiArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAtLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfaW5nZW5pYy5jCj4gYi9kcml2ZXJz
L3R0eS9zZXJpYWwvODI1MC84MjUwX2luZ2VuaWMuYwo+IGluZGV4IGEyNzgzZTM4YTJlMy4uNWY4
Nzg3MzA5MDY0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC84MjUwLzgyNTBfaW5n
ZW5pYy5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9pbmdlbmljLmMKPiBA
QCAtMjc0LDQ0ICsyNzQsMjYgQEAgc3RhdGljIGludCBpbmdlbmljX3VhcnRfcHJvYmUoc3RydWN0
Cj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IMKgCWlmICghdWFydC5wb3J0Lm1lbWJhc2UpCj4g
wqAJCXJldHVybiAtRU5PTUVNOwo+IMKgCj4gLQlkYXRhLT5jbGtfbW9kdWxlID0gZGV2bV9jbGtf
Z2V0KCZwZGV2LT5kZXYsICJtb2R1bGUiKTsKPiArCWRhdGEtPmNsa19tb2R1bGUgPSBkZXZtX2Ns
a19nZXRfZW5hYmxlZCgmcGRldi0+ZGV2LAo+ICJtb2R1bGUiKTsKPiDCoAlpZiAoSVNfRVJSKGRh
dGEtPmNsa19tb2R1bGUpKQo+IMKgCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGRldi0+ZGV2LCBQ
VFJfRVJSKGRhdGEtCj4gPmNsa19tb2R1bGUpLAo+IMKgCQkJCcKgwqDCoMKgICJ1bmFibGUgdG8g
Z2V0IG1vZHVsZQo+IGNsb2NrXG4iKTsKPiDCoAo+IC0JZGF0YS0+Y2xrX2JhdWQgPSBkZXZtX2Ns
a19nZXQoJnBkZXYtPmRldiwgImJhdWQiKTsKPiArCWRhdGEtPmNsa19iYXVkID0gZGV2bV9jbGtf
Z2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgImJhdWQiKTsKPiDCoAlpZiAoSVNfRVJSKGRhdGEtPmNs
a19iYXVkKSkKPiDCoAkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgUFRSX0VSUihk
YXRhLQo+ID5jbGtfYmF1ZCksCj4gwqAJCQkJwqDCoMKgwqAgInVuYWJsZSB0byBnZXQgYmF1ZCBj
bG9ja1xuIik7Cj4gwqAKPiAtCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShkYXRhLT5jbGtfbW9k
dWxlKTsKPiAtCWlmIChlcnIpIHsKPiAtCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJjb3VsZCBub3Qg
ZW5hYmxlIG1vZHVsZSBjbG9jazoKPiAlZFxuIiwgZXJyKTsKPiAtCQlnb3RvIG91dDsKPiAtCX0K
PiAtCj4gLQllcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoZGF0YS0+Y2xrX2JhdWQpOwo+IC0JaWYg
KGVycikgewo+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgImNvdWxkIG5vdCBlbmFibGUgYmF1ZCBj
bG9jazoKPiAlZFxuIiwgZXJyKTsKPiAtCQlnb3RvIG91dF9kaXNhYmxlX21vZHVsZWNsazsKPiAt
CX0KPiDCoAl1YXJ0LnBvcnQudWFydGNsayA9IGNsa19nZXRfcmF0ZShkYXRhLT5jbGtfYmF1ZCk7
Cj4gwqAKPiDCoAlkYXRhLT5saW5lID0gc2VyaWFsODI1MF9yZWdpc3Rlcl84MjUwX3BvcnQoJnVh
cnQpOwo+IMKgCWlmIChkYXRhLT5saW5lIDwgMCkgewo+IMKgCQllcnIgPSBkYXRhLT5saW5lOwo+
IC0JCWdvdG8gb3V0X2Rpc2FibGVfYmF1ZGNsazsKPiArCQlyZXR1cm4gZXJyOwoKTm90IHJlYWxs
eSB3b3J0aCBhIFYyLCBidXQgaWYgeW91IG1ha2UgYSBWMiwgcGxlYXNlICJyZXR1cm4gZGF0YS0K
PmxpbmU7IiBkaXJlY3RseS4KCkFja2VkLWJ5OiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldD4KCkNoZWVycywKLVBhdWwKCj4gwqAJfQo+IMKgCj4gwqAJcGxhdGZvcm1fc2V0X2Ry
dmRhdGEocGRldiwgZGF0YSk7Cj4gwqAJcmV0dXJuIDA7Cj4gLQo+IC1vdXRfZGlzYWJsZV9iYXVk
Y2xrOgo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNsa19iYXVkKTsKPiAtb3V0X2Rp
c2FibGVfbW9kdWxlY2xrOgo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNsa19tb2R1
bGUpOwo+IC1vdXQ6Cj4gLQlyZXR1cm4gZXJyOwo+IMKgfQo+IMKgCj4gwqBzdGF0aWMgdm9pZCBp
bmdlbmljX3VhcnRfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gQEAgLTMx
OSw4ICszMDEsNiBAQCBzdGF0aWMgdm9pZCBpbmdlbmljX3VhcnRfcmVtb3ZlKHN0cnVjdAo+IHBs
YXRmb3JtX2RldmljZSAqcGRldikKPiDCoAlzdHJ1Y3QgaW5nZW5pY191YXJ0X2RhdGEgKmRhdGEg
PSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiDCoAo+IMKgCXNlcmlhbDgyNTBfdW5yZWdp
c3Rlcl9wb3J0KGRhdGEtPmxpbmUpOwo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNs
a19tb2R1bGUpOwo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRhdGEtPmNsa19iYXVkKTsKPiDC
oH0KPiDCoAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBpbmdlbmljX3VhcnRfY29uZmlnIGp6NDc0
MF91YXJ0X2NvbmZpZyA9IHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
