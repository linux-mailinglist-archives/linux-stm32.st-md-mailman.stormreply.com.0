Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0879EE822
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Dec 2024 14:57:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 48681C7129D;
	Thu, 12 Dec 2024 13:57:21 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01BA3C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 13:57:12 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2ee786b3277so405910a91.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Dec 2024 05:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734011831; x=1734616631;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=NmTLqzScZk4mohfJDKEOFiS/c5yRNNGYoc5k/qifRE8=;
 b=AmtFTuCTlU3ILoHMLIbVhfa0p+UFtbe8RMPN67ZtswWZX0YZU0MqeJ1WsmfKl3OC58
 cqnErMmFlPERphst3IXa8t7jrK2GzjMxs8j/4c7B7byOX2lHHTeRZ3B2pxgdNOc3AQJg
 uJGT7ZKwfvBpzI5+a7gPuqMf2VEMx83Zyq9vExX3jvkaugD1cKD8kzsRyKALQXYgG/Pi
 oAd4xpumaYXBXY3liTPu4MkxOL3bvsg203y9t0V16L8SF/f0yxQK9I0oYFIhtNJFYr/H
 9skCdoCxZknM6h8G2rhP3B15q5+SV1fhecqJzRfSBQWxAC8VkOYZKwrJoKeJCxxBTACe
 mrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734011831; x=1734616631;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NmTLqzScZk4mohfJDKEOFiS/c5yRNNGYoc5k/qifRE8=;
 b=eMz9e7nau4vRpB+8eDbRpkgMhJJhiVlPmX3ikhZ/SLKrUakgy3EuGpShvimW4pZwLl
 1leMa3OoKvFRbRBejvERpw9Xhx0jSplM5WAOE4VIfV0hMofG9m0i5SI2slCgJmySLtz+
 vGt9IN2uqbC+lGc43Nb7kYr2UFeKpiHjUVOHInIdKUOAz5r0zQiDG8Jlmu8cxQ0h0NwK
 2BGz2554enxQbzJbFK6fjTjjzja4NFc3GpB9eWQE/fCqpxv2la1ikBSSBz+nQcG01Fio
 ZQFvnyBMFIibMNQNVVTjCaqJ2vnAyLJXRoPbHtaXe5ITFbwiXO7qrW9mdo36n+r1RBHe
 dJxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX82x990eguUOvaF1F0AyjQShNBU4UsbKa6x1oqeHz4NEYFa9wkAqvuj03o9RusHxpDFjuLHs6Vy6iLrQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqobycyrMAvsRrwNGPtgcdHwXmfgnqfa+Q5zJlEhVhuxQsZQMQ
 O7pvS9SaggobXalvVivd7Ei0k3rWh4I6J8TybUfVmLl1NDbJkNk/
X-Gm-Gg: ASbGncu3ty+hriKeL/dREQ18WGhoCs0Ps5gH12fp/o/GWFWYWZ4VK/LjlcTS5+GfTCu
 13aJCz7pU6VQO3F5Vlnl8zqi9S8W8ef7Al9uMQuynDrTQa/lWZ3DhcrrKa5PrHOYaRZvWbtXgES
 4Ab/eo1qkTL02qck7xyzw0XYeO93LGfYk3993S1ed3RJpJVeFoluBTTSt+NPF6B3IwFQ6r+Zd0A
 fjiFcA2fNX/bzK90n0d5ZdixHpiT9wTXDPlpLq817Z8iYXit8Y5Qe5xngf+8QMGgGch2ew1B04K
 aeAPuKJZ2x+63ILz6s3EAdUzGSoPww==
X-Google-Smtp-Source: AGHT+IEo4mBbMhtkdB3hzbmQugEtnQdEpzVLfEDXMQUSzX33prBh8SEVLIh/6dA+93tI1uPs3+SUpA==
X-Received: by 2002:a17:90b:3b49:b0:2ee:5bc9:75b5 with SMTP id
 98e67ed59e1d1-2f13925b22dmr5825418a91.4.1734011831408; 
 Thu, 12 Dec 2024 05:57:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f142de33basm1274609a91.23.2024.12.12.05.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 05:57:10 -0800 (PST)
