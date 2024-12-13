Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6732B9F0AC3
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 12:20:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 161C9C78006;
	Fri, 13 Dec 2024 11:20:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2263DC57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 11:20:05 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDAwDvD013489;
 Fri, 13 Dec 2024 12:19:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4mZdvhtRvGCfpQh2PJTw1zy782LwMEIbYoJwSZ47DZ8=; b=pWJbylCt/dHXMFLT
 nup21j37+Uh+cj5yPSAwz5H3m3pYQSkvrp6h4YN5trvJK91XoCD1GgF7KXpLE6Pp
 lY7BZpiNeETuSt0C9ZUCpPJqksMXw+F3keWTwlHto4XlzIPzg7vTANkA6uJl0+tE
 W+HFjVirm3thC15mnxOqbL/LlG7dQiUQ4HWa/jMR5pJ9y5Ld/v4n+9W5Rek10/g8
 ft256Ov1yLCBgsBTr8qf384ZxjJWFTdyNIOm1ybevxXTQRTH+rS+Ug2RUe3PRlq6
 XopHThXKsnJAMxbFj1Ury/iUMvboW36R39ueCQCCp+0K3GX6y2WTNDBG3eyoMpHW
 wJI+TQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ftj761y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 12:19:48 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C06D040047;
 Fri, 13 Dec 2024 12:18:22 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7F671264FE2;
 Fri, 13 Dec 2024 12:16:35 +0100 (CET)
Received: from [10.48.86.108] (10.48.86.108) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 13 Dec
 2024 12:16:34 +0100
Message-ID: <6d893831-7a2e-4a9a-a519-2e257e249f0f@foss.st.com>
Date: Fri, 13 Dec 2024 12:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mingwei Zheng <zmw12306@gmail.com>, <marex@denx.de>,
 <antonio.borneo@foss.st.com>
References: <20241213010948.2623382-1-zmw12306@gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20241213010948.2623382-1-zmw12306@gmail.com>
X-Originating-IP: [10.48.86.108]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: peng.fan@nxp.com, make24@iscas.ac.cn, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>, fabien.dessenne@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] pinctrl: stm32: Add check for
 clk_enable()
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

