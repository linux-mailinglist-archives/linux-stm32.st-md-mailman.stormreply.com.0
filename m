Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2E814383
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 09:24:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65F3FC6DD6C;
	Fri, 15 Dec 2023 08:24:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53BCAC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 08:24:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BF3A19E028453; Fri, 15 Dec 2023 09:23:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=xcAiWo/a18DOKV2t+LlI0pMtcGFpe6qJlE6ADF/4v7Y=; b=2l
 a1d7wKV+EobPTyM7kYIML2qkQg+vYzkuTCzz+A83OWkxFJ/KOKsol3eGeHOt5vZk
 IeB0GBO3Ij2E2wuTyXyHNUCcmGduCrECSDEJb+emAb8KwLFEuOaKCSBM9zCUncG0
 FIZFemEysrP/jsnV4u5gSYXYlzrR6BoMmmEr2pob9zWrGf7HLOKrRcXlPrJOW13n
 DbBu7YI7D5wusFggNPBMSNKgzTcunEc43QwfnF2LrF/RtY6yYHCeYPtkEKalxHTP
 f6qsHmA+GrKEt3qVxyDEXYsz6xF7gges/hbMXqFAPPm6zgAa6tr9K1tYL1kk7r1M
 24AhhQpLf9djhAbarrKQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvehms3pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Dec 2023 09:23:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F64A10005D;
 Fri, 15 Dec 2023 09:23:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 82AFF208D6F;
 Fri, 15 Dec 2023 09:23:46 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Dec
 2023 09:23:45 +0100
Message-ID: <34e78d6c-5a1e-4507-b827-15f74c02f758@foss.st.com>
Date: Fri, 15 Dec 2023 09:23:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>
References: <20231206083142.1476340-2-u.kleine-koenig@pengutronix.de>
 <20231206084853.q4dfbp5twpe235se@pengutronix.de>
 <31a82fc0-814e-456d-83e2-a4daf111a648@foss.st.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <31a82fc0-814e-456d-83e2-a4daf111a648@foss.st.com>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-15_04,2023-12-14_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, kernel@pengutronix.de,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32mp15x: Consolidate
 usbh_[eo]hci phy properties
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

T24gMTIvMTQvMjMgMTc6MTQsIEFsZXhhbmRyZSBUT1JHVUUgd3JvdGU6Cj4gSGkgVXdlCj4gCj4g
T24gMTIvNi8yMyAwOTo0OCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4+IEhlbGxvLAo+Pgo+
PiBPbiBXZWQsIERlYyAwNiwgMjAyMyBhdCAwOTozMTo0M0FNICswMTAwLCBVd2UgS2xlaW5lLUvD
tm5pZyB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTV4eC1ka3guZHRzaQo+Pj4gYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1ka3gu
ZHRzaQo+Pj4gaW5kZXggNTExMTEzZjJlMzk5Li43MDRjMGQwY2ZlNWYgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTV4eC1ka3guZHRzaQo+Pj4gKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eHgtZGt4LmR0c2kKPj4+IEBAIC02ODAsOCArNjgw
LDYgQEAgJnVzYXJ0MyB7Cj4+PiDCoCB9Owo+Pj4gwqAgwqAgJnVzYmhfZWhjaSB7Cj4+PiAtwqDC
oMKgIHBoeXMgPSA8JnVzYnBoeWNfcG9ydDA+Owo+Pj4gLcKgwqDCoCBzdGF0dXMgPSAib2theSI7
Cj4+Cj4+IHRoZSBzdGF0dXMgcHJvcGVydHkgbXVzdCBiZSBrZXB0LiBJIHdpbGwgd2FpdCBhIGJp
dCBmb3IgZnVydGhlciByZXZpZXcKPj4gYW5kIHRoZW4gcmVzZW5kICh1bmxlc3MgdGhpcyBwYXRj
aCBpcyBwaWNrZWQgdXAgd2l0aCB0aGlzIGlzc3VlIGZpeGVkCj4+IHVwKS4KPiAKPiBBcHBsaWVk
IHdpdGggdGhlIGZpeC4gRmlyc3QgSSBoYWQgYSBzbWFsbCBkb3VidCBhYm91dCB0aGUgcGF0Y2gg
YXMgd2UKPiBjYW4gYWxzbyBjaG9vc2UgdXNicGh5Y19wb3J0MSBmb3IgVVNCIGhvc3QgYnV0IGFz
IHVzYnBoeWNfcG9ydDAgcmVtYWlucwo+IGFsd2F5cyBjb25uZWN0ZWQgdG8gdGhlIFVTQiBob3N0
IHRoZW4geW91ciBwYXRjaCBtYWtlcyBjb21wbGV0ZWx5IHNlbnMuCgpIaSBVV2UsIEFsZXgsCgpJ
IHRlc3RlZCBpdCwgd2l0aCB0aGUgZml4LCBvbiBzdG0zMm1wMTU3Yy1ldjEgYW5kIHN0bTMybXAx
NTdjLWRrMi4gWW91CmNhbiBhZGQgbXk6ClRlc3RlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJy
aWNlLmdhc25pZXJAZm9zcy5zdC5jb20+CgpCZXN0IFJlZ2FyZHMsCkZhYnJpY2UKPiAKPiBSZWdh
cmRzCj4gQWxleAo+IAo+IAo+PiBCZXN0IHJlZ2FyZHMKPj4gVXdlCj4+Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKPiBMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
