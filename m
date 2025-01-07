Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDFBA036B5
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 04:55:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8551FC78018;
	Tue,  7 Jan 2025 03:55:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD8B2C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 03:55:21 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-2f441791e40so17724837a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jan 2025 19:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736222120; x=1736826920;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=;
 b=Olr8sK6UfxHX8VfoNGtQpY2feWb3BVq5l3I3tMRH6iNNM7tssB9tozcCshclHGXdTf
 Hsc65xWCHX+fNQ16zyOgEiIr7Trfa05HAfzwz1tV+2iVj0kUI5kTbWLjZvxQdVZaI7N5
 y1ILq7Pq8Y3ipr+ZU2wG8obNze22wU5JuznCIyS69iXE14lKry+9Lzt36eLsuA6X4z9j
 CflNw6CFQ8tIpmEEiCAZC6GajxPGBSF1+31FtNZH1TikVvvmH+z5Ls3gVP27ki/FMGRl
 OgWEW6wHrBpUY/Yj3pHutOVZXJF1XrXpmmXkrld0Tevfh86T5ZSNpxRi6CKQI3nVF790
 ifFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736222120; x=1736826920;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JkSX5xIdc8zBLFm+jjJZtb1iB0BmRRseeOTnpcRWYIA=;
 b=dyt9AxbVbjCMDICt+ENrixnRf5ke0UTF4cJBSOQVMfWEZVFZg9QE7zDoXnvvzO1yIx
 2Fqmiyku09QzuU7NVp1IlACzZz8jPjckwDDf1sf9mDr2ctL4DJ6HC2+gvMy4bw6f9ah8
 NIMuxPfoAv75wrf2nig+T+EkYM9qderAiSelOVqxJBSALi7b9Is+UOXdJYpsoRN8ZU5+
 7y57a66FU1G9MbmBCmYyCKm8mIBlRjThjaS2DNpOD9Q3aX0RvUI42EYh/BS2vWv77PJX
 BKjTGS1hrueD9ERFKXExGB6V4iRSb+OZM3j8fvbCU1vQv2ZEAROcSFD1PWNpy8ikYhCq
 iBwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvi4MmOizi7MeckFCZ6fX82h0j3tXbBzP/7zs3JnBwCML5Y3I2UGm27Y12+S7tyzCcDu5kDXYcjhdOYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwNhryKYjSM8dsp60nbx5a5o47zwPBV9wcqa4h9g4GKCrOPGxx1
 rcohSzvvv/kVyMhSIHukVCap0/N3ehW7IN/VmPdwCM2e5GCfHcCx
X-Gm-Gg: ASbGnctqAFEfdEeV1+uATpBO4SZfBBlLnVB7jUg4wTpmIlwTDKnm+VP5zQ32pBKpW5u
 pOHtOBgTJcS9VHnZFghReESWwGpG+4WfQ9wLW+YTtuxA3XblhNZuqcZSIaDmrq0sXf/mLCc9IWi
 gh5OyM+uPtKuSReq5S4pwpncWjpNktKOVVgOIHmNHZUuHWMh0GEAhEp3dZOoweWFAdRIqWKp9oM
 E9g3d9vEzjgUq9IBa3fl45+/MFExrXObP71cYgRnjHnsu/1/Ml9kti45Ges/f3nsJrEXEJ4VnMZ
 rKkVZgXdbiob6JouNsxCNaXXgO+gmoYMlm0=
X-Google-Smtp-Source: AGHT+IE2K2gRs1V2fgpYN0CLM9zdF4nwVbYze0GXJZkFBE9yEldHu2WRl6ZMw9QvCXUDA6422eZIOQ==
X-Received: by 2002:a17:90b:2545:b0:2ee:a76a:820 with SMTP id
 98e67ed59e1d1-2f452e3eebamr85264355a91.18.1736222120018; 
 Mon, 06 Jan 2025 19:55:20 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f48db83c37sm26295046a91.47.2025.01.06.19.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 19:55:19 -0800 (PST)
Message-ID: <14ad5eae-e10d-426d-ace1-f841b5249e9f@gmail.com>
Date: Tue, 7 Jan 2025 11:55:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20250103063241.2306312-1-a0987203069@gmail.com>
 <20250103063241.2306312-4-a0987203069@gmail.com>
 <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <2736ccd3-680d-4f5d-a31a-156dec056f22@wanadoo.fr>
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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

