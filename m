Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5EB9D94B5
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 10:39:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2AA66C78016;
	Tue, 26 Nov 2024 09:39:48 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EB59C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 09:39:40 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3ea49cc8b88so908750b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 01:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732613979; x=1733218779;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=;
 b=Yaf++DWMinxgJ2qwc1im1THs77Mhx63ozpY1GftL+gmsShXHoQy1HtzdOGautjzhJD
 1dqPCXIYMDAtVSDbeQdjxQ7SjXAgFbPd9D3+Xk7Xe47u0Jrl8VzBgCp7xEtNQiTVTVKZ
 tpuFyZZTK7ahOMmo3BC6t9L7LiFMDcYrli2+0t8Sy28h1leWPKHB8ry0ij3kEEhuvECX
 JwL1U3d2GCgY4snIoDhoQh0nBfdwpPu5U0kakelmI7OY2BL/xi3iR1cesl9sVCmpsSif
 +BnK3p0UXVHNXUHMZxP4/bmNKSWhgG8zWUCQpplvZGBOeUKk2mQ9u6PsQ/pS4j2hyiJb
 QGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732613979; x=1733218779;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5VqTNP1l3I0fkOuZ3WrWUQyb1/49E8EQXioZGwnik0g=;
 b=vAfrSvE30KN1zRpkzoOjDaRM27Abb2Y5SXrJfT6XZhT+1yUZyLhsT0puWRL+MzvlcY
 U6C3om25sKO4sJqEWE5fWxuE+C2fbDY88tnFc4U/4Bn1PLAb9v95RB7C4IJfjie4n3Sp
 krFUScyZUqXRzXsw1d+/Bpr0ui+9LGCW2mBK9XSs/GCuPgfAqmUVKVST3rGA4rD3tLgE
 8eyICt57a85rLm4qHYg4QQeAs62FVnSHCZFiazjCy+bC6Zg0vvg3XZUrzebXmxQZJxXE
 qSDr/oNA6LJqcERJsbGgm2/SG2j2P0CzlW0IpsSVFoHkOFsiG5pDKEnqn/eoqCbkvIVC
 0Luw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNJhbfF6VJ9hlZ7HeWsHH20qCKH4HMU6J/lG1ST3VuYf9yaPqHCI2DoIce7NsaLa9v+FHt6M5+pRPfVA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywzoi5y24CvYSsZhQeD64AOmMpQj3NblODZpEpMIHpKJk3AZhd8
 gLjthOkXl+apjwGzCgp96PUkmX5yjL37aoMmobF8rTSI/2fFKa4w
X-Gm-Gg: ASbGncv7p0jEixeGg1JZyZrGClPRu0Ng9ZM/r97xOyvGmh0DW8O2oBZ9O+DTMdpRqOJ
 g8+NtLsEA18ZB517z8L2zQn8sf8KnL8c+o7SvS18aO/60PR539wP3Lv/JRiGpapvVwMEw0ukvzI
 gnmrx0rCgMqDaxwD0m5etNCowiYmG42WsW6IgsXFnN1ufVUqrCYqArrdFcgqLK7iNV/fu7E5AUM
 yp28J1wMmWLn7vPR/mqCPoueiWmzsux1ckEi1sMd7y7eW8ryMdWfDsDg7qRcylLGc4KhP37Iiil
 RKK5uX08300w8RgTJMhYFoBRikAB
X-Google-Smtp-Source: AGHT+IGrPjDu68pnnnryOtllFazbBZWaKbpvb8qp33lzobhDwUA1rKma6IACU9y0c2nXW4nq4Bk1hA==
X-Received: by 2002:a05:6808:2395:b0:3e7:5cfa:87d1 with SMTP id
 5614622812f47-3e915aef033mr13135476b6e.27.1732613978760; 
 Tue, 26 Nov 2024 01:39:38 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de531247sm8159148b3a.104.2024.11.26.01.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 01:39:38 -0800 (PST)
Message-ID: <75e4881c-8b04-4b57-ab0d-e7eb18b31a84@gmail.com>
Date: Tue, 26 Nov 2024 17:39:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241118082707.8504-1-a0987203069@gmail.com>
 <20241118082707.8504-4-a0987203069@gmail.com>
 <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <klp4a7orsswfvh7s33575glcxhlwql2b7otrpchvucajydihsi@dqdkugwf5ze5>
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

RGVhciBVd2UsCgpUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxzIQoKVXdlIEtsZWluZS1Lw7ZuaWcg
5pa8IDExLzIwLzIwMjQgMTA6NTYgUE0g5a+r6YGTOgo+IEhlbGxvLAo+Cj4gT24gTW9uLCBOb3Yg
MTgsIDIwMjQgYXQgMDQ6Mjc6MDdQTSArMDgwMCwgSm9leSBMdSB3cm90ZToKPj4gK3N0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG51dm90b25fZHdtYWNfZHJpdmVyID0gewo+PiArCS5wcm9i
ZSAgPSBudXZvdG9uX2dtYWNfcHJvYmUsCj4+ICsJLnJlbW92ZV9uZXcgPSBzdG1tYWNfcGx0ZnJf
cmVtb3ZlLAo+IFBsZWFzZSB1c2UgLnJlbW92ZSBpbnN0ZWFkIG9mIC5yZW1vdmVfbmV3Lgo+Cj4g
VGhhbmtzCj4gVXdlCgpJIHdpbGwgdXNlIC5yZW1vdmUgaW5zdGVhZC4KClRoYW5rcyEKCkJSLAoK
Sm9leQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
