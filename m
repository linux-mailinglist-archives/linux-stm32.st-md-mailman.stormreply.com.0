Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CB295758E
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 22:22:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF958C6DD72;
	Mon, 19 Aug 2024 20:22:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3E60C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 20:21:58 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42819654737so36866495e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 13:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724098918; x=1724703718;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vaS84ttcu/4010Fv9HBj9GzkRV/n79iBXqj2pli8Tbs=;
 b=ZDztHD1/pvnsQzJTupMODqHIKwuGxBym0baq7imtBrKxSXW6B2fgXl5AG/800+wvcq
 58IYtmXVsELRud7tsO2IyMT3m6TU4D7ARhSAg37L447+AQr9di6nsfmITDpaHA/Mk5am
 59Erz9x2Um/efLSH9xl0YEuxSMY5IYvzw90SIkBWp/4w/xEy2kwG5yfaFiTW+6PcxrI6
 6ARhPbtVuTZu2B/m30TPVqsGsfWcWfeUR4SrVh7m4M4TSxj9o59GBGfn8sX5s9t5gdnL
 scRtYYGXqIze243eRnyF14btKYzQa/z5HoTspk0dP2gz76iYFd0EeNjh50FbHqBz/yCP
 ia9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724098918; x=1724703718;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vaS84ttcu/4010Fv9HBj9GzkRV/n79iBXqj2pli8Tbs=;
 b=msxoO6qEQNoKkIMmcEDxMQlmptfHHee8dUJE28ZD7PxyK6xScsIbskXWODD08TWx2J
 Vt0wOkvsY/a9vFVqvH0ow3BfRYCQVi9qIpjcEBHQ0EzSvxNiKH3CCTb7c8iM6kaazhXR
 MDRWGAYJA3pMzDCJNauFHrcFE6mvz4uh3NJj952XoV3d1I/oVADjAAM9hCe3P5lcrBl+
 6gYHRMusBo5msoZ9iXteyhidqy1Pxjgk19yFRQru0bUEGddaAvTINikmMZt5qfFWwaSw
 XCG2z/ADeXIGnWfbIl8nurF54CjbN/KHNWeoIgmnXoZFGm/sTCZ9S5wwaxFWVgrV+II9
 V5vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyYKVKyN9HnIh9djAJy8joocdoT1V4X8Y1yj3saCqShUt4jEzgw+6wDwJDNRKO39T+KX05ozkOZxDWow==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywq8qGIv0d2SCz1FIbRbzdKGHMQ9IHpiLI2aV5EtPQUNVi7V8eS
 8UBRBQrPyvCgWclkiCLE/IyM+kkMn970MHEQ45H4EN9ojKH9sSdQ
X-Google-Smtp-Source: AGHT+IGSRZAWyt+DnYIwf5njkpB6uItML2uqPjDLE5kTdpFc+m+lKakFrb+klZliHoHggbI0Xsx4Qg==
X-Received: by 2002:a05:600c:1c0a:b0:429:e6bb:a436 with SMTP id
 5b1f17b1804b1-429ed79be6dmr88973655e9.9.1724098917396; 
 Mon, 19 Aug 2024 13:21:57 -0700 (PDT)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194?
 ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded35991sm173247315e9.21.2024.08.19.13.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 13:21:57 -0700 (PDT)
Message-ID: <85eedb28-c02f-40ef-9d65-e8689b3f7dbd@gmail.com>
Date: Mon, 19 Aug 2024 22:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240716-thermal-v4-0-947b327e165c@gmail.com>
Content-Language: en-US, fr
In-Reply-To: <20240716-thermal-v4-0-947b327e165c@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/2] Add thermal management support for
	STi platform
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

