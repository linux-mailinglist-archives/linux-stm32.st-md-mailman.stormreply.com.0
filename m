Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 569026359B4
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 11:23:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16ECFC6506F;
	Wed, 23 Nov 2022 10:23:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE24DC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 10:23:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN9OPFc021301; Wed, 23 Nov 2022 11:23:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=SGry+RXaYobNxy94dZwABKmwWE82iqGqvu00CijFF8M=;
 b=GpGtTYpFtxCpqHIlejYPePZfPJ5MY2h6GVphcH1wfLwAuTF4NjoUL5w/Ah8dVtUEubJ6
 zLO7GOjHsFxvOPfaAX3uLQT822tlVn3gLk3dpJzgcNoVsgTSm2jqE2Jc4wnjVYbmZlDP
 6YdqctjGM3XFKHkn3BwLq6C+h8zlMLbVZskc+P+crJrYiT5zRTx//SS+WNarktoUB2r6
 L9m9lBC7K655OqyAjnDi7Xos4Txs1W4u6WooEXSf32O3cqG2GULbuPtLz3NzMbiF7qu2
 cyQvtIXCb7DWsIdnZZ4+19wfXMLdISE2dyDyk9lRAMbrh6jBKxrbB3VmWfqgv0ZJ6SB6 3Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxrax7xh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 11:23:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 598A1100039;
 Wed, 23 Nov 2022 11:23:31 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52CBB218CFF;
 Wed, 23 Nov 2022 11:23:31 +0100 (CET)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 11:23:28 +0100
Message-ID: <11ecd39d-af16-ed8e-6d70-cbb369e387c5@foss.st.com>
Date: Wed, 23 Nov 2022 11:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
 <20221115111347.3705732-6-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20221115111347.3705732-6-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_04,2022-11-23_01,2022-06-22_01
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 5/5] pwm: stm32: Use regmap_clear_bits and
 regmap_set_bits where applicable
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

