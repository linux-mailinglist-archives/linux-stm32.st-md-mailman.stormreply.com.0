Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F42B50FED
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 09:47:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBA62C3FACE;
	Wed, 10 Sep 2025 07:47:07 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFF99C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 07:47:06 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso33222405e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 00:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757490426; x=1758095226;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+WG/fOgOed7F+q/vykBWwKRqhGGU2/L6CsAzZkzcjHA=;
 b=KvQOyYAHl99wbls0VgddP+dAItwik5yNYX0NTM1dj3oZI5YVYV7RWtzXG3m3iJKWAj
 lieNdeyHv5KZqHOkXwjmuRpJP/HBP+r8tH7TCMfnNxtoAEMgW/72m18TrVF9f599+4Ie
 ZwA6U4OPaMtmLss56Oe2DCszNsmOF2W3ZdGxQnA25dYnrCOYIwRgDkwjOQykPJ0yIzra
 FyGXMGWnFWUMvlRUdWK0Pg8/BC9pFhc75CLWLKILS3DlGzasLZwDGruYE2pcR2eEdgsy
 7GuGnGpoi33xf7D4MpHtSUov9aB7oxmILjkkRzfM2CIzam9ZGjucjedvBZ5lXhPxkz2w
 xyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757490426; x=1758095226;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+WG/fOgOed7F+q/vykBWwKRqhGGU2/L6CsAzZkzcjHA=;
 b=xMB3xmkomvfEe1AvkzCZ4pTY7IylpQnCsOEmvB+sUAoAupVFOBsLhJRmqw8YRQ5pDT
 Oo5rVCeRtZfEPS4Ch8Flg1+R59CBDnLm5l4b4BannIlIYEj2Jzf09jGT4XBAOn1cgvz8
 hLxx/eivHiVVi+HuFwykqamBjljgASbQYrZIOM10YdAC9etZ/GLaKB2rHQ7v/8ItZFll
 7GXldWGPbx+AXXesTpXAfjlHs/HfGQJ2iieBIo1DzIQICrvYrNeex4fKAY3ZcoZfdr4h
 l312YyiPn77bqnnO7gIdVff46/sEVtCpWApke28L+pKecwUHEmreaSc1Ea0TeSBdiql+
 xVKw==
X-Gm-Message-State: AOJu0YzpEcAFUF8JcpQbndB/A+iCnid0XUe6kcQy+1D+BOrvykBM0KUm
 ZVFDIIuVD4UY/on+lhNp0fareOM1oSHa1lNQ7ySaSZHQBbxY/lJpRXaM
X-Gm-Gg: ASbGncsaseNG9sb90ZmrTOLN7IegmUu9jvKwSLGdfpry9YgHV/zBaR8c+YB26vxDxeT
 mxxWwRCYsDFT09ABXX8ougWMEcdI0wNv/+I+AnwNiWfvSqbU3SncJmp47nvwzRkDtwyc4id+ZTh
 hAwXBczN08GttrYzUkLWjzVPBuk1oqEibalyxRijNOky70C+gn9obHxeiO80OH+jTcfdugXu/TZ
 AHYD1ZxuaKqNr/wK37iI+7J/dyhanh3yLFeVnwNmV6eXsBwr1WMN8V3Q9BJ50i156ddC+7n1vCt
 YRK/H96h+kOnq+tXl8rltnfLiYrZldAkwMd3S7loEoWDcPlm2gId2EtbLHkagwJ7/icdXAscwFX
 Zwejlr5gmYLhKFHKX/ycAY4CD/pJb6jgaDigHIM5YrvPBen6BMFK6XqTiypoLMqLGrYG7pcTeBw
 bdau/Var3ruwrK2yByDsK/3o30HQLDqUJ8Bkqxm2r5nKWgbwgigzXM5HnS2I0oiNGGvA+ktRZeB
 Q==