Ck9uIDEyLzEzLzI0IDAyOjA5LCBNaW5nd2VpIFpoZW5nIHdyb3RlOgo+IENvbnZlcnQgdGhlIGRy
aXZlciB0byBjbGtfYnVsayooKSBBUEkuCj4gQWRkIGNoZWNrIGZvciB0aGUgcmV0dXJuIHZhbHVl
IG9mIGNsa19idWxrX2VuYWJsZSgpIHRvIGNhdGNoCj4gdGhlIHBvdGVudGlhbCBlcnJvci4KPiAK
PiBGaXhlczogMDVkOGFmNDQ5ZDkzICgicGluY3RybDogc3RtMzI6IEtlZXAgcGluY3RybCBibG9j
ayBjbG9jayBlbmFibGVkIHdoZW4gTEVWRUwgSVJRIHJlcXVlc3RlZCIpCj4gU2lnbmVkLW9mZi1i
eTogTWluZ3dlaSBaaGVuZyA8em13MTIzMDZAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpp
YXNoZW5nIEppYW5nIDxqaWFzaGVuZ2ppYW5nY29vbEBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdl
bG9nOgo+IAo+IHYzIC0+IHY0Ogo+IDEuIEFkZCBpbml0aWFsaXphdGlvbiBmb3IgIHBjdGwtPmNs
a3MuCj4gMi4gQWRqdXN0IGFsaWdubWVudC4KPiAKPiB2MiAtPiB2MzoKPiAKPiAxLiBDb252ZXJ0
IGNsa19kaXNhYmxlX3VucHJlcGFyZSB0byBjbGtfYnVsa19kaXNhYmxlCj4gYW5kIGNsa19idWxr
X3VucHJlcGFyZS4KPiAKPiB2MSAtPiB2MjoKPiAKPiAxLiBNb3ZlIGludCByZXQgZGVjbGFyYXRp
b24gaW50byBpZiBibG9jay4KPiAtLS0KPiAgIGRyaXZlcnMvcGluY3RybC9zdG0zMi9waW5jdHJs
LXN0bTMyLmMgfCAzNyArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYyBiL2RyaXZlcnMvcGluY3RybC9z
dG0zMi9waW5jdHJsLXN0bTMyLmMKPiBpbmRleCA1YjdmYTc3YzExODQuLjQyNzc0OWQ0ZjZhNSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi5jCj4gKysr
IGIvZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzIuYwo+IEBAIC04Niw3ICs4Niw2
IEBAIHN0cnVjdCBzdG0zMl9waW5jdHJsX2dyb3VwIHsKPiAgIAo+ICAgc3RydWN0IHN0bTMyX2dw
aW9fYmFuayB7Cj4gICAJdm9pZCBfX2lvbWVtICpiYXNlOwo+IC0Jc3RydWN0IGNsayAqY2xrOwo+
ICAgCXN0cnVjdCByZXNldF9jb250cm9sICpyc3RjOwo+ICAgCXNwaW5sb2NrX3QgbG9jazsKPiAg
IAlzdHJ1Y3QgZ3Bpb19jaGlwIGdwaW9fY2hpcDsKPiBAQCAtMTA4LDYgKzEwNyw3IEBAIHN0cnVj
dCBzdG0zMl9waW5jdHJsIHsKPiAgIAl1bnNpZ25lZCBuZ3JvdXBzOwo+ICAgCWNvbnN0IGNoYXIg
KipncnBfbmFtZXM7Cj4gICAJc3RydWN0IHN0bTMyX2dwaW9fYmFuayAqYmFua3M7Cj4gKwlzdHJ1
Y3QgY2xrX2J1bGtfZGF0YSAqY2xrczsKPiAgIAl1bnNpZ25lZCBuYmFua3M7Cj4gICAJY29uc3Qg
c3RydWN0IHN0bTMyX3BpbmN0cmxfbWF0Y2hfZGF0YSAqbWF0Y2hfZGF0YTsKPiAgIAlzdHJ1Y3Qg
aXJxX2RvbWFpbgkqZG9tYWluOwo+IEBAIC0xMzA4LDcgKzEzMDgsNyBAQCBzdGF0aWMgaW50IHN0
bTMyX2dwaW9saWJfcmVnaXN0ZXJfYmFuayhzdHJ1Y3Qgc3RtMzJfcGluY3RybCAqcGN0bCwgc3Ry
dWN0IGZ3bm9kZQo+ICAgCWlmIChJU19FUlIoYmFuay0+YmFzZSkpCj4gICAJCXJldHVybiBQVFJf
RVJSKGJhbmstPmJhc2UpOwo+ICAgCj4gLQllcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUoYmFuay0+
Y2xrKTsKPiArCWVyciA9IGNsa19wcmVwYXJlX2VuYWJsZShwY3RsLT5jbGtzW3BjdGwtPm5iYW5r
c10uY2xrKTsKPiAgIAlpZiAoZXJyKSB7Cj4gICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHBy
ZXBhcmVfZW5hYmxlIGNsayAoJWQpXG4iLCBlcnIpOwo+ICAgCQlyZXR1cm4gZXJyOwo+IEBAIC0x
Mzk3LDcgKzEzOTcsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2dwaW9saWJfcmVnaXN0ZXJfYmFuayhz
dHJ1Y3Qgc3RtMzJfcGluY3RybCAqcGN0bCwgc3RydWN0IGZ3bm9kZQo+ICAgCXJldHVybiAwOwo+
ICAgCj4gICBlcnJfY2xrOgo+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGJhbmstPmNsayk7Cj4g
KwljbGtfZGlzYWJsZV91bnByZXBhcmUocGN0bC0+Y2xrc1twY3RsLT5uYmFua3NdLmNsayk7Cj4g
ICAJcmV0dXJuIGVycjsKPiAgIH0KPiAgIAo+IEBAIC0xNjE3LDEwICsxNjE3LDE4IEBAIGludCBz
dG0zMl9wY3RsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJCXJldHVy
biAtRUlOVkFMOwo+ICAgCX0KPiAgIAlwY3RsLT5iYW5rcyA9IGRldm1fa2NhbGxvYyhkZXYsIGJh
bmtzLCBzaXplb2YoKnBjdGwtPmJhbmtzKSwKPiAtCQkJR0ZQX0tFUk5FTCk7Cj4gKwkJCQkgICBH
RlBfS0VSTkVMKTsKPiAgIAlpZiAoIXBjdGwtPmJhbmtzKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsK
PiAgIAo+ICsJcGN0bC0+Y2xrcyA9IGRldm1fa2NhbGxvYyhkZXYsIGJhbmtzLCBzaXplb2YoKnBj
dGwtPmNsa3MpLAo+ICsJCQkJICBHRlBfS0VSTkVMKTsKPiArCWlmICghcGN0bC0+Y2xrcykKPiAr
CQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgYmFua3M7ICsraSkKPiAr
CQlwY3RsLT5jbGtzW2ldLmlkID0gIiI7Cj4gKwo+ICAgCWkgPSAwOwo+ICAgCWZvcl9lYWNoX2dw
aW9jaGlwX25vZGUoZGV2LCBjaGlsZCkgewo+ICAgCQlzdHJ1Y3Qgc3RtMzJfZ3Bpb19iYW5rICpi
YW5rID0gJnBjdGwtPmJhbmtzW2ldOwo+IEBAIC0xNjMxLDExICsxNjM5LDEwIEBAIGludCBzdG0z
Ml9wY3RsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJCQlmd25vZGVf
aGFuZGxlX3B1dChjaGlsZCk7Cj4gICAJCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiAgIAkJfQo+
IC0KPiAtCQliYW5rLT5jbGsgPSBvZl9jbGtfZ2V0X2J5X25hbWUobnAsIE5VTEwpOwo+IC0JCWlm
IChJU19FUlIoYmFuay0+Y2xrKSkgewo+ICsJCXBjdGwtPmNsa3NbaV0uY2xrID0gb2ZfY2xrX2dl
dF9ieV9uYW1lKG5wLCBOVUxMKTsKPiArCQlpZiAoSVNfRVJSKHBjdGwtPmNsa3NbaV0uY2xrKSkg
ewo+ICAgCQkJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwo+IC0JCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIFBUUl9FUlIoYmFuay0+Y2xrKSwKPiArCQkJcmV0dXJuIGRldl9lcnJfcHJvYmUo
ZGV2LCBQVFJfRVJSKHBjdGwtPmNsa3NbaV0uY2xrKSwKPiAgIAkJCQkJICAgICAiZmFpbGVkIHRv
IGdldCBjbGtcbiIpOwo+ICAgCQl9Cj4gICAJCWkrKzsKPiBAQCAtMTY0Niw4ICsxNjUzLDcgQEAg
aW50IHN0bTMyX3BjdGxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgIAkJ
aWYgKHJldCkgewo+ICAgCQkJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwo+ICAgCj4gLQkJCWZv
ciAoaSA9IDA7IGkgPCBwY3RsLT5uYmFua3M7IGkrKykKPiAtCQkJCWNsa19kaXNhYmxlX3VucHJl
cGFyZShwY3RsLT5iYW5rc1tpXS5jbGspOwo+ICsJCQljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFy
ZShwY3RsLT5uYmFua3MsIHBjdGwtPmNsa3MpOwo+ICAgCj4gICAJCQlyZXR1cm4gcmV0Owo+ICAg
CQl9Cj4gQEAgLTE3MjYsMTAgKzE3MzIsOCBAQCBzdGF0aWMgaW50IF9fbWF5YmVfdW51c2VkIHN0
bTMyX3BpbmN0cmxfcmVzdG9yZV9ncGlvX3JlZ3MoCj4gICBpbnQgX19tYXliZV91bnVzZWQgc3Rt
MzJfcGluY3RybF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgIHsKPiAgIAlzdHJ1Y3Qg
c3RtMzJfcGluY3RybCAqcGN0bCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+IC0JaW50IGk7Cj4g
ICAKPiAtCWZvciAoaSA9IDA7IGkgPCBwY3RsLT5uYmFua3M7IGkrKykKPiAtCQljbGtfZGlzYWJs
ZShwY3RsLT5iYW5rc1tpXS5jbGspOwo+ICsJY2xrX2J1bGtfZGlzYWJsZShwY3RsLT5uYmFua3Ms
IHBjdGwtPmNsa3MpOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gQEAgLTE3MzgsMTAgKzE3
NDIsMTEgQEAgaW50IF9fbWF5YmVfdW51c2VkIHN0bTMyX3BpbmN0cmxfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiAgIHsKPiAgIAlzdHJ1Y3Qgc3RtMzJfcGluY3RybCAqcGN0bCA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwo+ICAgCXN0cnVjdCBzdG0zMl9waW5jdHJsX2dyb3VwICpnID0gcGN0
bC0+Z3JvdXBzOwo+IC0JaW50IGk7Cj4gKwlpbnQgaSwgcmV0Owo+ICAgCj4gLQlmb3IgKGkgPSAw
OyBpIDwgcGN0bC0+bmJhbmtzOyBpKyspCj4gLQkJY2xrX2VuYWJsZShwY3RsLT5iYW5rc1tpXS5j
bGspOwo+ICsJcmV0ID0gY2xrX2J1bGtfZW5hYmxlKHBjdGwtPm5iYW5rcywgcGN0bC0+Y2xrcyk7
Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwg
cGN0bC0+bmdyb3VwczsgaSsrLCBnKyspCj4gICAJCXN0bTMyX3BpbmN0cmxfcmVzdG9yZV9ncGlv
X3JlZ3MocGN0bCwgZy0+cGluKTsKCgpUZXN0ZWQtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
