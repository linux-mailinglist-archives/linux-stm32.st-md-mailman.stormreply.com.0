Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD1222C5A3
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jul 2020 14:57:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF64DC36B27;
	Fri, 24 Jul 2020 12:57:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 971D2C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jul 2020 12:57:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06OCvBYg002758; Fri, 24 Jul 2020 14:57:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=u81ztgjIJJ329cqaZ/0ZrdkPGl4LegMpe1IdzmOvXJ8=;
 b=AK0WtPv0aSmrZ9MBGxNzHF7Vouss8MhB9iwPS2EbZp/ZWxx0Z5AeG1vCuTjYXi9eqHpB
 HppYnVIazp6gFPmxCbtf87cyY9NR19Wo4LEYIw1Xc8QhIzfBwJ9j9deogKKputQT1CfW
 ApwRla7mo4RyGooh1OWHuFmz5sFLR2SVuTBjzIlLZVm4LyuIPo+Rwxcy3VTkrpSMXRLW
 OE44Uq3UmboZg1nhWSTMYdyHFvf/k02HAcPWGQIb3vUxRG6JXZ9ukQPN0EEj/+4JRsyR
 BLfTFn9X91o+f0z7NaLPdbUK9zwbwYf5Pnf0zCio89ag2lKl5Zra0PxxBK7OxLxwkpXU nA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32bs6vg63r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 14:57:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 33AEF100034;
 Fri, 24 Jul 2020 14:57:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BF752A4D8E;
 Fri, 24 Jul 2020 14:57:07 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 24 Jul
 2020 14:57:06 +0200
To: Alexandre Torgue <alexandre.torgue@st.com>, Felipe Balbi
 <balbi@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20200616140717.28465-1-amelie.delaunay@st.com>
 <d8069a78-2640-d112-a2fb-d86b99a8e44f@st.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <97cd44c1-9e19-94bc-54f8-204d79b79975@st.com>
Date: Fri, 24 Jul 2020 14:57:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d8069a78-2640-d112-a2fb-d86b99a8e44f@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_04:2020-07-24,
 2020-07-24 signatures=0
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Minas Harutyunyan <hminas@synopsys.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Add USB role switch support to DWC2
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

