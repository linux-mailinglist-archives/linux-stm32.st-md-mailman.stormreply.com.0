Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C34DB429AD
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 21:20:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 030CCC36B2C;
	Wed,  3 Sep 2025 19:20:38 +0000 (UTC)
Received: from aposti.net (aposti.net [185.119.170.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5712C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1756927235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=c+ZgGU/Y7ymCGJS4a8iBSCEwRU68y0Cdd3gwtYGpdv4=;
 b=Z0xvlH/ECfsC59swm4ATc7moQPplDnhXIzmBF4X35r6pJmnBDDeoU1Ie5Ab1yxhe+1ln8W
 GcUQb2ZLGdW9NnPudS1kvJ3oXxwi39axE8bJQYRDLCQpq4QuYcwKIMP6MOFv74jzcnlQqN
 tMc5uO4lOOAAr/7RBg88uyXzuq33+zQ=
Message-ID: <f19aa842d210bf4cd3d7abf03ea7323f9e52df75.camel@crapouillou.net>
From: Paul Cercueil <paul@crapouillou.net>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
Date: Wed, 03 Sep 2025 21:20:32 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
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
 lBwgAhlGy6nqP7O3u7q23hRU=
MIME-Version: 1.0
Cc: imx@lists.linux.dev, soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 arm-scmi@vger.kernel.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-actions@lists.infradead.org,
 asahi@lists.linux.dev, sophgo@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 024/114] clk: ingenic: x1000-cgu: convert
 from round_rate() to determine_rate()
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

TGUgbHVuZGkgMTEgYW/Du3QgMjAyNSDDoCAxMToxOCAtMDQwMCwgQnJpYW4gTWFzbmV5IHZpYSBC
NCBSZWxheSBhCsOpY3JpdMKgOgo+IEZyb206IEJyaWFuIE1hc25leSA8Ym1hc25leUByZWRoYXQu
Y29tPgo+IAo+IFRoZSByb3VuZF9yYXRlKCkgY2xrIG9wcyBpcyBkZXByZWNhdGVkLCBzbyBtaWdy
YXRlIHRoaXMgZHJpdmVyIGZyb20KPiByb3VuZF9yYXRlKCkgdG8gZGV0ZXJtaW5lX3JhdGUoKSB1
c2luZyB0aGUgQ29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaAo+IG9uIHRoZSBjb3ZlciBsZXR0ZXIg
b2YgdGhpcyBzZXJpZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxibWFzbmV5
QHJlZGhhdC5jb20+CgpSZXZpZXdlZC1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxv
dS5uZXQ+CgpDaGVlcnMsCi1QYXVsCgo+IC0tLQo+IMKgZHJpdmVycy9jbGsvaW5nZW5pYy94MTAw
MC1jZ3UuYyB8IDE5ICsrKysrKysrKystLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMCBp
bnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Ns
ay9pbmdlbmljL3gxMDAwLWNndS5jCj4gYi9kcml2ZXJzL2Nsay9pbmdlbmljL3gxMDAwLWNndS5j
Cj4gaW5kZXgKPiBmZWIwM2VlZDRmZThjOGY2MTdlZjk4MjU0YTUyMmQ3MmQ0NTJhYzE3Li5kODA4
ODZjYWYzOTMzMDlhMGM5MDhjMDZmYjUKPiBhYThiNTlhY2VkMTI3IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvY2xrL2luZ2VuaWMveDEwMDAtY2d1LmMKPiArKysgYi9kcml2ZXJzL2Nsay9pbmdlbmlj
L3gxMDAwLWNndS5jCj4gQEAgLTg0LDE2ICs4NCwxNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZwo+
IHgxMDAwX290Z19waHlfcmVjYWxjX3JhdGUoc3RydWN0IGNsa19odyAqaHcsCj4gwqAJcmV0dXJu
IHBhcmVudF9yYXRlOwo+IMKgfQo+IMKgCj4gLXN0YXRpYyBsb25nIHgxMDAwX290Z19waHlfcm91
bmRfcmF0ZShzdHJ1Y3QgY2xrX2h3ICpodywgdW5zaWduZWQKPiBsb25nIHJlcV9yYXRlLAo+IC0J
CQkJwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nICpwYXJlbnRfcmF0ZSkKPiArc3RhdGljIGludCB4
MTAwMF9vdGdfcGh5X2RldGVybWluZV9yYXRlKHN0cnVjdCBjbGtfaHcgKmh3LAo+ICsJCQkJCXN0
cnVjdCBjbGtfcmF0ZV9yZXF1ZXN0Cj4gKnJlcSkKPiDCoHsKPiAtCWlmIChyZXFfcmF0ZSA8IDE4
MDAwMDAwKQo+IC0JCXJldHVybiAxMjAwMDAwMDsKPiAtCj4gLQlpZiAocmVxX3JhdGUgPCAzNjAw
MDAwMCkKPiAtCQlyZXR1cm4gMjQwMDAwMDA7Cj4gKwlpZiAocmVxLT5yYXRlIDwgMTgwMDAwMDAp
Cj4gKwkJcmVxLT5yYXRlID0gMTIwMDAwMDA7Cj4gKwllbHNlIGlmIChyZXEtPnJhdGUgPCAzNjAw
MDAwMCkKPiArCQlyZXEtPnJhdGUgPSAyNDAwMDAwMDsKPiArCWVsc2UKPiArCQlyZXEtPnJhdGUg
PSA0ODAwMDAwMDsKPiDCoAo+IC0JcmV0dXJuIDQ4MDAwMDAwOwo+ICsJcmV0dXJuIDA7Cj4gwqB9
Cj4gwqAKPiDCoHN0YXRpYyBpbnQgeDEwMDBfb3RnX3BoeV9zZXRfcmF0ZShzdHJ1Y3QgY2xrX2h3
ICpodywgdW5zaWduZWQgbG9uZwo+IHJlcV9yYXRlLAo+IEBAIC0xNjEsNyArMTYyLDcgQEAgc3Rh
dGljIGludCB4MTAwMF91c2JfcGh5X2lzX2VuYWJsZWQoc3RydWN0IGNsa19odwo+ICpodykKPiDC
oAo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfb3BzIHgxMDAwX290Z19waHlfb3BzID0gewo+
IMKgCS5yZWNhbGNfcmF0ZSA9IHgxMDAwX290Z19waHlfcmVjYWxjX3JhdGUsCj4gLQkucm91bmRf
cmF0ZSA9IHgxMDAwX290Z19waHlfcm91bmRfcmF0ZSwKPiArCS5kZXRlcm1pbmVfcmF0ZSA9IHgx
MDAwX290Z19waHlfZGV0ZXJtaW5lX3JhdGUsCj4gwqAJLnNldF9yYXRlID0geDEwMDBfb3RnX3Bo
eV9zZXRfcmF0ZSwKPiDCoAo+IMKgCS5lbmFibGUJCT0geDEwMDBfdXNiX3BoeV9lbmFibGUsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
