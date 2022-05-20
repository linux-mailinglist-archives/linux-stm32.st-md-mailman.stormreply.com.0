Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A5E52ED44
	for <lists+linux-stm32@lfdr.de>; Fri, 20 May 2022 15:37:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF84EC56630;
	Fri, 20 May 2022 13:37:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77F37C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 13:37:45 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24KC5lLW004845;
 Fri, 20 May 2022 15:37:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=EWqpQF3gyIEpXuoGoxFjVR5sJZAkS9thASy95mo2gLk=;
 b=XySLmH8+CsqbK/oh3XOX+GIZuOg40bzGyXtse9RJ/M337Lcxd8wbl/gJVno/7bpYbPDM
 Tw7QZVhEsM0wXdmpM1xxryOy37lgb5Kipo4RDlXoa4Wdzkf4Qe5I2kRc5mFjX4bib2am
 fmN3XeoOeemC1pUCBU3GH2vFlWrZq0/AHsvPgH6UaxwjWtAOGOeWKskfYmFHpPDHTpFw
 C+RZ+cK5igukUmBcDYbcPYVmXc00s2TdCm+ZGt3A/tseyRS285yU8xZxw54j5ybpzUMf
 rExolZEb3PHeGTjgNIgNNuIPIMVPjcox5sJV2yDbfY6rCAaSDlwSkeEVUvCuWqavINGn GA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21umcwkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 15:37:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A5FB6100040;
 Fri, 20 May 2022 15:37:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C0D123301F;
 Fri, 20 May 2022 15:37:05 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.44) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 15:37:01 +0200
Message-ID: <a1b9a37e-a049-136d-5320-9a413873ded3@foss.st.com>
Date: Fri, 20 May 2022 15:37:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring
 <robh+dt@kernel.org>
References: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20220519162838.695404-1-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_04,2022-05-20_02,2022-02-23_01
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: mfd: stm32-timers:
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

T24gNS8xOS8yMiAxODoyOCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gVGhlIHRpbWVyIHVu
aXRzIGluIHRoZSBzdG0zMm1wMSBDUFVzIGhhdmUgaW50ZXJydXB0cywgZGVwZW5kaW5nIG9uIHRo
ZQo+IHRpbWVyIGZsYXZvdXIgZWl0aGVyIG9uZSAiZ2xvYmFsIiBvciBmb3VyIGRlZGljYXRlZCBv
bmVzLiBEb2N1bWVudCBob3cKPiB0byBmb3JtYWxpemUgdGhlc2UgaW4gYSBkZXZpY2UgdHJlZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgoKSGkgVXdlLAoKWW91IGNhbiBhZGQgbXk6ClJldmlld2VkLWJ5OiBGYWJy
aWNlIEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KCkJlc3QgUmVnYXJkcywK
VGhhbmtzCkZhYnJpY2UKCj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MzoKPiAgIC0gRG8gdGhlIHRo
aW5ncyBSb2Igc3VnZ2VzdGVkIGluIHJlcWx5IHRvIHYxIHdoaWNoIEkgZGlkbid0IG5vdGljZQo+
ICAgICB1bnRpbCBGYWJyaWNlIHRvbGQgbWUgaW4gcmVwbHkgdG8gdjMuCj4gCj4gIC4uLi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMueWFtbCAgfCAxNSArKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0zMi10aW1lcnMu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3Qsc3RtMzItdGlt
ZXJzLnlhbWwKPiBpbmRleCAxMGIzMzBkNDI5MDEuLjViMDViMmVjMTcyOCAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3N0LHN0bTMyLXRpbWVycy55
YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9zdCxzdG0z
Mi10aW1lcnMueWFtbAo+IEBAIC00Niw2ICs0NiwyMSBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgbWlu
SXRlbXM6IDEKPiAgICAgIG1heEl0ZW1zOiA3Cj4gIAo+ICsgIGludGVycnVwdHM6Cj4gKyAgICBv
bmVPZjoKPiArICAgICAgLSBtYXhJdGVtczogMQo+ICsgICAgICAtIG1heEl0ZW1zOiA0Cj4gKwo+
ICsgIGludGVycnVwdC1uYW1lczoKPiArICAgIG9uZU9mOgo+ICsgICAgICAtIGl0ZW1zOgo+ICsg
ICAgICAgICAgLSBjb25zdDogZ2xvYmFsCj4gKyAgICAgIC0gaXRlbXM6Cj4gKyAgICAgICAgICAt
IGNvbnN0OiBicmsKPiArICAgICAgICAgIC0gY29uc3Q6IHVwCj4gKyAgICAgICAgICAtIGNvbnN0
OiB0cmctY29tCj4gKyAgICAgICAgICAtIGNvbnN0OiBjYwo+ICsKPiAgICAiI2FkZHJlc3MtY2Vs
bHMiOgo+ICAgICAgY29uc3Q6IDEKPiAgCj4gCj4gYmFzZS1jb21taXQ6IDMxMjMxMDkyODQxNzZi
MTUzMjg3NDU5MWY3YzgxZjM4MzdiYmRjMTcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