SGVsbG8sCgpMZSAxNi8wNy8yMDI0IMOgIDE5OjM0LCBSYXBoYWVsIEdhbGxhaXMtUG91IGEgw6lj
cml0wqA6Cj4gVGhpcyBwYXRjaCBzZXJpZXMgZW5oYW5jZXMgdGhlIHN0X3RoZXJtYWwgZHJpdmVy
IGluIG9yZGVyIHRvIGVuYWJsZQo+IHN1cHBvcnQgZm9yIHRoZXJtYWwgem9uZXMuIFRoZSBjaGFu
Z2VzIGluY2x1ZGU6Cj4gCj4gMS4gUmVwbGFjZSBkZXByZWNhdGVkIFBNIHJ1bnRpbWUgbWFjcm9z
IHdpdGggdGhlaXIgdXBkYXRlZCBjb3VudGVycGFydHMuCj4gMi4gSW1wbGVtZW50aW5nIGRldm1f
KiBiYXNlZCB0aGVybWFsIG9mIHpvbmUgZnVuY3Rpb25zIHdpdGhpbiB0aGUgZHJpdmVyLgo+IDMu
IFVwZGF0aW5nIHRoZSBzdGloNDE4IGRldmljZS10cmVlLgo+IAo+IFRoZSBkZXZpY2UtdHJlZSBw
YXRjaCBkZXBlbmRzIG9uIGFuIGVhcmxpZXIgcGF0Y2ggc2VudCB0byB0aGUgbWFpbGluZwo+IGxp
c3QgWzFdLgo+IAo+IEFzIGl0IGlzIGN1cnJlbnRseSBpbXBsZW1lbnRlZCwgYW4gYWxlcnQgdGhy
ZXNob2xkIG9mIDg1wrBDIGlzIHNldCB0bwo+IHRyaWdnZXIgdGhlIENQVSB0aHJvdHRsaW5nLCBh
bmQgd2hlbiB0aGUgdGVtcGVyYXR1cmUgZXhjZWVkcyB0aGUKPiBjcml0aWNhbCB0aHJlc2hvbGQg
b2YgOTXCsEMsIHRoZSBzeXN0ZW0gc2h1dHMgZG93bi4gVGhlcmUgaXMgZm9yIG5vdyBubwo+IGFj
dGl2ZSBjb29saW5nIGRldmljZSBvbiB0aGUgcGxhdGZvcm0sIHdoaWNoIGV4cGxhaW5zIHRoZSB1
c2Ugb2YgdGhlCj4gY3B1ZnJlcSBmcmFtZXdvcmsuCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xrbWwvMjAyNDAzMjAtdGhlcm1hbC12My0yLTcwMDI5NjY5NGM0YUBnbWFpbC5jb20K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFp
bC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIFsyLzJdIG9wdGltaXplIGRlcGVuZGVu
Y2llcwo+IC0gWzIvMl0gZG8gbm90IHJldHVybiBkZXZtXyogZXhpdCBjb2RlCj4gLSBMaW5rIHRv
IHYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNzE0LXRoZXJtYWwtdjMtMC04OGYy
NDg5ZWY3ZDVAZ21haWwuY29tCgpHZW50bGUgcGluZyBvbiB0aGlzIHNlcmllIDopCgpUaGFua3Mg
Zm9yIHlvdXIgdGltZSwKClJlZ2FyZHMsClJhcGhhw6tsCgo+IAo+IENoYW5nZXMgaW4gdjM6Cj4g
LSBGaXggdW5tZXQgZGVwZW5kZW5jeSBpbiBbMi8yXQo+IC0gUmVtb3ZlIG5vIG1vcmUgdXNlZCB2
YXJpYWJsZSBpbiBbMi8yXQo+IC0gUmVtb3ZlIGFscmVhZHkgbWVyZ2VkIHBhdGNoIGluIHNvYyB0
cmVlCj4gLSBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjI1LXRo
ZXJtYWwtdjItMC1iZjgzNTRlZDUxZWVAZ21haWwuY29tCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAt
IEFkZCBQYXRyaWNlJ3MgUi1iCj4gLSBFZGl0IHBhdGNoIFsyLzNdIHRvIHJlbW92ZSB1bnVzZWQg
c3RydWN0Cj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNTE4
LXRoZXJtYWwtdjEtMC03ZGZjYTNlZDQ1NGJAZ21haWwuY29tCj4gCj4gLS0tCj4gUmFwaGFlbCBH
YWxsYWlzLVBvdSAoMik6Cj4gICAgICAgIHRoZXJtYWw6IHN0OiBzd2l0Y2ggZnJvbSBDT05GSUdf
UE1fU0xFRVAgZ3VhcmRzIHRvIHBtX3NsZWVwX3B0cigpCj4gICAgICAgIHRoZXJtYWw6IHN0aTog
ZGVwZW5kIG9uIFRIRVJNQUxfT0Ygc3Vic3lzdGVtCj4gCj4gICBkcml2ZXJzL3RoZXJtYWwvS2Nv
bmZpZyAgICAgICAgICAgICAgICB8ICAyICstCj4gICBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RfdGhl
cm1hbC5jICAgICAgICB8IDMyICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBk
cml2ZXJzL3RoZXJtYWwvc3Qvc3RfdGhlcm1hbF9tZW1tYXAuYyB8ICAyICstCj4gICBkcml2ZXJz
L3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYyAgICAgICB8ICA4ICsrKy0tLS0tCj4gICA0IGZpbGVz
IGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDI3IGRlbGV0aW9ucygtKQo+IC0tLQo+IGJhc2Ut
Y29tbWl0OiA0ZjQwYmU2MWFmOTlhNjdkNTU4MGMxNDQ4YWNkOWI3NGMwMzc2Mzg5Cj4gY2hhbmdl
LWlkOiAyMDI0MDUxOC10aGVybWFsLThmNjI1NDI4YWNmOQo+IAo+IEJlc3QgcmVnYXJkcywKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
