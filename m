Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F6324EFF
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Feb 2021 12:19:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 895DFC57B59;
	Thu, 25 Feb 2021 11:19:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13E31C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 11:19:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11PBHF5r006407; Thu, 25 Feb 2021 12:19:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CMTm/gPp7SHBgmvKDTH9L2sSez0dNF3orqXJb1JT8M4=;
 b=MvAR4Vv/NHFJsNA0pv6LrnxkIuwZSUtNrUvWrBXo0SthxC6nF3KtidapmIO5QY/f5M3Y
 bxoONQEw5hO7tv23xOkXyF62AHTjNfLewBoyfnbFOLdSpR31ACHQWKZODGlOREIH7JF/
 AQPXmzqtZaGDi+JOyWU31Ums/ms7LV/q1XYdjftFs2DcUamHJnG1e08Z95p2Of/nFEy3
 BMPV/Ad9zkCO90nd19ZDMjnwcAzfE910H3U2+AxtoJE3uGEla5qhqPKwIGiN2DJya9bH
 35btoWnIfhT8uIxctSmhof5jOMMWVqhdlNlDrjUIt8fubQpS7+QtuMh4SXMqq7cWle7q 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36w66cn91j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 12:19:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DE3A710002A;
 Thu, 25 Feb 2021 12:19:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A25F22529A;
 Thu, 25 Feb 2021 12:19:20 +0100 (CET)