Message-ID: <194f1c3a-2333-4a33-b459-d50f02e1b98c@roeck-us.net>
Date: Thu, 12 Dec 2024 05:57:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241211163457.301140-1-clement.legoffic@foss.st.com>
 <20241212102050.374501-1-clement.legoffic@foss.st.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241212102050.374501-1-clement.legoffic@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] watchdog: stm32_iwdg: fix error
 message during driver probe
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

T24gMTIvMTIvMjQgMDI6MjAsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPiBUaGUgY29tbWl0
IDNhYjE2NjNhZjZjMSAoIndhdGNoZG9nOiBzdG0zMl9pd2RnOiBBZGQgcHJldGltZW91dCBzdXBw
b3J0IikKPiBpbnRyb2R1Y2VzIHRoZSBzdXBwb3J0IGZvciB0aGUgcHJlLXRpbWVvdXQgaW50ZXJy
dXB0Lgo+IAo+IFRoZSBzdXBwb3J0IGZvciB0aGlzIGludGVycnVwdCBpcyBvcHRpb25hbCBidXQg
dGhlIGRyaXZlciB1c2VzIHRoZQo+IHBsYXRmb3JtX2dldF9pcnEoKSB3aWNoIHByb2R1Y2VzIGFu
IGVycm9yIG1lc3NhZ2UgZHVyaW5nIHRoZSBkcml2ZXIKPiBwcm9iZSBpZiB3ZSBkb24ndCBoYXZl
IGFueSBgaW50ZXJydXB0c2AgcHJvcGVydHkgaW4gdGhlIERULgo+IAo+IFVzZSB0aGUgcGxhdGZv
cm1fZ2V0X2lycV9vcHRpb25hbCgpIEFQSSB0byBnZXQgcmlkIG9mIHRoZSBlcnJvciBtZXNzYWdl
Cj4gYXMgdGhpcyBwcm9wZXJ0eSBpcyBvcHRpb25hbC4KPiAKPiBGaXhlczogM2FiMTY2M2FmNmMx
ICgid2F0Y2hkb2c6IHN0bTMyX2l3ZGc6IEFkZCBwcmV0aW1lb3V0IHN1cHBvcnQiKQo+IFNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNv
bT4KClJldmlld2VkLWJ5OiBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+Cgo+IC0t
LQo+IHYxIC0+IHYyOiBDaGFuZ2UgdGhlIGNvbW1pdCBtZXNzYWdlIGJlY2F1c2UgaXQgb25seSBw
cmludHMgYW4gZXJyb3IKPiBtZXNzYWdlIGFuZCBkb250IGJyZWFrIHRoZSBEVCBiYWNrd2FyZCBj
b21wYXRpYmlsaXR5Lgo+IAo+IGRyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jIHwgMiArLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jIGIvZHJpdmVycy93YXRjaGRv
Zy9zdG0zMl9pd2RnLmMKPiBpbmRleCBkNzAwZTBkNDliYjk1Li44YWQwNmI1NGM1YWRjIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvc3RtMzJfaXdkZy5jCj4gKysrIGIvZHJpdmVycy93
YXRjaGRvZy9zdG0zMl9pd2RnLmMKPiBAQCAtMjg2LDcgKzI4Niw3IEBAIHN0YXRpYyBpbnQgc3Rt
MzJfaXdkZ19pcnFfaW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAgCWlmICgh
d2R0LT5kYXRhLT5oYXNfZWFybHlfd2FrZXVwKQo+ICAgCQlyZXR1cm4gMDsKPiAKPiAtCWlycSA9
IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gKwlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxX29w
dGlvbmFsKHBkZXYsIDApOwo+ICAgCWlmIChpcnEgPD0gMCkKPiAgIAkJcmV0dXJuIDA7Cj4gCj4g
Cj4gYmFzZS1jb21taXQ6IGZhYzA0ZWZjNWM3OTNkY2NiZDA3ZTJkNTlhZjlmOTBiN2ZjMGRjYTQK
PiAtLQo+IDIuMzQuMQo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
