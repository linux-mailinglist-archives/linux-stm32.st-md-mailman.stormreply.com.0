Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C8AE7EFD
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Jun 2025 12:21:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E795C32EB0;
	Wed, 25 Jun 2025 10:21:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58759C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Jun 2025 10:21:35 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P62V3v021991;
 Wed, 25 Jun 2025 12:21:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 C4yzJ1noedDWVQEaOZSM94W1Wxwn8zZ9kpiO6XR9LxU=; b=tzkHB94wRKqAwx4c
 0lvTUd/MYGBUx70suX7tiBjmz0UtKwRUjtVPIihur62TbMpXnmXpdcWmAcdp5xpW
 pJhiDVqchowhT7pV99S6j6SU6rDAOWYXhkkVwFxxMyC4wjjDYTsf0eHmDBFfiURV
 rU9kKk2Ce52GLRFVg3ZaOeyIaes040BDjPmJk81aWNwBTwCNso39GT/ejla9qTYW
 PqSVpiw4Ed0mzE2VIisvjpYOTdwxw3RJNg0AR5LWINIBu6zV9J+fp3aNyf5Y4M+D
 HRRQsYRdb9v8xpc3neYRQgJVZHr4su1XCjrpysVrcRguZdv2L4yM2cGfSe5ewNjS
 3LpBlw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dkmjryqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Jun 2025 12:21:11 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 04F1A40046;
 Wed, 25 Jun 2025 12:19:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 12132AE5D21;
 Wed, 25 Jun 2025 12:18:21 +0200 (CEST)
Received: from [10.130.77.120] (10.130.77.120) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Jun
 2025 12:18:20 +0200
Message-ID: <01dbb6cf-3ab4-4922-b301-661464c9e56d@foss.st.com>
Date: Wed, 25 Jun 2025 12:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Bruel <christian.bruel@foss.st.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <helgaas@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
References: <175068078778.15794.15418191733712827693.b4-ty@kernel.org>
 <20250624222206.GA1537968@bhelgaas>
 <3bmw76gzqjq2nmjvj7tb6gi5x233zzfrhv44uyjopl2lxyzbkh@zg5skeu62nbh>
Content-Language: en-US
In-Reply-To: <3bmw76gzqjq2nmjvj7tb6gi5x233zzfrhv44uyjopl2lxyzbkh@zg5skeu62nbh>
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
Cc: robh@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 shradha.t@samsung.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org,
 thippeswamy.havalige@amd.com, linux-kernel@vger.kernel.org, cassel@kernel.org,
 devicetree@vger.kernel.org, quic_schintav@quicinc.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 bhelgaas@google.com, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, johan+linaro@kernel.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH v12 0/9] Add STM32MP25 PCIe
	drivers
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

