Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EAA6E116B
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Apr 2023 17:49:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B458C69063;
	Thu, 13 Apr 2023 15:49:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4372AC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Apr 2023 15:49:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33DDcXxo015973; Thu, 13 Apr 2023 17:49:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=10v21qlgUMLfu5kPMNcmhdYRHZiJpyjT0L0dJsmLtvw=;
 b=v6OhYbbvrpPLx1JwxegMChOboBtJzz6Ylcpk0rKNJucPUsYQ9fGbD3rZjZvsLZRYgMaS
 n7rSO28G+PgKy6Cf/wXXzO4Msz4+5s4qAT42Fx8Fj8UzZqnz7/jIfMfabs2yVX/tf0OB
 cH1eIMCvtn7kXWBtR+mdOmNT4kzDwTk2AfKSvJYBwHnTU/oNblBWA6ydFj1CkHbu3KoE
 gdZ5k3T6A3ivRznb9021jFKHjzrnbqQOHFb47c9+mi+MaIoLZ3HcjZWusxDn+BihZQPD
 2l8Gyjjkt8iwP5LdmUpd5jkocIvnJHVt3iWCDj69TV78dTiKqj2SvHnxNE9bZLrDcUcT tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pxf2qah42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 17:49:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F24BE10002A;
 Thu, 13 Apr 2023 17:49:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EACB9227885;
 Thu, 13 Apr 2023 17:49:23 +0200 (CEST)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Apr
 2023 17:49:22 +0200
Message-ID: <434b4497-0dd4-4818-b4f7-f57264d8b2a7@foss.st.com>
Date: Thu, 13 Apr 2023 17:49:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, William Breathitt Gray
 <william.gray@linaro.org>
References: <20230412153709.3557323-1-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20230412153709.3557323-1-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_11,2023-04-13_01,2023-02-09_01
Cc: linux-iio@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: Reset TIM_TISEL
 and TIM_SMCR to their default value
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