CkNocmlzdG9waGUgSkFJTExFVCDmlrwgMS80LzIwMjUgMTI6MzggQU0g5a+r6YGTOgo+IExlIDAz
LzAxLzIwMjUgw6AgMDc6MzIsIEpvZXkgTHUgYSDDqWNyaXTCoDoKPj4gQWRkIHN1cHBvcnQgZm9y
IEdpZ2FiaXQgRXRoZXJuZXQgb24gTnV2b3RvbiBNQTM1IHNlcmllcyB1c2luZyBkd21hYyAKPj4g
ZHJpdmVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKb2V5IEx1IDxhMDk4NzIwMzA2OUBnbWFpbC5j
b20+Cj4KPiAuLi4KPgo+PiArwqDCoMKgIC8qIE51dm90b24gRFdNQUMgY29uZmlncyAqLwo+PiAr
wqDCoMKgIHBsYXRfZGF0LT5oYXNfZ21hYyA9IDE7Cj4+ICvCoMKgwqAgcGxhdF9kYXQtPnR4X2Zp
Zm9fc2l6ZSA9IDIwNDg7Cj4+ICvCoMKgwqAgcGxhdF9kYXQtPnJ4X2ZpZm9fc2l6ZSA9IDQwOTY7
Cj4+ICvCoMKgwqAgcGxhdF9kYXQtPm11bHRpY2FzdF9maWx0ZXJfYmlucyA9IDA7Cj4+ICvCoMKg
wqAgcGxhdF9kYXQtPnVuaWNhc3RfZmlsdGVyX2VudHJpZXMgPSA4Owo+PiArwqDCoMKgIHBsYXRf
ZGF0LT5mbGFncyAmPSB+U1RNTUFDX0ZMQUdfVVNFX1BIWV9XT0w7Cj4+ICsKPj4gK8KgwqDCoCBw
cml2X2RhdGEgPSBudnRfZ21hY19zZXR1cChwZGV2LCBwbGF0X2RhdCk7Cj4+ICvCoMKgwqAgaWYg
KElTX0VSUihwcml2X2RhdGEpKQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIocHJp
dl9kYXRhKTsKPj4gKwo+PiArwqDCoMKgIHJldCA9IHN0bW1hY19kdnJfcHJvYmUoJnBkZXYtPmRl
diwgcGxhdF9kYXQsICZzdG1tYWNfcmVzKTsKPgo+IHN0bW1hY19wbHRmcl9yZW1vdmUoKSBpcyBj
YWxsZWQgYnkgdGhlIC5yZW1vdmUgZnVuY3Rpb24uCj4gSXMgaXQgY29ycmVjdCB0byBjYWxsIHN0
bW1hY19kdnJfcHJvYmUoKSBoZXJlLCBhbmQgbm90IAo+IHN0bW1hY19wbHRmcl9wcm9iZSgpPwoK
VGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suIFlvdSdyZSBjb3JyZWN0LiBJIHdpbGwgdXBkYXRl
IHRoZSBjb2RlIHRvIApjYWxsIHN0bW1hY19wbHRmcl9wcm9iZSgpLgoKQlIsCgpKb2V5Cgo+Cj4+
ICvCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+ICsKPj4g
K8KgwqDCoCAvKiBUaGUgUE1UIGZsYWcgaXMgZGV0ZXJtaW5lZCBieSB0aGUgUldLIHByb3BlcnR5
Lgo+PiArwqDCoMKgwqAgKiBIb3dldmVyLCBvdXIgaGFyZHdhcmUgaXMgY29uZmlndXJlZCB0byBz
dXBwb3J0IG9ubHkgTUdLLgo+PiArwqDCoMKgwqAgKiBUaGlzIGlzIGFuIG92ZXJyaWRlIG9uIFBN
VCB0byBlbmFibGUgV29MIGNhcGFiaWxpdHkuCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIHBs
YXRfZGF0LT5wbXQgPSAxOwo+PiArwqDCoMKgIGRldmljZV9zZXRfd2FrZXVwX2NhcGFibGUoJnBk
ZXYtPmRldiwgMSk7Cj4+ICsKPj4gK8KgwqDCoCByZXR1cm4gMDsKPj4gK30KPgo+IC4uLgo+Cj4+
ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBudnRfZHdtYWNfZHJpdmVyID0gewo+PiAr
wqDCoMKgIC5wcm9iZcKgID0gbnZ0X2dtYWNfcHJvYmUsCj4+ICvCoMKgwqAgLnJlbW92ZSA9IHN0
bW1hY19wbHRmcl9yZW1vdmUsCj4+ICvCoMKgwqAgLmRyaXZlciA9IHsKPj4gK8KgwqDCoMKgwqDC
oMKgIC5uYW1lwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAibnV2b3Rvbi1kd21hYyIsCj4+ICvCoMKg
wqDCoMKgwqDCoCAucG3CoMKgwqDCoMKgwqDCoCA9ICZzdG1tYWNfcGx0ZnJfcG1fb3BzLAo+PiAr
wqDCoMKgwqDCoMKgwqAgLm9mX21hdGNoX3RhYmxlID0gbnZ0X2R3bWFjX21hdGNoLAo+PiArwqDC
oMKgIH0sCj4+ICt9Owo+Cj4gLi4uCj4KPiBDSgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