CgpPbiA2LzI1LzI1IDA2OjAwLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6Cj4gT24gVHVl
LCBKdW4gMjQsIDIwMjUgYXQgMDU6MjI6MDZQTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3cm90ZToK
Pj4gT24gTW9uLCBKdW4gMjMsIDIwMjUgYXQgMDY6MTM6MDdBTSAtMDYwMCwgTWFuaXZhbm5hbiBT
YWRoYXNpdmFtIHdyb3RlOgo+Pj4gT24gVHVlLCAxMCBKdW4gMjAyNSAxMTowNzowNSArMDIwMCwg
Q2hyaXN0aWFuIEJydWVsIHdyb3RlOgo+Pj4+IENoYW5nZXMgaW4gdjEyOwo+Pj4+ICAgICBGaXgg
d2FybmluZyByZXBvcnRlZCBieSBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4+
Pgo+Pj4+IENoYW5nZXMgaW4gdjExOwo+Pj4+ICAgICBBZGRyZXNzIGNvbW1lbnRzIGZyb20gTWFu
aXZhbm5hOgo+Pj4+ICAgICAtIFJDIGRyaXZlcjogRG8gbm90IGNhbGwgcG1fcnVudGltZV9nZXRf
bm9yZXN1bWUgaW4gcHJvYmUKPj4+PiAgICAgICAgICAgICAgICAgIE1vcmUgdXNlcyBvZiBkZXZf
ZXJyX3Byb2JlCj4+Pj4gICAgIC0gRVAgZHJpdmVyOiBVc2UgbGV2ZWwgdHJpZ2dlcmVkIFBFUlNU
IyBpcnEKPj4+Pgo+Pj4+IFsuLi5dCj4+Pgo+Pj4gQXBwbGllZCwgdGhhbmtzIQo+Pj4KPj4+IFsx
LzldIGR0LWJpbmRpbmdzOiBQQ0k6IEFkZCBTVE0zMk1QMjUgUENJZSBSb290IENvbXBsZXggYmlu
ZGluZ3MKPj4+ICAgICAgICBjb21taXQ6IDQxZDVjZmJkZGE3YTYxYzVkNjQ2YTU0MDM1YjY5NzIw
NWNmZjFjZjAKPj4+IFsyLzldIFBDSTogc3RtMzI6IEFkZCBQQ0llIGhvc3Qgc3VwcG9ydCBmb3Ig
U1RNMzJNUDI1Cj4+PiAgICAgICAgY29tbWl0OiBmNjExMWJjMmQ4ZmU2ZmZjNzQxNjYxMTI2YTIx
NzQ1MjMxMjRkYzExCj4+PiBbMy85XSBkdC1iaW5kaW5nczogUENJOiBBZGQgU1RNMzJNUDI1IFBD
SWUgRW5kcG9pbnQgYmluZGluZ3MKPj4+ICAgICAgICBjb21taXQ6IDIwM2NmYzRhMjM1MDZmZmI5
YzQ4ZDEzMDAzNDhjMjkwZGJmOTM2OGUKPj4+IFs0LzldIFBDSTogc3RtMzI6IEFkZCBQQ0llIEVu
ZHBvaW50IHN1cHBvcnQgZm9yIFNUTTMyTVAyNQo+Pj4gICAgICAgIGNvbW1pdDogODg2OWZiMzZh
MTA3YTlmZjE4ZGFiOGMyMjRkZTZhZmZmMWU4MWRlYwo+Pj4gWzUvOV0gTUFJTlRBSU5FUlM6IGFk
ZCBlbnRyeSBmb3IgU1QgU1RNMzJNUDI1IFBDSWUgZHJpdmVycwo+Pj4gICAgICAgIGNvbW1pdDog
MDAzOTAyZWQ3Nzc4ZDYyMDgzMTIwMjUzY2QyODJhOTExMjY3NDk4Ngo+Pgo+PiBUaGlzIGRvZXNu
J3QgYnVpbGQgZm9yIG1lIHdpdGggdGhlIGF0dGFjaGVkIGNvbmZpZzoKPj4KPj4gICAgJCBtYWtl
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzIubwo+PiAgICAgIENBTEwgICAg
c2NyaXB0cy9jaGVja3N5c2NhbGxzLnNoCj4+ICAgICAgREVTQ0VORCBvYmp0b29sCj4+ICAgICAg
SU5TVEFMTCBsaWJzdWJjbWRfaGVhZGVycwo+PiAgICAgIENDICAgICAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1zdG0zMi5vCj4+ICAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtc3RtMzIuYzogSW4gZnVuY3Rpb24g4oCYc3RtMzJfcGNpZV9zdXNwZW5kX25vaXJx4oCZ
Ogo+PiAgICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXN0bTMyLmM6ODM6MTY6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhwaW5jdHJsX3BtX3NlbGVj
dF9zbGVlcF9zdGF0ZeKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
Pj4gICAgICAgODMgfCAgICAgICAgIHJldHVybiBwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0
ZShkZXYpOwo+PiAJfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fgo+PiAgICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXN0bTMyLmM6IEluIGZ1bmN0
aW9uIOKAmHN0bTMyX3BjaWVfcmVzdW1lX25vaXJx4oCZOgo+PiAgICBkcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLXN0bTMyLmM6OTY6MjQ6IGVycm9yOiDigJhzdHJ1Y3RkZXZpY2XigJkg
aGFzIG5vIG1lbWJlciBuYW1lZCDigJhwaW5z4oCZCj4+ICAgICAgIDk2IHwgICAgICAgICBpZiAo
IUlTX0VSUihkZXYtPnBpbnMtPmluaXRfc3RhdGUpKQo+PiAJfCAgICAgICAgICAgICAgICAgICAg
ICAgIF5+Cj4+ICAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzIuYzo5Nzoy
MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHBpbmN0cmxfc2Vs
ZWN0X3N0YXRl4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+PiAg
ICAgICA5NyB8ICAgICAgICAgICAgICAgICByZXQgPSBwaW5jdHJsX3NlbGVjdF9zdGF0ZShkZXYt
PnBpbnMtPnAsIGRldi0+cGlucy0+aW5pdF9zdGF0ZSk7Cj4+IAl8ICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgo+PiAgICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLXN0bTMyLmM6OTc6NDc6IGVycm9yOiDigJhzdHJ1Y3RkZXZpY2XigJkgaGFzIG5vIG1l
bWJlciBuYW1lZCDigJhwaW5z4oCZCj4+ICAgICAgIDk3IHwgICAgICAgICAgICAgICAgIHJldCA9
IHBpbmN0cmxfc2VsZWN0X3N0YXRlKGRldi0+cGlucy0+cCwgZGV2LT5waW5zLT5pbml0X3N0YXRl
KTsKPj4gCXwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+
Cj4+ICAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtc3RtMzIuYzo5Nzo2MTogZXJy
b3I6IOKAmHN0cnVjdGRldmljZeKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmHBpbnPigJkKPj4g
ICAgICAgOTcgfCAgICAgICAgICAgICAgICAgcmV0ID0gcGluY3RybF9zZWxlY3Rfc3RhdGUoZGV2
LT5waW5zLT5wLCBkZXYtPnBpbnMtPmluaXRfc3RhdGUpOwo+PiAJfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgo+PiAgICBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLXN0bTMyLmM6OTk6MjM6IGVycm9yOiBpbXBsaWNp
dCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0
YXRl4oCZIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+PiAgICAgICA5
OSB8ICAgICAgICAgICAgICAgICByZXQgPSBwaW5jdHJsX3BtX3NlbGVjdF9kZWZhdWx0X3N0YXRl
KGRldik7Cj4+IAl8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+Cj4+Cj4gCj4gSG1tLi4uIEkgc2VlIHR3byBpc3N1ZXMgaGVyZS4gRmlyc3QgaXMs
IHdyb25nIHBpbmN0cmwgaGVhZGVyIHVzZWQuIFRoZSBjb3JyZWN0Cj4gb25lIGlzOgo+IAo+ICNp
bmNsdWRlIDxsaW51eC9waW5jdHJsL2NvbnN1bWVyLmg+CgphaCB5ZXMsIHRoZSBtaXNzaW5nIHBp
bmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUoKSBzaG91bGQgaW5kZWVkIGJlIApmaXhlZCBi
eSB1c2luZyB0aGUgY29ycmVjdCBoZWFkZXIuCgo+IAo+IFNlY29uZCBpc3N1ZSBpcyB0aGUgZHJp
dmVyIGFjY2Vzc2luZyAic3RydWN0IGRldmljZTo6cGlucyIgZGlyZWN0bHkuIFRoZSAicGlucyIK
PiBtZW1iZXIgd29uJ3QgYmUgYXZhaWxhYmxlIGlmIENPTkZJR19QSU5DVFJMIGlzIG5vdCBzZXQg
KHdoaWNoIGlzIHdoYXQgeW91cgo+IC5jb25maWcgaGFzKS4gU28gZWl0aGVyIHRoZSBtZW1iZXIg
c2hvdWxkIG5vdCBiZSBhY2Nlc3NlZCBkaXJlY3RseSBvciB0aGUKPiBkcml2ZXIgaGFzIHRvIGRl
cGVuZCBvbiBDT05GSUdfUElOQ1RSTC4gVGhlIGxhdHRlciBvbmUgaXMgbm90IGFjY2VwdGFibGUu
SXQKPiBhbHNvIGxvb2tzIHdlaXJkIHRoYXQgb25seSB0aGlzIGRyaXZlciBpcyBhY2Nlc3Npbmcg
dGhlICJwaW5zIiBtZW1iZXIgZGlyZWN0bHkKPiBhcGFydCBmcm9tIHRoZSBwaW5jdHJsIGNvcmUu
IFNvIEkgdGhpbmsgdGhpcyBwYXJ0IG5lZWRzIGEgcmV2aXNpdC4KPiAKPiBDaHJpc3RpYW4/ClRo
ZSBwaW5jdHJsICJpbml0IiBhbmQgImRlZmF1bHQiIGNvbmZpZ3VyYXRpb25zIGFyZSBtYW5hZ2Vk
IGVmZmVjdGl2ZWx5IApieSB0aGUgcHJvYmluZyBjb2RlLiBUaGUgc2FtZSBhcHByb2FjaCBpcyBy
ZXF1aXJlZCBpbiAKc3RtMzJfcGNpZV9yZXN1bWVfbm9pcnEoKS4KCkluIHRoaXMgY2FzZSwgd291
bGQgaW50cm9kdWNpbmcgYSBuZXcgaGVscGVyIGZ1bmN0aW9uLCAKcGluY3RybF9wbV9zZWxlY3Rf
aW5pdF9zdGF0ZSgpLCBiZSBwcmVmZXJhYmxlLCBldmVuIGlmIHdlIGFyZSB0aGUgb25seSAKY29u
c3VtZXI/CgpUaGFuayB5b3UKCgo+IAo+IC0gTWFuaQo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
