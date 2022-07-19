Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFDE557A30F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Jul 2022 17:31:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EA71C640F6;
	Tue, 19 Jul 2022 15:31:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF540C640F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Jul 2022 15:31:09 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26JFS1Ep030938;
 Tue, 19 Jul 2022 17:30:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=StPFKjyHQ6JloIb+PfGZXvKA/3ATMA/f8rEmiAG937w=;
 b=fl6q9Zf+v/AGGlfuFTPXasDWrUhSoE+j6VgYcJmn8GCP3tz/2iou1Mw3mKkIa6Kl1VxS
 WeWnvZGlik7J44IVqyNa9PHq8EV7bkWVH5twzT40Y5Rp4Umi5NBx0IYfrzLS0gX67RK/
 pqVlJz41MvN+PceULVZUX/XjEw7zQkjzw+KwYnmhYV4iVTkoUpLPWbZ3WkchwCbxBno/
 mPg/1jSvG9W0kQ87qzMdevuAoiCu/6EmLnXXrTmvTng5EO0FglMqVZ51T15ShWsNK70a
 Zt/Tk91EGKuJPPiWwBlAbx/1ZWETI9PgkgFuIIDK5oF3SOCMWEqzZFUGfv+56ukcx+zl 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3hbnhy0kkf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jul 2022 17:30:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 655F510002A;
 Tue, 19 Jul 2022 17:30:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 45BDD22AFE7;
 Tue, 19 Jul 2022 17:30:54 +0200 (CEST)
Received: from [10.201.20.208] (10.75.127.45) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 19 Jul
 2022 17:30:50 +0200
Message-ID: <d46e5eee-c8ae-545f-e69e-1dd2f2e71323@foss.st.com>
Date: Tue, 19 Jul 2022 17:30:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Jonathan Corbet <corbet@lwn.net>, Vinod Koul
 <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
References: <20220713142148.239253-1-amelie.delaunay@foss.st.com>
 <20220713142148.239253-4-amelie.delaunay@foss.st.com>
 <e1fbf7cf-1bb7-6583-3713-7dbd58a4898e@denx.de>
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <e1fbf7cf-1bb7-6583-3713-7dbd58a4898e@denx.de>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-19_04,2022-07-19_01,2022-06-22_01
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 3/4] dmaengine: stm32-dma: add support
 to trigger STM32 MDMA
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

