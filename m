Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3609FBB52
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Dec 2024 10:37:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97215C78030;
	Tue, 24 Dec 2024 09:37:46 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1991C78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 09:37:38 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-21680814d42so46256555ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Dec 2024 01:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735033057; x=1735637857;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=;
 b=VcLps48rNMivgIRtJeW74OLwb9JXwehjvNXsSlBUm89G7gvK5/TdIe/rmiuwTfNiAa
 ueR4eA1yMYGfyQR3RkeXH91CHDfnxAZlynVDtAk/r1bnUqJYKBy1LKU6JFWAPdJZoue+
 z2iSMV43oUYYARkHFErLbbFT6PFra1tWUL7f0oLkRmmNeKZKzc1PzCBBDprtb8UfxJiY
 3/cYL5OklaSV2w6GoS2pMQHXqL3nBC9PUkeLZMfrwkeR60/VWd6W+9J7t3gzhMPVSFpl
 prm8I0xLuNCPlhDOqQ8tfGOWod5fcuHwxkf9cNuSn7ujCbQJ1M1KSIHSb5mjJCzXYDJ9
 IDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735033057; x=1735637857;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jLmFWbWd3SQkC6J4LYdTAks5WNvEgPSVXIlgEkT9qUk=;
 b=UJ23/v0OqUaGie3kMgx8YsD6mtxchTsrzF/g6sehdwA7OpVRD9pBAuFIk+fcdapDX/
 4ryGue0CTRuTcH1zues+61sroLGt6BlJ3ivlmgw3o4lHw+HLMDkMwPyJcdFz1tWQRCg6
 1FsdlXnz3x3m+U3bjiXsKt0k1WAlKrHmuZDcE02wPb/E5QNZ12uaFRocsKnw1Qc3GM5v
 4QEXSUL+95OZT07PUpRitBVNtMXHXfBh9tPiUuJunnjCTdQsmuXd1i0S1Cg8UMuOekGv
 UvXOWf/R3YfAe46eqaflYo1ndo5h8jxKT61sFZBkmObdHJZ8lDlM6wxM4+YXRAbW7DBf
 00Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQYcfFT7Aus67379ySOfy+TRXA4FJ0aJIHgB5ttyD+lT+fy+ieCZkAWebBvGQ15hEf858cwOgjTSzseg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwrSKInkZD+zLxk5uSlWQthqShkI5c7df7ejJpsczXikneJhpfJ
 EnZvWfrC6OmZ2noUTH5LxFsOXnP90IFASchQS2anx644EGAmc4Hr
X-Gm-Gg: ASbGnctYLt4XBecrFWtgR+eGPBW4XVUhOg6IPD3eIG+QSDKDSb1ryk5IoiJ2tg3qN0p
 pwwrkUJAPV2aSoMOx/4P695hCdL9jIe3eDIWAzWEXd3tKZvSZhsTHo4fqsCYPgwl1JjWcx4Fn9H
 LJN20K2yobadsSRj9Oj+S8Gvka/To3T1lqK6zclgFei3csepovUYJnqfaKDL4MJE/xGMF+OxcJt
 GQPS4NEC4d9IpWwhZzzJYHHF+oltbcilCwxGU/WJ1GKLedWzvyFvFQxHV5oyxQc6Vx4R92LSoMX
 SU8vhMvj0rtpwY/chB1hakV5ksfnB/ZbxA0=
X-Google-Smtp-Source: AGHT+IHeB/WWKd6mmgZbT26UjUM4RGWZKImwzEuCo8jzyGFGDy66eiSE5XasK5+ZN6cxtxmkvDMOCA==
X-Received: by 2002:a05:6a00:8085:b0:725:ae5f:7f06 with SMTP id
 d2e1a72fcca58-72abe096383mr24761611b3a.23.1735033057380; 
 Tue, 24 Dec 2024 01:37:37 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad90c1bcsm9590252b3a.187.2024.12.24.01.37.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Dec 2024 01:37:36 -0800 (PST)
