Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1196F82C124
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jan 2024 14:52:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B51F1C6DD75;
	Fri, 12 Jan 2024 13:52:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AB7DC6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jan 2024 13:52:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40C8bMSh014558; Fri, 12 Jan 2024 14:52:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=bQDWIGEUgxPtuigdQYbYpc8qQmx6+NnBxK0RzcsvHAk=; b=Mo
 MDc32tNZ2bdXNePfuK2gQh17PuuNs5HDWkF7eC0e2Bp0QqQ4Fi9D3QoweqBAgHb7
 5BwkGP5Ay1SVvg7oacZ4M6P09cD48CmFExeA8AM1n+G7rqU8chGQhz8+o3D4aZyU
 32AoO6RFggFYb6q8fC0WqLeDYm2gy6deaScB8KdCaauewtSqx2mFApN0wvsEn35t
 gG8UYxfdCR1nqK1Wh5XGv5QbWSqp5mp2/cCjBagOHFAzW68qsamp9/59kZoXPT8C
 B/4nzc3m2m73SomaMBXTlfdSMibFVJeIkar3P0GIfhad8G3LaZh1izZZs/i+g1ru
 HbFdBGkEFOLhjveIPeFQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vk22w9ab1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jan 2024 14:52:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCC1410002A;
 Fri, 12 Jan 2024 14:52:27 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA420215159;
 Fri, 12 Jan 2024 14:52:27 +0100 (CET)
Received: from [10.129.178.37] (10.129.178.37) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 12 Jan
 2024 14:52:24 +0100
Message-ID: <3552f3e5-01cc-4e95-a055-f7aea0f8dc4b@foss.st.com>
Date: Fri, 12 Jan 2024 14:52:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20240111113146.16011-1-dario.binacchi@amarulasolutions.com>
 <20240111113146.16011-5-dario.binacchi@amarulasolutions.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240111113146.16011-5-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.129.178.37]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 4/5] ARM: dts: stm32: add display
 support on stm32f769-disco
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

