Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD0976EA2E
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Aug 2023 15:26:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2071EC6A5F2;
	Thu,  3 Aug 2023 13:26:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35561C6904B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Aug 2023 13:26:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 373CUaUd005319; Thu, 3 Aug 2023 15:26:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=769HHGAF/6gRexcMz7wlX14yHSAscue5CPjDxlCcFNs=; b=EX
 0N59efnCEKZ2fu5sSysVtXhkt6Iyu1sZKmkXgPpL4tbmhJwuHQTdKv1KTptbDSzx
 HznLDiFipuLOnp55ODSo5vEgoaUOYd7HILQBNa8yatnDehNiAbZN/zKJdFLTBDAe
 kAj4BviRVWpCT8OJYLtpyl0I0Vk/9NrIyVkwoLwSOwriO7X3Zo94pSbzAcPjeeQo
 U+wxRIG8nPWq+J3sGJlEF/V0xICP6EMoRvfd6Bg0lVgJJRSU7jpySh50WY5Z5nkN
 Wi9RMe7iCKo9PWXmnGAVU2DzHAQOrb+Ig+ug8mbKORDe9KIK0lK6XoNlS0mGZMwt
 3jBi0d3pLALgEvq3LM6A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s85xr33bb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Aug 2023 15:26:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D6BC2100089;
 Thu,  3 Aug 2023 15:26:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BD983222C9D;
 Thu,  3 Aug 2023 15:26:27 +0200 (CEST)
Received: from [10.201.20.168] (10.201.20.168) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 3 Aug
 2023 15:26:27 +0200
Message-ID: <6047bf29-14c0-c06f-3161-09e89a992b41@foss.st.com>
Date: Thu, 3 Aug 2023 15:26:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230620104349.834687-1-valentin.caron@foss.st.com>
 <40b91e5a-0b25-c5e3-66f1-70e1d12f661c@foss.st.com>
Content-Language: en-US
From: Valentin CARON <valentin.caron@foss.st.com>
In-Reply-To: <40b91e5a-0b25-c5e3-66f1-70e1d12f661c@foss.st.com>
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_12,2023-08-03_01,2023-05-22_02
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: set default gpio line
 names using pin names
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

