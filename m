Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3A97EB0F6
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:35:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CA2BC6B47D;
	Tue, 14 Nov 2023 13:35:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C7E0AC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:35:29 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AEBvpL3018212; Tue, 14 Nov 2023 14:35:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=uDF1LKg+LNckCmIf1p02zUMvTaTbnhhNepD4Klmyu/k=; b=zs
 A2lLz0eiu9VqRgd0YzfeEqMO2oxrvxCs9Jd8HWe59W1KqHVnJw5dxCQPQWZ4/UDJ
 4am576zZH7WAjWQSUH2Mk7LHibO0m3TAVhVl5mCn/sERQDyKEKbrt1ylHp7Jnlbo
 jQUUyG+rJy/Dv4a3i5Ma1z8mwdclibGWy6EOSo/LypWRHMPF4CbCMMszpI9L51X5
 Xhy1g8lpz8uAXYOMndoYXqbCUi3uQPw1lreevg4GpsuL0AnYRLGPELgQdhVM/cVm
 H3ITNr1dEdWY0+6F1I3f6xEOzRaN5fx9OW9cw5i54yyjBgV9ts381TCZ3L7nypkr
 4LUwnZnhay0A4MLkPXrA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1ch40gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 14:35:22 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6DC15100038;
 Tue, 14 Nov 2023 14:35:21 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60FA42128CE;
 Tue, 14 Nov 2023 14:35:21 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 14:35:20 +0100
