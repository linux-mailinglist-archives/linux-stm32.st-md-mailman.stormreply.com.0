Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6210B159221
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Feb 2020 15:44:40 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11980C36B0B;
	Tue, 11 Feb 2020 14:44:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 350A3C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Feb 2020 14:44:38 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01BEiRXu032757; Tue, 11 Feb 2020 15:44:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=zMrqEZqOCVnlA3/9d0Rc7Rgo4RLOby/Y5h96V1K6k5k=;
 b=GtWzjgWpZQmghAi169LU0uuY4j7UF/y4Gxjub5zSHljucQ9SciIS1fLFx8NgjERgpEqd
 wD2ePTUv/IS4QpFL9ashW1yofY0nK/2ZRkTrwnh5vpa39jIgJSyf0bP0MsxLWB3JnPwC
 c1nSsQxR/ELJ1NNAZiSh6qB5VMdSGOdzJw/piJ0VJCKihyErlkdRkV9gaiGiZggHXRb3
 JKG1oAfc3Pk3dP48IbxrRU1u7fZArbuL1j1hAOco7JtMhjlz4ZZv7pVn4VOAXp9fdizr
 uotji9CPN2DDHDLLtx4hKF92yFf7FnBzwHslCu1jX0mj3fq8XgNV6R/j+ka/1TtPFeHt PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufh5xf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Feb 2020 15:44:28 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6748F100046;
 Tue, 11 Feb 2020 15:44:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 535752BD3FC;
 Tue, 11 Feb 2020 15:44:18 +0100 (CET)
Received: from lmecxl0923.lme.st.com (10.75.127.48) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 11 Feb
 2020 15:44:17 +0100
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
References: <20200128090636.13689-1-ludovic.barre@st.com>
 <20200128090636.13689-10-ludovic.barre@st.com>
From: Ludovic BARRE <ludovic.barre@st.com>
Message-ID: <853f4b14-a188-f329-34e5-8e88fcafa775@st.com>
Date: Tue, 11 Feb 2020 15:44:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20200128090636.13689-10-ludovic.barre@st.com>
Content-Language: fr
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-11_04:2020-02-10,
 2020-02-11 signatures=0
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, srinivas.kandagatla@linaro.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH V2 9/9] mmc: mmci: add sdmmc variant
	revision 2.0
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

