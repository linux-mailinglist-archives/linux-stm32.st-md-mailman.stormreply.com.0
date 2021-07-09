Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CECF3C23A3
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Jul 2021 14:43:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3922EC57B5F;
	Fri,  9 Jul 2021 12:43:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C824EC57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jul 2021 12:43:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169Cbr9d018435; Fri, 9 Jul 2021 14:43:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=VjWjX8YxlPuNBcQA/W+vKbgaRTFnqXjqqNwnc9uv62s=;
 b=1LesFDrlJAIkMhVFWaarZHOP1sNhTRBTCdYqYAYbUk7SshB4BtWNENiLVKjpRgTsRYIj
 eUGU3uZit67SJxDG/d34+qMmG7hmz/fTItlo/DfnxrVlzIbMYykuq/AJJ3C6JxdyuyqH
 KHvzDyIBQ3kpaolC2tNCh7RAOOBRnbMFNyF+J0Rz1+sNdbe5ZD7clhwBBsK9XK6/dMSV
 9/NIEYATe3jXovyxs5/4nkyEb9uon5AlvToRX1/qMy6PyLRGfhKyQQAvpEUjeiIlib6n
 gw3O924H+a7p2Q94K6COMWU+n5lquRbGVxM+tKJpcdMgHv2+c4yTFwJkU6Vl7CU/LF62 cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39pe94tsvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 14:43:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4859100034;
 Fri,  9 Jul 2021 14:43:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A80632248B3;
 Fri,  9 Jul 2021 14:43:16 +0200 (CEST)
Received: from lmecxl0993.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 9 Jul
 2021 14:43:15 +0200
To: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>, "Yannick
 FERTRE - foss" <yannick.fertre@foss.st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210708125217.11784-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <51673f9a-2f57-237b-d67a-008a9212f7b4@foss.st.com>
Date: Fri, 9 Jul 2021 14:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708125217.11784-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_05:2021-07-09,
 2021-07-09 signatures=0
Cc: Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Add Raphael Gallais-Pou as
 STM32 DRM maintainer
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

CgpPbiA3LzgvMjEgMjo1NCBQTSwgUmFwaGFlbCBHQUxMQUlTLVBPVSAtIGZvc3Mgd3JvdGU6Cj4g
QWRkIFJhcGhhZWwgR2FsbGFpcy1Qb3UgYXMgU1RNMzIgRFJNIG1haW50YWluZXIuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3Nz
LnN0LmNvbT4KPiAtLS0KPiAgIE1BSU5UQUlORVJTIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVS
Uwo+IGluZGV4IDBmMTE3MWNlYWY4Yi4uNGZhM2JmYzAwZjU3IDEwMDY0NAo+IC0tLSBhL01BSU5U
QUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtNjE2NSw2ICs2MTY1LDcgQEAgRFJNIERS
SVZFUlMgRk9SIFNUTQo+ICAgTToJWWFubmljayBGZXJ0cmUgPHlhbm5pY2suZmVydHJlQGZvc3Mu
c3QuY29tPgo+ICAgTToJUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QGZvc3Muc3QuY29t
Pgo+ICAgTToJQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+
Cj4gK006CVJhcGhhZWwgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5j
b20+CgpIaSBSYXBoYcOrbCwKV2FybSB3ZWxjb21lIG9uIGJvYXJkIQoKUmV2aWV3ZWQtYnk6IFBo
aWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBmb3NzLnN0LmNvbT4KCk5vdGU6IHlvdSBtYXkg
aGF2ZSB0byB3YWl0IGFuZCByZXNlbmQgeW91ciBwYXRjaCBhcyBCZW5qYW1pbiBzZW50IApyZWNl
bnRseSBhbiB1cGRhdGUgdG9vLgoKTWFueSB0aGFua3MKUGhpbGlwcGUgOi0pCgoKPiAgIEw6CWRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiAgIFM6CU1haW50YWluZWQKPiAgIFQ6CWdp
dCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