Message-ID: <c2da3f60-595c-4938-809a-c5640388c13c@foss.st.com>
Date: Tue, 14 Nov 2023 14:35:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-12-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231019200658.1754190-12-u.kleine-koenig@pengutronix.de>
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
Subject: Re: [Linux-stm32] [PATCH 5/5] pwm: stm32: Fix enable count for clk
	in .probe()
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
cHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gCj4gTWFrZSB0aGUgZHJpdmVyIHRh
a2Ugb3ZlciBoYXJkd2FyZSBzdGF0ZSB3aXRob3V0IGRpc2FibGluZyBpbiAucHJvYmUoKQo+IGFu
ZCBlbmFibGUgdGhlIGNsb2NrIGZvciBlYWNoIGVuYWJsZWQgY2hhbm5lbC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgo+IFt1a2xlaW5l
azogc3BsaXQgb2ZmIGZyb20gYSBwYXRjaCB0aGF0IGFsc28gaW1wbGVtZW50ZWQgLmdldF9zdGF0
ZSgpXQo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdA
cGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jIHwgMTggKysr
KysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKCkhpIFV3ZSwKCkknZCBvbmx5IGhhdmUgYSBzdWdnZXN0aW9uIG9uIHRoZSBj
b21taXQgdGl0bGU6CnB3bTogc3RtMzI6IEZpeCBlbmFibGUgY291bnQgZm9yIGNsayBpbiAucHJv
YmUoKQogICAgICAgICAgICBeCk9uIGZpcnN0IHNpZ2h0LCB0aGUgIkZpeCIgbWF5IHN1Z2dlc3Qg
dGhhdCB0aGlzIGZpeGVzIHNvbWV0aGluZyBvbGRlciBpbgp0aGUgdHJlZS4gVGhpcyB3b3VsZCBz
dWdnZXN0IGEgRml4ZXMgdGFnIHdoaWNoIGlzbid0IHRoZSBjYXNlIGluIHRoaXMKc2VyaWVzLCBh
cyB0aGlzIGlzIGEgc3BsaXQgb2YgdGhlIC5nZXRfc3RhdGUoKSBwYXRjaC4KSXMgaXQgcG9zc2li
bGUgdG8gcmVwaHJhc2UgPwpzb21ldGhpbmcgbGlrZTogc2V0IGNsayBlbmFibGUgY291bnQgd2hl
biBwcm9iaW5nIGNoYW5uZWxzID8KCkFwYXJ0IGZyb20gdGhhdCwgeW91IGNhbiBhZGQgbXk6ClJl
dmlld2VkLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4K
Ci0tLQpJJ3ZlIGFkZGl0aW9uYWwgcXVlc3Rpb25zLCB1bnJlbGF0ZWQgdG8gdGhpcyBwYXRjaC4g
SSBoYWQgYSBsb29rIGF0CnB3bS1zdG0zMi1scC5jLCB0aGUgY2xvY2sgZW5hYmxpbmcgaXMgZG9u
ZSBkaXJlY3RseSBpbiB0aGUgLmdldF9zdGF0ZSgpCnJvdXRpbmUuIEkgdGhpbmsgdGhpcyBzaG91
bGQgYmUgbW92ZWQgdG8gdGhlIC5wcm9iZSgpIHJvdXRpbmUgYXMgZG9uZQpoZXJlLiBUaGVyZSdz
IGxpa2VseSBhIHJpc2ssIHRoYXQgY2xrIGVuYWJsZSBjb3VudCBnZXRzIGluY3JlYXNlZAphcnRp
ZmljaWFsbHksIGF0IGxlYXN0IHNpbmNlIGNvbW1pdCBjZmM0YzE4OWJjNzAgInB3bTogUmVhZCBp
bml0aWFsCmhhcmR3YXJlIHN0YXRlIGF0IHJlcXVlc3QgdGltZSIuClNoYWxsIEkgc2VuZCBhIHBh
dGNoIGZvciBwd20tc3RtMzItbHAuYywgc2ltaWxhciBhcyB0aGlzIHBhdGNoID8gT3IgaGFzCml0
IGJlZW4gc3BvdHRlZCBhbHJlYWR5ID8KCkJlc3QgUmVnYXJkcywKVGhhbmtzLApGYWJyaWNlCgo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3
bS1zdG0zMi5jCj4gaW5kZXggNjgyMzk1NjdhNTY0Li45N2EyYzNjMDliNjkgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIu
Ywo+IEBAIC02MDUsMTcgKzYwNSwyMSBAQCBzdGF0aWMgdm9pZCBzdG0zMl9wd21fZGV0ZWN0X2Nv
bXBsZW1lbnRhcnkoc3RydWN0IHN0bTMyX3B3bSAqcHJpdikKPiAgCXByaXYtPmhhdmVfY29tcGxl
bWVudGFyeV9vdXRwdXQgPSAoY2NlciAhPSAwKTsKPiAgfQo+ICAKPiAtc3RhdGljIHVuc2lnbmVk
IGludCBzdG0zMl9wd21fZGV0ZWN0X2NoYW5uZWxzKHN0cnVjdCBzdG0zMl9wd20gKnByaXYpCj4g
K3N0YXRpYyB1bnNpZ25lZCBpbnQgc3RtMzJfcHdtX2RldGVjdF9jaGFubmVscyhzdHJ1Y3Qgc3Rt
MzJfcHdtICpwcml2LAo+ICsJCQkJCSAgICAgIHVuc2lnbmVkIGludCAqbnVtX2VuYWJsZWQpCj4g
IHsKPiAtCXUzMiBjY2VyOwo+ICsJdTMyIGNjZXIsIGNjZXJfYmFja3VwOwo+ICAKPiAgCS8qCj4g
IAkgKiBJZiBjaGFubmVscyBlbmFibGUgYml0cyBkb24ndCBleGlzdCB3cml0aW5nIDEgd2lsbCBo
YXZlIG5vCj4gIAkgKiBlZmZlY3Qgc28gd2UgY2FuIGRldGVjdCBhbmQgY291bnQgdGhlbS4KPiAg
CSAqLwo+ICsJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgJmNjZXJfYmFja3Vw
KTsKPiAgCXJlZ21hcF9zZXRfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCBUSU1fQ0NFUl9D
Q1hFKTsKPiAgCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsICZjY2VyKTsKPiAt
CXJlZ21hcF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsIFRJTV9DQ0VSX0NDWEUp
Owo+ICsJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsIGNjZXJfYmFja3VwKTsK
PiArCj4gKwkqbnVtX2VuYWJsZWQgPSBod2VpZ2h0MzIoY2Nlcl9iYWNrdXAgJiBUSU1fQ0NFUl9D
Q1hFKTsKPiAgCj4gIAlyZXR1cm4gaHdlaWdodDMyKGNjZXIgJiBUSU1fQ0NFUl9DQ1hFKTsKPiAg
fQo+IEBAIC02MjYsNiArNjMwLDggQEAgc3RhdGljIGludCBzdG0zMl9wd21fcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYt
Pm9mX25vZGU7Cj4gIAlzdHJ1Y3Qgc3RtMzJfdGltZXJzICpkZGF0YSA9IGRldl9nZXRfZHJ2ZGF0
YShwZGV2LT5kZXYucGFyZW50KTsKPiAgCXN0cnVjdCBzdG0zMl9wd20gKnByaXY7Cj4gKwl1bnNp
Z25lZCBpbnQgbnVtX2VuYWJsZWQ7Cj4gKwl1bnNpZ25lZCBpbnQgaTsKPiAgCWludCByZXQ7Cj4g
IAo+ICAJcHJpdiA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqcHJpdiksIEdGUF9LRVJORUwp
Owo+IEBAIC02NDgsNyArNjU0LDExIEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcHJpdi0+Y2hpcC5kZXYgPSBkZXY7Cj4g
IAlwcml2LT5jaGlwLm9wcyA9ICZzdG0zMnB3bV9vcHM7Cj4gLQlwcml2LT5jaGlwLm5wd20gPSBz
dG0zMl9wd21fZGV0ZWN0X2NoYW5uZWxzKHByaXYpOwo+ICsJcHJpdi0+Y2hpcC5ucHdtID0gc3Rt
MzJfcHdtX2RldGVjdF9jaGFubmVscyhwcml2LCAmbnVtX2VuYWJsZWQpOwo+ICsKPiArCS8qIElu
aXRpYWxpemUgY2xvY2sgcmVmY291bnQgdG8gbnVtYmVyIG9mIGVuYWJsZWQgUFdNIGNoYW5uZWxz
LiAqLwo+ICsJZm9yIChpID0gMDsgaSA8IG51bV9lbmFibGVkOyBpKyspCj4gKwkJY2xrX2VuYWJs
ZShwcml2LT5jbGspOwo+ICAKPiAgCXJldCA9IGRldm1fcHdtY2hpcF9hZGQoZGV2LCAmcHJpdi0+
Y2hpcCk7Cj4gIAlpZiAocmV0IDwgMCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
