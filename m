Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B9F1BD93C
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Apr 2020 12:14:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7399C36B0D;
	Wed, 29 Apr 2020 10:14:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82C24C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Apr 2020 10:14:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TACTrZ017973; Wed, 29 Apr 2020 12:13:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=W5A8lTFTfg+9iuepDFbRf4C+euOmp/nYF0WkFVb9u5o=;
 b=Alq3gBQhIyAHVodxDf8TqfFkbAZIFn7wy2gckqe0kyMIxkOtIcLiSe+WKo9E8ar4QJ/S
 l948MtEbrcbq72YHY/sKwUzy7lYreyBd2NXg8nr0aKb2EtKMz6lcPheqVQAOSI1bGzsU
 m7fpSWzT3wNRhI7g+D9235QUsyFr71rrMtdvv2rJ5VPQBZSR33u4E5tM1ER8SHKC7II8
 zknaO0+2FemsepXW9KKJEV7+jCYEDxYWNWBEVwW6EIyP917c12ZEj08oAjuvuwtd1o5i
 EvTYJUZpNLXsjQ+j/3a0YbpRiviWiuOvB8IsEYh5Mvrgx63xavdkJTahXKSsb7ApTovx 4Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30mhcc5nex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 12:13:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 80D2A10002A;
 Wed, 29 Apr 2020 12:13:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 48F2220B86D;
 Wed, 29 Apr 2020 12:13:42 +0200 (CEST)
Received: from [10.211.9.35] (10.75.127.44) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 29 Apr
 2020 12:13:33 +0200
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-7-git-send-email-christophe.kerello@st.com>
 <20200427202212.0235d987@xps13> <0e2c9a6a-aa21-7814-9af8-629de6568fab@st.com>
 <20200429113529.5ddc3ad9@xps13> <b6b31f36-8e8f-4042-2587-0dcad82aafc5@st.com>
 <20200429120632.7bce63e6@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <cf4f4d00-7cfd-d0df-3004-9fd534e62bd0@st.com>
Date: Wed, 29 Apr 2020 12:13:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200429120632.7bce63e6@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG6NODE2.st.com
 (10.75.127.17)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_03:2020-04-29,
 2020-04-29 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, tony@atomide.com, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 06/12] mtd: rawnand: stm32_fmc2: use
 FMC2_TIMEOUT_MS for timeouts
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