aGkgVWxmCgpMZSAxLzI4LzIwIMOgIDEwOjA2IEFNLCBMdWRvdmljIEJhcnJlIGEgw6ljcml0wqA6
Cj4gVGhpcyBwYXRjaCBhZGRzIGEgc2RtbWMgdmFyaWFudCByZXZpc2lvbiAyLjAuCj4gVGhpcyBy
ZXZpc2lvbiBpcyBiYWNrd2FyZCBjb21wYXRpYmxlIHdpdGggMS4xLCBhbmQgYWRkcyBkbWEKPiBs
aW5rIGxpc3Qgc3VwcG9ydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWRvdmljIEJhcnJlIDxsdWRv
dmljLmJhcnJlQHN0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbW1jL2hvc3QvbW1jaS5jIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L21tY2kuYyBiL2Ry
aXZlcnMvbW1jL2hvc3QvbW1jaS5jCj4gaW5kZXggMjRlNjMwMTgzZWQ0Li5hNzc0YzMyOWMyMTIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tbWNpLmMKPiArKysgYi9kcml2ZXJzL21t
Yy9ob3N0L21tY2kuYwo+IEBAIC0yNzUsNiArMjc1LDMxIEBAIHN0YXRpYyBzdHJ1Y3QgdmFyaWFu
dF9kYXRhIHZhcmlhbnRfc3RtMzJfc2RtbWMgPSB7Cj4gICAJLmluaXQJCQk9IHNkbW1jX3Zhcmlh
bnRfaW5pdCwKPiAgIH07Cj4gICAKPiArc3RhdGljIHN0cnVjdCB2YXJpYW50X2RhdGEgdmFyaWFu
dF9zdG0zMl9zZG1tY3YyID0gewo+ICsJLmZpZm9zaXplCQk9IDE2ICogNCwKPiArCS5maWZvaGFs
ZnNpemUJCT0gOCAqIDQsCj4gKwkuZl9tYXgJCQk9IDIwODAwMDAwMCwKPiArCS5zdG0zMl9jbGtk
aXYJCT0gdHJ1ZSwKPiArCS5jbWRyZWdfY3BzbV9lbmFibGUJPSBNQ0lfQ1BTTV9TVE0zMl9FTkFC
TEUsCj4gKwkuY21kcmVnX2xyc3BfY3JjCT0gTUNJX0NQU01fU1RNMzJfTFJTUF9DUkMsCj4gKwku
Y21kcmVnX3Nyc3BfY3JjCT0gTUNJX0NQU01fU1RNMzJfU1JTUF9DUkMsCj4gKwkuY21kcmVnX3Ny
c3AJCT0gTUNJX0NQU01fU1RNMzJfU1JTUCwKPiArCS5jbWRyZWdfc3RvcAkJPSBNQ0lfQ1BTTV9T
VE0zMl9DTURTVE9QLAo+ICsJLmRhdGFfY21kX2VuYWJsZQk9IE1DSV9DUFNNX1NUTTMyX0NNRFRS
QU5TLAo+ICsJLmlycV9waW9fbWFzawkJPSBNQ0lfSVJRX1BJT19TVE0zMl9NQVNLLAo+ICsJLmRh
dGFjdHJsX2ZpcnN0CQk9IHRydWUsCj4gKwkuZGF0YWNudF91c2VsZXNzCT0gdHJ1ZSwKPiArCS5k
YXRhbGVuZ3RoX2JpdHMJPSAyNSwKPiArCS5kYXRhY3RybF9ibG9ja3N6CT0gMTQsCj4gKwkuZGF0
YWN0cmxfYW55X2Jsb2Nrc3oJPSB0cnVlLAo+ICsJLnN0bTMyX2lkbWFic2l6ZV9tYXNrCT0gR0VO
TUFTSygxNiwgNSksCj4gKwkuZG1hX2xsaQkJPSB0cnVlLAo+ICsJLmJ1c3lfdGltZW91dAkJPSB0
cnVlLAoKSSBmb3JnZXQgImJ1c3lfZGV0ZWN0CQk9IHRydWUsIiBwcm9wZXJ0eQpJIGFkZCB0aGlz
IGluIG5leHQgcGF0Y2ggc2V0Cgo+ICsJLmJ1c3lfZGV0ZWN0X2ZsYWcJPSBNQ0lfU1RNMzJfQlVT
WUQwLAo+ICsJLmJ1c3lfZGV0ZWN0X21hc2sJPSBNQ0lfU1RNMzJfQlVTWUQwRU5ETUFTSywKPiAr
CS5pbml0CQkJPSBzZG1tY192YXJpYW50X2luaXQsCj4gK307Cj4gKwo+ICAgc3RhdGljIHN0cnVj
dCB2YXJpYW50X2RhdGEgdmFyaWFudF9xY29tID0gewo+ICAgCS5maWZvc2l6ZQkJPSAxNiAqIDQs
Cj4gICAJLmZpZm9oYWxmc2l6ZQkJPSA4ICogNCwKPiBAQCAtMjM0Myw2ICsyMzY4LDExIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgYW1iYV9pZCBtbWNpX2lkc1tdID0gewo+ICAgCQkubWFzawk9IDB4
ZjBmZmZmZmYsCj4gICAJCS5kYXRhCT0gJnZhcmlhbnRfc3RtMzJfc2RtbWMsCj4gICAJfSwKPiAr
CXsKPiArCQkuaWQgICAgID0gMHgwMDI1MzE4MCwKPiArCQkubWFzawk9IDB4ZjBmZmZmZmYsCj4g
KwkJLmRhdGEJPSAmdmFyaWFudF9zdG0zMl9zZG1tY3YyLAo+ICsJfSwKPiAgIAkvKiBRdWFsY29t
bSB2YXJpYW50cyAqLwo+ICAgCXsKPiAgIAkJLmlkICAgICA9IDB4MDAwNTExODAsCj4gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