Received: from [10.211.6.253] (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 25 Feb
 2021 12:19:19 +0100
To: William Breathitt Gray <vilhelm.gray@gmail.com>, <jic23@kernel.org>
References: <20210219095906.220382-1-vilhelm.gray@gmail.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <288929fc-6984-072b-359a-10e163056bad@foss.st.com>
Date: Thu, 25 Feb 2021 12:19:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210219095906.220382-1-vilhelm.gray@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_06:2021-02-24,
 2021-02-25 signatures=0
Cc: Alexandre Torgue <alexandre.torgue@st.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: Report count
 function when SLAVE_MODE_DISABLED
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

T24gMi8xOS8yMSAxMDo1OSBBTSwgV2lsbGlhbSBCcmVhdGhpdHQgR3JheSB3cm90ZToKPiBXaGVu
IGluIFNMQVZFX01PREVfRElTQUJMRUQgbW9kZSwgdGhlIGNvdW50IHN0aWxsIGluY3JlYXNlcyBp
ZiB0aGUKPiBjb3VudGVyIGlzIGVuYWJsZWQgYmVjYXVzZSBhbiBpbnRlcm5hbCBjbG9jayBpcyB1
c2VkLiBUaGlzIHBhdGNoIGZpeGVzCj4gdGhlIHN0bTMyX2NvdW50X2Z1bmN0aW9uX2dldCgpIGZ1
bmN0aW9uIHRvIHByb3Blcmx5IHJlcG9ydCB0aGlzCj4gYmVoYXZpb3IuCgpIaSBXaWxsaWFtLAoK
VGhhbmtzIGZvciB0aGUgcGF0Y2gsIHRoYXQncyBzb21ldGhpbmcgSSBhbHNvIG5vdGljZWQgZWFy
bGllci4KUGxlYXNlIGZpbmQgZmV3IGNvbW1lbnQgYmVsb3cuCgo+IAo+IEZpeGVzOiBhZDI5OTM3
ZTIwNmYgKCJjb3VudGVyOiBBZGQgU1RNMzIgVGltZXIgcXVhZHJhdHVyZSBlbmNvZGVyIikKPiBD
YzogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAc3QuY29tPgo+IENjOiBNYXhpbWUg
Q29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4gQ2M6IEFsZXhhbmRyZSBUb3Jn
dWUgPGFsZXhhbmRyZS50b3JndWVAc3QuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdpbGxpYW0gQnJl
YXRoaXR0IEdyYXkgPHZpbGhlbG0uZ3JheUBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvY291
bnRlci9zdG0zMi10aW1lci1jbnQuYyB8IDMxICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMgYi9kcml2
ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKPiBpbmRleCBlZjJhOTc0YTJmMTAuLmVjNmQ5
ZTg5YzAyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMK
PiArKysgYi9kcml2ZXJzL2NvdW50ZXIvc3RtMzItdGltZXItY250LmMKPiBAQCAtNDQsMTMgKzQ0
LDE0IEBAIHN0cnVjdCBzdG0zMl90aW1lcl9jbnQgewo+ICAgKiBAU1RNMzJfQ09VTlRfRU5DT0RF
Ul9NT0RFXzM6IGNvdW50cyBvbiBib3RoIFRJMUZQMSBhbmQgVEkyRlAyIGVkZ2VzCj4gICAqLwo+
ICBlbnVtIHN0bTMyX2NvdW50X2Z1bmN0aW9uIHsKPiAtCVNUTTMyX0NPVU5UX1NMQVZFX01PREVf
RElTQUJMRUQgPSAtMSwKPiArCVNUTTMyX0NPVU5UX1NMQVZFX01PREVfRElTQUJMRUQsCj4gIAlT
VE0zMl9DT1VOVF9FTkNPREVSX01PREVfMSwKPiAgCVNUTTMyX0NPVU5UX0VOQ09ERVJfTU9ERV8y
LAo+ICAJU1RNMzJfQ09VTlRfRU5DT0RFUl9NT0RFXzMsCj4gIH07Cj4gIAo+ICBzdGF0aWMgZW51
bSBjb3VudGVyX2NvdW50X2Z1bmN0aW9uIHN0bTMyX2NvdW50X2Z1bmN0aW9uc1tdID0gewo+ICsJ
W1NUTTMyX0NPVU5UX1NMQVZFX01PREVfRElTQUJMRURdID0gQ09VTlRFUl9DT1VOVF9GVU5DVElP
Tl9JTkNSRUFTRSwKPiAgCVtTVE0zMl9DT1VOVF9FTkNPREVSX01PREVfMV0gPSBDT1VOVEVSX0NP
VU5UX0ZVTkNUSU9OX1FVQURSQVRVUkVfWDJfQSwKPiAgCVtTVE0zMl9DT1VOVF9FTkNPREVSX01P
REVfMl0gPSBDT1VOVEVSX0NPVU5UX0ZVTkNUSU9OX1FVQURSQVRVUkVfWDJfQiwKPiAgCVtTVE0z
Ml9DT1VOVF9FTkNPREVSX01PREVfM10gPSBDT1VOVEVSX0NPVU5UX0ZVTkNUSU9OX1FVQURSQVRV
UkVfWDQsCj4gQEAgLTk5LDkgKzEwMCwxMCBAQCBzdGF0aWMgaW50IHN0bTMyX2NvdW50X2Z1bmN0
aW9uX2dldChzdHJ1Y3QgY291bnRlcl9kZXZpY2UgKmNvdW50ZXIsCj4gIAljYXNlIDM6Cj4gIAkJ
KmZ1bmN0aW9uID0gU1RNMzJfQ09VTlRfRU5DT0RFUl9NT0RFXzM7Cj4gIAkJcmV0dXJuIDA7Cj4g
KwlkZWZhdWx0OgoKSSdkIHJhdGhlciBhZGQgYSAnY2FzZSAwJywgYXMgdGhhdCdzIHRoZSByZWFs
IHZhbHVlIGZvciBzbGF2ZSBtb2RlCmRpc2FibGVkLiBGb3IgcmVmZXJlbmNlLCBoZXJlJ3Mgd2hh
dCB0aGUgU1RNMzIgdGltZXIgc3BlYyBzYXlzIG9uIHNsYXZlCm1vZGUgc2VsZWN0aW9uOgowMDAw
OiBTbGF2ZSBtb2RlIGRpc2FibGVkIC0gaWYgQ0VOID0g4oCYMeKAmSB0aGVuIHRoZSBwcmVzY2Fs
ZXIgaXMgY2xvY2tlZApkaXJlY3RseSBieSB0aGUgaW50ZXJuYWwgY2xvY2suCgo+ICsJCSpmdW5j
dGlvbiA9IFNUTTMyX0NPVU5UX1NMQVZFX01PREVfRElTQUJMRUQ7Cj4gKwkJcmV0dXJuIDA7Cj4g
IAl9Cj4gLQo+IC0JcmV0dXJuIC1FSU5WQUw7CgpPdGhlciBzbGF2ZSBtb2RlcyBjb3VsZCBiZSBh
ZGRlZCBsYXRlciAobGlrZSBjb3VudGluZyBvbiBleHRlcm5hbApzaWduYWxzOiBjaGFubmVsIEEs
IEIsIEVUUiBvciBvdGhlciBzaWduYWxzKS4gQnV0IHRoaXMgaXNuJ3Qgc3VwcG9ydGVkCnJpZ2h0
IG5vdyBpbiB0aGUgZHJpdmVyLgpUaGVuIEkgc3VnZ2VzdCB0byBrZWVwIHRoZSByZXR1cm5pbmcg
LUVJTlZBTCBmb3IgdGhlIGRlZmF1bHQgY2FzZSBoZXJlLgpEbyB5b3UgYWdyZWUgd2l0aCB0aGlz
IGFwcHJvYWNoID8KCj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgc3RtMzJfY291bnRfZnVuY3Rpb25f
c2V0KHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291bnRlciwKPiBAQCAtMjc0LDMxICsyNzYsMzYg
QEAgc3RhdGljIGludCBzdG0zMl9hY3Rpb25fZ2V0KHN0cnVjdCBjb3VudGVyX2RldmljZSAqY291
bnRlciwKPiAgCXNpemVfdCBmdW5jdGlvbjsKPiAgCWludCBlcnI7Cj4gIAo+IC0JLyogRGVmYXVs
dCBhY3Rpb24gbW9kZSAoZS5nLiBTVE0zMl9DT1VOVF9TTEFWRV9NT0RFX0RJU0FCTEVEKSAqLwo+
IC0JKmFjdGlvbiA9IFNUTTMyX1NZTkFQU0VfQUNUSU9OX05PTkU7Cj4gLQo+ICAJZXJyID0gc3Rt
MzJfY291bnRfZnVuY3Rpb25fZ2V0KGNvdW50ZXIsIGNvdW50LCAmZnVuY3Rpb24pOwo+ICAJaWYg
KGVycikKPiAtCQlyZXR1cm4gMDsKPiArCQlyZXR1cm4gZXJyOwoKVGhpcyBtYWtlcyBzZW5zZSwg
aW4gY2FzZSB0aGUgZXJyb3IgcmVwb3J0aW5nIGlzIGtlcHQgYWJvdmUuIE90aGVyd2lzZSwKaXQg
YWx3YXlzIHJldHVybnMgMC4KCj4gIAo+ICAJc3dpdGNoIChmdW5jdGlvbikgewo+ICAJY2FzZSBT
VE0zMl9DT1VOVF9FTkNPREVSX01PREVfMToKPiAgCQkvKiBjb3VudHMgdXAvZG93biBvbiBUSTFG
UDEgZWRnZSBkZXBlbmRpbmcgb24gVEkyRlAyIGxldmVsICovCj4gIAkJaWYgKHN5bmFwc2UtPnNp
Z25hbC0+aWQgPT0gY291bnQtPnN5bmFwc2VzWzBdLnNpZ25hbC0+aWQpCj4gIAkJCSphY3Rpb24g
PSBTVE0zMl9TWU5BUFNFX0FDVElPTl9CT1RIX0VER0VTOwo+IC0JCWJyZWFrOwo+ICsJCWVsc2UK
PiArCQkJKmFjdGlvbiA9IFNUTTMyX1NZTkFQU0VfQUNUSU9OX05PTkU7CgpNb3JlIGEgcXVlc3Rp
b24gaGVyZS4uLgoKPiArCQlyZXR1cm4gMDsKPiAgCWNhc2UgU1RNMzJfQ09VTlRfRU5DT0RFUl9N
T0RFXzI6Cj4gIAkJLyogY291bnRzIHVwL2Rvd24gb24gVEkyRlAyIGVkZ2UgZGVwZW5kaW5nIG9u
IFRJMUZQMSBsZXZlbCAqLwo+ICAJCWlmIChzeW5hcHNlLT5zaWduYWwtPmlkID09IGNvdW50LT5z
eW5hcHNlc1sxXS5zaWduYWwtPmlkKQo+ICAJCQkqYWN0aW9uID0gU1RNMzJfU1lOQVBTRV9BQ1RJ
T05fQk9USF9FREdFUzsKPiAtCQlicmVhazsKPiArCQllbHNlCj4gKwkJCSphY3Rpb24gPSBTVE0z
Ml9TWU5BUFNFX0FDVElPTl9OT05FOwoKLi4uLCBub3QgcmVsYXRlZCB0byB5b3VyIGZpeDogSW4g
InF1YWRyYXR1cmUgeDIgYSIgb3IgInF1YWRyYXR1cmUgeDIgYiIsCnRoZSBvdGhlciBzaWduYWwg
ZGV0ZXJtaW5lcyB0aGUgY291bnRpbmcgZGlyZWN0aW9uLgpJIGZlZWwgbGlrZSB0aGlzIGlzbid0
IHJlYWxseSByZXByZXNlbnRlZCB3aXRoIHRoZSAibm9uZSIgYWN0aW9uLgoKSSBqdXN0IHJlYWxp
emVkIGlmIHdlIHdhbnQgdG8gZXh0ZW5kIHRoaXMgZHJpdmVyIHRvIGFkZCBuZXcgc2lnbmFscwoo
ZS5nLiBsaWtlIGNvdW50aW5nIG9uIGNoQSwgY2hCIG9yIGV2ZW4gYnkgYWRkaW5nIG90aGVyIHNp
Z25hbHMgbGlrZSBFVFIKb24gU1RNMzIgd2l0aCB0aGUgaW5jcmVhc2UgZnVuY3Rpb24pLCB0aGlz
IG1heSBzdGFydCB0byBiZSBjb25mdXNpbmcuCkN1cnJlbnRseSBvbmx5IHRoZSB0d28gc2lnbmFs
IG5hbWVzIGNvdWxkIGdpdmUgc29tZSBoaW50IChzbyBpdCdzIHJhdGhlcgpvYnZpb3VzIGN1cnJl
bnRseSkuCgpNYXliZSB0aGVyZSBjb3VsZCBiZSBzb21lIGNoYW5nZSBsYXRlciB0byBpbmRpY2F0
ZSB0aGUgb3RoZXIgc2lnbmFsCihjaGFubmVsIEEgb3IgY2hhbm5lbCBCKSBwYXJ0aWNpcGF0ZXMg
aW4gcXVhZHJhdHVyZSBlbmNvZGluZyA/CgoKVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMsCkZhYnJp
Y2UKCj4gKwkJcmV0dXJuIDA7Cj4gIAljYXNlIFNUTTMyX0NPVU5UX0VOQ09ERVJfTU9ERV8zOgo+
ICAJCS8qIGNvdW50cyB1cC9kb3duIG9uIGJvdGggVEkxRlAxIGFuZCBUSTJGUDIgZWRnZXMgKi8K
PiAgCQkqYWN0aW9uID0gU1RNMzJfU1lOQVBTRV9BQ1RJT05fQk9USF9FREdFUzsKPiAtCQlicmVh
azsKPiArCQlyZXR1cm4gMDsKPiArCWNhc2UgU1RNMzJfQ09VTlRfU0xBVkVfTU9ERV9ESVNBQkxF
RDoKPiArCQkvKiBjb3VudHMgb24gaW50ZXJuYWwgY2xvY2sgd2hlbiBDRU49MSAqLwo+ICsJCSph
Y3Rpb24gPSBTVE0zMl9TWU5BUFNFX0FDVElPTl9OT05FOwo+ICsJCXJldHVybiAwOwo+ICsJZGVm
YXVsdDoKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiAgCX0KPiAtCj4gLQlyZXR1cm4gMDsKPiAgfQo+
ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBjb3VudGVyX29wcyBzdG0zMl90aW1lcl9jbnRfb3Bz
ID0gewo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