T24gNC8xMi8yMyAxNzozNywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gVGhlIGRyaXZlciBh
c3N1bWVzIHRoYXQgdGhlIGlucHV0IHNlbGVjdGlvbiByZWdpc3RlciAoVElNX1RJU0VMKSBpcyBh
dAo+IGl0cyByZXNldCBkZWZhdWx0IHZhbHVlLiBVc3VhbGx5IHRoaXMgaXMgdGhlIGNhc2UsIGJ1
dCB0aGUgYm9vdGxvYWRlcgo+IG1pZ2h0IGhhdmUgbW9kaWZpZWQgaXQuIEFsc28gcmVzZXQgdGhl
IFNNQ1IgcmVnaXN0ZXIgd2hpbGUgYXQgaXQuCj4gCj4gVGhpcyBiYXNlcyBvbiB0aGUgZWZmZWN0
aXZlbHkgc2FtZSBwYXRjaCBzdWJtaXR0ZWQgYnkgT2xpdmllciBNb3lzYW4gZm9yCj4gcHdtLXN0
bTMyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gSGVsbG8sCj4gCj4gbm90ZSB0aGF0IHRoZSBwYXRj
aCBieSBPbGl2aWVyIE1veXNhblsxXSBmb3IgcHdtLXN0bTMyIGlzIGV4cGVjdGVkIHRvCj4gYXBw
ZWFyIGluIFRoaWVycnkncyB0cmVlIHNvb24uIEl0IGFkZGVkIHRoZSBkZWZpbml0aW9uIG9mIFRJ
TV9USVNFTCBpbgo+IHRoZSBzYW1lIHdheSwgc28gdGhlIHR3byBwYXRjaGVzIHNob3VsZCBtZXJn
ZSBqdXN0IGZpbmUuIEFsdGVybmF0aXZlbHkKPiB5b3UgY2FuIGNvbW1pdCBpdCB0byBhIHRyZWUg
dGhhdCBhbHJlYWR5IGhhcyB0aGUgcHdtIGNoYW5nZSAoYW5kIHRoZW4KPiBkcm9wIHRoZSBjaGFu
Z2UgdG8gaW5jbHVkZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmggZnJvbSB0aGlzIG9uZSkuCj4g
Cj4gQmVzdCByZWdhcmRzCj4gVXdlCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXB3bS8yMDIyMTIxMzEwMjcwNy4xMDk2MzQ1LTEtb2xpdmllci5tb3lzYW5AZm9zcy5zdC5j
b20KPiAKPiAgZHJpdmVycy9jb3VudGVyL3N0bTMyLXRpbWVyLWNudC5jIHwgNCArKysrCj4gIGlu
Y2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oICB8IDEgKwo+ICAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzIt
dGltZXItY250LmMgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKPiBpbmRleCA5
YmYyMGE1ZDZiZGEuLmQwMDFkNzdmMTdhYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NvdW50ZXIv
c3RtMzItdGltZXItY250LmMKPiArKysgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250
LmMKPiBAQCAtMzQyLDYgKzM0MiwxMCBAQCBzdGF0aWMgaW50IHN0bTMyX3RpbWVyX2NudF9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAKPiAgCXBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIHByaXYpOwo+ICAKPiArCS8qIFJlc2V0IGlucHV0IHNlbGVjdG9yIHRvIGl0cyBk
ZWZhdWx0IGlucHV0IGFuZCBkaXNhYmxlIHNsYXZlIG1vZGUgKi8KPiArCXJlZ21hcF93cml0ZShw
cml2LT5yZWdtYXAsIFRJTV9USVNFTCwgMHgwKTsKPiArCXJlZ21hcF93cml0ZShwcml2LT5yZWdt
YXAsIFRJTV9TTUNSLCAweDApOwoKSGkgVXdlLAoKSnVzdCBvbiBTTUNSOiB0aGUgZnVuY3Rpb25f
d3JpdGUgcm91dGluZSB3aWxsIHRha2UgY2FyZSBvZiBzZXR0aW5nIGl0CmRlcGVuZGluZyBvbiB0
aGUgY291bnQgZnVuY3Rpb24gKGluY3JlYXNlLCBlbmNvZGVyIG1vZGUuLi4pLiBTbyBpdCBsb29r
cwpsaWtlIHVzZWxlc3MgdG8gZGlzYWJsZSBzbGF2ZSBtb2RlIGR1cmluZyBwcm9iZS4KQ291bGQg
aXQgYmUgcmVtb3ZlZCA/CgpXaXRoIHRoYXQsIHlvdSBjYW4gYWRkIG15OgpSZXZpZXdlZC1ieTog
RmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5jb20KCkJlc3QgUmVnYXJk
cywKRmFicmljZQoKPiArCj4gIAkvKiBSZWdpc3RlciBDb3VudGVyIGRldmljZSAqLwo+ICAJcmV0
ID0gZGV2bV9jb3VudGVyX2FkZChkZXYsIGNvdW50ZXIpOwo+ICAJaWYgKHJldCA8IDApCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oIGIvaW5jbHVkZS9saW51
eC9tZmQvc3RtMzItdGltZXJzLmgKPiBpbmRleCA1ZjVjNDNmZDY5ZGQuLjFiOTQzMjVmZWJiMyAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21mZC9zdG0zMi10aW1lcnMuaAo+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvbWZkL3N0bTMyLXRpbWVycy5oCj4gQEAgLTMxLDYgKzMxLDcgQEAKPiAgI2Rl
ZmluZSBUSU1fQkRUUgkweDQ0CS8qIEJyZWFrIGFuZCBEZWFkLVRpbWUgUmVnICovCj4gICNkZWZp
bmUgVElNX0RDUgkJMHg0OAkvKiBETUEgY29udHJvbCByZWdpc3RlciAgICAqLwo+ICAjZGVmaW5l
IFRJTV9ETUFSCTB4NEMJLyogRE1BIHJlZ2lzdGVyIGZvciB0cmFuc2ZlciAqLwo+ICsjZGVmaW5l
IFRJTV9USVNFTAkweDY4CS8qIElucHV0IFNlbGVjdGlvbiAgICAgICAgICovCj4gIAo+ICAjZGVm
aW5lIFRJTV9DUjFfQ0VOCUJJVCgwKQkvKiBDb3VudGVyIEVuYWJsZQkgICAqLwo+ICAjZGVmaW5l
IFRJTV9DUjFfRElSCUJJVCg0KSAgLyogQ291bnRlciBEaXJlY3Rpb24JICAgKi8KPiAKPiBiYXNl
LWNvbW1pdDogZmUxNWMyNmVlMjZlZmExMTc0MWE3YjYzMmU5ZjIzYjAxYWNhNGNjNgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
