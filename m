Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF98FC86D
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Jun 2024 11:58:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9E74C71288;
	Wed,  5 Jun 2024 09:58:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CA3CC6B47A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Jun 2024 09:57:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4557cvlj013276;
 Wed, 5 Jun 2024 11:57:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 Yl2/1DvIUCdB1SM68YD06QoDvfl+b4umSa+Pr8mxF0I=; b=J+wKxVzLNClyM69E
 gk71rArZ3dSR5WmkoQd7MZ+Nvn1ZWNMZ/SJm5io0n+Oj8HGLwsvCuMKf7nqnNx5g
 lz6SpMVUuI9sZ6bc2Y7XHnBLMYWzvcfPNjkmGnS5GSEa18LgBSIimYZttnaMgwaN
 xiDedlp7ZRxXq1s0rUFqVpEjQDIH5+20m6vjdHwMn5hqAmDBbQcdT1AqFYlu0y2Y
 an+GGTuGiUKjJgHa9tM83eFJtvVeD54ZnQPobyLu5Q3Q2YFEwkIpokYSsI0sVvtx
 3pl4hwNmOU/Ii81M9GlEKRV85jpZwChNGnzf4KmM9+C3wf90CsxoJQxXVJuX5DVW
 +LEWOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yfw30fyq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jun 2024 11:57:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 78A3540047;
 Wed,  5 Jun 2024 11:57:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B05D1214D37;
 Wed,  5 Jun 2024 11:55:48 +0200 (CEST)
Received: from [10.48.86.164] (10.48.86.164) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 11:55:47 +0200
Message-ID: <70b66190-2c55-4228-8c31-f58a05829d8b@foss.st.com>
Date: Wed, 5 Jun 2024 11:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marek Vasut <marex@denx.de>
References: <20240604143502.154463-1-christophe.roullier@foss.st.com>
 <20240604143502.154463-2-christophe.roullier@foss.st.com>
 <067d41e5-89cf-45eb-8cfa-b6c3cd434f76@linaro.org>
Content-Language: en-US
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <067d41e5-89cf-45eb-8cfa-b6c3cd434f76@linaro.org>
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-05_02,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 01/11] dt-bindings: net: add STM32MP13
 compatible in documentation for stm32
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