CgpPbiA0LzI5LzIwIDEyOjA2IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIENocmlzdG9w
aGUsCj4gCj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPiB3
cm90ZSBvbiBXZWQsIDI5IEFwcgo+IDIwMjAgMTE6NDE6NDQgKzAyMDA6Cj4gCj4+IE9uIDQvMjkv
MjAgMTE6MzUgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+PiBIaSBDaHJpc3RvcGhlLAo+Pj4K
Pj4+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGUg
b24gV2VkLCAyOSBBcHIKPj4+IDIwMjAgMTE6Mjc6NDMgKzAyMDA6Cj4+PiAgICAKPj4+PiBIaSBN
aXF1w6hsLAo+Pj4+Cj4+Pj4gT24gNC8yNy8yMCA4OjIyIFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+Pj4+PiBIaSBDaHJpc3RvcGhlLAo+Pj4+Pgo+Pj4+PiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNo
cmlzdG9waGUua2VyZWxsb0BzdC5jb20+IHdyb3RlIG9uIFdlZCwgMTUgQXByCj4+Pj4+IDIwMjAg
MTc6NTc6MzAgKzAyMDA6Cj4+Pj4+ICAgICA+Pj4+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgY29u
c3RhbnQgRk1DMl9USU1FT1VUX1VTLgo+Pj4+Pj4gRk1DMl9USU1FT1VUX01TIGlzIHNldCB0byA1
IHNlY29uZHMgYW5kIHRoaXMgY29uc3RhbnQgaXMgdXNlZAo+Pj4+Pj4gZWFjaCB0aW1lIHRoYXQg
d2UgbmVlZCB0byB3YWl0IChleGNlcHQgd2hlbiB0aGUgdGltZW91dCB2YWx1ZQo+Pj4+Pj4gaXMg
c2V0IGJ5IHRoZSBmcmFtZXdvcmspCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+
PiAgICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAxMSArKysrKy0t
LS0tLQo+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0
bTMyX2ZtYzJfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMK
Pj4+Pj4+IGluZGV4IGFiNTMzMTQuLmYxNTljMzkgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+Pj4+Pj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMKPj4+Pj4+IEBAIC0zNyw4ICszNyw3IEBACj4+Pj4+
PiAgICAgLyogTWF4IEVDQyBidWZmZXIgbGVuZ3RoICovCj4+Pj4+PiAgICAgI2RlZmluZSBGTUMy
X01BWF9FQ0NfQlVGX0xFTgkJKEZNQzJfQkNIRFNSU19MRU4gKiBGTUMyX01BWF9TRykKPj4+Pj4+
ICAgICA+PiAtI2RlZmluZSBGTUMyX1RJTUVPVVRfVVMJCQkxMDAwCj4+Pj4+PiAtI2RlZmluZSBG
TUMyX1RJTUVPVVRfTVMJCQkxMDAwCj4+Pj4+PiArI2RlZmluZSBGTUMyX1RJTUVPVVRfTVMJCQk1
MDAwCj4+Pj4+PiAgICAgPj4gICAvKiBUaW1pbmdzICovCj4+Pj4+PiAgICAgI2RlZmluZSBGTUMy
X1RISVoJCQkxCj4+Pj4+PiBAQCAtNTI1LDkgKzUyNCw5IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1j
Ml9oYW1fY2FsY3VsYXRlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGNvbnN0IHU4ICpkYXRhLAo+
Pj4+Pj4gICAgIAl1MzIgc3IsIGhlY2NyOwo+Pj4+Pj4gICAgIAlpbnQgcmV0Owo+Pj4+Pj4gICAg
ID4+IC0JcmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQoZm1jMi0+aW9fYmFzZSArIEZN
QzJfU1IsCj4+Pj4+PiAtCQkJCQkgc3IsIHNyICYgRk1DMl9TUl9OV1JGLCAxMCwKPj4+Pj4+IC0J
CQkJCSBGTUMyX1RJTUVPVVRfTVMpOwo+Pj4+Pj4gKwlyZXQgPSByZWFkbF9yZWxheGVkX3BvbGxf
dGltZW91dF9hdG9taWMoZm1jMi0+aW9fYmFzZSArIEZNQzJfU1IsCj4+Pj4+PiArCQkJCQkJc3Is
IHNyICYgRk1DMl9TUl9OV1JGLCAxLAo+Pj4+Pj4gKwkJCQkJCTEwMDAgKiBGTUMyX1RJTUVPVVRf
TVMpOwo+Pj4+Pgo+Pj4+PiBJcyB0aGUgX2F0b21pYyBzdWZmaXggbmVlZGVkIGhlcmU/IElmIHll
cyBpdCB3b3VsZCBkZXNlcnZlIGEgc2VwYXJhdGUKPj4+Pj4gcGF0Y2ggd2l0aCBGaXhlcy9TdGFi
bGUgdGFncy4KPj4+Pj4gICAgID4+Cj4+Pj4gSSBoYXZlIGN1cnJlbnRseSBub3Qgc2VlbiBhbnkg
aXNzdWVzLiBTbywgSSB3aWxsIHJlbW92ZSB0aGlzIG1vZGlmaWNhdGlvbiBhcyB3ZSB3aWxsIG1v
dmUgdG8gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0IGluIHBhdGNoIDEwLgo+Pj4+ICAgCj4+Pj4+
PiAgICAgCWlmIChyZXQpIHsKPj4+Pj4+ICAgICAJCWRldl9lcnIoZm1jMi0+ZGV2LCAiaGFtIHRp
bWVvdXRcbiIpOwo+Pj4+Pj4gICAgIAkJcmV0dXJuIHJldDsKPj4+Pj4+IEBAIC0xMzE1LDcgKzEz
MTQsNyBAQCBzdGF0aWMgaW50IHN0bTMyX2ZtYzJfd2FpdHJkeShzdHJ1Y3QgbmFuZF9jaGlwICpj
aGlwLCB1bnNpZ25lZCBsb25nIHRpbWVvdXRfbXMpCj4+Pj4+PiAgICAgCS8qIENoZWNrIGlmIHRo
ZXJlIGlzIG5vIHBlbmRpbmcgcmVxdWVzdHMgdG8gdGhlIE5BTkQgZmxhc2ggKi8KPj4+Pj4+ICAg
ICAJaWYgKHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0X2F0b21pYyhmbWMyLT5pb19iYXNlICsg
Rk1DMl9TUiwgc3IsCj4+Pj4+PiAgICAgCQkJCQkgICAgICBzciAmIEZNQzJfU1JfTldSRiwgMSwK
Pj4+Pj4+IC0JCQkJCSAgICAgIEZNQzJfVElNRU9VVF9VUykpCj4+Pj4+PiArCQkJCQkgICAgICAx
MDAwICogRk1DMl9USU1FT1VUX01TKSkKPj4+Pj4+ICAgICAJCWRldl93YXJuKGZtYzItPmRldiwg
IldhaXRyZHkgdGltZW91dFxuIik7Cj4+Pj4+PiAgICAgPj4gICAJLyogV2FpdCB0V0IgYmVmb3Jl
IFIvQiMgc2lnbmFsIGlzIGxvdyAqLwo+Pj4+Pgo+Pj4+PiBZb3UgY2hhbmdlIHRoZSB0aW1lb3V0
cyBmcm9tIDFtcyB0byA1cy4KPj4+Pj4KPj4+Pj4gTWF5YmUgNXMgaXMgYSBsaXR0bGUgYml0IHRv
byBtdWNoIElNSE8gYnV0IHdlIGRvbid0IHJlYWxseSBjYXJlIGFzIHRoaXMKPj4+Pj4gaXMgYSB0
aW1lb3V0LiBIb3dldmVyIDFtcyBpcyB0aWdodC4gSWYgeW91IGFyZSBjaGFuZ2luZyB0aGlzIHZh
bHVlCj4+Pj4+IGJlY2F1c2UgaXQgdHJpZ2dlcnMgZXJyb3IgKGVnLiB3aGVuIHRoZSBtYWNoaW5l
IGlzIGxvYWRlZCksIHRoZW4gaXQgaXMKPj4+Pj4gYSBmaXggYW5kIHNob3VsZCBhcHBlYXIgbGlr
ZSBpdC4KPj4+Pj4KPj4+Pj4gVGhhbmtzLAo+Pj4+PiBNaXF1w6hsCj4+Pj4+ICAgICA+Pgo+Pj4+
IE5vIGVycm9ycyBjdXJyZW50bHkgaGFwcGVucy4KPj4+PiBEdXJpbmcgb3VyIHN0cmVzcyB0ZXN0
cywgaW4gYSBvdmVybG9hZGVkIHN5c3RlbSwgd2UgaGF2ZSBzZWVuIHRoYXQgd2UgY291bGQgYmUg
Y2xvc2UgdG8gMSBzZWNvbmQsIGV2ZW4gaWYgd2UgbmV2ZXIgbWV0IHRoaXMgdmFsdWUuCj4+Pj4g
U28sIHRvIGJlIHNhZmUsIEkgaGF2ZSBzZXQgdGhpcyB0aW1lb3V0IHRvIDUgc2Vjb25kcy4KPj4+
PiBBcyBpdCBpcyBqdXN0IGEgdGltZW91dCB2YWx1ZSwgSSBoYXZlIG5vdCBzZWVuIGFueSBzaWRl
IGVmZmVjdC4KPj4+PiBJIGFtIHVzaW5nIHRoZSBzYW1lIHRpbWVvdXQgY29uc3RhbnQgdG8gYXZv
aWQgdG8gaGF2ZSBvbmUgdGltZW91dCBwZXIgY2FzZXMuCj4+Pgo+Pj4gU29tZXRoaW5nIGlzIHdy
b25nIGluIG15IG1pbmQ6Cj4+PiBZb3Ugc2F5IHlvdSBvYnNlcnZlIGRlbGF5cyBvZiBhbG1vc3Qg
dXAgdG8gMSBzZWNvbmQsIGJ1dCB0aGUgcG9sbGluZwo+Pj4gY3VycmVudGx5IGhhcHBlbnMgb24g
MTAwMCB1cyA9IDFtcywgZWl0aGVyIHlvdSBoYWQgdGltZW91dHMgb3IgSQo+Pj4gbWlzcmVhZCBz
b21ldGhpbmc/Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOobAo+Pj4gICAgCj4+Cj4+IEhpIE1p
cXXDqGwsCj4+Cj4+IE15IGZhdWx0LiBGb3IgdGhpcyBwb2xsaW5nLCB3ZSBuZXZlciBtZXQgMSBt
cy4KPj4gVGhlIDEgc2Vjb25kIG9ic2VydmVkIHdhcyBvbiB0aGUgc2VxdWVuY2VyIHdoZW4gd2Ug
cmVhZC93cml0ZSBhIHBhZ2UgKGFzIGl0IHRoZSBzYW1lIHRpbWVvdXQgdmFsdWUgdGhhdCBpcyB1
c2VkKQo+IAo+IE9LIEkgZ2V0IGl0LiBTbyBwZXJoYXBzIHlvdSBjYW4gZ2l2ZSB0aGVzZSBkZXRh
aWxzIGluIHRoZSBjb21taXQgbG9nIHRvCj4gZXhwbGFpbiB3aHkgeW91IHVzZSA1IHNlY29uZHMg
aW5zdGVhZCBvZiBvbmUuCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKCkhpIE1pcXXDqGwsCgpB
IHByb3Bvc2FsIGNvdWxkIGFsc28gYmUgdG8gc3BsaXQgdGhpcyBwYXRjaDoKICAtIGEgZmlyc3Qg
cGF0Y2ggdGhhdCBpcyB1c2luZyBvbmx5IG9uZSB0aW1lb3V0IHZhbHVlLgogIC0gYSBzZWNvbmQg
cGF0Y2ggdGhhdCBpcyBpbmNyZWFzaW5nIHRoZSB2YWx1ZSB0byA1IHNlY29uZHMuCgpSZWdhcmRz
LApDaHJpc3RvcGhlIEtlcmVsbG8uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
