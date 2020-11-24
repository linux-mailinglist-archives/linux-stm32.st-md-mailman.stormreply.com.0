Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E32C340D
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 23:35:05 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0555CC56630;
	Tue, 24 Nov 2020 22:35:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BF682C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 22:35:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOMVtLB007251; Tue, 24 Nov 2020 23:34:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=z+RTPtSVNcxm52qSEaB20QzEW+8sFDwTaiAR30QmwZ8=;
 b=u3zOv/bCiuXkAeYVnEgs2a4DcVsrdHIIGNQAgMp4RYL6nMthY6yXKWYxoUEhmpYOs+ev
 R42t4zooAKQj+2KkL/jDdAFX9oD0UN603j9At08vkGGCbAEnkxVrQlX8nvrfpUljeoAS
 SR5kPqInJuREQtUuXxNQktyi9+8bakg3VDxSt55QwOTWxsbENffXx/pNkD1NZK5N1LB0
 98WHGIIYpJHWsDjdb17Jjfko2ZXZ7HBG3lZNzcIrFxO2U48suOFLt3SukE4zDbTRuK7A
 PsvPHl9NAOIHaAkt0HahNKWQkLk7QKy09FNjnRQdYWQBJRmMVCy+C+UphF/83bWepNTs Bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0hjc2ey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 23:34:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A10EC100034;
 Tue, 24 Nov 2020 23:34:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8787620754A;
 Tue, 24 Nov 2020 23:34:33 +0100 (CET)
Received: from [10.129.7.42] (10.75.127.48) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 23:34:32 +0100
Message-ID: <57457fcd335e7d6bfd543187de02608bcccf812f.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, <netdev@vger.kernel.org>,
 Yonglong Liu <liuyonglong@huawei.com>, Willy Liu <willy.liu@realtek.com>
Date: Tue, 24 Nov 2020 23:33:42 +0100
In-Reply-To: <7d8bf728-7d73-fa8c-d63d-49e9e6c872fd@gmail.com>
References: <20201124143848.874894-1-antonio.borneo@st.com>
 <20201124215932.885306-1-antonio.borneo@st.com>
 <7d8bf728-7d73-fa8c-d63d-49e9e6c872fd@gmail.com>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_09:2020-11-24,
 2020-11-24 signatures=0
Cc: linux-kernel@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>,
 linuxarm@huawei.com, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] net: phy: realtek: read actual speed
 on rtl8211f to detect downshift
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

