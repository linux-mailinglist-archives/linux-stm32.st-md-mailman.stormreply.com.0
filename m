Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E6D275492
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 11:32:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 010C8C3FAD5;
	Wed, 23 Sep 2020 09:32:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 849F8C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 09:32:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08N9RfZF025147; Wed, 23 Sep 2020 11:31:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=lzbFRFsz/R6jt9tD1gxmeXbe10XEpYjyF4q6GDF0eY8=;
 b=HKRLjl+N+kCvWIU+T8HEO7D2PQY4QJBEjKqWVe5uagmlRjLoAeZJSpJjvSdsU4rwHWEy
 UZCY02zB8HxV5loJRqnUzLBXK98D+Mk4uzbkMdfPJHLaQ0mVqhGmE2HsMgZzEgTgIMf5
 rhRB+OAXurla8GpssLSBR5Ag/2UURowVc5xjZiyiJ2V1Bm9lW88i97I3yveMvAft2O5q
 wam7e2SszUnMHl9olK7KowhNixT0PUDAR7v4sAw4Rm0bNc2HVvD1Sp+6EyrSouI3lRTf
 BJD1T0gyvI4vEU3FiOw3/Jl61qPenABA41LE0/rUrWPVu6fL8kx9I6tegp1IoD/zmots 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n8vewct2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Sep 2020 11:31:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C692910002A;
 Wed, 23 Sep 2020 11:31:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D01B22A5612;
 Wed, 23 Sep 2020 11:31:39 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 23 Sep
 2020 11:31:17 +0200
To: Jun Li <lijun.kernel@gmail.com>
References: <20200902075707.9052-1-amelie.delaunay@st.com>
 <20200902075707.9052-2-amelie.delaunay@st.com>
 <CAKgpwJWPWFF_yWC0N_7qPONpWCN8U8tKVJ5Ctr1DGqXd_FyWkA@mail.gmail.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <31ee8d7c-00b0-0ae1-eea1-e245f215c586@st.com>
Date: Wed, 23 Sep 2020 11:31:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKgpwJWPWFF_yWC0N_7qPONpWCN8U8tKVJ5Ctr1DGqXd_FyWkA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-23_03:2020-09-23,
 2020-09-23 signatures=0
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 1/6] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

