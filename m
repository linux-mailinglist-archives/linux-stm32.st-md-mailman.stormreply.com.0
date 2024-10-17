Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF259A24E8
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 16:22:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A0D0C78032;
	Thu, 17 Oct 2024 14:22:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72B3FC5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 14:22:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HECOBX011443;
 Thu, 17 Oct 2024 16:22:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 M5IH4NYx4I75X9RNzmg//dnlErgU4vaCdoHfvnZ3qZM=; b=dV3Z7oaH5XInNfPu
 FyiSRgArV2wYBLAl4UsyJbCtr7OiIptw7ILxlUzkkjr/nm+xL47gcOheGVNRRude
 vUiF3E+PX2kJUPEKbg/owHG4mcw1Td4bIuu3Ne25vt1MMjejsftPEMPD/mS8OQvY
 JtI62i0lIu9bOFYGVm/n1s3keAwzdYcJintcEPeJac8AlQgk1KON5xBzXoX6qxrZ
 tuAiOaMTrpx8Mqav/+8bcFJG4DcCe8YV9ff4Ov3eOjVevcFcvT6Z+BcS3WvRLYLh
 RYqL4Xx8F64Uu6Ni8neckeuWl3WrCKvl787xAupScC8RjryGtPtpSndb3Jq1uEo6
 6OMafg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 429qybktr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Oct 2024 16:22:18 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D290740045;
 Thu, 17 Oct 2024 16:20:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 046AB24390A;
 Thu, 17 Oct 2024 16:20:00 +0200 (CEST)
Received: from [10.48.86.107] (10.48.86.107) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 17 Oct
 2024 16:19:59 +0200
Message-ID: <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
Date: Thu, 17 Oct 2024 16:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linus.walleij@linaro.org>, Russell King
 <linux@armlinux.org.uk>, Kees Cook <kees@kernel.org>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, Mark Brown
 <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel
 <ardb@kernel.org>
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
X-Originating-IP: [10.48.86.107]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: stable@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

T24gMTAvMTcvMjQgMTQ6NTksIExpbnVzIFdhbGxlaWogd3JvdGU6Cj4gWy4uLl0KPiAgIAo+ICtz
dGF0aWMgdW5zaWduZWQgbG9uZyBhcm1fa2FzYW5fbWVtX3RvX3NoYWRvdyh1bnNpZ25lZCBsb25n
IGFkZHIpCj4gK3sKPiArCXJldHVybiAodW5zaWduZWQgbG9uZylrYXNhbl9tZW1fdG9fc2hhZG93
KCh2b2lkICopYWRkcik7Cj4gK30KPiArCgpga2FzYW5fbWVtX3RvX3NoYWRvd2AgZnVuY3Rpb24g
c3ltYm9sIGlzIG9ubHkgZXhwb3J0ZWQgd2l0aCA6CkNPTkZJR19LQVNBTl9HRU5FUklDIG9yIGRl
ZmluZWQoQ09ORklHX0tBU0FOX1NXX1RBR1MpIGZyb20ga2FzYW4uaAoKVG8gbWUsIHRoZSBpZiBj
b25kaXRpb24geW91IGFkZGVkIGJlbG93IHNob3VsZCBiZSBleHBhbmRlZCB3aXRoIHRob3NlIAp0
d28gbWFjcm9zLgoKPiBbLi4uXQo+ICAgdm9pZCBfX2NoZWNrX3ZtYWxsb2Nfc2VxKHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tKQo+ICAgewo+ICAgCWludCBzZXE7Cj4gICAKPiAgIAlkbyB7Cj4gICAJCXNl
cSA9IGF0b21pY19yZWFkKCZpbml0X21tLmNvbnRleHQudm1hbGxvY19zZXEpOwo+IC0JCW1lbWNw
eShwZ2Rfb2Zmc2V0KG1tLCBWTUFMTE9DX1NUQVJUKSwKPiAtCQkgICAgICAgcGdkX29mZnNldF9r
KFZNQUxMT0NfU1RBUlQpLAo+IC0JCSAgICAgICBzaXplb2YocGdkX3QpICogKHBnZF9pbmRleChW
TUFMTE9DX0VORCkgLQo+IC0JCQkJCXBnZF9pbmRleChWTUFMTE9DX1NUQVJUKSkpOwo+ICsJCW1l
bWNweV9wZ2QobW0sIFZNQUxMT0NfU1RBUlQsIFZNQUxMT0NfRU5EKTsKPiArCQlpZiAoSVNfRU5B
QkxFRChDT05GSUdfS0FTQU5fVk1BTExPQykpIHsKPiArCQkJdW5zaWduZWQgbG9uZyBzdGFydCA9
Cj4gKwkJCQlhcm1fa2FzYW5fbWVtX3RvX3NoYWRvdyhWTUFMTE9DX1NUQVJUKTsKPiArCQkJdW5z
aWduZWQgbG9uZyBlbmQgPQo+ICsJCQkJYXJtX2thc2FuX21lbV90b19zaGFkb3coVk1BTExPQ19F
TkQpOwo+ICsJCQltZW1jcHlfcGdkKG1tLCBzdGFydCwgZW5kKTsKPiArCQl9Cj4gICAJCS8qCj4g
ICAJCSAqIFVzZSBhIHN0b3JlLXJlbGVhc2Ugc28gdGhhdCBvdGhlciBDUFVzIHRoYXQgb2JzZXJ2
ZSB0aGUKPiAgIAkJICogY291bnRlcidzIG5ldyB2YWx1ZSBhcmUgZ3VhcmFudGVlZCB0byBzZWUg
dGhlIHJlc3VsdHMgb2YgdGhlCj4KT3RoZXJ3aXNlIGl0IGNvbXBpbGVzIHdpdGggS0FTQU4gZW5h
YmxlZCwgSSBhbSBydW5uaW5nIHNvbWUgdGVzdHMgd2l0aCAKeW91ciBwYXRjaGVzLgoKUmVnYXJk
cywKCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