T24gVHVlLCAyMDIwLTExLTI0IGF0IDIzOjIyICswMTAwLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6
Cj4gQW0gMjQuMTEuMjAyMCB1bSAyMjo1OSBzY2hyaWViIEFudG9uaW8gQm9ybmVvOgo+ID4gVGhl
IHJ0bDgyMTFmIHN1cHBvcnRzIGRvd25zaGlmdCBhbmQgYmVmb3JlIGNvbW1pdCA1NTAyYjIxOGUw
MDEKPiA+ICgibmV0OiBwaHk6IHVzZSBwaHlfcmVzb2x2ZV9hbmVnX2xpbmttb2RlIGluIGdlbnBo
eV9yZWFkX3N0YXR1cyIpCj4gPiB0aGUgcmVhZC1iYWNrIG9mIHJlZ2lzdGVyIE1JSV9DVFJMMTAw
MCB3YXMgdXNlZCB0byBkZXRlY3QgdGhlCj4gPiBuZWdvdGlhdGVkIGxpbmsgc3BlZWQuCj4gPiBU
aGUgY29kZSBhZGRlZCBpbiBjb21taXQgZDQ0NWRmZjJkZjYwICgibmV0OiBwaHk6IHJlYWx0ZWs6
IHJlYWQKPiA+IGFjdHVhbCBzcGVlZCB0byBkZXRlY3QgZG93bnNoaWZ0IikgaXMgd29ya2luZyBm
aW5lIGFsc28gZm9yIHRoaXMKPiA+IHBoeSBhbmQgaXQncyB0cml2aWFsIHJlLXVzaW5nIGl0IHRv
IHJlc3RvcmUgdGhlIGRvd25zaGlmdAo+ID4gZGV0ZWN0aW9uIG9uIHJ0bDgyMTFmLgo+ID4gCj4g
PiBBZGQgdGhlIHBoeSBzcGVjaWZpYyByZWFkX3N0YXR1cygpIHBvaW50aW5nIHRvIHRoZSBleGlz
dGluZwo+ID4gZnVuY3Rpb24gcnRsZ2VuX3JlYWRfc3RhdHVzKCkuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0BzdC5jb20+Cj4gPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzQ3OGY4NzFhLTU4M2QtMDFmMS05Y2M1LTJlZWE1NmQ4
YzJhN0BodWF3ZWkuY29tCj4gPiAtLS0KPiA+IFRvOiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4u
Y2g+Cj4gPiBUbzogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPiA+IFRv
OiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxpbnV4Lm9yZy51az4KPiA+IFRvOiAiRGF2aWQgUy4g
TWlsbGVyIiA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4KPiA+IFRvOiBKYWt1YiBLaWNpbnNraSA8a3Vi
YUBrZXJuZWwub3JnPgo+ID4gVG86IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcKPiA+IFRvOiBZb25n
bG9uZyBMaXUgPGxpdXlvbmdsb25nQGh1YXdlaS5jb20+Cj4gPiBUbzogV2lsbHkgTGl1IDx3aWxs
eS5saXVAcmVhbHRlay5jb20+Cj4gPiBDYzogbGludXhhcm1AaHVhd2VpLmNvbQo+ID4gQ2M6IFNh
bGlsIE1laHRhIDxzYWxpbC5tZWh0YUBodWF3ZWkuY29tPgo+ID4gQ2M6IGxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPiA+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnCj4gPiBJbi1SZXBseS1UbzogPDIwMjAxMTI0MTQzODQ4Ljg3NDg5NC0xLWFudG9uaW8u
Ym9ybmVvQHN0LmNvbT4KPiA+IAo+ID4gVjEgPT4gVjIKPiA+IAltb3ZlIGZyb20gYSBnZW5lcmlj
IGltcGxlbWVudGF0aW9uIGFmZmVjdGluZyBldmVyeSBwaHkKPiA+IAl0byBhIHJ0bDgyMTFmIHNw
ZWNpZmljIGltcGxlbWVudGF0aW9uCj4gPiAtLS0KPiA+IMKgZHJpdmVycy9uZXQvcGh5L3JlYWx0
ZWsuYyB8IDEgKwo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiA+IAo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3BoeS9yZWFsdGVrLmMgYi9kcml2ZXJzL25ldC9waHkv
cmVhbHRlay5jCj4gPiBpbmRleCA1NzU1ODBkM2ZmZTAuLjhmZjhhNGVkYzE3MyAxMDA2NDQKPiA+
IC0tLSBhL2RyaXZlcnMvbmV0L3BoeS9yZWFsdGVrLmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L3Bo
eS9yZWFsdGVrLmMKPiA+IEBAIC02MjEsNiArNjIxLDcgQEAgc3RhdGljIHN0cnVjdCBwaHlfZHJp
dmVyIHJlYWx0ZWtfZHJ2c1tdID0gewo+ID4gwqAJCVBIWV9JRF9NQVRDSF9FWEFDVCgweDAwMWNj
OTE2KSwKPiA+IMKgCQkubmFtZQkJPSAiUlRMODIxMUYgR2lnYWJpdCBFdGhlcm5ldCIsCj4gPiDC
oAkJLmNvbmZpZ19pbml0CT0gJnJ0bDgyMTFmX2NvbmZpZ19pbml0LAo+ID4gKwkJLnJlYWRfc3Rh
dHVzCT0gcnRsZ2VuX3JlYWRfc3RhdHVzLAo+ID4gwqAJCS5hY2tfaW50ZXJydXB0CT0gJnJ0bDgy
MTFmX2Fja19pbnRlcnJ1cHQsCj4gPiDCoAkJLmNvbmZpZ19pbnRyCT0gJnJ0bDgyMTFmX2NvbmZp
Z19pbnRyLAo+ID4gwqAJCS5zdXNwZW5kCT0gZ2VucGh5X3N1c3BlbmQsCj4gPiAKPiA+IGJhc2Ut
Y29tbWl0OiA5YmQyNzAyZDI5MmNiN2I1NjViMDllOTQ5ZDMwMjg4YWI3YTI2ZDUxCj4gPiAKPiAK
PiBQZWZlY3Qgd291bGQgYmUgdG8gbWFrZSB0aGlzIGEgZml4IGZvciA1NTAyYjIxOGUwMDEsCj4g
YnV0IHJ0bGdlbl9yZWFkX3N0YXR1cygpIHdhcyBhZGRlZCBvbmUgeWVhciBhZnRlciB0aGlzIGNo
YW5nZS4KPiBNYXJraW5nIHRoZSBjaGFuZ2UgdGhhdCBhZGRlZCBydGxnZW5fcmVhZF9zdGF0dXMo
KSBhcyAiRml4ZXMiCj4gd291bGQgYmUgdGVjaG5pY2FsbHkgb2ssIGJ1dCBhcyBpdCdzIG5vdCBh
Y3R1YWxseSBicm9rZW4gbm90Cj4gZXZlcnlib2R5IG1heSBiZSBoYXBweSB3aXRoIHRoaXMuCj4g
SGF2aW5nIHNhaWQgdGhhdCBJJ2QgYmUgZmluZSB3aXRoIHRyZWF0aW5nIHRoaXMgYXMgYW4gaW1w
cm92ZW1lbnQsCj4gZG93bnNoaWZ0IHNob3VsZCBiZSBhIHJhcmUgY2FzZS4KCkNvcnJlY3QhIEJl
aW5nIHRoZSBjb21taXQgdGhhdCBhZGRzIHJ0bGdlbl9yZWFkX3N0YXR1cygpIGFuIGltcHJvdmVt
ZW50LApzaG91bGQgbm90IGJlIGJhY2twb3J0ZWQsIHNvIHRoaXMgcGF0Y2ggaXMgbm90IG1hcmtl
ZCBhbnltb3JlIGFzIGEgZml4IQpQbHVzLCB0aGlzIGRvZXMgbm90IGZpeCA1NTAyYjIxOGUwMDEg
aW4gdGhlIGdlbmVyYWwgY2FzZSwgYnV0IGxpbWl0ZWQgdG8Kb25lIHNwZWNpZmljIHBoeSwgbWFr
aW5nIHRoZSAnZml4ZXMnIGxhYmVsIGxlc3MgcmVsZXZhbnQuCkFueXdheSwgdGhlIGNvbW1pdCBt
ZXNzYWdlIHJlcG9ydHMgYWxsIHRoZSBpbmdyZWRpZW50cyBmb3IgYSBiYWNrcG9ydC4KCkJ5IHRo
ZSB3YXksIEkgaGF2ZSBpbmNvcnJlY3RseSBzZW50IHRoaXMgYmFzZWQgb24gbmV0ZGV2LCBidXQg
aXQncyBub3QgYQpmaXggYW55bW9yZSEgU2hvdWxkIEkgcmViYXNlIGl0IG9uIG5ldGRldi1uZXh0
IGFuZCByZXNlbmQ/CgpBbnRvbmlvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