X-Google-Smtp-Source: AGHT+IHCQlyEGA4dQJ+eF6cYPq/TcQfhp+X5TSRzHZoqn+jcag/Ng+LaHLBRVKb0m1OSVaCN+kNKcA==
X-Received: by 2002:a05:600c:4f91:b0:45b:88d6:8db5 with SMTP id
 5b1f17b1804b1-45ddde82fc0mr127441425e9.12.1757490425798; 
 Wed, 10 Sep 2025 00:47:05 -0700 (PDT)
Received: from ?IPV6:2a02:8440:7135:4f4c:9000:7072:695b:3ef?
 (2a02-8440-7135-4f4c-9000-7072-695b-03ef.rev.sfr.net.
 [2a02:8440:7135:4f4c:9000:7072:695b:3ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45df821f714sm17367435e9.16.2025.09.10.00.47.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 00:47:05 -0700 (PDT)
Message-ID: <19e664da-df4c-4bc0-84ce-41e4364f10bc@gmail.com>
Date: Wed, 10 Sep 2025 09:47:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
 <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
Content-Language: en-US
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
In-Reply-To: <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-perf-users@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 01/20] bus: firewall: move
 stm32_firewall header file in include folder
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

T24gMDkvMDkvMjAyNSAxNDoyNSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4gCj4gCj4gT24g
OS85LzI1IDEyOjEyLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+IEZyb206IENsw6ltZW50
IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPj4KPj4gT3RoZXIgZHJp
dmVyIHRoYW4gcmlmc2MgYW5kIGV0enBjIGNhbiBpbXBsZW1lbnQgZmlyZXdhbGwgb3BzLCBzdWNo
IGFzCj4+IHJjYy4KPj4gSW4gb3JkZXIgZm9yIHRoZW0gdG8gaGF2ZSBhY2Nlc3MgdG8gdGhlIG9w
cyBhbmQgdHlwZSBvZiB0aGlzIGZyYW1ld29yaywKPj4gd2UgbmVlZCB0byBnZXQgdGhlIGBzdG0z
Ml9maXJld2FsbC5oYCBmaWxlIGluIHRoZSBpbmNsdWRlLyBmb2xkZXIuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4K
Pj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxsZWdvZmZpYy5jbGVtZW50QGdt
YWlsLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4+IMKgIGRyaXZlcnMv
YnVzL3N0bTMyX2ZpcmV3YWxsLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDMgKy0tCj4+IMKgIGRyaXZlcnMvYnVzL3N0bTMyX3JpZnNjLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4+IMKgIHtkcml2ZXJzID0+IGlu
Y2x1ZGUvbGludXh9L2J1cy9zdG0zMl9maXJld2FsbC5oIHwgMAo+PiDCoCA0IGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYnVzL3N0bTMyX2V0enBjLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCj4+IGlu
ZGV4IDdmYzBmMTY5NjBiZS4uNDkxOGExNGU1MDdlIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2J1
cy9zdG0zMl9ldHpwYy5jCj4+ICsrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMKPj4gQEAg
LTUsNiArNSw3IEBACj4+IMKgICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+PiDCoCAjaW5j
bHVkZSA8bGludXgvYml0cy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2Fs
bC5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51
eC9lcnIuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPj4gQEAgLTE2LDggKzE3LDYg
QEAKPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+PiDCoCAjaW5jbHVk
ZSA8bGludXgvdHlwZXMuaD4KPj4gLSNpbmNsdWRlICJzdG0zMl9maXJld2FsbC5oIgo+PiAtCj4+
IMKgIC8qCj4+IMKgwqAgKiBFVFpQQyByZWdpc3RlcnMKPj4gwqDCoCAqLwo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyBiL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3
YWxsLmMKPj4gaW5kZXggMmZjOTc2MWRhZGVjLi5lZjQ5ODgwNTRiNDQgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmMKPj4gKysrIGIvZHJpdmVycy9idXMvc3RtMzJf
ZmlyZXdhbGwuYwo+PiBAQCAtNSw2ICs1LDcgQEAKPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2JpdGZp
ZWxkLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9iaXRzLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgv
YnVzL3N0bTMyX2ZpcmV3YWxsLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmly
ZXdhbGxfZGV2aWNlLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KPj4gwqAgI2lu
Y2x1ZGUgPGxpbnV4L2Vyci5oPgo+PiBAQCAtMTgsOCArMTksNiBAQAo+PiDCoCAjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPj4gLSNpbmNsdWRl
ICJzdG0zMl9maXJld2FsbC5oIgo+PiAtCj4+IMKgIC8qIENvcnJlc3BvbmRzIHRvIFNUTTMyX0ZJ
UkVXQUxMX01BWF9FWFRSQV9BUkdTICsgZmlyZXdhbGwgSUQgKi8KPj4gwqAgI2RlZmluZSBTVE0z
Ml9GSVJFV0FMTF9NQVhfQVJHUyAgICAgICAgCj4+IChTVE0zMl9GSVJFV0FMTF9NQVhfRVhUUkFf
QVJHUyArIDEpCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jIGIvZHJp
dmVycy9idXMvc3RtMzJfcmlmc2MuYwo+PiBpbmRleCA0Y2YxYjYwMDE0YjcuLjY0M2RkZDBhNWY1
NCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYwo+PiArKysgYi9kcml2
ZXJzL2J1cy9zdG0zMl9yaWZzYy5jCj4+IEBAIC01LDYgKzUsNyBAQAo+PiDCoCAjaW5jbHVkZSA8
bGludXgvYml0ZmllbGQuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPj4gKyNpbmNs
dWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2Rl
dmljZS5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4+IMKgICNpbmNsdWRlIDxsaW51
eC9pbml0Lmg+Cj4+IEBAIC0xNiw4ICsxNyw2IEBACj4+IMKgICNpbmNsdWRlIDxsaW51eC9wbGF0
Zm9ybV9kZXZpY2UuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+Cj4+IC0jaW5jbHVk
ZSAic3RtMzJfZmlyZXdhbGwuaCIKPj4gLQo+PiDCoCAvKgo+PiDCoMKgICogUklGU0Mgb2Zmc2V0
IHJlZ2lzdGVyCj4+IMKgwqAgKi8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0bTMyX2Zp
cmV3YWxsLmggYi9pbmNsdWRlL2xpbnV4L2J1cy8gCj4+IHN0bTMyX2ZpcmV3YWxsLmgKPj4gc2lt
aWxhcml0eSBpbmRleCAxMDAlCj4+IHJlbmFtZSBmcm9tIGRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3
YWxsLmgKPj4gcmVuYW1lIHRvIGluY2x1ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmgKPj4K
CkhpIEdhdGllbgoKPiBBcyB0aGUgZmlyZXdhbGwgaGVhZGVyIGlzIG1vdmVkIHRvIGEgZGVkaWNh
dGVkIGZpcmV3YWxsIGRpcmVjdG9yeSwKCkkgZG9uJ3QgbW92ZSBpdCB0byBhIGRlZGljYXRlZCBm
aXJld2FsbCBkaXJlY3RvcnkganVzdCB0byB0aGUgImJ1cyIgCmRpcmVjdG9yeSB3aGVyZSB0aGUg
InN0bTMyX2ZpcmV3YWxsX2RldmljZS5oIiBoZWFkZXIgZmlsZSBpcyBhbHJlYWR5IApsb2NhdGVk
LgoKPiBtYXliZSBpdCB3b3VsZCBiZSBjb2hlcmVudCB0byBjcmVhdGUgdGhlIHNhbWUga2luZCBv
ZiBkaXJlY3RvcnkKPiBmb3IgdGhlIHNvdXJjZXMgYXMgbm9uLWJ1c2VzIGRyaXZlcnMgdXNlIGl0
LiBJIGNhbiB0ZXN0IGl0IG9uIG15Cj4gc2lkZSBpZiB5b3UncmUgd2lsbGluZyB0byBtYWtlIHRo
ZSBjaGFuZ2UuCgpEbyB5b3UgbWVhbiBjcmVhdGUgYW4gaW5jbHVkZS9saW51eC9idXMvZmlyZXdh
bGwvIGRpcmVjdG9yeSA/CgpCZXN0IHJlZ2FyZHMsCkNsw6ltZW50Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
