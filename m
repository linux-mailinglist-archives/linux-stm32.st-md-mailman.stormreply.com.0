Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DDADF7EB0CD
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:26:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96697C6B44B;
	Tue, 14 Nov 2023 13:26:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F190DC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:26:39 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AE9EmRn031609; Tue, 14 Nov 2023 14:26:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=v6RHVxwutJkSi6Qco+qNtL7rvalniuJSr5bDH69HBw4=; b=Ja
 luzfrziUTgr5pbj04et5GPvMTssLHZgSX+oPmD48AIaNpxFPGdij8ZNcqIUyWd3Y
 G7x7dN2fKSwM4h2mreekTFLV/GpwA4eF2DwwlSXYQvFm6WiZWPzJC0q0goMsP5kY
 +8cbyGuDUk9yF8fuXM1vVIFL8+eKY8fGGZSZZfp16znrRd0Yvd633x/57P64kSbL
 aawFKASX3ca07xu8fIh3kIqLnNXY64y4DmhLnGPuy4YIfntvtJpGdRc1VysA5T7Y
 CP9jkZHmpEGdMQXeqNRcQ5OpwwqhHlBAfKVwCV6WdKNRMZ1E/pGrqmZoo1d32f7n
 c/F8MBRGIe6aosBI35Xg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1u1uv72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 14:26:29 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A861100038;
 Tue, 14 Nov 2023 14:26:28 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 822642122E3;
 Tue, 14 Nov 2023 14:26:28 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 14:26:27 +0100
Message-ID: <77d75b3e-f9b7-4360-9e92-223befc9b57b@foss.st.com>
Date: Tue, 14 Nov 2023 14:26:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-8-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231019200658.1754190-8-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_13,2023-11-09_01,2023-05-22_02
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] pwm: stm32: Replace write_ccrx with
	regmap_write
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

T24gMTAvMTkvMjMgMjI6MDcsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZyb206IFBoaWxp
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gVGhlIFRJTV9DQ1IxLi4uNCBy
ZWdpc3RlcnMgYXJlIGNvbnNlY3V0aXZlLCBzbyByZXBsYWNlIHRoZSBzd2l0Y2gKPiBjYXNlIHdp
dGggYSBzaW1wbGUgY2FsY3VsYXRpb24uIFNpbmNlIGNoIGlzIGtub3duIHRvIGJlIGluIHRoZSAw
Li4uMwo+IHJhbmdlIChpdCBpcyBzZXQgdG8gaHdwd20gPCBucHdtIDw9IDQpLCBkcm9wIHRoZSB1
bm5lY2Vzc2FyeSBlcnJvcgo+IGhhbmRsaW5nLiBUaGUgcmV0dXJuIHZhbHVlIHdhcyBub3QgY2hl
Y2tlZCBhbnl3YXkuIFdoYXQgcmVtYWlucyBkb2VzCj4gbm90IHdhcnJhbnQga2VlcGluZyB0aGUg
d3JpdGVfY2NyeCgpIGZ1bmN0aW9uIGFyb3VuZCwgc28gaW5zdGVhZCBjYWxsCj4gcmVnbWFwX3dy
aXRlKCkgZGlyZWN0bHkgYXQgdGhlIHNpbmd1bGFyIGNhbGwgc2l0ZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4g
LS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMTcgKy0tLS0tLS0tLS0tLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNiBkZWxldGlvbnMoLSkKCkhpIFV3ZSwK
ClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwKWW91IGNhbiBhZGQgbXk6ClJldmlld2VkLWJ5OiBG
YWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KClRoYW5rcywKRmFi
cmljZQoKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgYi9kcml2ZXJz
L3B3bS9wd20tc3RtMzIuYwo+IGluZGV4IDMzMDNhNzU0ZWEwMi4uNWU0ODU4NGUzYmQ0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4gKysrIGIvZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMKPiBAQCAtNTIsMjEgKzUyLDYgQEAgc3RhdGljIHUzMiBhY3RpdmVfY2hhbm5lbHMo
c3RydWN0IHN0bTMyX3B3bSAqZGV2KQo+ICAJcmV0dXJuIGNjZXIgJiBUSU1fQ0NFUl9DQ1hFOwo+
ICB9Cj4gIAo+IC1zdGF0aWMgaW50IHdyaXRlX2Njcngoc3RydWN0IHN0bTMyX3B3bSAqZGV2LCBp
bnQgY2gsIHUzMiB2YWx1ZSkKPiAtewo+IC0Jc3dpdGNoIChjaCkgewo+IC0JY2FzZSAwOgo+IC0J
CXJldHVybiByZWdtYXBfd3JpdGUoZGV2LT5yZWdtYXAsIFRJTV9DQ1IxLCB2YWx1ZSk7Cj4gLQlj
YXNlIDE6Cj4gLQkJcmV0dXJuIHJlZ21hcF93cml0ZShkZXYtPnJlZ21hcCwgVElNX0NDUjIsIHZh
bHVlKTsKPiAtCWNhc2UgMjoKPiAtCQlyZXR1cm4gcmVnbWFwX3dyaXRlKGRldi0+cmVnbWFwLCBU
SU1fQ0NSMywgdmFsdWUpOwo+IC0JY2FzZSAzOgo+IC0JCXJldHVybiByZWdtYXBfd3JpdGUoZGV2
LT5yZWdtYXAsIFRJTV9DQ1I0LCB2YWx1ZSk7Cj4gLQl9Cj4gLQlyZXR1cm4gLUVJTlZBTDsKPiAt
fQo+IC0KPiAgI2RlZmluZSBUSU1fQ0NFUl9DQzEyUCAoVElNX0NDRVJfQ0MxUCB8IFRJTV9DQ0VS
X0NDMlApCj4gICNkZWZpbmUgVElNX0NDRVJfQ0MxMkUgKFRJTV9DQ0VSX0NDMUUgfCBUSU1fQ0NF
Ul9DQzJFKQo+ICAjZGVmaW5lIFRJTV9DQ0VSX0NDMzRQIChUSU1fQ0NFUl9DQzNQIHwgVElNX0ND
RVJfQ0M0UCkKPiBAQCAtMzY5LDcgKzM1NCw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX2NvbmZp
ZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCBpbnQgY2gsCj4gIAlkdHkgPSBwcmQgKiBkdXR5X25z
Owo+ICAJZG9fZGl2KGR0eSwgcGVyaW9kX25zKTsKPiAgCj4gLQl3cml0ZV9jY3J4KHByaXYsIGNo
LCBkdHkpOwo+ICsJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX0NDUjEgKyA0ICogY2gs
IGR0eSk7Cj4gIAo+ICAJLyogQ29uZmlndXJlIG91dHB1dCBtb2RlICovCj4gIAlzaGlmdCA9IChj
aCAmIDB4MSkgKiBDQ01SX0NIQU5ORUxfU0hJRlQ7Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
