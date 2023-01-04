Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A961D65D39E
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Jan 2023 14:02:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58F84C69066;
	Wed,  4 Jan 2023 13:02:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7657C69064
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Jan 2023 13:02:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 304BSjNk022820; Wed, 4 Jan 2023 14:02:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hgiH8ltvo3OuQOLuGkA7ONnzC2YMWMCv1OtKzJek1ws=;
 b=6bsxQLK2yftNt0pXES8+NJ6SrqExZsfawwjh1CsuiLRABNICsHIOWX3fZKSlNrgzGSbK
 b8qFBdDz6c/5r+YuFe7RQe69XgkFIQPpkbmz6cUVSsg5eGyV/sRBwv321KqnD2JBmyw1
 oTXxS5v2uaL2Zoo4YiTo6r/a2kCyfVjZrF7r2sLyRSPmtkpkPx5FcyHMwhbRYodsZvhU
 pRyD1NF9httxSODfZxO61uXUEslqajhOvv8YO0AG/uoXwXcAdXxfuMisM8ilXdPirFkm
 WWxst5NNeKzTRsVbDzwucHl75y3CULL8Fwh1IupMteVPZYUGiFFi72kzK9nfL/t32aYv 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mtda6apaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 04 Jan 2023 14:02:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE27710002A;
 Wed,  4 Jan 2023 14:02:24 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D80C521D387;
 Wed,  4 Jan 2023 14:02:24 +0100 (CET)
Received: from [10.48.0.157] (10.48.0.157) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 4 Jan
 2023 14:02:21 +0100
Message-ID: <5d7dac5f-2a39-316f-2123-fe2e7808eec0@foss.st.com>
Date: Wed, 4 Jan 2023 14:02:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Etienne Carriere <etienne.carriere@linaro.org>
References: <20230103140521.187678-1-patrick.delaunay@foss.st.com>
 <20230103150515.v4.3.I59210046e368cfc22bd3cca2afe1653674f8ece8@changeid>
 <CAN5uoS-dXLSs9DiJFBTAOJbPZPp4BUfxqZ7ND_irzBbUEwaUHg@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <CAN5uoS-dXLSs9DiJFBTAOJbPZPp4BUfxqZ7ND_irzBbUEwaUHg@mail.gmail.com>
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
Cc: linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 3/3] nvmem: stm32: detect bsec pta
 presence for STM32MP15x
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