Ck9uIDYvNS8yNCAxMDoxNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAwNC8wNi8y
MDI0IDE2OjM0LCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+PiBOZXcgU1RNMzIgU09DIGhh
dmUgMiBHTUFDcyBpbnN0YW5jZXMuCj4+IEdNQUMgSVAgdmVyc2lvbiBpcyBTTlBTIDQuMjAuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgUm91bGxpZXIgPGNocmlzdG9waGUucm91bGxp
ZXJAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9z
dG0zMi1kd21hYy55YW1sICB8IDQxICsrKysrKysrKysrKysrKy0tLS0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RtMzItZHdtYWMueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RtMzItZHdtYWMueWFtbAo+
PiBpbmRleCA3Y2NmNzU2NzZiNmQ1Li5lY2JlZDlhN2FhZjZkIDEwMDY0NAo+PiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0bTMyLWR3bWFjLnlhbWwKPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdG0zMi1kd21hYy55YW1s
Cj4+IEBAIC0yMiwxOCArMjIsMTcgQEAgc2VsZWN0Ogo+PiAgICAgICAgICAgZW51bToKPj4gICAg
ICAgICAgICAgLSBzdCxzdG0zMi1kd21hYwo+PiAgICAgICAgICAgICAtIHN0LHN0bTMybXAxLWR3
bWFjCj4+ICsgICAgICAgICAgLSBzdCxzdG0zMm1wMTMtZHdtYWMKPj4gICAgIHJlcXVpcmVkOgo+
PiAgICAgICAtIGNvbXBhdGlibGUKPj4gICAKPj4gLWFsbE9mOgo+PiAtICAtICRyZWY6IHNucHMs
ZHdtYWMueWFtbCMKPj4gLQo+PiAgIHByb3BlcnRpZXM6Cj4+ICAgICBjb21wYXRpYmxlOgo+PiAg
ICAgICBvbmVPZjoKPj4gICAgICAgICAtIGl0ZW1zOgo+PiAgICAgICAgICAgICAtIGVudW06Cj4+
ICAgICAgICAgICAgICAgICAtIHN0LHN0bTMybXAxLWR3bWFjCj4+ICsgICAgICAgICAgICAgIC0g
c3Qsc3RtMzJtcDEzLWR3bWFjCj4+ICAgICAgICAgICAgIC0gY29uc3Q6IHNucHMsZHdtYWMtNC4y
MGEKPj4gICAgICAgICAtIGl0ZW1zOgo+PiAgICAgICAgICAgICAtIGVudW06Cj4+IEBAIC03NSwx
MiArNzQsMTUgQEAgcHJvcGVydGllczoKPj4gICAgIHN0LHN5c2NvbjoKPj4gICAgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+PiAgICAgICBp
dGVtczoKPj4gLSAgICAgIC0gaXRlbXM6Cj4+ICsgICAgICAtIG1pbkl0ZW1zOiAyCj4+ICsgICAg
ICAgIGl0ZW1zOgo+PiAgICAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIHRoZSBz
eXNjb24gbm9kZSB3aGljaCBlbmNvbXBhc2VzIHRoZSBnbHVlIHJlZ2lzdGVyCj4+ICAgICAgICAg
ICAgIC0gZGVzY3JpcHRpb246IG9mZnNldCBvZiB0aGUgY29udHJvbCByZWdpc3Rlcgo+PiArICAg
ICAgICAgIC0gZGVzY3JpcHRpb246IGZpZWxkIHRvIHNldCBtYXNrIGluIHJlZ2lzdGVyCj4+ICAg
ICAgIGRlc2NyaXB0aW9uOgo+PiAgICAgICAgIFNob3VsZCBiZSBwaGFuZGxlL29mZnNldCBwYWly
LiBUaGUgcGhhbmRsZSB0byB0aGUgc3lzY29uIG5vZGUgd2hpY2gKPj4gLSAgICAgIGVuY29tcGFz
ZXMgdGhlIGdsdWUgcmVnaXN0ZXIsIGFuZCB0aGUgb2Zmc2V0IG9mIHRoZSBjb250cm9sIHJlZ2lz
dGVyCj4+ICsgICAgICBlbmNvbXBhc2VzIHRoZSBnbHVlIHJlZ2lzdGVyLCB0aGUgb2Zmc2V0IG9m
IHRoZSBjb250cm9sIHJlZ2lzdGVyIGFuZAo+PiArICAgICAgdGhlIG1hc2sgdG8gc2V0IGJpdGZp
ZWxkIGluIGNvbnRyb2wgcmVnaXN0ZXIKPj4gICAKPj4gICAgIHN0LGV4dC1waHljbGs6Cj4+ICAg
ICAgIGRlc2NyaXB0aW9uOgo+PiBAQCAtMTEyLDEyICsxMTQsMzcgQEAgcmVxdWlyZWQ6Cj4+ICAg
Cj4+ICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+PiAgIAo+PiArYWxsT2Y6Cj4+ICsg
IC0gJHJlZjogc25wcyxkd21hYy55YW1sIwo+PiArICAtIGlmOgo+PiArICAgICAgcHJvcGVydGll
czoKPj4gKyAgICAgICAgY29tcGF0aWJsZToKPj4gKyAgICAgICAgICBjb250YWluczoKPj4gKyAg
ICAgICAgICAgIGVudW06Cj4+ICsgICAgICAgICAgICAgIC0gc3Qsc3RtMzJtcDEtZHdtYWMKPj4g
KyAgICAgICAgICAgICAgLSBzdCxzdG0zMi1kd21hYwo+PiArICAgIHRoZW46Cj4+ICsgICAgICBw
cm9wZXJ0aWVzOgo+PiArICAgICAgICBzdCxzeXNjb246Cj4+ICsgICAgICAgICAgaXRlbXM6Cj4+
ICsgICAgICAgICAgICBtYXhJdGVtczogMgo+PiArCj4+ICsgIC0gaWY6Cj4+ICsgICAgICBwcm9w
ZXJ0aWVzOgo+PiArICAgICAgICBjb21wYXRpYmxlOgo+PiArICAgICAgICAgIGNvbnRhaW5zOgo+
PiArICAgICAgICAgICAgZW51bToKPj4gKyAgICAgICAgICAgICAgLSBzdCxzdG0zMm1wMTMtZHdt
YWMKPj4gKyAgICB0aGVuOgo+PiArICAgICAgcHJvcGVydGllczoKPj4gKyAgICAgICAgc3Qsc3lz
Y29uOgo+PiArICAgICAgICAgIGl0ZW1zOgo+PiArICAgICAgICAgICAgbWluSXRlbXM6IDMKPiBJ
IGRvbid0IHRoaW5rIHRoaXMgd29ya3MuIFlvdSBub3cgY29uc3RyYWluIHRoZSBmaXJzdCBkaW1l
bnNpb24gd2hpY2gKPiBoYWQgb25seSBvbmUgaXRlbSBiZWZvcmUuCj4KPiBNYWtlIHlvdXIgZXhh
bXBsZSBjb21wbGV0ZSBhbmQgdGVzdCBpdC4KPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YK
CkhpIEtyenlzenRvZiwKCiJPZmZpY2lhbCIgYmluZGluZ3MgZm9yIE1QMTU6IHN0LHN5c2NvbiA9
IDwmc3lzY2ZnIDB4ND47CiJPZmZpY2lhbCIgYmluZGluZ3MgZm9yIE1QMTM6IHN0LHN5c2NvbiA9
IDwmc3lzY2ZnIDB4NCAweGZmMDAwMD47IG9yIApzdCxzeXNjb24gPSA8JnN5c2NmZyAweDQgMHhm
ZjAwMDAwMD47CgpJZiBJIGV4ZWN1dGUgbWFrZSBkdF9iaW5kaW5nX2NoZWNrIApEVF9TQ0hFTUFf
RklMRVM9RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zdG0zMi1kd21hYy55
YW1sIHdpdGg6CgogwqDCoCBGb3IgTVAxNTogc3Qsc3lzY29uID0gPCZzeXNjZmc+OyAKPT5iaW5k
aW5ncy9uZXQvc3RtMzItZHdtYWMuZXhhbXBsZS5kdGI6IGV0aGVybmV0QDQwMDI3MDAwOiBzdCxz
eXNjb246MDogCls0Mjk0OTY3Mjk1XSBpcyB0b28gc2hvcnQKCiDCoMKgIEZvciBNUDE1OiBzdCxz
eXNjb24gPSA8JnN5c2NmZyAweDQgMHhmZjAwMDA+OyAKPT5kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9zdG0zMi1kd21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRANDAwMjcwMDA6IApzdCxzeXNjb246
MDogWzQyOTQ5NjcyOTUsIDQsIDE2NzExNjgwXSBpcyB0b28gbG9uZwoKIMKgwqAgRm9yIE1QMTM6
IHN0LHN5c2NvbiA9IDwmc3lzY2ZnIDB4ND47ID0+IApkZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9z
dG0zMi1kd21hYy5leGFtcGxlLmR0YjogZXRoZXJuZXRANTgwMGEwMDA6IApzdCxzeXNjb246MDog
WzQyOTQ5NjcyOTUsIDRdIGlzIHRvbyBzaG9ydAoKIMKgwqAgRm9yIE1QMTM6IHN0LHN5c2NvbiA9
IDwmc3lzY2ZnIDB4NCAweGZmMDAwMCAweGZmPjsgPT4gCmRldmljZXRyZWUvYmluZGluZ3MvbmV0
L3N0bTMyLWR3bWFjLmV4YW1wbGUuZHRiOiBldGhlcm5ldEA1ODAwYTAwMDogCnN0LHN5c2Nvbjow
OiBbNDI5NDk2NzI5NSwgNCwgMTY3MTE2ODAsIDI1NV0gaXMgdG9vIGxvbmcKClNvIGl0IGlzIHNl
ZW1zIGdvb2QgOi0pCgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
