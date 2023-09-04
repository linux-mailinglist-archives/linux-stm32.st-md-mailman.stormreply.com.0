Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE03791235
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 09:31:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 595ACC6B452;
	Mon,  4 Sep 2023 07:31:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FAD7C6B44E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Sep 2023 07:31:12 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 383LHANh011127; Mon, 4 Sep 2023 09:30:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=CJ6f+Mj4xw5e5f2nUevdxPupbRu8vHoKZgu1otbVbto=; b=Ct
 Ax+XF23ODo/au8B+ZrDh83sB9V35dL97jfSytDcF7GnaFpEfXua1uO5mNveiF6ZV
 ULJqOWqQ8/CW9vKbt8JtAkZZfIYkfm7ZkuDQCFX97ES4W97cbNjGR/P0MJXvXc8N
 8e6BrOsY3KYAQK9iXSTEvNTBSPfPJSxKVp9Jyw8+c9EA/ysRV2M9ao+ZLpleINMK
 clAX1gMEbcIYZf//j7XFUPD1NM0WPgsp53LtLEID+8n4mcDwAWOFLkA5F6hamyJM
 1olxdiwbjUuF+Oc/BTewcK8FNIPptKC7OL0hw1jO0YVNDeVlJIds9WiKEOde88Nt
 +PNsOLv7+6Zu72uc0V5g==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3svem0bhah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Sep 2023 09:30:40 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2F187100058;
 Mon,  4 Sep 2023 09:30:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4A66C2122EB;
 Mon,  4 Sep 2023 09:30:38 +0200 (CEST)
Received: from [10.201.20.125] (10.201.20.125) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 4 Sep
 2023 09:30:37 +0200
Message-ID: <26ca3e45-b89a-705a-5aa2-9c5f1a5e20db@foss.st.com>
Date: Mon, 4 Sep 2023 09:30:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230901120836.1057900-1-yann.gautier@foss.st.com>
 <CACRpkdaj6bEQTo6a5gOJQne-wKqBLvuxiOe9kE+q-nkYLOU7Pw@mail.gmail.com>
From: Yann Gautier <yann.gautier@foss.st.com>
In-Reply-To: <CACRpkdaj6bEQTo6a5gOJQne-wKqBLvuxiOe9kE+q-nkYLOU7Pw@mail.gmail.com>
X-Originating-IP: [10.201.20.125]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_04,2023-08-31_01,2023-05-22_02
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: add SDIO in-band
	interrupt mode
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

T24gOS8yLzIzIDE4OjQzLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IEhpIFlhbm4vQ2hyaXN0b3Bo
ZSwKPiAKPiBqdXN0IGEgcXVpY2sgbm90ZToKPiAKPiBPbiBGcmksIFNlcCAxLCAyMDIzIGF0IDI6
MDjigK9QTSBZYW5uIEdhdXRpZXIgPHlhbm4uZ2F1dGllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4g
Cj4+ICtzdGF0aWMgdm9pZCBzZG1tY19lbmFibGVfc2Rpb19pcnEoc3RydWN0IG1tY2lfaG9zdCAq
aG9zdCwgaW50IGVuYWJsZSkKPj4gK3sKPj4gKyAgICAgICB2b2lkIF9faW9tZW0gKmJhc2UgPSBo
b3N0LT5iYXNlOwo+PiArICAgICAgIHUzMiBtYXNrID0gcmVhZGxfcmVsYXhlZChiYXNlICsgTU1D
SU1BU0swKTsKPj4gKwo+PiArICAgICAgIGlmIChlbmFibGUpCj4+ICsgICAgICAgICAgICAgICB3
cml0ZWxfcmVsYXhlZChtYXNrIHwgTUNJX1NUX1NESU9JVE1BU0ssIGJhc2UgKyBNTUNJTUFTSzAp
Owo+PiArICAgICAgIGVsc2UKPj4gKyAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKG1hc2sg
JiB+TUNJX1NUX1NESU9JVE1BU0ssIGJhc2UgKyBNTUNJTUFTSzApOwo+PiArfQo+PiArCj4+ICtz
dGF0aWMgdm9pZCBzZG1tY19zZGlvX2lycShzdHJ1Y3QgbW1jaV9ob3N0ICpob3N0LCB1MzIgc3Rh
dHVzKQo+PiArewo+PiArICAgICAgIGlmIChzdGF0dXMgJiBNQ0lfU1RfU0RJT0lUKSB7Cj4+ICsg
ICAgICAgICAgICAgICBzZG1tY19lbmFibGVfc2Rpb19pcnEoaG9zdCwgMCk7Cj4+ICsgICAgICAg
ICAgICAgICBzZGlvX3NpZ25hbF9pcnEoaG9zdC0+bW1jKTsKPj4gKyAgICAgICB9Cj4+ICt9Cj4g
Cj4gWW91IG5lZWQgdG8gbW92ZSB0aGVzZSB0byBtbWNpIGFuZCByZW5hbWUgdGhlbSBzaW5jZSBV
eDUwMCB3aWxsIHVzZQo+IHRoZSBzYW1lIGNhbGxiYWNrcy4KCkhpIExpbnVzLAoKWWVzLCB0aGF0
J3Mgd2hhdCBJIHdhcyBwbGFubmluZyB0byBkby4KPiAKPj4gICBzdGF0aWMgc3RydWN0IG1tY2lf
aG9zdF9vcHMgc2RtbWNfdmFyaWFudF9vcHMgPSB7Cj4+ICAgICAgICAgIC52YWxpZGF0ZV9kYXRh
ID0gc2RtbWNfaWRtYV92YWxpZGF0ZV9kYXRhLAo+ICguLi4pCj4+ICsgICAgICAgLmVuYWJsZV9z
ZGlvX2lycSA9IHNkbW1jX2VuYWJsZV9zZGlvX2lycSwKPj4gKyAgICAgICAuc2Rpb19pcnEgPSBz
ZG1tY19zZGlvX2lycSwKPj4gICB9Owo+IAo+IFdoYXQgYWJvdXQgZHJvcHBpbmcgdGhlIHBlci12
YXJpYW50IGNhbGxiYWNrcyBhbmQganVzdCBpbmxpbmUKPiB0aGlzIGludG8gbW1jaV9lbmFibGVf
c2Rpb19pcnEoKS9tbWNpX2Fja19zZGlvX2lycSgpIHNpbmNlCj4gc28gbWFueSB2YXJpYW50cyBo
YXZlIHRoZSBzYW1lIHNjaGVtZT8gSSBoYXZlbid0IGxvb2tlZAo+IGF0IHRoZSBRdWFsY29tbSB2
YXJpYW50IHRob3VnaCwgbWF5YmUgaXQgaXMgY29tcGxldGVseQo+IGRpZmZlcmVudC4uLgoKSSdt
IG5vdCBzdXJlIGFib3V0IHRoaXMuIEtlZXBpbmcgdGhlIG9wcyB3aWxsIG1ha2UgaXQgZWFzaWVy
IGZvciBvdGhlciAKdmFyaWFudHMgdG8gYnJpbmcgdGhlaXIgb3duIGNvZGUgaWYgdGhlaXIgc2No
ZW1lIGlzIGRpZmZlcmVudC4KCkJlc3QgcmVnYXJkcywKWWFubgoKPiAKPiBZb3VycywKPiBMaW51
cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
