Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9865166CC
	for <lists+linux-stm32@lfdr.de>; Sun,  1 May 2022 19:52:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BEB2C628A2;
	Sun,  1 May 2022 17:52:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A179C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 May 2022 17:52:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43196B80E92;
 Sun,  1 May 2022 17:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B847C385AA;
 Sun,  1 May 2022 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651427519;
 bh=A+KWCBjbPxzqgaB4YkY3/72H1oSKZcmYsDZciBLSzKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=C1fI2IjZFKqbaxS+9Ng29j5164LESe2VsiXsMJtpgpmqsGHvbL/TwqU7hUyj7boNs
 KqP+JpTcRWaAeeYfv5bwrQj0m4VXr00HUUJKS5Ovsn1XvuvzxPTUlpZybjRdq0lglh
 wQyFcTtUrJPBTAgKF2NG1QZC6dKhCxpsxSbre27F/J6+E/5P+727CW8whXgSAqivUx
 mb2LvW6ZArpK+6YsYHVxE+hkJzdbOpuf023ZkDKzJ7BTdz25gQdT7glvITGB0UlWjx
 GR9h5lrV5OHtknDsUDcG83NRRQPjXPw48rd6Uyk+BXmaTkHnNmI45OIwUC3G6o7rO4
 5cIpvxS6oYHiA==
Date: Sun, 1 May 2022 19:00:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20220501190015.48d6acd3@jic23-huawei>
In-Reply-To: <20220501103447.111392-1-krzysztof.kozlowski@linaro.org>
References: <20220501103447.111392-1-krzysztof.kozlowski@linaro.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] iio: stmpe-adc: use of_device_id for
	OF matching
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

T24gU3VuLCAgMSBNYXkgMjAyMiAxMjozNDo0NiArMDIwMApLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgb2ZfZGV2aWNlX2lk
IHdhcyBhZGRlZCB0byBhbGxvdyBtb2R1bGUgYXV0b2xvYWRpbmcsIGJ1dCBpdCBzaG91bGQgYmUK
PiBhbHNvIHVzZWQgdG8gYWxsb3cgZHJpdmVyIG1hdGNoaW5nIHZpYSBEZXZpY2V0cmVlLgo+IAo+
IFRoaXMgYWxzbyBmaXhlcyBXPTEgd2FybmluZzoKPiAgIGRyaXZlcnMvaWlvL2FkYy9zdG1wZS1h
ZGMuYzozNTc6MzQ6IGVycm9yOiDigJhzdG1wZV9hZGNfaWRz4oCZIGRlZmluZWQgYnV0IG5vdCB1
c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gCj4gU2lnbmVkLW9mZi1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpTZXJp
ZXMgYXBwbGllZCB0byB0aGUgdG9ncmVnIGJyYW5jaCBvZiBpaW8uZ2l0IGFuZCBwdXNoZWQgb3V0
IGFzIHRlc3RpbmcgZm9yIDAtZGF5CnRvIHBva2UgYXQgaXQuCgpUaGFua3MsCgpKb25hdGhhbgoK
PiAtLS0KPiAgZHJpdmVycy9paW8vYWRjL3N0bXBlLWFkYy5jIHwgMTMgKysrKysrKy0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMv
c3RtcGUtYWRjLmMKPiBpbmRleCBkMmQ0MDUzODg0OTkuLjAyMDg3ODlmYzBmNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMKPiArKysgYi9kcml2ZXJzL2lpby9hZGMv
c3RtcGUtYWRjLmMKPiBAQCAtMzQ1LDIxICszNDUsMjIgQEAgc3RhdGljIGludCBfX21heWJlX3Vu
dXNlZCBzdG1wZV9hZGNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCj4gIHN0YXRpYyBT
SU1QTEVfREVWX1BNX09QUyhzdG1wZV9hZGNfcG1fb3BzLCBOVUxMLCBzdG1wZV9hZGNfcmVzdW1l
KTsKPiAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN0bXBlX2FkY19pZHNb
XSA9IHsKPiArCXsgLmNvbXBhdGlibGUgPSAic3Qsc3RtcGUtYWRjIiwgfSwKPiArCXsgfSwKPiAr
fTsKPiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc3RtcGVfYWRjX2lkcyk7Cj4gKwo+ICBzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzdG1wZV9hZGNfZHJpdmVyID0gewo+ICAJLnByb2Jl
CQk9IHN0bXBlX2FkY19wcm9iZSwKPiAgCS5kcml2ZXIJCT0gewo+ICAJCS5uYW1lCT0gInN0bXBl
LWFkYyIsCj4gIAkJLnBtCT0gJnN0bXBlX2FkY19wbV9vcHMsCj4gKwkJLm9mX21hdGNoX3RhYmxl
ID0gc3RtcGVfYWRjX2lkcywKPiAgCX0sCj4gIH07Cj4gIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIo
c3RtcGVfYWRjX2RyaXZlcik7Cj4gIAo+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBzdG1wZV9hZGNfaWRzW10gPSB7Cj4gLQl7IC5jb21wYXRpYmxlID0gInN0LHN0bXBlLWFkYyIs
IH0sCj4gLQl7IH0sCj4gLX07Cj4gLU1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHN0bXBlX2FkY19p
ZHMpOwo+IC0KPiAgTU9EVUxFX0FVVEhPUigiU3RlZmFuIEFnbmVyIDxzdGVmYW4uYWduZXJAdG9y
YWRleC5jb20+Iik7Cj4gIE1PRFVMRV9ERVNDUklQVElPTigiU1RNUEVYWFggQURDIGRyaXZlciIp
Owo+ICBNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