SGksCgpPbiAxLzQvMjMgMTA6MzAsIEV0aWVubmUgQ2FycmllcmUgd3JvdGU6Cj4gSGkgUGF0cmlj
aywKPgo+IE9uIFR1ZSwgMyBKYW4gMjAyMyBhdCAxNTowOCwgUGF0cmljayBEZWxhdW5heQo+IDxw
YXRyaWNrLmRlbGF1bmF5QGZvc3Muc3QuY29tPiB3cm90ZToKPj4gT24gU1RNMzJNUDE1eCBTb0Ms
IHRoZSBTTUMgYmFja2VuZCBpcyBvcHRpb25hbCB3aGVuIE9QLVRFRSBpcyB1c2VkOwo+PiB0aGUg
UFRBIEJTRUMgc2hvdWxkIGJlIHVzZWQgYXMgaXQgaXMgZG9uZSBvbiBTVE0zMk1QMTN4IHBsYXRm
b3JtLAo+PiBidXQgdGhlIEJTRUMgU01DIGNhbiBiZSBhbHNvIHVzZWQ6IGl0IGlzIGEgbGVnYWN5
IG1vZGUgaW4gT1AtVEVFLAo+PiBub3QgcmVjb21tZW5kZWQgYnV0IHVzZWQgaW4gcHJldmlvdXMg
T1AtVEVFIGZpcm13YXJlLgo+Pgo+PiBUaGUgcHJlc2VuY2Ugb2YgT1AtVEVFIGlzIGR5bmFtaWNh
bGx5IGRldGVjdGVkIGluIFNUTTMyTVAxNXggZGV2aWNlIHRyZWUKPj4gYW5kIHRoZSBzdXBwb3J0
ZWQgTlZNRU0gYmFja2VuZCBpcyBkeW5hbWljYWxseSBkZXRlY3RlZDoKPj4gLSBQVEEgd2l0aCBz
dG0zMl9ic2VjX3B0YV9maW5kCj4+IC0gU01DIHdpdGggc3RtMzJfYnNlY19jaGVjawo+Pgo+PiBX
aXRoIE9QLVRFRSBidXQgd2l0aG91dCBQVEEgYW5kIFNNQyBkZXRlY3Rpb24sIHRoZSBwcm9iZSBp
cyBkZWZlcnJlZCBmb3IKPj4gU1RNMzJNUDE1eCBkZXZpY2VzLgo+Pgo+PiBPbiBTVE0zMk1QMTN4
IHBsYXRmb3JtLCBvbmx5IHRoZSBQVEEgaXMgc3VwcG9ydGVkIHdpdGggY2ZnLT50YSA9IHRydWUK
Pj4gYW5kIHRoaXMgZGV0ZWN0aW9uIGlzIHNraXBwZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBh
dHJpY2sgRGVsYXVuYXkgPHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+
PiAobm8gY2hhbmdlcyBzaW5jZSB2MykKPj4KPj4gQ2hhbmdlcyBpbiB2MzoKPj4gLSB1c2Ugb2Zf
ZmluZF9jb21wYXRpYmxlX25vZGUgaW4gb3B0ZWVfcHJlc2VuY2VfY2hlY2sgZnVuY3Rpb24KPj4g
ICAgaW5zdGVhZCBvZiBvZl9maW5kX25vZGVfYnlfcGF0aCgiL2Zpcm13YXJlL29wdGVlIikKPj4K
Pj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBBZGRlZCBwYXRjaCBpbiB0aGUgc2VyaWUgZm9yIEJTRUMg
UFRBIHN1cHBvcnQgb24gU1RNMzJNUDE1eAo+PiAgICB3aXRoIGR5bmFtaWMgZGV0ZWN0aW9uIG9m
IE9QLVRFRSBwcmVzZW5jZSBhbmQgU01DIHN1cHBvcnQgKGxlZ2FjeSBtb2RlKQo+Pgo+PiAgIGRy
aXZlcnMvbnZtZW0vc3RtMzItcm9tZW0uYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lbS9zdG0zMi1yb21lbS5jIGIvZHJp
dmVycy9udm1lbS9zdG0zMi1yb21lbS5jCj4+IGluZGV4IDJlZGM2MTkyNWU1Mi4uMWI5MGM3ODMw
MWZhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL252bWVtL3N0bTMyLXJvbWVtLmMKPj4gKysrIGIv
ZHJpdmVycy9udm1lbS9zdG0zMi1yb21lbS5jCj4+IEBAIC0xNTksNiArMTU5LDMxIEBAIHN0YXRp
YyBpbnQgc3RtMzJfYnNlY19wdGFfd3JpdGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQgaW50IG9m
ZnNldCwgdm9pZCAqYnVmLAo+PiAgICAgICAgICByZXR1cm4gc3RtMzJfYnNlY19vcHRlZV90YV93
cml0ZShwcml2LT5jdHgsIHByaXYtPmxvd2VyLCBvZmZzZXQsIGJ1ZiwgYnl0ZXMpOwo+PiAgIH0K
Pj4KPj4gK3N0YXRpYyBib29sIHN0bTMyX2JzZWNfc21jX2NoZWNrKHZvaWQpCj4+ICt7Cj4+ICsg
ICAgICAgdTMyIHZhbDsKPj4gKyAgICAgICBpbnQgcmV0Owo+PiArCj4+ICsgICAgICAgLyogY2hl
Y2sgdGhhdCB0aGUgT1AtVEVFIHN1cHBvcnQgdGhlIEJTRUMgU01DIChsZWdhY3kgbW9kZSkgKi8K
Pj4gKyAgICAgICByZXQgPSBzdG0zMl9ic2VjX3NtYyhTVE0zMl9TTUNfUkVBRF9TSEFET1csIDAs
IDAsICZ2YWwpOwo+PiArCj4+ICsgICAgICAgcmV0dXJuICFyZXQ7Cj4+ICt9Cj4+ICsKPj4gK3N0
YXRpYyBib29sIG9wdGVlX3ByZXNlbmNlX2NoZWNrKHZvaWQpCj4+ICt7Cj4+ICsgICAgICAgc3Ry
dWN0IGRldmljZV9ub2RlICpucDsKPj4gKyAgICAgICBib29sIHRlZV9kZXRlY3RlZCA9IGZhbHNl
Owo+PiArCj4+ICsgICAgICAgLyogY2hlY2sgdGhhdCB0aGUgT1AtVEVFIG5vZGUgaXMgcHJlc2Vu
dCBhbmQgYXZhaWxhYmxlLiAqLwo+PiArICAgICAgIG5wID0gb2ZfZmluZF9jb21wYXRpYmxlX25v
ZGUoTlVMTCwgTlVMTCwgImxpbmFybyxvcHRlZS10eiIpOwo+PiArICAgICAgIGlmIChucCAmJiBv
Zl9kZXZpY2VfaXNfYXZhaWxhYmxlKG5wKSkKPj4gKyAgICAgICAgICAgICAgIHRlZV9kZXRlY3Rl
ZCA9IHRydWU7Cj4+ICsgICAgICAgb2Zfbm9kZV9wdXQobnApOwo+PiArCj4+ICsgICAgICAgcmV0
dXJuIHRlZV9kZXRlY3RlZDsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBpbnQgc3RtMzJfcm9tZW1f
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICB7Cj4+ICAgICAgICAgIGNv
bnN0IHN0cnVjdCBzdG0zMl9yb21lbV9jZmcgKmNmZzsKPj4gQEAgLTE5NSwxMCArMjIwLDE0IEBA
IHN0YXRpYyBpbnQgc3RtMzJfcm9tZW1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPj4gICAgICAgICAgfSBlbHNlIHsKPj4gICAgICAgICAgICAgICAgICBwcml2LT5jZmcuc2l6
ZSA9IGNmZy0+c2l6ZTsKPj4gICAgICAgICAgICAgICAgICBwcml2LT5sb3dlciA9IGNmZy0+bG93
ZXI7Cj4+IC0gICAgICAgICAgICAgICBpZiAoY2ZnLT50YSkgewo+PiArICAgICAgICAgICAgICAg
aWYgKGNmZy0+dGEgfHwgb3B0ZWVfcHJlc2VuY2VfY2hlY2soKSkgewo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmMgPSBzdG0zMl9ic2VjX29wdGVlX3RhX29wZW4oJnByaXYtPmN0eCk7Cj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiB3YWl0IGZvciBPUC1URUUgY2xpZW50IGRyaXZl
ciB0byBiZSB1cCBhbmQgcmVhZHkgKi8KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJj
KQo+PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocmMgPT0gLUVQUk9CRV9ERUZFUikgewo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEJTRUMgUFRBIGlzIHJlcXVpcmVk
IG9yIFNNQyBub3QgcmVhZHkgKi8KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoY2ZnLT50YSB8fCAhc3RtMzJfYnNlY19zbWNfY2hlY2soKSkKPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICB9IGVsc2UgaWYgKHJjKQo+IENvdWxkIHlvdSBmaXggdGhlIGxvZ2lj
PyBUaGUgc2VxdWVuY2UgaGVyZSBmYWlscyB0byBmYWxsYmFjayB0byBCU0VDCj4gU01DIHNlcnZp
Y2UgaWYgb3B0ZWUgZG9lcyBub3QgZW1iZWQgQlNFQyBQVEEgc2VydmljZSBhbmQgb3B0ZWUgZHJp
dmVyCj4gaXMgcHJvYmVkIGJlZm9yZSBzdG0zMl9yb21lbS4KCgpZZXMsIEkgd2lsbCBtb2RpZnkg
aXQuLi4KCgpteSBwYXRjaCBpcyB3b3JraW5nIG9ubHkgaWYgT1AtVEVFIGlzIHByb2JlZCBhZnRl
ciBCU0VDIE5WTUVNIHdoZW4gUkMgPSAKZGVmZXJlZAoKCnN0bTMyX2JzZWNfc21jX2NoZWNrKCkg
aXPCoCBub3QgY2FsbGVkIHRoZSBPUC1URUUgaXMgYWxyZWFkeSBwb3JiZWQKCihub3QgZGVmZXJy
ZWQpIGJ1dCBUQSBpcyBub3QgaW50ZWdyYXRlZAoKCj4KPiBCciwKPiBldGllbm5lCj4KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmMgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LCBzdG0zMl9ic2Vj
X29wdGVlX3RhX2Nsb3NlLCBwcml2LT5jdHgpOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHJjKSB7Cj4+IC0tCj4+IDIuMjUuMQo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