SGkgTWFyZWssCgpUaGFua3MgZm9yIHJldmlld2luZy4KCk9uIDcvMTQvMjIgMjE6MDIsIE1hcmVr
IFZhc3V0IHdyb3RlOgo+IE9uIDcvMTMvMjIgMTY6MjEsIEFtZWxpZSBEZWxhdW5heSB3cm90ZToK
PiAKPiBbLi4uXQo+IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEvc3RtMzItZG1hLmMgYi9k
cml2ZXJzL2RtYS9zdG0zMi1kbWEuYwo+PiBpbmRleCBhZGIyNWExMWM3MGYuLjM5MTYyOTVmZTE1
NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9kbWEvc3RtMzItZG1hLmMKPj4gKysrIGIvZHJpdmVy
cy9kbWEvc3RtMzItZG1hLmMKPj4gQEAgLTE0Miw2ICsxNDIsOCBAQAo+PiDCoCAjZGVmaW5lIFNU
TTMyX0RNQV9ESVJFQ1RfTU9ERV9HRVQobinCoMKgwqAgKCgobikgJiAKPj4gU1RNMzJfRE1BX0RJ
UkVDVF9NT0RFX01BU0spID4+IDIpCj4+IMKgICNkZWZpbmUgU1RNMzJfRE1BX0FMVF9BQ0tfTU9E
RV9NQVNLwqDCoMKgIEJJVCg0KQo+PiDCoCAjZGVmaW5lIFNUTTMyX0RNQV9BTFRfQUNLX01PREVf
R0VUKG4pwqDCoMKgICgoKG4pICYgCj4+IFNUTTMyX0RNQV9BTFRfQUNLX01PREVfTUFTSykgPj4g
NCkKPj4gKyNkZWZpbmUgU1RNMzJfRE1BX01ETUFfU1RSRUFNX0lEX01BU0vCoMKgwqAgR0VOTUFT
SygxOSwgMTYpCj4+ICsjZGVmaW5lIFNUTTMyX0RNQV9NRE1BX1NUUkVBTV9JRF9HRVQobikgKCgo
bikgJiAKPj4gU1RNMzJfRE1BX01ETUFfU1RSRUFNX0lEX01BU0spID4+IDE2KQo+IAo+IFRyeSBG
SUVMRF9HRVQoKSBmcm9tIGluY2x1ZGUvbGludXgvYml0ZmllbGQuaAo+IAo+IFsuLi5dCj4gCgpZ
ZXMsIGJ1dCBub3Qgb25seSBvbiB0aGlzIG5ldyBsaW5lLiBJJ2xsIGFkZCBhIHByaW9yIHBhdGNo
IHRvIHRoZSAKcGF0Y2hzZXQgdG8gdXNlIEZJRUxEX3tHRVQsUFJFUH0oKSBoZWxwZXJzIGV2ZXJ5
IHdoZXJlIGN1c3RvbSBtYWNyb3MgYXJlIAp1c2VkLgoKPj4gQEAgLTE2MzAsNiArMTY3MCwyMCBA
QCBzdGF0aWMgaW50IHN0bTMyX2RtYV9wcm9iZShzdHJ1Y3QgCj4+IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNoYW4tPmlkID0gaTsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGNoYW4tPnZjaGFuLmRlc2NfZnJlZSA9IHN0bTMyX2RtYV9kZXNjX2ZyZWU7Cj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCB2Y2hhbl9pbml0KCZjaGFuLT52Y2hhbiwgZGQpOwo+PiArCj4+ICvC
oMKgwqDCoMKgwqDCoCBjaGFuLT5tZG1hX2NvbmZpZy5pZmNyID0gcmVzLT5zdGFydDsKPj4gK8Kg
wqDCoMKgwqDCoMKgIGNoYW4tPm1kbWFfY29uZmlnLmlmY3IgKz0gKGNoYW4tPmlkICYgNCkgPyBT
VE0zMl9ETUFfSElGQ1IgOiAKPj4gU1RNMzJfRE1BX0xJRkNSOwo+PiArCj4+ICvCoMKgwqDCoMKg
wqDCoCBjaGFuLT5tZG1hX2NvbmZpZy50Y2YgPSBTVE0zMl9ETUFfVENJOwo+PiArwqDCoMKgwqDC
oMKgwqAgLyoKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBiaXQwIG9mIGNoYW4tPmlkIHJlcHJlc2Vu
dHMgdGhlIG5lZWQgdG8gbGVmdCBzaGlmdCBieSA2Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogYml0
MSBvZiBjaGFuLT5pZCByZXByZXNlbnRzIHRoZSBuZWVkIHRvIGV4dHJhIGxlZnQgc2hpZnQgCj4+
IGJ5IDE2Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogVENJRjAsIGNoYW4tPmlkID0gYjAwMDA7IFRD
SUY0LCBjaGFuLT5pZCA9IGIwMTAwOiBsZWZ0IAo+PiBzaGlmdCBieSAwKjYgKyAwKjE2Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogVENJRjEsIGNoYW4tPmlkID0gYjAwMDE7IFRDSUY1LCBjaGFuLT5p
ZCA9IGIwMTAxOiBsZWZ0IAo+PiBzaGlmdCBieSAxKjYgKyAwKjE2Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogVENJRjIsIGNoYW4tPmlkID0gYjAwMTA7IFRDSUY2LCBjaGFuLT5pZCA9IGIwMTEwOiBs
ZWZ0IAo+PiBzaGlmdCBieSAwKjYgKyAxKjE2Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogVENJRjMs
IGNoYW4tPmlkID0gYjAwMTE7IFRDSUY3LCBjaGFuLT5pZCA9IGIwMTExOiBsZWZ0IAo+PiBzaGlm
dCBieSAxKjYgKyAxKjE2Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+ICvCoMKgwqDCoMKgwqDC
oCBjaGFuLT5tZG1hX2NvbmZpZy50Y2YgPDw9ICg2ICogKGNoYW4tPmlkICYgMHgxKSArIDE2ICog
Cj4+ICgoY2hhbi0+aWQgJiAweDIpID4+IDEpKTsKPiAKPiBTb21lIHNvcnQgb2Ygc3ltYm9saWMg
bWFjcm9zIGluc3RlYWQgb2Ygb3Blbi1jb2RlZCBjb25zdGFudHMgY291bGQgaGVscCAKPiByZWFk
YWJpbGl0eSBoZXJlLgo+IAoKSSBhZ3JlZS4gQXMgdGhlIHNhbWUga2luZCBvZiBjb21wdXRhdGlv
biBpcyBkb25lIGluIApzdG0zMl9kbWFfaXJxX3N0YXR1cygpIGFuZCBzdG0zMl9kbWFfaXJxX2Ns
ZWFyKCksIEknbGwgYWRkIGFub3RoZXIgcHJpb3IgCnBhdGNoIHRvIHRoZSBwYXRjaHNldCB0byBp
bnRyb2R1Y2UgbmV3IG1hY3JvIGhlbHBlcnMgdG8gZ2V0IElTUi9JRkNSIApvZmZzZXQgZGVwZW5k
aW5nIG9uIGNoYW5uZWwgaWQsIGFuZCB0byBnZXQgY2hhbm5lbCBmbGFncyBtYXNrIGRlcGVuZGlu
ZyAKb24gY2hhbm5lbCBpZC4KCj4gWy4uLl0KClJlZ2FyZHMsCkFtZWxpZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
