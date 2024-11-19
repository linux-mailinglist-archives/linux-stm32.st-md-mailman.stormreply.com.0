Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D89A69D418E
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C3E9C7A85E;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0FF5C78F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 10:08:22 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20c8b557f91so6498235ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 02:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732010901; x=1732615701;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=;
 b=AQIvAU1iq1xiStoVnLOKLZYpypwvHqHkGAh5iIWqRrSDT+N9zr2DY41LFuxB7DgMQl
 B0AdtyYQHN5kNrGo1bl8wrLv566M92zFHMfZhj5pq4FMqWklf4byWnyXsraTmMRLs06+
 UqGPzx5SpjIqr0Be143dqtRsNdhVdzpTYwXQxBw4qvFLPgnVLQxnHnY37pNkJVu3fYmZ
 POayjCgy/IgquHmvJrEOazI/u8PIIpKfmqisvgw2zZnkNhbEQN3J9jjAmVhCGuIDek2P
 BNlT3qJgCStlE8DCXYaIg6WsNUdszBoxVnBCsGIyO9Rftsl5Tb380LtiyOEtBmtTRSTU
 A3iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732010901; x=1732615701;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cWTYfL2NcNvtJ7hT2DfleWj2jSJLFnsNcjBnW0uewCg=;
 b=pZuRpgkpG7wBLXfOdN0czkghownDuKJoZAu/1mW6KWIlFK095wQ9ENepzZ/YaL6+Fz
 lEZdD+Bl42AYVJpzi7QJ/DM8kUxEKVgnYgfzYeegBzudymIrtvGiQGe0APNJSdvRrzss
 QdhuLyLYS1ScjxAosPJIWX0UekdET6Em1eXIzvTPC/wBs+E66S/RrUh7AX8CNqF5sZ0S
 okpTRYr6nbPp0BFhjDWGc5s7UIsak+C42uRNxSyRqHJH77sSlORbbZLeBxAwpnp8JS+/
 Gx/TANlG2S+e3sAAmSQ+lJPBVeGYbUT48fuVCmGuCbFeYhIV9YjE8Ce8JYSkZCGMODDo
 z4qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9pIGOjsDE4OYCU5BuGc2sCQXrtF13POQVdhxpSgWodhGjTpD+KqMmkMFLOtf8mHJYkS4DpGdizrcHaQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzuZ8vw6npW9ft+t5WPP3aAPiTJ4JfL8CUsiGkHARHEWiADRJvA
 Odp9pAJx9nhGx17F2i8S7eqVLa3VWaoZal/sol7AZKfdqTJrK2xS
X-Google-Smtp-Source: AGHT+IEAjyQGdRHNm7PwkX2khYpceIhQ92EAPL/Ia7j4slTtR5ja4Ryry5i8z7VVQ8n6txgqIQJr+w==
X-Received: by 2002:a17:903:1d1:b0:20c:9983:27ae with SMTP id
 d9443c01a7336-211d0ecdac7mr237798475ad.48.1732010900702; 
 Tue, 19 Nov 2024 02:08:20 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2120ac39585sm41966965ad.261.2024.11.19.02.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 02:08:20 -0800 (PST)
Message-ID: <191ebf4b-231d-4ebc-9ff2-4916ef718970@gmail.com>
Date: Tue, 19 Nov 2024 18:08:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <4d44bc93-6a81-4dc8-9f22-a103882f25e1@lunn.ch>
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: ychuang3@nuvoton.com, edumazet@google.com, schung@nuvoton.com,
 yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH v3 3/3] net: stmmac: dwmac-nuvoton: Add
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

CkFuZHJldyBMdW5uIOaWvCAxMS8xOS8yMDI0IDk6NDggQU0g5a+r6YGTOgo+PiArCWlmIChvZl9w
cm9wZXJ0eV9yZWFkX3UzMihkZXYtPm9mX25vZGUsICJ0eC1pbnRlcm5hbC1kZWxheS1wcyIsICZh
cmcpKSB7Cj4+ICsJCXR4X2RlbGF5ID0gMDsgLyogRGVmYXVsdCB2YWx1ZSBpcyAwICovCj4+ICsJ
fSBlbHNlIHsKPj4gKwkJaWYgKGFyZyA8PSAyMDAwKSB7Cj4+ICsJCQl0eF9kZWxheSA9IChhcmcg
PT0gMjAwMCkgPyAweEYgOiAoYXJnIC8gUEFUSF9ERUxBWV9ERUMpOwo+PiArCQkJZGV2X2RiZyhk
ZXYsICJTZXQgVHggcGF0aCBkZWxheSB0byAweCV4XG4iLCB0eF9kZWxheSk7Cj4gVGhlIGRldmlj
ZSB0cmVlIGJpbmRpbmcgc2F5czoKPgo+ICsgIHR4LWludGVybmFsLWRlbGF5LXBzOgo+ICsgICAg
ZW51bTogWzAsIDIwMDBdCj4KPgo+IFNvIG9ubHkgdHdvIHZhbHVlcyBhcmUgYWxsb3dlZC4gWWV0
IHRoZSBDIGNvZGUgaXMKPgo+IGFyZyAvIFBBVEhfREVMQVlfREVDCj4KPiB3aGljaCBzZWVtcyB0
byBhbGxvdyAxNiB2YWx1ZXM/Cj4KPiBQbGVhc2UgbWFrZSB0aGlzIGNvbnNpc3RlbnQuCj4KPgo+
ICAgICAgQW5kcmV3CgpPb3BzLiBUaGF0IHdhcyBteSBtaXN1c2U7IEkgd2lsbCBjaGFuZ2UgaXQg
dG8gbWluaW11bSBhbmQgbWF4aW11bS4KClRoYW5rcyEKCkJSLAoKSm9leQoKPgo+IC0tLQo+IHB3
LWJvdDogY3IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