CgpPbiA5LzIzLzIwIDExOjA4IEFNLCBKdW4gTGkgd3JvdGU6Cj4gQW1lbGllIERlbGF1bmF5IDxh
bWVsaWUuZGVsYXVuYXlAc3QuY29tPiDkuo4yMDIw5bm0OeaciDLml6XlkajkuIkg5LiL5Y2INDow
MeWGmemBk++8mgo+Pgo+PiBQb3dlciBvcGVyYXRpb24gbW9kZSBtYXkgZGVwZW5kcyBvbiBoYXJk
d2FyZSBkZXNpZ24sIHNvLCBhZGQgdGhlIG9wdGlvbmFsCj4+IHByb3BlcnR5IHBvd2VyLW9wbW9k
ZSBmb3IgdXNiLWMgY29ubmVjdG9yIHRvIHNlbGVjdCB0aGUgcG93ZXIgb3BlcmF0aW9uCj4+IG1v
ZGUgY2FwYWJpbGl0eS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVs
aWUuZGVsYXVuYXlAc3QuY29tPgo+PiAtLS0KPj4gQ2hhbmdlcyBpbiB2MjoKPj4gLSBBZGQgZGVz
Y3JpcHRpb24gZm9yIHBvc3NpYmxlIG9wZXJhdGlvbiBjdXJyZW50IHZhbHVlcwo+PiAtLS0KPj4g
ICAuLi4vYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCAgICAgfCAyMCArKysr
KysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPj4K
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0
b3IvdXNiLWNvbm5lY3Rvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwKPj4gaW5kZXggOWJkNTJlNjNjOTM1Li4yZmQ4
NWI5YTdlMWEgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sCj4+IEBAIC04OCw2
ICs4OCwyNiBAQCBwcm9wZXJ0aWVzOgo+PiAgICAgICAgIC0gZGV2aWNlCj4+ICAgICAgICAgLSBk
dWFsCj4+Cj4+ICsgIHBvd2VyLW9wbW9kZToKPj4gKyAgICBkZXNjcmlwdGlvbjogRGV0ZXJtaW5l
cyB0aGUgcG93ZXIgb3BlcmF0aW9uIG1vZGUgdGhhdCB0aGUgVHlwZSBDIGNvbm5lY3Rvcgo+PiAr
ICAgICAgd2lsbCBzdXBwb3J0IGFuZCB3aWxsIGFkdmVydGlzZSB0aHJvdWdoIENDIHBpbnMuCj4+
ICsgICAgICAtICJkZWZhdWx0IiBjb3JyZXNwb25kcyB0byBkZWZhdWx0IFVTQiB2b2x0YWdlIGFu
ZCBjdXJyZW50IGRlZmluZWQgYnkgdGhlCj4+ICsgICAgICAgIFVTQiAyLjAgYW5kIFVTQiAzLjIg
c3BlY2lmaWNhdGlvbnMsIDVWIDUwMG1BIGZvciBVU0IgMi4wIHBvcnRzIGFuZAo+PiArICAgICAg
ICA1ViA5MDBtQSBvciAxNTAwbUEgZm9yIFVTQiAzLjIgcG9ydHMgaW4gc2luZ2xlLWxhbmUgb3Ig
ZHVhbC1sYW5lCj4+ICsgICAgICAgIG9wZXJhdGlvbiByZXNwZWN0aXZlbHkuCj4+ICsgICAgICAt
ICIxLjVBIiBhbmQgIjMuMEEiLCA1ViAxLjVBIGFuZCA1ViAzLjBBIHJlc3BlY3RpdmVseSwgYXMg
ZGVmaW5lZCBpbiBVU0IKPj4gKyAgICAgICAgVHlwZS1DIENhYmxlIGFuZCBDb25uZWN0b3Igc3Bl
Y2lmaWNhdGlvbiwgd2hlbiBQb3dlciBEZWxpdmVyeSBpcyBub3QKPj4gKyAgICAgICAgc3VwcG9y
dGVkLgo+PiArICAgICAgLSAidXNiX3Bvd2VyX2RlbGl2ZXJ5IiB3aGVuIFBvd2VyIERlbGl2ZXJ5
IGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5lZCBpbgo+PiArICAgICAgICBVU0IgUG93ZXIgRGVsaXZl
cnkgc3BlY2lmaWNhdGlvbi4KPiAKPiBXaHkgbmVlZCAidXNiX3Bvd2VyX2RlbGl2ZXJ5Ij8gaXNu
J3QgdGhpcyBpbmZvcm1hdGlvbiBjYW4gYmUgaW1wbGllZCBieQo+IGV4aXN0aW5nIHByb3BlcnRp
ZXMgbGlrZSBpZiAic291cmNlLXBkb3MiIGlzIHByZXNlbnQ/Cj4gCgpwb3dlci1vcG1vZGUgaXMg
YW4gb3B0aW9uYWwgcHJvcGVydHkuCnVzYl9wb3dlcl9kZWxpdmVyeSwgYXMgMy4wQSwgMS41QSBv
ciBkZWZhdWx0IGhlcmUsIG9ubHkgcmVmbGVjdCB0aGUgCnBvc3NpYmxlIHBvd2VyIG9wZXJhdGlv
biBtb2RlIHlvdSBjYW4gc2V0IGFuZCB0aGF0IGFyZSB1bmRlcnN0b29kIGJ5IAp0eXBlYyBjbGFz
czoKc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0eXBlY19wd3Jfb3Btb2Rlc1tdID0gewoJW1RZ
UEVDX1BXUl9NT0RFX1VTQl0JPSAiZGVmYXVsdCIsCglbVFlQRUNfUFdSX01PREVfMV81QV0JPSAi
MS41QSIsCglbVFlQRUNfUFdSX01PREVfM18wQV0JPSAiMy4wQSIsCglbVFlQRUNfUFdSX01PREVf
UERdCT0gInVzYl9wb3dlcl9kZWxpdmVyeSIsCn07CgpCdXQgSSBndWVzcyB0aGF0IGEgVHlwZS1D
IGNvbnRyb2xsZXIgd2l0aCB1c2IgcG93ZXIgZGVsaXZlcnkgc3VwcG9ydCAKd29uJ3QgdXNlIHBv
d2VyLW9wbW9kZSBwcm9wZXJ0eSBidXQgcmF0aGVyIHNvdXJjZS9zaW5rLXBkb3MuCgpwb3dlci1v
cG1vZGUgc2hvd3Mgd2hhdCB3aWxsIGJlIGFkdmVydGlzZWQgdGhyb3VnaCBDQyBwaW5zLiBJIGNh
biByZW1vdmUgCnVzYl9wb3dlcl9kZWxpdmVyeSBmcm9tIHRoZSBwb3NzaWJsZSB2YWx1ZXMsIGJ1
dCB3aGF0IGFib3V0IHRoZSB1c2VyIHdobyAKd2lsbCBhZGQgcG93ZXItb3Btb2RlIHByb3BlcnR5
IHRvIGNvbmZpZ3VyZSBoaXMgVHlwZS1DIGNvbnRyb2xsZXIgd2l0aCAKVVNCIHBvd2VyIGRlbGl2
ZXJ5IHN1cHBvcnQgKHNpbmsgYW5kL29yIHNvdXJjZSBieSB0aGUgd2F5KSA/ClNob3VsZCBJIHJl
c3RyaWN0IHRoZSB1c2Ugb2YgcG93ZXItb3Btb2RlIHRvIG5vbi1VU0IgcG93ZXIgZGVsaXZlcnkg
ClR5cGUtQyBjb250cm9sbGVycyA/ClBsZWFzZSBhZHZpc2UuCgpSZWdhcmRzLApBbWVsaWUKCgo+
IExpIEp1bgo+PiArICAgIGFsbE9mOgo+PiArICAgICAgLSAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sI2RlZmluaXRpb25zL3N0cmluZwo+PiArICAgIGVudW06Cj4+ICsgICAgICAtIGRlZmF1bHQK
Pj4gKyAgICAgIC0gMS41QQo+PiArICAgICAgLSAzLjBBCj4+ICsgICAgICAtIHVzYl9wb3dlcl9k
ZWxpdmVyeQo+PiArCj4+ICAgICAjIFRoZSBmb2xsb3dpbmcgYXJlIG9wdGlvbmFsIHByb3BlcnRp
ZXMgZm9yICJ1c2ItYy1jb25uZWN0b3IiIHdpdGggcG93ZXIKPj4gICAgICMgZGVsaXZlcnkgc3Vw
cG9ydC4KPj4gICAgIHNvdXJjZS1wZG9zOgo+PiAtLQo+PiAyLjE3LjEKPj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