Ck9uIDEvMTEvMjQgMTI6MzEsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IFRoZSBwYXRjaCBhZGRz
IGRpc3BsYXkgc3VwcG9ydCBvbiB0aGUgc3RtMzJmNzY5LWRpc2NvIGJvYXJkLgo+Cj4gU2lnbmVk
LW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tPgo+IC0tLQo+Cj4gKG5vIGNoYW5nZXMgc2luY2UgdjEpCj4KPiAgYXJjaC9hcm0vYm9vdC9k
dHMvc3Qvc3RtMzJmNzY5LWRpc2NvLmR0cyB8IDcyICsrKysrKysrKysrKysrKysrKysrKysrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNjby5kdHMgYi9hcmNo
L2FybS9ib290L2R0cy9zdC9zdG0zMmY3NjktZGlzY28uZHRzCj4gaW5kZXggODYzMmJkODY2Mjcy
Li5kMWViNWY5Yzc4YmYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJm
NzY5LWRpc2NvLmR0cwo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNj
by5kdHMKPiBAQCAtNDEsNyArNDEsNyBAQAo+ICAgKi8KPiAgCj4gIC9kdHMtdjEvOwo+IC0jaW5j
bHVkZSAic3RtMzJmNzQ2LmR0c2kiCj4gKyNpbmNsdWRlICJzdG0zMmY3NjkuZHRzaSIKPiAgI2lu
Y2x1ZGUgInN0bTMyZjc2OS1waW5jdHJsLmR0c2kiCj4gICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9p
bnB1dC9pbnB1dC5oPgo+ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlvLmg+Cj4gQEAg
LTYwLDYgKzYwLDE5IEBAIG1lbW9yeUBjMDAwMDAwMCB7Cj4gIAkJcmVnID0gPDB4QzAwMDAwMDAg
MHgxMDAwMDAwPjsKPiAgCX07Cj4gIAo+ICsJcmVzZXJ2ZWQtbWVtb3J5IHsKPiArCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPiArCQkjc2l6ZS1jZWxscyA9IDwxPjsKPiArCQlyYW5nZXM7Cj4gKwo+
ICsJCWxpbnV4LGRtYSB7Cj4gKwkJCWNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPiAr
CQkJbGludXgsZG1hLWRlZmF1bHQ7Cj4gKwkJCW5vLW1hcDsKPiArCQkJc2l6ZSA9IDwweDEwMDAw
MD47Cj4gKwkJfTsKPiArCX07Cj4gKwo+ICAJYWxpYXNlcyB7Cj4gIAkJc2VyaWFsMCA9ICZ1c2Fy
dDE7Cj4gIAl9Owo+IEBAIC04NSw2ICs5OCwxMyBAQCBidXR0b24tMCB7Cj4gIAkJfTsKPiAgCX07
Cj4gIAo+ICsJcGFuZWxfYmFja2xpZ2h0OiBwYW5lbC1iYWNrbGlnaHQgewo+ICsJCWNvbXBhdGli
bGUgPSAiZ3Bpby1iYWNrbGlnaHQiOwo+ICsJCWdwaW9zID0gPCZncGlvaSAxNCBHUElPX0FDVElW
RV9ISUdIPjsKPiArCQlkZWZhdWx0LW9uOwo+ICsJCXN0YXR1cyA9ICJva2F5IjsKPiArCX07Cj4g
Kwo+ICAJdXNib3RnX2hzX3BoeTogdXNiLXBoeSB7Cj4gIAkJI3BoeS1jZWxscyA9IDwwPjsKPiAg
CQljb21wYXRpYmxlID0gInVzYi1ub3AteGNlaXYiOwo+IEBAIC0xMTQsNiArMTM0LDQ2IEBAICZj
bGtfaHNlIHsKPiAgCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47Cj4gIH07Cj4gIAo+ICsm
ZHNpIHsKPiArCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ICsJI3NpemUtY2VsbHMgPSA8MD47Cj4g
KwlzdGF0dXMgPSAib2theSI7Cj4gKwo+ICsJcG9ydHMgewo+ICsJCSNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+ICsJCSNzaXplLWNlbGxzID0gPDA+Owo+ICsKPiArCQlwb3J0QDAgewo+ICsJCQlyZWcg
PSA8MD47Cj4gKwkJCWRzaV9pbjogZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBvaW50ID0g
PCZsdGRjX291dF9kc2k+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwo+ICsJCXBvcnRAMSB7Cj4gKwkJ
CXJlZyA9IDwxPjsKPiArCQkJZHNpX291dDogZW5kcG9pbnQgewo+ICsJCQkJcmVtb3RlLWVuZHBv
aW50ID0gPCZkc2lfcGFuZWxfaW4+Owo+ICsJCQl9Owo+ICsJCX07Cj4gKwl9Owo+ICsKPiArCXBh
bmVsMDogcGFuZWwtZHNpQDAgewo+ICsJCWNvbXBhdGlibGUgPSAib3Jpc2V0ZWNoLG90bTgwMDlh
IjsKPiArCQlyZWcgPSA8MD47IC8qIGRzaSB2aXJ0dWFsIGNoYW5uZWwgKDAuLjMpICovCj4gKwkJ
cmVzZXQtZ3Bpb3MgPSA8JmdwaW9qIDE1IEdQSU9fQUNUSVZFX0xPVz47Cj4gKwkJcG93ZXItc3Vw
cGx5ID0gPCZ2Y2NfM3YzPjsKPiArCQliYWNrbGlnaHQgPSA8JnBhbmVsX2JhY2tsaWdodD47Cj4g
KwkJc3RhdHVzID0gIm9rYXkiOwo+ICsKPiArCQlwb3J0IHsKPiArCQkJZHNpX3BhbmVsX2luOiBl
bmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8JmRzaV9vdXQ+Owo+ICsJCQl9Owo+
ICsJCX07Cj4gKwl9Owo+ICt9Owo+ICsKPiAgJmkyYzEgewo+ICAJcGluY3RybC0wID0gPCZpMmMx
X3BpbnNfYj47Cj4gIAlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+IEBAIC0xMjIsNiArMTgy
LDE2IEBAICZpMmMxIHsKPiAgCXN0YXR1cyA9ICJva2F5IjsKPiAgfTsKPiAgCj4gKyZsdGRjIHsK
PiArCXN0YXR1cyA9ICJva2F5IjsKPiArCj4gKwlwb3J0IHsKPiArCQlsdGRjX291dF9kc2k6IGVu
ZHBvaW50QDAgewoKSGkgRGFyaW8sCgpUaGVyZSBpcyBubyBuZWVkIGZvciB1bml0IG5hbWUgb24g
dGhpcyBlbmRwb2ludCBzaW5jZSBpdCBpcyBhbG9uZS4KCk90aGVyd2lzZSBpdCB0cmlnZ2VycyB0
aGlzIHdhcm5pbmcgYXQgYnVpbGQgdGltZSA6CgouLi4vYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJmNzY5LWRpc2NvLmR0czoxODkuMjgtMTkxLjU6IFdhcm5pbmcKKHVuaXRfYWRkcmVzc192c19y
ZWcpOiAvc29jL2Rpc3BsYXktY29udHJvbGxlckA0MDAxNjgwMC9wb3J0L2VuZHBvaW50QDA6IG5v
ZGUKaGFzIGEgdW5pdCBuYW1lLCBidXQgbm8gcmVnIG9yIHJhbmdlcyBwcm9wZXJ0eQoKLi4uL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMyZjc2OS1kaXNjby5kdHM6MTg5LjI4LTE5MS41OiBXYXJu
aW5nCih1bml0X2FkZHJlc3NfdnNfcmVnKTogL3NvYy9kaXNwbGF5LWNvbnRyb2xsZXJANDAwMTY4
MDAvcG9ydC9lbmRwb2ludEAwOiBub2RlCmhhcyBhIHVuaXQgbmFtZSwgYnV0IG5vIHJlZyBvciBy
YW5nZXMgcHJvcGVydHkKCgpSZWdhcmRzLAoKUmFwaGHDq2wKCj4gKwkJCXJlbW90ZS1lbmRwb2lu
dCA9IDwmZHNpX2luPjsKPiArCQl9Owo+ICsJfTsKPiArfTsKPiArCj4gICZydGMgewo+ICAJc3Rh
dHVzID0gIm9rYXkiOwo+ICB9OwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