T24gMTEvMTUvMjIgMTI6MTMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZvdW5kIHVzaW5n
IGNvY2NpbmVsbGUgYW5kIHRoZSBmb2xsb3dpbmcgc2VtYW50aWMgcGF0Y2g6Cj4gCj4gQEAKPiBl
eHByZXNzaW9uIG1hcCwgcmVnLCBiaXRzOwo+IEBACj4gCj4gLSByZWdtYXBfdXBkYXRlX2JpdHMo
bWFwLCByZWcsIGJpdHMsIGJpdHMpCj4gKyByZWdtYXBfc2V0X2JpdHMobWFwLCByZWcsIGJpdHMp
Cj4gCj4gQEAKPiBleHByZXNzaW9uIG1hcCwgcmVnLCBiaXRzOwo+IEBACj4gCj4gLSByZWdtYXBf
dXBkYXRlX2JpdHMobWFwLCByZWcsIGJpdHMsIDApCj4gKyByZWdtYXBfY2xlYXJfYml0cyhtYXAs
IHJlZywgYml0cykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzIu
YyB8IDM0ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKSGkgVXdlLAoKWW91IGNhbiBh
ZGQgbXk6ClRlc3RlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5z
dC5jb20+CgpCZXN0IFJlZ2FyZHMsClRoYW5rcwpGYWJyaWNlCgo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3B3bS9wd20tc3RtMzIuYyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4gaW5kZXgg
Nzk0Y2E1YjAyOTY4Li4yMWU0YTM0ZGZmZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdt
LXN0bTMyLmMKPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwo+IEBAIC0xMTUsMTQgKzEx
NSwxNCBAQCBzdGF0aWMgaW50IHN0bTMyX3B3bV9yYXdfY2FwdHVyZShzdHJ1Y3Qgc3RtMzJfcHdt
ICpwcml2LCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLAo+ICAJaW50IHJldDsKPiAgCj4gIAkvKiBF
bnN1cmUgcmVnaXN0ZXJzIGhhdmUgYmVlbiB1cGRhdGVkLCBlbmFibGUgY291bnRlciBhbmQgY2Fw
dHVyZSAqLwo+IC0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0VHUiwgVElN
X0VHUl9VRywgVElNX0VHUl9VRyk7Cj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFw
LCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTiwgVElNX0NSMV9DRU4pOwo+ICsJcmVnbWFwX3NldF9iaXRz
KHByaXYtPnJlZ21hcCwgVElNX0VHUiwgVElNX0VHUl9VRyk7Cj4gKwlyZWdtYXBfc2V0X2JpdHMo
cHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTik7Cj4gIAo+ICAJLyogVXNlIGNjMSBv
ciBjYzMgRE1BIHJlc3AgZm9yIFBXTSBpbnB1dCBjaGFubmVscyAxICYgMiBvciAzICYgNCAqLwo+
ICAJZG1hX2lkID0gcHdtLT5od3B3bSA8IDIgPyBTVE0zMl9USU1FUlNfRE1BX0NIMSA6IFNUTTMy
X1RJTUVSU19ETUFfQ0gzOwo+ICAJY2NlbiA9IHB3bS0+aHdwd20gPCAyID8gVElNX0NDRVJfQ0Mx
MkUgOiBUSU1fQ0NFUl9DQzM0RTsKPiAgCWNjciA9IHB3bS0+aHdwd20gPCAyID8gVElNX0NDUjEg
OiBUSU1fQ0NSMzsKPiAtCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DQ0VS
LCBjY2VuLCBjY2VuKTsKPiArCXJlZ21hcF9zZXRfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DQ0VS
LCBjY2VuKTsKPiAgCj4gIAkvKgo+ICAJICogVGltZXIgRE1BIGJ1cnN0IG1vZGUuIFJlcXVlc3Qg
MiByZWdpc3RlcnMsIDIgYnVyc3RzLCB0byBnZXQgYm90aAo+IEBAIC0xNjAsOCArMTYwLDggQEAg
c3RhdGljIGludCBzdG0zMl9wd21fcmF3X2NhcHR1cmUoc3RydWN0IHN0bTMyX3B3bSAqcHJpdiwg
c3RydWN0IHB3bV9kZXZpY2UgKnB3bSwKPiAgCX0KPiAgCj4gIHN0b3A6Cj4gLQlyZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgY2NlbiwgMCk7Cj4gLQlyZWdtYXBfdXBk
YXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBUSU1fQ1IxX0NFTiwgMCk7Cj4gKwlyZWdt
YXBfY2xlYXJfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCBjY2VuKTsKPiArCXJlZ21hcF9j
bGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4pOwo+ICAKPiAgCXJl
dHVybiByZXQ7Cj4gIH0KPiBAQCAtMzU5LDcgKzM1OSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfcHdt
X2NvbmZpZyhzdHJ1Y3Qgc3RtMzJfcHdtICpwcml2LCBpbnQgY2gsCj4gIAo+ICAJcmVnbWFwX3dy
aXRlKHByaXYtPnJlZ21hcCwgVElNX1BTQywgcHJlc2NhbGVyKTsKPiAgCXJlZ21hcF93cml0ZShw
cml2LT5yZWdtYXAsIFRJTV9BUlIsIHByZCAtIDEpOwo+IC0JcmVnbWFwX3VwZGF0ZV9iaXRzKHBy
aXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9BUlBFLCBUSU1fQ1IxX0FSUEUpOwo+ICsJcmVn
bWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9BUlBFKTsKPiAgCj4g
IAkvKiBDYWxjdWxhdGUgdGhlIGR1dHkgY3ljbGVzICovCj4gIAlkdHkgPSBwcmQgKiBkdXR5X25z
Owo+IEBAIC0zNzcsNyArMzc3LDcgQEAgc3RhdGljIGludCBzdG0zMl9wd21fY29uZmlnKHN0cnVj
dCBzdG0zMl9wd20gKnByaXYsIGludCBjaCwKPiAgCWVsc2UKPiAgCQlyZWdtYXBfdXBkYXRlX2Jp
dHMocHJpdi0+cmVnbWFwLCBUSU1fQ0NNUjIsIG1hc2ssIGNjbXIpOwo+ICAKPiAtCXJlZ21hcF91
cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsIFRJTV9CRFRSLCBUSU1fQkRUUl9NT0UsIFRJTV9CRFRS
X01PRSk7Cj4gKwlyZWdtYXBfc2V0X2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQkRUUiwgVElNX0JE
VFJfTU9FKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQo+IEBAIC00MTEsMTMgKzQxMSwxMyBAQCBz
dGF0aWMgaW50IHN0bTMyX3B3bV9lbmFibGUoc3RydWN0IHN0bTMyX3B3bSAqcHJpdiwgaW50IGNo
KQo+ICAJaWYgKHByaXYtPmhhdmVfY29tcGxlbWVudGFyeV9vdXRwdXQpCj4gIAkJbWFzayB8PSBU
SU1fQ0NFUl9DQzFORSA8PCAoY2ggKiA0KTsKPiAgCj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJp
di0+cmVnbWFwLCBUSU1fQ0NFUiwgbWFzaywgbWFzayk7Cj4gKwlyZWdtYXBfc2V0X2JpdHMocHJp
di0+cmVnbWFwLCBUSU1fQ0NFUiwgbWFzayk7Cj4gIAo+ICAJLyogTWFrZSBzdXJlIHRoYXQgcmVn
aXN0ZXJzIGFyZSB1cGRhdGVkICovCj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFw
LCBUSU1fRUdSLCBUSU1fRUdSX1VHLCBUSU1fRUdSX1VHKTsKPiArCXJlZ21hcF9zZXRfYml0cyhw
cml2LT5yZWdtYXAsIFRJTV9FR1IsIFRJTV9FR1JfVUcpOwo+ICAKPiAgCS8qIEVuYWJsZSBjb250
cm9sbGVyICovCj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ1IxLCBU
SU1fQ1IxX0NFTiwgVElNX0NSMV9DRU4pOwo+ICsJcmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21h
cCwgVElNX0NSMSwgVElNX0NSMV9DRU4pOwo+ICAKPiAgCXJldHVybiAwOwo+ICB9Cj4gQEAgLTQz
MSwxMSArNDMxLDExIEBAIHN0YXRpYyB2b2lkIHN0bTMyX3B3bV9kaXNhYmxlKHN0cnVjdCBzdG0z
Ml9wd20gKnByaXYsIGludCBjaCkKPiAgCWlmIChwcml2LT5oYXZlX2NvbXBsZW1lbnRhcnlfb3V0
cHV0KQo+ICAJCW1hc2sgfD0gVElNX0NDRVJfQ0MxTkUgPDwgKGNoICogNCk7Cj4gIAo+IC0JcmVn
bWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsIG1hc2ssIDApOwo+ICsJcmVn
bWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgbWFzayk7Cj4gIAo+ICAJLyog
V2hlbiBhbGwgY2hhbm5lbHMgYXJlIGRpc2FibGVkLCB3ZSBjYW4gZGlzYWJsZSB0aGUgY29udHJv
bGxlciAqLwo+ICAJaWYgKCFhY3RpdmVfY2hhbm5lbHMocHJpdikpCj4gLQkJcmVnbWFwX3VwZGF0
ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4sIDApOwo+ICsJCXJlZ21h
cF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NSMSwgVElNX0NSMV9DRU4pOwo+ICAKPiAg
CWNsa19kaXNhYmxlKHByaXYtPmNsayk7Cj4gIH0KPiBAQCAtNTY4LDEwICs1NjgsOSBAQCBzdGF0
aWMgdm9pZCBzdG0zMl9wd21fZGV0ZWN0X2NvbXBsZW1lbnRhcnkoc3RydWN0IHN0bTMyX3B3bSAq
cHJpdikKPiAgCSAqIElmIGNvbXBsZW1lbnRhcnkgYml0IGRvZXNuJ3QgZXhpc3Qgd3JpdGluZyAx
IHdpbGwgaGF2ZSBubwo+ICAJICogZWZmZWN0IHNvIHdlIGNhbiBkZXRlY3QgaXQuCj4gIAkgKi8K
PiAtCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5yZWdtYXAsCj4gLQkJCSAgIFRJTV9DQ0VSLCBU
SU1fQ0NFUl9DQzFORSwgVElNX0NDRVJfQ0MxTkUpOwo+ICsJcmVnbWFwX3NldF9iaXRzKHByaXYt
PnJlZ21hcCwgVElNX0NDRVIsIFRJTV9DQ0VSX0NDMU5FKTsKPiAgCXJlZ21hcF9yZWFkKHByaXYt
PnJlZ21hcCwgVElNX0NDRVIsICZjY2VyKTsKPiAtCXJlZ21hcF91cGRhdGVfYml0cyhwcml2LT5y
ZWdtYXAsIFRJTV9DQ0VSLCBUSU1fQ0NFUl9DQzFORSwgMCk7Cj4gKwlyZWdtYXBfY2xlYXJfYml0
cyhwcml2LT5yZWdtYXAsIFRJTV9DQ0VSLCBUSU1fQ0NFUl9DQzFORSk7Cj4gIAo+ICAJcHJpdi0+
aGF2ZV9jb21wbGVtZW50YXJ5X291dHB1dCA9IChjY2VyICE9IDApOwo+ICB9Cj4gQEAgLTU4NSwx
MCArNTg0LDkgQEAgc3RhdGljIGludCBzdG0zMl9wd21fZGV0ZWN0X2NoYW5uZWxzKHN0cnVjdCBz
dG0zMl9wd20gKnByaXYpCj4gIAkgKiBJZiBjaGFubmVscyBlbmFibGUgYml0cyBkb24ndCBleGlz
dCB3cml0aW5nIDEgd2lsbCBoYXZlIG5vCj4gIAkgKiBlZmZlY3Qgc28gd2UgY2FuIGRldGVjdCBh
bmQgY291bnQgdGhlbS4KPiAgCSAqLwo+IC0JcmVnbWFwX3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21h
cCwKPiAtCQkJICAgVElNX0NDRVIsIFRJTV9DQ0VSX0NDWEUsIFRJTV9DQ0VSX0NDWEUpOwo+ICsJ
cmVnbWFwX3NldF9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsIFRJTV9DQ0VSX0NDWEUpOwo+
ICAJcmVnbWFwX3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgJmNjZXIpOwo+IC0JcmVnbWFw
X3VwZGF0ZV9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsIFRJTV9DQ0VSX0NDWEUsIDApOwo+
ICsJcmVnbWFwX2NsZWFyX2JpdHMocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgVElNX0NDRVJfQ0NY
RSk7Cj4gIAo+ICAJaWYgKGNjZXIgJiBUSU1fQ0NFUl9DQzFFKQo+ICAJCW5wd20rKzsKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
