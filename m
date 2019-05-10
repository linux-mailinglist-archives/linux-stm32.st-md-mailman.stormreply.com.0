Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BA41A128
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 18:18:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 428A9CA8E59
	for <lists+linux-stm32@lfdr.de>; Fri, 10 May 2019 16:18:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DACBCA8E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 May 2019 16:18:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AG6Ouu020346; Fri, 10 May 2019 18:18:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=PguXOvYkF+R79Fad+g6HPIvHZAK+tnsbwJxd4RZ8Mx4=;
 b=i/L4kcrTl7DXUVkY0YdNfr6IRCUyA7WGFDtEagrEckJT5I4igDv6h1RNulFqbHJfYkDT
 O8vlf5BZVjo7ohkjWmFR39yLSHQivMNgLHoSXTMcfNbEr8RpDIsQdQsdqDXOKVTnIe9t
 t4xZxaJvilIocOGaA7cNUKYbUw2Rk0bJCQLbp1ar376BQSPXdvA1bxvEhKYKYe9hC7nb
 AGXYJx4Uq54iu6zScrRLI9QzUlHhvTIDfTVp3R6Xl0N9s/tUnxm5TlVuAHA5CK4NnLL8
 y1Pum3mltzyfhRmfRESk7TR4AVnNoS4RxITV4t8nVSi7LObh23Ylk6Hpiyg0+lVKSa4+ Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2sqt2-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 18:18:27 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C869E34;
 Fri, 10 May 2019 16:18:26 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AD3192C3B;
 Fri, 10 May 2019 16:18:26 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 10 May
 2019 18:18:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Fri, 10 May 2019 18:18:26 +0200
From: Philippe CORNU <philippe.cornu@st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Benjamin GAIGNARD
 <benjamin.gaignard@st.com>, Vincent ABRIOU <vincent.abriou@st.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v2 3/5] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c
Thread-Index: AQHVBzuHStnNA/lFBEOhBVwWTTwHpKZkZ/0A
Date: Fri, 10 May 2019 16:18:26 +0000
Message-ID: <43d17eda-0359-fb20-06ba-bfc5b7aabb75@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
 <1557498023-10766-4-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1557498023-10766-4-git-send-email-yannick.fertre@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <68ED2B94F2BEF544BE9EB562CB0F19E6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH v2 3/5] ARM: dts: stm32: add
 phy-dsi-supply property on stm32mp157c
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

RGVhciBZYW5uaWNrLA0KVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLA0KDQpSZXZpZXdlZC1ieTog
UGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QHN0LmNvbT4NCg0KUGhpbGlwcGUgOi0pDQoN
Ck9uIDUvMTAvMTkgNDoyMCBQTSwgWWFubmljayBGZXJ0csOpIHdyb3RlOg0KPiBUaGUgZHNpIHBo
eXNpY2FsIGxheWVyIGlzIHBvd2VyZWQgYnkgdGhlIDF2OCBwb3dlciBjb250cm9sbGVyIHN1cHBs
eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFubmljay5mZXJ0cmVA
c3QuY29tPg0KPiAtLS0NCj4gICBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpIHwg
MSArDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMybXAxNTdjLmR0c2kNCj4gaW5kZXggMmFmZWVlNi4uNmIxNGYxZSAxMDA2NDQNCj4gLS0t
IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaQ0KPiArKysgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpDQo+IEBAIC0xMTU2LDYgKzExNTYsNyBAQA0KPiAgIAkJ
CWNsb2NrLW5hbWVzID0gInBjbGsiLCAicmVmIiwgInB4X2NsayI7DQo+ICAgCQkJcmVzZXRzID0g
PCZyY2MgRFNJX1I+Ow0KPiAgIAkJCXJlc2V0LW5hbWVzID0gImFwYiI7DQo+ICsJCQlwaHktZHNp
LXN1cHBseSA9IDwmcmVnMTg+Ow0KPiAgIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICAgCQl9
Ow0KPiAgIA0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