SGkgTGludXMsCgpJcyB0aGUgQWNrZWQtYnkgZnJvbSBBbGV4YW5kcmUgZW5vdWdoID8KCkhlIGlz
IG1haW50YWluZXIgb2YgYXJtL3N0bTMyIGFyY2hpdGVjdHVyZS4KClRoYW5rcywKVmFsZW50aW4K
Ck9uIDYvMjEvMjMgMTA6MTgsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkKPgo+IE9uIDYv
MjAvMjMgMTI6NDMsIFZhbGVudGluIENhcm9uIHdyb3RlOgo+PiBBZGQgc3RtMzJfcGN0cmxfZ2V0
X2Rlc2NfcGluX2Zyb21fZ3BpbyBmdW5jdGlvbiB0byBmaW5kIGEgc3RtMzIgcGluCj4+IGRlc2Ny
aXB0b3Igd2hpY2ggaXMgbWF0Y2hpbmcgd2l0aCBhIGdwaW8uCj4+IE1vc3Qgb2YgdGhlIHRpbWUg
cGluIG51bWJlciBpcyBlcXVhbCB0byBwaW4gaW5kZXggaW4gYXJyYXkuIFNvIHRoZSBmaXJzdAo+
PiBwYXJ0IG9mIHRoZSBmdW5jdGlvbiBpcyB1c2VmdWwgdG8gc3BlZWQgdXAuCj4+Cj4+IEFuZCBk
dXJpbmcgZ3BpbyBiYW5rIHJlZ2lzdGVyLCB3ZSBzZXQgZGVmYXVsdCBncGlvIG5hbWVzIHdpdGgg
cGluIG5hbWVzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBWYWxlbnRpbiBDYXJvbiA8dmFsZW50aW4u
Y2Fyb25AZm9zcy5zdC5jb20+Cj4+IC0tLQo+Cj4gQWNrZWQtYnk6IEFsZXhhbmRyZSBUT1JHVUUg
PGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4KPj4gwqAgZHJpdmVycy9waW5jdHJsL3N0
bTMyL3BpbmN0cmwtc3RtMzIuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYyAKPj4gYi9kcml2ZXJzL3BpbmN0cmwv
c3RtMzIvcGluY3RybC1zdG0zMi5jCj4+IGluZGV4IDRiOTdiZDAwMTkxYi4uZWVkYmI5Yjk3YTY1
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jCj4+
ICsrKyBiL2RyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLmMKPj4gQEAgLTEyNzUs
NiArMTI3NSwyOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBpbmNvbmZfb3BzIAo+PiBzdG0zMl9w
Y29uZl9vcHMgPSB7Cj4+IMKgwqDCoMKgwqAgLnBpbl9jb25maWdfZGJnX3Nob3fCoMKgwqAgPSBz
dG0zMl9wY29uZl9kYmdfc2hvdywKPj4gwqAgfTsKPj4gwqAgK3N0YXRpYyBzdHJ1Y3Qgc3RtMzJf
ZGVzY19waW4gCj4+ICpzdG0zMl9wY3RybF9nZXRfZGVzY19waW5fZnJvbV9ncGlvKHN0cnVjdCBz
dG0zMl9waW5jdHJsICpwY3RsLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc3RtMzJfZ3Bpb19iYW5rICpi
YW5rLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQo+PiArewo+PiArwqDCoMKgIHVu
c2lnbmVkIGludCBzdG0zMl9waW5fbmIgPSBiYW5rLT5iYW5rX25yICogCj4+IFNUTTMyX0dQSU9f
UElOU19QRVJfQkFOSyArIG9mZnNldDsKPj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtMzJfZGVzY19waW4g
KnBpbl9kZXNjOwo+PiArwqDCoMKgIGludCBpOwo+PiArCj4+ICvCoMKgwqAgLyogV2l0aCBmZXcg
ZXhjZXB0aW9ucyAoZS5nLiBiYW5rICdaJyksIHBpbiBudW1iZXIgbWF0Y2hlcyB3aXRoIAo+PiBw
aW4gaW5kZXggaW4gYXJyYXkgKi8KPj4gK8KgwqDCoCBwaW5fZGVzYyA9IHBjdGwtPnBpbnMgKyBz
dG0zMl9waW5fbmI7Cj4+ICvCoMKgwqAgaWYgKHBpbl9kZXNjLT5waW4ubnVtYmVyID09IHN0bTMy
X3Bpbl9uYikKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBwaW5fZGVzYzsKPj4gKwo+PiArwqDC
oMKgIC8qIE90aGVyd2lzZSwgbG9vcCBhbGwgYXJyYXkgdG8gZmluZCB0aGUgcGluIHdpdGggdGhl
IHJpZ2h0IAo+PiBudW1iZXIgKi8KPj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgcGN0bC0+bnBp
bnM7IGkrKykgewo+PiArwqDCoMKgwqDCoMKgwqAgcGluX2Rlc2MgPSBwY3RsLT5waW5zICsgaTsK
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChwaW5fZGVzYy0+cGluLm51bWJlciA9PSBzdG0zMl9waW5f
bmIpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBwaW5fZGVzYzsKPj4gK8KgwqDC
oCB9Cj4+ICvCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+ICt9Cj4+ICsKPj4gwqAgc3RhdGljIGludCBz
dG0zMl9ncGlvbGliX3JlZ2lzdGVyX2Jhbmsoc3RydWN0IHN0bTMyX3BpbmN0cmwgKnBjdGwsIAo+
PiBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqZndub2RlKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IHN0bTMyX2dwaW9fYmFuayAqYmFuayA9ICZwY3RsLT5iYW5rc1twY3RsLT5uYmFua3NdOwo+
PiBAQCAtMTI4NSw2ICsxMzA3LDggQEAgc3RhdGljIGludCBzdG0zMl9ncGlvbGliX3JlZ2lzdGVy
X2Jhbmsoc3RydWN0IAo+PiBzdG0zMl9waW5jdHJsICpwY3RsLCBzdHJ1Y3QgZndub2RlCj4+IMKg
wqDCoMKgwqAgc3RydWN0IHJlc291cmNlIHJlczsKPj4gwqDCoMKgwqDCoCBpbnQgbnBpbnMgPSBT
VE0zMl9HUElPX1BJTlNfUEVSX0JBTks7Cj4+IMKgwqDCoMKgwqAgaW50IGJhbmtfbnIsIGVyciwg
aSA9IDA7Cj4+ICvCoMKgwqAgc3RydWN0IHN0bTMyX2Rlc2NfcGluICpzdG0zMl9waW47Cj4+ICvC
oMKgwqAgY2hhciAqKm5hbWVzOwo+PiDCoCDCoMKgwqDCoMKgIGlmICghSVNfRVJSKGJhbmstPnJz
dGMpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVzZXRfY29udHJvbF9kZWFzc2VydChiYW5rLT5y
c3RjKTsKPj4gQEAgLTEzNTQsNiArMTM3OCwxNyBAQCBzdGF0aWMgaW50IHN0bTMyX2dwaW9saWJf
cmVnaXN0ZXJfYmFuayhzdHJ1Y3QgCj4+IHN0bTMyX3BpbmN0cmwgKnBjdGwsIHN0cnVjdCBmd25v
ZGUKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvCoMKgwqAg
bmFtZXMgPSBkZXZtX2tjYWxsb2MoZGV2LCBucGlucywgc2l6ZW9mKGNoYXIgKiksIEdGUF9LRVJO
RUwpOwo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBucGluczsgaSsrKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBzdG0zMl9waW4gPSBzdG0zMl9wY3RybF9nZXRfZGVzY19waW5fZnJvbV9ncGlvKHBj
dGwsIGJhbmssIGkpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHN0bTMyX3BpbiAmJiBzdG0zMl9w
aW4tPnBpbi5uYW1lKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1lc1tpXSA9IGRldm1f
a2FzcHJpbnRmKGRldiwgR0ZQX0tFUk5FTCwgIiVzIiwgCj4+IHN0bTMyX3Bpbi0+cGluLm5hbWUp
Owo+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYW1l
c1tpXSA9IE5VTEw7Cj4+ICvCoMKgwqAgfQo+PiArCj4+ICvCoMKgwqAgYmFuay0+Z3Bpb19jaGlw
Lm5hbWVzID0gKGNvbnN0IGNoYXIgKiBjb25zdCAqKW5hbWVzOwo+PiArCj4+IMKgwqDCoMKgwqAg
ZXJyID0gZ3Bpb2NoaXBfYWRkX2RhdGEoJmJhbmstPmdwaW9fY2hpcCwgYmFuayk7Cj4+IMKgwqDC
oMKgwqAgaWYgKGVycikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWls
ZWQgdG8gYWRkIGdwaW9jaGlwKCVkKSFcbiIsIGJhbmtfbnIpOwo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
