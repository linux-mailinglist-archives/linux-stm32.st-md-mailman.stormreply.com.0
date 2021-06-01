Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C5F397385
	for <lists+linux-stm32@lfdr.de>; Tue,  1 Jun 2021 14:48:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60C56C57B5A;
	Tue,  1 Jun 2021 12:48:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9AA07C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jun 2021 12:48:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 151Clde2004573; Tue, 1 Jun 2021 14:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=z1+Wnvit74uNghN0bCNQj3HecsTBaLmiImgMis/YHwU=;
 b=m6qN6D0NZd1nY03SCvG9oPy643X1C31egKw8bmra2oATxq+McoF7xMx2fOlta7uFfA2h
 PJFzo40m6sYSPuNf8l3wa5gp5AlmfObcpWO4M2D8DwzIaCgsqAnDvk/SpeH5beTUNtnP
 1SQXU3hREOMkH8J1vIcpHxu8yPpC4/CHdbtzJwRA1M6zcQ0Ot1eNSGPxg8udNQIhGE0W
 txycQaNThTJrCMgPeGH4MSCrIAOdVsX2t6lgoJYueHn1luimRFtraLnEDfvDvbFzSGZf
 RpZEGF6XCbR9VGrjjC47fcx0bd6USzk8vuuGB+tIdput8Zwts+gVBUNz7g6VxbcevsWt HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38wjdg0xth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Jun 2021 14:48:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3C7BC10002A;
 Tue,  1 Jun 2021 14:48:12 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2565322176F;
 Tue,  1 Jun 2021 14:48:12 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.44) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 1 Jun
 2021 14:48:11 +0200
To: <dillon.minfei@gmail.com>, <pierre-yves.mordret@foss.st.com>,
 <alain.volmat@foss.st.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <mturquette@baylibre.com>
References: <1620990152-19255-1-git-send-email-dillon.minfei@gmail.com>
 <1620990152-19255-4-git-send-email-dillon.minfei@gmail.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <6ecedc1d-3b80-0eba-a5f0-8feb3eae16cf@foss.st.com>
Date: Tue, 1 Jun 2021 14:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1620990152-19255-4-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-01_06:2021-05-31,
 2021-06-01 signatures=0
Cc: sboyd@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/4] clk: stm32: Fix stm32f429's ltdc
 driver hang in set clock rate
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

