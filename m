Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A21557EE37
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2019 10:01:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C8CBC35E04;
	Fri,  2 Aug 2019 08:01:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B26E2C35E01
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2019 08:01:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x727l47J024706; Fri, 2 Aug 2019 10:01:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=80WZ1+E55pChQRiPbqt3WX05FkkFhBCqjh5SB5ZS5fU=;
 b=Tdcdoko4/Ul2MgZc8VNexIOx7Y7AdHu0tU6ZmZO1RCcaDlQ4Mm6S8BAXI/d0Bf4w/x5L
 PAtYTxeQa+6OXF+NzoIZ0+eVWgGSasfPZguOPE3Rnl8yMPv2XXu7Q3aI37WdCCklP8by
 IXuDY+jcWMyaFmqJmTXT9GOzAjAexdHNR+CLIEChJXig3RgwC5XozwV61XbIyhVM7q0t
 cbah+wX39NhXVPHhzInc/ICWKjTihpL8QFcOrmXOF9tlSFh1SsaTJCTeP6KTOHhc7qYW
 qv9IcqYepZqae+BM6Ztto0C1didEPB6CzEXuGish6odXbSUZVoV/WDD+VVN/YvNLMrH3 Zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2u2jp4t4w2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 02 Aug 2019 10:01:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D1CA646;
 Fri,  2 Aug 2019 08:01:41 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ACC2F207407;
 Fri,  2 Aug 2019 10:01:41 +0200 (CEST)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 2 Aug
 2019 10:01:41 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Fri, 2 Aug 2019 10:01:41 +0200
From: Yannick FERTRE <yannick.fertre@st.com>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 Philippe CORNU <philippe.cornu@st.com>, Fabrice GASNIER
 <fabrice.gasnier@st.com>
Thread-Topic: [PATCH] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c-ev1
Thread-Index: AQHVRhn/pZrojeZIhUaYEdH8ko+CKKbnXDWAgAAHFwA=
Date: Fri, 2 Aug 2019 08:01:40 +0000
Message-ID: <4e53ec28-0368-7ad8-1397-4d3d3172f02e@st.com>
References: <1564410548-20436-1-git-send-email-yannick.fertre@st.com>
 <346d04ad-17ed-40c8-f10a-b13a2ea79d92@st.com>
In-Reply-To: <346d04ad-17ed-40c8-f10a-b13a2ea79d92@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <DDDF93E406C16842AF9F6D3FE37A2808@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_04:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: add phy-dsi-supply
 property on stm32mp157c-ev1
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

TWFueSB0aGFua3MgQWxleC4NCg0KT24gOC8yLzE5IDk6MzYgQU0sIEFsZXhhbmRyZSBUb3JndWUg
d3JvdGU6DQo+IEhpIFlhbm5pY2sNCj4NCj4gT24gNy8yOS8xOSA0OjI5IFBNLCBZYW5uaWNrIEZl
cnRyw6kgd3JvdGU6DQo+PiBUaGUgZHNpIHBoeXNpY2FsIGxheWVyIGlzIHBvd2VyZWQgYnkgdGhl
IDF2OCBwb3dlciBjb250cm9sbGVyIHN1cHBseS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5u
aWNrIEZlcnRyw6kgPHlhbm5pY2suZmVydHJlQHN0LmNvbT4NCj4+IC0tLQ0KPj4gwqAgYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZXYxLmR0cyB8IDEgKw0KPj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLWV2MS5kdHMgDQo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdj
LWV2MS5kdHMNCj4+IGluZGV4IGZlYjhmNzcuLjE5ZDY5ZDAgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzDQo+PiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1ldjEuZHRzDQo+PiBAQCAtMTAxLDYgKzEwMSw3IEBADQo+PiDCoCAm
ZHNpIHsNCj4+IMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+PiDCoMKgwqDCoMKg
ICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gK8KgwqDCoCBwaHktZHNpLXN1cHBseSA9IDwmcmVnMTg+
Ow0KPj4gwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7DQo+PiDCoCDCoMKgwqDCoMKgIHBvcnRz
IHsNCj4+DQo+DQo+IEFwcGxpZWQgb24gc3RtMzItbmV4dC4NCj4NCj4gVGhhbmtzLg0KPiBBbGV4
DQotLSANCllhbm5pY2sgRmVydHLDqSB8IFRJTkE6IDE2NiA3MTUyIHwgVGVsOiArMzMgMjQ0MDI3
MTUyIHwgTW9iaWxlOiArMzMgNjIwNjAwMjcwDQpNaWNyb2NvbnRyb2xsZXJzIGFuZCBEaWdpdGFs
IElDcyBHcm91cCB8IE1pY3JvY29udHJvbGxldXJzIERpdmlzaW9uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
