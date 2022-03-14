Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 432294D85AA
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 14:06:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03098C60468;
	Mon, 14 Mar 2022 13:06:04 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D319CC5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 13:06:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nTkOc-00053S-TA; Mon, 14 Mar 2022 14:05:58 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nTkOa-000eWs-KI; Mon, 14 Mar 2022 14:05:55 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nTkOY-0007WY-D1; Mon, 14 Mar 2022 14:05:54 +0100
Message-ID: <1e620fa18fa34ca1f65558e3a52f79f81ff20634.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yann Gautier <yann.gautier@foss.st.com>, Ulf Hansson
 <ulf.hansson@linaro.org>
Date: Mon, 14 Mar 2022 14:05:54 +0100
In-Reply-To: <20220314125554.190574-1-yann.gautier@foss.st.com>
References: <20220314095225.53563-1-yann.gautier@foss.st.com>
 <20220314125554.190574-1-yann.gautier@foss.st.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: manage MMC_PM_KEEP_POWER
 per variant config
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

SGkgWWFubiwKCk9uIE1vLCAyMDIyLTAzLTE0IGF0IDEzOjU1ICswMTAwLCBZYW5uIEdhdXRpZXIg
d3JvdGU6Cj4gQWRkIGEgZGlzYWJsZV9rZWVwX3Bvd2VyIGZpZWxkIGluIHZhcmlhbnRfZGF0YSBz
dHJ1Y3QuIFRoZQo+IE1NQ19QTV9LRUVQX1BPV0VSIGZsYWcgd2lsbCBiZSBlbmFibGVkIGlmIGRp
c2FibGVfa2VlcF9wb3dlciBpcyBub3QKPiBzZXQuCj4gSXQgaXMgb25seSBzZXQgdG8gdHJ1ZSBm
b3Igc3RtMzJfc2RtbWMgdmFyaWFudHMuCj4gCj4gVGhlIGlzc3VlIHdhcyBzZWVuIG9uIFNUTTMy
TVAxNTdDLURLMiBib2FyZCwgd2hpY2ggZW1iZWRzIGEgd2lmaQo+IGNoaXAuCj4gSXQgZG9lc24n
dCBjb3JyZWN0bHkgc3VwcG9ydCBsb3cgcG93ZXIgb24gdGhpcyBib2FyZC4gVGhlIFdpZmkgY2hp
cAo+IGF3YWl0cyBhbiBhbHdheXMtb24gcmVndWxhdG9yLCBidXQgaXQgd2FzIGNvbm5lY3RlZCB0
byB2M3YzIHdoaWNoIGlzCj4gb2ZmCj4gaW4gbG93LXBvd2VyIHNlcXVlbmNlLiBNTUNfUE1fS0VF
UF9QT1dFUiBzaG91bGQgdGhlbiBiZSBkaXNhYmxlZC4KPiAKPiBUaGUgZmxhZyBjYW4gc3RpbGwg
YmUgZW5hYmxlZCB0aHJvdWdoIERUIHByb3BlcnR5Ogo+IGtlZXAtcG93ZXItaW4tc3VzcGVuZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBZYW5uIEdhdXRpZXIgPHlhbm4uZ2F1dGllckBmb3NzLnN0LmNv
bT4KPiAtLS0KPiBVcGRhdGUgaW4gdjI6Cj4gUmV3b3JkIGNvbW1pdCBtZXNzYWdlIHRvIGJldHRl
ciBleHBsYWluIHRoZSBpc3N1ZS4KPiAKPiBSZXNlbmQgdGhlIHBhdGNoIGFsb25lLiBJdCB3YXMg
cHJldmlvdWxzeSBpbiBhIHNlcmllcyBbMV0gZm9yIHdoaWNoCj4gdGhlCj4gb3RoZXIgcGF0Y2hl
cyB3aWxsIGJlIHJld29ya2VkLgo+IAo+IFsxXSAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
a21sLzIwMjIwMzA0MTM1MTM0LjQ3ODI3LTEteWFubi5nYXV0aWVyQGZvc3Muc3QuY29tLwo+IAo+
IMKgZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMgfCA1ICsrKystCj4gwqBkcml2ZXJzL21tYy9ob3N0
L21tY2kuaCB8IDEgKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMgYi9kcml2
ZXJzL21tYy9ob3N0L21tY2kuYwo+IGluZGV4IDQ1Yjg2MDhjOTM1Yy4uMGUyZjJmNWQ2YTUyIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5jCj4gKysrIGIvZHJpdmVycy9tbWMv
aG9zdC9tbWNpLmMKPiBAQCAtMjc0LDYgKzI3NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgdmFyaWFudF9k
YXRhIHZhcmlhbnRfc3RtMzJfc2RtbWMgPQo+IHsKPiDCoMKgwqDCoMKgwqDCoMKgLmJ1c3lfZGV0
ZWN0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgPSB0cnVlLAo+IMKgwqDCoMKgwqDCoMKgwqAuYnVz
eV9kZXRlY3RfZmxhZ8KgwqDCoMKgwqDCoMKgPSBNQ0lfU1RNMzJfQlVTWUQwLAo+IMKgwqDCoMKg
wqDCoMKgwqAuYnVzeV9kZXRlY3RfbWFza8KgwqDCoMKgwqDCoMKgPSBNQ0lfU1RNMzJfQlVTWUQw
RU5ETUFTSywKPiArwqDCoMKgwqDCoMKgwqAuZGlzYWJsZV9rZWVwX3Bvd2VywqDCoMKgwqDCoD0g
dHJ1ZSwKPiDCoMKgwqDCoMKgwqDCoMKgLmluaXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoD0gc2RtbWNfdmFyaWFudF9pbml0LAo+IMKgfTsKPiDCoAo+IEBAIC0zMDEsNiAr
MzAyLDcgQEAgc3RhdGljIHN0cnVjdCB2YXJpYW50X2RhdGEgdmFyaWFudF9zdG0zMl9zZG1tY3Yy
Cj4gPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoC5idXN5X2RldGVjdMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoD0gdHJ1ZSwKPiDCoMKgwqDCoMKgwqDCoMKgLmJ1c3lfZGV0ZWN0X2ZsYWfCoMKgwqDCoMKg
wqDCoD0gTUNJX1NUTTMyX0JVU1lEMCwKPiDCoMKgwqDCoMKgwqDCoMKgLmJ1c3lfZGV0ZWN0X21h
c2vCoMKgwqDCoMKgwqDCoD0gTUNJX1NUTTMyX0JVU1lEMEVORE1BU0ssCj4gK8KgwqDCoMKgwqDC
oMKgLmRpc2FibGVfa2VlcF9wb3dlcsKgwqDCoMKgwqA9IHRydWUsCj4gwqDCoMKgwqDCoMKgwqDC
oC5pbml0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqA9IHNkbW1jX3Zhcmlh
bnRfaW5pdCwKPiDCoH07Cj4gwqAKPiBAQCAtMjE3Miw3ICsyMTc0LDggQEAgc3RhdGljIGludCBt
bWNpX3Byb2JlKHN0cnVjdCBhbWJhX2RldmljZSAqZGV2LAo+IMKgwqDCoMKgwqDCoMKgwqBob3N0
LT5zdG9wX2Fib3J0LmZsYWdzID0gTU1DX1JTUF9SMUIgfCBNTUNfQ01EX0FDOwo+IMKgCj4gwqDC
oMKgwqDCoMKgwqDCoC8qIFdlIHN1cHBvcnQgdGhlc2UgUE0gY2FwYWJpbGl0aWVzLiAqLwo+IC3C
oMKgwqDCoMKgwqDCoG1tYy0+cG1fY2FwcyB8PSBNTUNfUE1fS0VFUF9QT1dFUjsKPiArwqDCoMKg
wqDCoMKgwqBpZiAoIXZhcmlhbnQtPmRpc2FibGVfa2VlcF9wb3dlcikKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgbW1jLT5wbV9jYXBzIHw9IE1NQ19QTV9LRUVQX1BPV0VSOwo+IMKg
Cj4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFdlIGNhbiBkbyBTR0lP
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5oIGIvZHJpdmVycy9tbWMvaG9z
dC9tbWNpLmgKPiBpbmRleCBlMWE5Yjk2YTMzOTYuLjJjYWQxZWY5NzY2YSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL21tYy9ob3N0L21tY2kuaAo+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvbW1jaS5o
Cj4gQEAgLTM2MSw2ICszNjEsNyBAQCBzdHJ1Y3QgdmFyaWFudF9kYXRhIHsKPiDCoMKgwqDCoMKg
wqDCoMKgdTMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgb3BlbmRy
YWluOwo+IMKgwqDCoMKgwqDCoMKgwqB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgZG1hX2xsaToxOwo+IMKgwqDCoMKgwqDCoMKgwqB1MzLCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdG0zMl9pZG1hYnNpemVfbWFzazsKPiArwqDC
oMKgwqDCoMKgwqB1OMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ZGlzYWJsZV9rZWVwX3Bvd2VyOjE7CgpUaGVyZSBhcmUgYWxyZWFkeSBmb3VyIHNlcGFyYXRlIGJp
dGZpZWxkcyBpbiBzdHJ1Y3QgdmFyaWFudF9kYXRhLCB3aHkKbm90IG1vdmUgdGhpcyB1cCBpbnRv
IG9uZSBvZiB0aGVtPwoKcmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