SGkgRGlsbG9uCgpPbiA1LzE0LzIxIDE6MDIgUE0sIGRpbGxvbi5taW5mZWlAZ21haWwuY29tIHdy
b3RlOgo+IEZyb206IERpbGxvbiBNaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+IAo+IFRo
aXMgaXMgZHVlIHRvIG1pc3VzZSDigJhQTExfVkNPX1NBSScgYW5kJ1BMTF9TQUknIGluIGNsay1z
dG0zMmY0LmMKPiAnUExMX1NBSScgaXMgMiwgJ1BMTF9WQ09fU0FJJyBpcyA3KGRlZmluZWQgaW4K
PiBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3N0bTMyZngtY2xvY2suaCkuCj4gCj4gJ3Bvc3Rf
ZGl2JyBwb2ludCB0byAncG9zdF9kaXZfZGF0YVtdJywgJ3Bvc3RfZGl2LT5wbGxfbnVtJwo+IGlz
IFBMTF9JMlMgb3IgUExMX1NBSS4KPiAKPiAnY2xrc1tQTExfVkNPX1NBSV0nIGhhcyB2YWxpZCAn
c3RydWN0IGNsa19odyogJyByZXR1cm4KPiBmcm9tIHN0bTMyZjRfcmNjX3JlZ2lzdGVyX3BsbCgp
IGJ1dCwgYXQgbGluZSAxNzc3IG9mCj4gZHJpdmVyL2Nsay9jbGstc3RtMzJmNC5jLCB1c2UgdGhl
ICdjbGtzW3Bvc3RfZGl2LT5wbGxfbnVtXScsCj4gZXF1YWwgdG8gJ2Nsa3NbUExMX1NBSV0nLCB0
aGlzIGlzIGludmFsaWQgYXJyYXkgbWVtYmVyIGF0IHRoYXQgdGltZS4KPiAKPiBGaXhlczogNTE3
NjMzZWY2MzBlICgiY2xrOiBzdG0zMmY0OiBBZGQgcG9zdCBkaXZpc29yIGZvciBJMlMgJiBTQUkg
UExMcyIpCj4gU2lnbmVkLW9mZi1ieTogRGlsbG9uIE1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFpbC5j
b20+Cj4gQWNrZWQtYnk6IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVsLm9yZz4KPiBMaW5rOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzE1OTA1NjQ0NTMtMjQ0OTkt
Ni1naXQtc2VuZC1lbWFpbC1kaWxsb24ubWluZmVpQGdtYWlsLmNvbS8KPiAtLS0KPiAgZHJpdmVy
cy9jbGsvY2xrLXN0bTMyZjQuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Ns
ay1zdG0zMmY0LmMgYi9kcml2ZXJzL2Nsay9jbGstc3RtMzJmNC5jCj4gaW5kZXggMTgxMTdjZTVm
Zjg1Li40MmNhMmRkODZhZWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLXN0bTMyZjQu
Ywo+ICsrKyBiL2RyaXZlcnMvY2xrL2Nsay1zdG0zMmY0LmMKPiBAQCAtNTU3LDEzICs1NTcsMTMg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfZGl2X3RhYmxlIHBvc3RfZGl2cl90YWJsZVtdID0g
ewo+ICAKPiAgI2RlZmluZSBNQVhfUE9TVF9ESVYgMwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHN0
bTMyZjRfcGxsX3Bvc3RfZGl2X2RhdGEgIHBvc3RfZGl2X2RhdGFbTUFYX1BPU1RfRElWXSA9IHsK
PiAtCXsgQ0xLX0kyU1FfUERJViwgUExMX0kyUywgInBsbGkycy1xLWRpdiIsICJwbGxpMnMtcSIs
Cj4gKwl7IENMS19JMlNRX1BESVYsIFBMTF9WQ09fSTJTLCAicGxsaTJzLXEtZGl2IiwgInBsbGky
cy1xIiwKPiAgCQlDTEtfU0VUX1JBVEVfUEFSRU5ULCBTVE0zMkY0X1JDQ19EQ0tDRkdSLCAwLCA1
LCAwLCBOVUxMfSwKPiAgCj4gLQl7IENMS19TQUlRX1BESVYsIFBMTF9TQUksICJwbGxzYWktcS1k
aXYiLCAicGxsc2FpLXEiLAo+ICsJeyBDTEtfU0FJUV9QRElWLCBQTExfVkNPX1NBSSwgInBsbHNh
aS1xLWRpdiIsICJwbGxzYWktcSIsCj4gIAkJQ0xLX1NFVF9SQVRFX1BBUkVOVCwgU1RNMzJGNF9S
Q0NfRENLQ0ZHUiwgOCwgNSwgMCwgTlVMTCB9LAo+ICAKPiAtCXsgTk9fSURYLCBQTExfU0FJLCAi
cGxsc2FpLXItZGl2IiwgInBsbHNhaS1yIiwgQ0xLX1NFVF9SQVRFX1BBUkVOVCwKPiArCXsgTk9f
SURYLCBQTExfVkNPX1NBSSwgInBsbHNhaS1yLWRpdiIsICJwbGxzYWktciIsIENMS19TRVRfUkFU
RV9QQVJFTlQsCj4gIAkJU1RNMzJGNF9SQ0NfRENLQ0ZHUiwgMTYsIDIsIDAsIHBvc3RfZGl2cl90
YWJsZSB9LAo+ICB9Owo+ICAKPiAKUmV2aWV3ZWQtYnk6IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmlj
ZS5jaG90YXJkQGZvc3Muc3QuY29tPgoKVGhhbmtzClBhdHJpY2UKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
