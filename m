Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33977E4AE
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Aug 2023 17:08:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39889C6B45F;
	Wed, 16 Aug 2023 15:08:12 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 206B8C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Aug 2023 15:08:11 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.goehrs@pengutronix.de>)
 id 1qWI7s-0003IB-HQ; Wed, 16 Aug 2023 17:08:00 +0200
Message-ID: <41c33633-a6ca-4eb4-91ba-f2cd43600e93@pengutronix.de>
Date: Wed, 16 Aug 2023 17:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Valentin Caron <valentin.caron@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20230615075815.310261-1-valentin.caron@foss.st.com>
 <20230615075815.310261-2-valentin.caron@foss.st.com>
Content-Language: en-US-large
From: =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
In-Reply-To: <20230615075815.310261-2-valentin.caron@foss.st.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.goehrs@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/4] spi: stm32: renaming of spi_master
 into spi_controller
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGVsbG8sCgpPbiAxNS4wNi4yMyAwOTo1OCwgVmFsZW50aW4gQ2Fyb24gd3JvdGU6Cj4gRnJvbTog
QWxhaW4gVm9sbWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+Cj4gCj4gUHJlcGFyaW5nIGlu
dHJvZHVjdGlvbiBvZiBTUEkgZGV2aWNlLCByZW5hbWUgdGhlIHNwaV9tYXN0ZXIgc3RydWN0dXJl
Cj4gaW50byBzcGlfY29udHJvbGxlci4gVGhpcyBkb2Vzbid0IGhhdmUgYW55IGZ1bmN0aW9uYWwg
aW1wYWN0IHNpbmNlCj4gc3BpX21hc3RlciB3YXMgYWxyZWFkeSBhIG1hY3JvIGZvciBzcGlfY29u
dHJvbGxlci4KPiBSZWZlcnJpbmcgbm93IHRvIGN0cmwgaW5zdGVhZCBvZiBtYXN0ZXIgc2luY2Ug
dGhlIHNwaV9jb250cm9sbGVyCj4gc3RydWN0dXJlIG1pZ2h0IG5vdCBiZSB1c2VkIGFzIGEgbWFz
dGVyIGNvbnRyb2xsZXIgb25seS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGFpbiBWb2xtYXQgPGFs
YWluLnZvbG1hdEBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBWYWxlbnRpbiBDYXJvbiA8
dmFsZW50aW4uY2Fyb25AZm9zcy5zdC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3NwaS9zcGktc3Rt
MzIuYyB8IDE1NCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAx
IGZpbGUgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgNzcgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jIGIvZHJpdmVycy9zcGkvc3BpLXN0bTMy
LmMKPiBpbmRleCBkNjU5OGU0MTE2YmQuLjVkOTQzOWFlMWMwOSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3NwaS9zcGktc3RtMzIuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1zdG0zMi5jCgo8c25p
cD4KCj4gQEAgLTkzOSwxMyArOTM5LDEzIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMmg3X3Nw
aV9pcnFfdGhyZWFkKGludCBpcnEsIHZvaWQgKmRldl9pZCkKPiAgIAo+ICAgLyoqCj4gICAgKiBz
dG0zMl9zcGlfcHJlcGFyZV9tc2cgLSBzZXQgdXAgdGhlIGNvbnRyb2xsZXIgdG8gdHJhbnNmZXIg
YSBzaW5nbGUgbWVzc2FnZQo+IC0gKiBAbWFzdGVyOiBjb250cm9sbGVyIG1hc3RlciBpbnRlcmZh
Y2UKPiArICogQGN0cmw6IGNvbnRyb2xsZXIgaW50ZXJmYWNlCj4gICAgKiBAbXNnOiBwb2ludGVy
IHRvIHNwaSBtZXNzYWdlCj4gICAgKi8KPiAtc3RhdGljIGludCBzdG0zMl9zcGlfcHJlcGFyZV9t
c2coc3RydWN0IHNwaV9tYXN0ZXIgKm1hc3RlciwKPiArc3RhdGljIGludCBzdG0zMl9zcGlfcHJl
cGFyZV9tc2coc3RydWN0IHNwaV9jb250cm9sbGVyICpjdHJsLAo+ICAgCQkJCSBzdHJ1Y3Qgc3Bp
X21lc3NhZ2UgKm1zZykKPiAgIHsKPiAtCXN0cnVjdCBzdG0zMl9zcGkgKnNwaSA9IHNwaV9tYXN0
ZXJfZ2V0X2RldmRhdGEobWFzdGVyKTsKPiArCXN0cnVjdCBzdG0zMl9zcGkgKnNwaSA9IHNwaV9j
b250cm9sbGVyX2dldF9kZXZkYXRhKGN0cmwpOwo+ICAgCXN0cnVjdCBzcGlfZGV2aWNlICpzcGlf
ZGV2ID0gbXNnLT5zcGk7Cj4gICAJc3RydWN0IGRldmljZV9ub2RlICpucCA9IHNwaV9kZXYtPmRl
di5vZl9ub2RlOwo+ICAgCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gQEAgLTk4NCw5ICs5ODQsOSBA
QCBzdGF0aWMgaW50IHN0bTMyX3NwaV9wcmVwYXJlX21zZyhzdHJ1Y3Qgc3BpX21hc3RlciAqbWFz
dGVyLAo+ICAgCWlmIChzcGktPmNmZy0+c2V0X251bWJlcl9vZl9kYXRhKSB7Cj4gICAJCWludCBy
ZXQ7Cj4gICAKPiAtCQlyZXQgPSBzcGlfc3BsaXRfdHJhbnNmZXJzX21heHdvcmRzKG1hc3Rlciwg
bXNnLAo+IC0JCQkJCQkgICBTVE0zMkg3X1NQSV9UU0laRV9NQVgsCj4gLQkJCQkJCSAgIEdGUF9L
RVJORUwgfCBHRlBfRE1BKTsKPiArCQlyZXQgPSBzcGlfc3BsaXRfdHJhbnNmZXJzX21heHNpemUo
Y3RybCwgbXNnLAo+ICsJCQkJCQkgIFNUTTMySDdfU1BJX1RTSVpFX01BWCwKPiArCQkJCQkJICBH
RlBfS0VSTkVMIHwgR0ZQX0RNQSk7Cj4gICAJCWlmIChyZXQpCj4gICAJCQlyZXR1cm4gcmV0Owo+
ICAgCX0KCjxzbmlwPgoKdGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgcmVncmVzc2lvbiB3aGVuIHRy
YW5zbWl0dGluZyBsYXJnZSBTUEkgdHJhbnNmZXJzIHdpdGgKYSB3b3JkIHNpemUgIT0gOCBiaXRz
LiBUaGUgcmVncmVzc2lvbiBpcyBjYXVzZWQgYnkgZWZmZWN0aXZlbHkgcmV2ZXJ0aW5nIGNvbW1p
dAoxZTQ5MjkxMTI1MDdmICgic3BpOiBzdG0zMjogc3BsaXQgbGFyZ2UgdHJhbnNmZXJzIGJhc2Vk
IG9uIHdvcmQgc2l6ZSBpbnN0ZWFkIG9mCmJ5dGVzIikgYnkgY2hhbmdpbmcgdGhlIGNhbGwgdG8g
c3BpX3NwbGl0X3RyYW5zZmVyc19tYXh3b3JkcygpIGJhY2sgdG8Kc3BpX3NwbGl0X3RyYW5zZmVy
c19tYXhzaXplKCkuCgpJJ3ZlIHNlbnQgYSBwYXRjaFsxXSB0aGF0IGZpeGVzIHRoaXMgcmVncmVz
c2lvbiBieSBjaGFuZ2luZyB0aGUg4oCmX21heHNpemUoKQpjYWxsIGJhY2sgdG8g4oCmX21heHdv
cmRzKCkuCgpbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDgxNjE0NTIzNy4z
MTU5ODE3LTEtbC5nb2VocnNAcGVuZ3V0cm9uaXguZGUvCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