Message-ID: <5ae923d7-3b4f-430c-bb43-edee7f549e56@gmail.com>
Date: Tue, 24 Dec 2024 17:37:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
 <20241218114442.137884-4-a0987203069@gmail.com>
 <7a4f5769-0010-40fd-8bb7-a20f2725114f@intel.com>
 <216e7c97-e0b1-4833-b344-a71834020b15@gmail.com>
 <c800e544-82af-43d3-b07a-e7b1a4028330@intel.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <c800e544-82af-43d3-b07a-e7b1a4028330@intel.com>
Cc: edumazet@google.com, schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v5 3/3] net: stmmac: dwmac-nuvoton: Add
 dwmac glue for Nuvoton MA35 family
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

ClByemVtZWsgS2l0c3plbCDmlrwgMTIvMjAvMjAyNCA2OjU5IFBNIOWvq+mBkzoKPiBPbiAxMi8y
MC8yNCAwODowNywgSm9leSBMdSB3cm90ZToKPj4gRGVhciBQcnplbWVrLAo+Pgo+PiBUaGFuayB5
b3UgZm9yIHlvdXIgcmVwbHkuCj4KPiBzdXJlIDopCj4gcGxlYXNlIGFsc28gY29uZmlndXJlIHlv
dXIgZW1haWwgdG8gd3JpdGUgcmVwbGllcyBhcyBwbGFpbi10ZXh0LCBpbnN0ZWFkCj4gb2YgSFRN
TApUaGFuayB5b3UgZm9yIHRoZSByZW1pbmRlcvCfmYIKPgo+IEkgYWxzbyBmb3Jnb3QgdG8gc2F5
LCB0aGF0IHlvdSBzaG91bGQgaGF2ZSB0YXJnZXQgdGhpcyBzZXJpZXMgZm9yIHRoZQo+IG5ldC1u
ZXh0ICgtLXN1YmplY3QtcHJlZml4IGZvciBnaXQtc2VuZC1lbWFpbCkKPgpNYXkgSSBjb25maXJt
IGlmIHlvdSBhcmUgcmVmZXJyaW5nIHRvIG5ldGRldi9uZXQtbmV4dD8KPgo+IFBsZWFzZSBhbHNv
IG5vdGUgdGhhdCB5b3VyIHYyIHNob3VsZCB3YWl0IHRvIGJlIHNlbmQgaW4gdGhlIG5ldyB5ZWFy
LAo+IGFzIHdlIHdpbGwgYmVnaW4gdGhlIFdpbnRlciBCcmVhayBmb3IgbmV0ZGV2IE1MIGluIGEg
bW9tZW50Lgo+CkdvdCBpdCEgSGFwcHkgaG9saWRheXMhIPCfjokKPgo+Pj4+ICsvKiAyMDAwcHMg
aXMgbWFwcGVkIHRvIDAgfiAweEYgKi8KPj4+PiArI2RlZmluZSBQQVRIX0RFTEFZX0RFQ8KgwqDC
oMKgwqAgMTM0Cj4+Pgo+Pj4gd291bGQgYmUgZ3JlYXQgdG8gcHJldml4IHlvdXIgbWFjcm9zIGJ5
IE5WVF8KPj4gR290IGl0Lgo+Pj4KPj4+IHdoeSAxMzQgYW5kIG5vdCAxMjU/Cj4+Cj4+IFRoZSBp
bnRlcnZhbCBpcyBjb25maXJtZWQgdG8gYmUgMTM0LiBUaGUgbWFwcGluZyBpcyBhcyBmb2xsb3dz
Ogo+Pgo+PiB8MDAwMHwgPSAwLjAwIG5zCj4+IHwwMDAxfCA9IDAuMTMgbnMKPj4gfDAwMTB8ID0g
MC4yNyBucwo+PiAuLi4KPj4gfDExMTF8ID0gMi4wMCBucwo+Cj4gdGhhbmtzLCB0aGF0J3MgY29y
cmVjdCwgc29ycnkgZm9yIGNvbmZ1c2lvbgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
