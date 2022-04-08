Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ECF4F993C
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 17:19:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7B69C628AC;
	Fri,  8 Apr 2022 15:19:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AF826C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 15:19:20 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2389hItH009505;
 Fri, 8 Apr 2022 17:18:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=BJPh09OuN2vkxDfN//4LhHfa8nRlHWyf3N0XomHXsKY=;
 b=q30X057yLL0K1i5IKVTO02Vexo7I6XZcYYqhNNc6n98hGdv4wgA8B0oUhfvJiDzNJzEO
 Abk89SS8f1ywodnEIGM375jQFONBPMOolyTGL0/+CNva5opNmkGiYCyzwPnbeVZmuFDj
 5bcmWijb5NBxfBFJM5nyaQMgsxUrdCN+E9brfv7t3w2Q0IOlu5NoHD0vjro9zE9PqF8K
 7D2F/YgRPelO2gNr0R8JijfD5dv9ssDnZxmPrj9sdrmHvto8O2199gE2xAl85uzv7PQ0
 x7rOqk9nv0wLtC4/jWZOlzxXSEUjuOw9Ah/FZO6ezdpT7uFtAlzcRCSzEd1FOsgbggY8 JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f8x4rv371-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 17:18:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 891E610002A;
 Fri,  8 Apr 2022 17:18:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 81800220FC7;
 Fri,  8 Apr 2022 17:18:51 +0200 (CEST)
Received: from [10.251.20.121] (10.75.127.44) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 8 Apr
 2022 17:18:50 +0200
Message-ID: <d3d1907a-37af-16a1-d5c6-52cfe497775b@foss.st.com>
Date: Fri, 8 Apr 2022 17:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>
References: <20220408063502.136403-1-u.kleine-koenig@pengutronix.de>
 <20220408063502.136403-2-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220408063502.136403-2-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_05,2022-04-08_01,2022-02-23_01
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: mfd: stm32-timers:
 Document how to specify interrupts
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

T24gNC84LzIyIDA4OjM1LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBUaGUgdGltZXIgdW5p
dHMgaW4gdGhlIHN0bTMybXAxIENQVXMgaGF2ZSBpbnRlcnJ1cHRzLCBkZXBlbmRpbmcgb24gdGhl
Cj4gdGltZXIgZmxhdm91ciBlaXRoZXIgb25lICJnbG9iYWwiIG9yIGZvdXIgZGVkaWNhdGVkIG9u
ZXMuIERvY3VtZW50IGhvdwo+IHRvIGZvcm1hbGl6ZSB0aGVzZSBpbiBhIGRldmljZSB0cmVlLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0z
Mi10aW1lcnMueWFtbCAgICB8IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItdGltZXJzLnlhbWwKPiBpbmRleCAxMGIzMzBkNDI5
MDEuLjVlNDIxNGQxNjEzYiAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMueWFtbAo+IEBAIC00Niw2ICs0
NiwxOSBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgbWluSXRlbXM6IDEKPiAgICAgIG1heEl0ZW1zOiA3
Cj4gIAo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBtYXhJdGVtczogNAoKSGkgVXdlLAoKUm9iIHBv
c3RlZCBhIHJlbWFyayBpbiBWMSwgd2hpY2ggbmVlZCB0byBiZSB0YWtlbiBJTUhPOgoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL0NBTF9Kc3FLVzNYSjZuNUNMZ19CTkVhQVNrVW5YTE09Sl9Y
Wlc4TTZpN3NHUHVaOF85QUBtYWlsLmdtYWlsLmNvbS8KClJ1bm5pbmcgYSBkdGJzX2NoZWNrIHdp
dGggZHRzIGNoYW5nZSwgc2hvd3Mgc29tZSBpc3N1ZXMgbGlrZToKLi4udGltZXJANDAwMDAwMDA6
IGludGVycnVwdHM6IFtbMCwgMjgsIDRdXSBpcyB0b28gc2hvcnQKLi4udGltZXJANDAwMDEwMDA6
IGludGVycnVwdHM6IFtbMCwgMjksIDRdXSBpcyB0b28gc2hvcnQKLi4uCgpJdCBzaG91bGQgYmUg
b2sgd2l0aCBSb2IncyBwcm9wb3NhbC4KClRoYW5rcywKQmVzdCBSZWdhcmRzLApGYWJyaWNlCgo+
ICsKPiArICBpbnRlcnJ1cHQtbmFtZXM6Cj4gKyAgICBhbnlPZjoKPiArICAgICAgLSBpdGVtczoK
PiArICAgICAgICAgIC0gY29uc3Q6IGdsb2JhbAo+ICsgICAgICAtIGl0ZW1zOgo+ICsgICAgICAg
ICAgLSBjb25zdDogYnJrCj4gKyAgICAgICAgICAtIGNvbnN0OiB1cAo+ICsgICAgICAgICAgLSBj
b25zdDogdHJnLWNvbQo+ICsgICAgICAgICAgLSBjb25zdDogY2MKPiArCj4gICAgIiNhZGRyZXNz
LWNlbGxzIjoKPiAgICAgIGNvbnN0OiAxCj4gIApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
