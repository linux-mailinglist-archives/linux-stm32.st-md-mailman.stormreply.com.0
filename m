Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D45778C74DD
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 12:55:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8230FC6C83A;
	Thu, 16 May 2024 10:55:32 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2EF20C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 10:55:26 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 31B3188080;
 Thu, 16 May 2024 12:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715856925;
 bh=BGm4j+MAQe7qfEJLKK5z2ee+wgmO36NawXxM+a6a8nA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=xsKg0yQDBLIMUsiKakUMaV7SAhce4/DrXzOWuX+f3NJe7msr2rsA9OeJwSeHn9zcf
 8cFO/1nGDh/1GdgADV3RN7zE2dKFrGXNthYMFOGKiIQiCNmLIwwATB9UbYT0NbvEUg
 tDLdWhudVfW0H+IM+iS2jzBLdv3ZGc3ZlzGn8jx0S1fgkKhlEh3qTXJl9PyMoGosNz
 /r8c91iE7TIVSDyJPU2JJrR6FV1v7e5R14hblgF+fdR4V1Focki0H0WsaOQ17ZmqCT
 JRh41rX/rpdImixcgoxn+oI8jKE9sQD8kqVpDhEa4QEBF5YSnrNFcak7Fh7dUqf7El
 VtZP4nhnb3j7A==
Message-ID: <404122b2-75fe-4da6-8167-fb98eba7f941@denx.de>
Date: Thu, 16 May 2024 12:52:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 linux-crypto@vger.kernel.org
References: <20240516012210.128307-1-marex@denx.de>
 <20240516012210.128307-2-marex@denx.de>
 <1e2da893-efff-4f7c-9842-a9484e4c2230@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <1e2da893-efff-4f7c-9842-a9484e4c2230@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Yang Yingliang <yangyingliang@huawei.com>, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] hwrng: stm32 - cache device pointer
 in struct stm32_rng_private
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

T24gNS8xNi8yNCAxMTozNyBBTSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6CgpIaSwKCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jIAo+PiBiL2RyaXZl
cnMvY2hhci9od19yYW5kb20vc3RtMzItcm5nLmMKPj4gaW5kZXggNmRlYzRhZGM0OTg1My4uMDAw
MTJlNmU0Y2NjOCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9zdG0zMi1y
bmcuYwo+PiArKysgYi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL3N0bTMyLXJuZy5jCj4+IEBAIC03
MCw2ICs3MCw3IEBAIHN0cnVjdCBzdG0zMl9ybmdfY29uZmlnIHsKPj4gwqAgc3RydWN0IHN0bTMy
X3JuZ19wcml2YXRlIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaHdybmcgcm5nOwo+PiArwqDCoMKg
IHN0cnVjdCBkZXZpY2UgKmRldjsKPj4gwqDCoMKgwqDCoCB2b2lkIF9faW9tZW0gKmJhc2U7Cj4+
IMKgwqDCoMKgwqAgc3RydWN0IGNsayAqY2xrOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCByZXNldF9j
b250cm9sICpyc3Q7Cj4+IEBAIC05OSw3ICsxMDAsNyBAQCBzdHJ1Y3Qgc3RtMzJfcm5nX3ByaXZh
dGUgewo+PiDCoMKgICovCj4+IMKgIHN0YXRpYyBpbnQgc3RtMzJfcm5nX2NvbmNlYWxfc2VlZF9l
cnJvcl9jb25kX3Jlc2V0KHN0cnVjdCAKPj4gc3RtMzJfcm5nX3ByaXZhdGUgKnByaXYpCj4+IMKg
IHsKPj4gLcKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAoc3RydWN0IGRldmljZSAqKXByaXYt
PnJuZy5wcml2Owo+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9IHByaXYtPmRldjsKPj4g
wqDCoMKgwqDCoCB1MzIgc3IgPSByZWFkbF9yZWxheGVkKHByaXYtPmJhc2UgKyBSTkdfU1IpOwo+
PiDCoMKgwqDCoMKgIHUzMiBjciA9IHJlYWRsX3JlbGF4ZWQocHJpdi0+YmFzZSArIFJOR19DUik7
Cj4+IMKgwqDCoMKgwqAgaW50IGVycjsKPj4gQEAgLTE3MSw3ICsxNzIsNyBAQCBzdGF0aWMgaW50
IHN0bTMyX3JuZ19jb25jZWFsX3NlZWRfZXJyb3Ioc3RydWN0IAo+PiBod3JuZyAqcm5nKQo+PiDC
oCB7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHN0bTMyX3JuZ19wcml2YXRlICpwcml2ID0gY29udGFp
bmVyX29mKHJuZywgc3RydWN0IAo+PiBzdG0zMl9ybmdfcHJpdmF0ZSwgcm5nKTsKPj4gLcKgwqDC
oCBkZXZfZGJnKChzdHJ1Y3QgZGV2aWNlICopcHJpdi0+cm5nLnByaXYsICJDb25jZWFsaW5nIHNl
ZWQgZXJyb3JcbiIpOwo+PiArwqDCoMKgIGRldl9kYmcocHJpdi0+ZGV2LCAiQ29uY2VhbGluZyBz
ZWVkIGVycm9yXG4iKTsKPj4gwqDCoMKgwqDCoCBpZiAocHJpdi0+ZGF0YS0+aGFzX2NvbmRfcmVz
ZXQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gc3RtMzJfcm5nX2NvbmNlYWxfc2VlZF9l
cnJvcl9jb25kX3Jlc2V0KHByaXYpOwo+PiBAQCAtMTg3LDcgKzE4OCw3IEBAIHN0YXRpYyBpbnQg
c3RtMzJfcm5nX3JlYWQoc3RydWN0IGh3cm5nICpybmcsIHZvaWQgCj4+ICpkYXRhLCBzaXplX3Qg
bWF4LCBib29sIHdhaXQpCj4+IMKgwqDCoMKgwqAgaW50IHJldHZhbCA9IDAsIGVyciA9IDA7Cj4+
IMKgwqDCoMKgwqAgdTMyIHNyOwo+PiAtwqDCoMKgIHJldHZhbCA9IHBtX3J1bnRpbWVfcmVzdW1l
X2FuZF9nZXQoKHN0cnVjdCBkZXZpY2UgKilwcml2LT5ybmcucHJpdik7Cj4+ICvCoMKgwqAgcmV0
dmFsID0gcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldChwcml2LT5kZXYpOwo+PiDCoMKgwqDCoMKg
IGlmIChyZXR2YWwpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0dmFsOwo+PiBAQCAt
MjA2LDcgKzIwNyw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcm5nX3JlYWQoc3RydWN0IGh3cm5nICpy
bmcsIHZvaWQgCj4+ICpkYXRhLCBzaXplX3QgbWF4LCBib29sIHdhaXQpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzciwgc3IsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMCwgNTAwMDApOwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoZXJyKSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGV2X2Vycigoc3RydWN0IGRldmljZSAqKXByaXYtPnJuZy5wcml2LAo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIocHJpdi0+ZGV2LAo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIiVzOiB0aW1lb3V0ICV4IVxuIiwgX19m
dW5jX18sIHNyKTsKPiAKPiBOaXQ6IEZpdHMgaW4gb25lIGxpbmUKClRoZSBsaW1pdCBpcyBub3cg
MTAwIGluc3RlYWQgb2YgODAgY2hhcnMsIHJpZ2h0ID8KCmJ0dyBJIGZvdW5kIG9uZSBtb3JlIGFu
ZCBmaXhlZCBpdC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