SGkgRmVsaXBlLAoKSSBzYXcgdGhhdCB5b3UgdG9vayBEVCBwYXRjaCAoQVJNOiBkdHM6IHN0bTMy
OiBlbmFibGUgdXNiLXJvbGUtc3dpdGNoIG9uIApVU0IgT1RHIG9uIHN0bTMybXAxNXh4LWRreCkg
aW4geW91ciBuZXh0IGJyYW5jaC4gQXMgaXQgd2FzIGFscmVhZHkgaW4KQWxleCcgc3RtMzItbmV4
dCBicmFuY2gsIGEgcG90ZW50aWFsIG1lcmdlIGNvbmZsaWN0IGNvdWxkIG9jY3VycmVkLgoKUmVn
YXJkcywKQW1lbGllCgpPbiA3LzIxLzIwIDEwOjU0IEFNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3Rl
Ogo+IEhpIEFtw6lsaWUKPiAKPiBPbiA2LzE2LzIwIDQ6MDcgUE0sIEFtZWxpZSBEZWxhdW5heSB3
cm90ZToKPj4gV2hlbiB1c2luZyB1c2ItYyBjb25uZWN0b3IgKGJ1dCBpdCBjYW4gYWxzbyBiZSB0
aGUgY2FzZSB3aXRoIGEgbWljcm8tYgo+PiBjb25uZWN0b3IpLCBpZGRpZywgYXZhbGlkLCBidmFs
aWQsIHZidXN2YWxpZCBpbnB1dCBzaWduYWxzIG1heSBub3QgYmUKPj4gY29ubmVjdGVkIHRvIHRo
ZSBEV0MyIE9URyBjb250cm9sbGVyLgo+PiBEV0MyIE9URyBjb250cm9sbGVyIGZlYXR1cmVzIGFu
IG92ZXJyaWRpbmcgY29udHJvbCBvZiB0aGUgUEhZIHZvbHRhZ2UgCj4+IHZhbGlkCj4+IGFuZCBJ
RCBpbnB1dCBzaWduYWxzLgo+PiBTbywgbWlzc2luZyBzaWduYWxzIGNhbiBiZSBmb3JjZWQgdXNp
bmcgdXNiIHJvbGUgZnJvbSB1c2Igcm9sZSBzd2l0Y2ggYW5kCj4+IHRoaXMgb3ZlcnJpZGUgZmVh
dHVyZS4KPj4KPj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB1c2Igcm9sZSBzd2l0Y2gg
dG8gZHdjMiwgYnkgdXNpbmcgb3ZlcnJpZGluZwo+PiBjb250cm9sIG9mIHRoZSBQSFkgdm9sdGFn
ZSB2YWxpZCBhbmQgSUQgaW5wdXQgc2lnbmFscy4KPj4KPj4gSXQgaGFzIGJlZW4gdGVzdGVkIG9u
IHN0bTMybXAxNTdjLWRrMiBbMV0sIHdoaWNoIGhhcyBhIFR5cGUtQyBjb25uZWN0b3IKPj4gbWFu
YWdlZCBieSBhIFR5cGUtQyBwb3J0IGNvbnRyb2xsZXIsIGFuZCBjb25uZWN0ZWQgdG8gVVNCIE9U
RyBjb250cm9sbGVyLgo+Pgo+PiBbMV0gaHR0cHM6Ly93d3cuc3QuY29tL2VuL2V2YWx1YXRpb24t
dG9vbHMvc3RtMzJtcDE1N2MtZGsyLmh0bWwKPj4KPj4gQW1lbGllIERlbGF1bmF5ICgzKToKPj4g
wqDCoCB1c2I6IGR3YzI6IG92ZXJyaWRlIFBIWSBpbnB1dCBzaWduYWxzIHdpdGggdXNiIHJvbGUg
c3dpdGNoIHN1cHBvcnQKPj4gwqDCoCB1c2I6IGR3YzI6IGRvbid0IHVzZSBJRC9WYnVzIGRldGVj
dGlvbiBpZiB1c2Itcm9sZS1zd2l0Y2ggb24gU1RNMzJNUDE1Cj4+IMKgwqDCoMKgIFNvQ3MKPj4g
wqDCoCBBUk06IGR0czogc3RtMzI6IGVuYWJsZSB1c2Itcm9sZS1zd2l0Y2ggb24gVVNCIE9URyBv
biBzdG0zMm1wMTV4eC1ka3gKPj4KPj4gwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgt
ZGt4LmR0c2kgfMKgwqAgMiArLQo+PiDCoCBkcml2ZXJzL3VzYi9kd2MyL0tjb25maWfCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+PiDCoCBkcml2ZXJzL3VzYi9kd2MyL01h
a2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArLQo+PiDCoCBkcml2ZXJz
L3VzYi9kd2MyL2NvcmUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA4ICsr
Cj4+IMKgIGRyaXZlcnMvdXNiL2R3YzIvZHJkLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDE5MCArKysrKysrKysrKysrKysrKysrKysrKysrCj4+IMKgIGRyaXZlcnMvdXNiL2R3
YzIvZ2FkZ2V0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4+IMKgIGRy
aXZlcnMvdXNiL2R3YzIvcGFyYW1zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0
ICstCj4+IMKgIGRyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDEzICsrCj4+IMKgIDggZmlsZXMgY2hhbmdlZCwgMjE4IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3VzYi9kd2MyL2Ry
ZC5jCj4+Cj4gCj4gRFQgcGF0Y2ggYXBwbGllZCBvbiBzdG0zMi1uZXh0Lgo+IAo+IFRoYW5rcwo+
IEFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
