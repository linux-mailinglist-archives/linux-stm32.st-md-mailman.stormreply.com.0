Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A0D81B96D
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Dec 2023 15:19:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38CF6C6B477;
	Thu, 21 Dec 2023 14:19:00 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC492C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 14:18:58 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5542106d393so708288a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Dec 2023 06:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703168338; x=1703773138;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZgRxVc3b/cXQXk1FRUsZmIntq3x5skTt1E+0eRMTOto=;
 b=c9PhNxzYUeCMi+nLNmDhEq2I/ZNXhgXhD7HyIAFgnMuE6mdmVC0i6v++xMwbW/CLcP
 Al76oML+xN0+0AyJIjewE9NETQQHpi/Csr1j/NkaPWbCfzhcUsNsipqyv1q1D53iEkfh
 VtjpRpJP0R6BvMCF+MGFuBxv48hj370JLsjQv16Q3QTLz1iMIKOoyHEugAuJoKbNGnH3
 rPTOEEQIG9Kv6jBAF1ejyHww0/8qa4MF/NV0wXreul3p7WHsF+K9bGUlGFGTDoYfYO/a
 eVFC+lI3Oe7Fpk3myym2lRWukmTYGssIRON+j2jLYTRK9BK++NfvDkDr/Rh/SkdB1jsx
 2m5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703168338; x=1703773138;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZgRxVc3b/cXQXk1FRUsZmIntq3x5skTt1E+0eRMTOto=;
 b=HZHxo59pRqola6zx3roOoIgEkr75pub9DnqQey9wzPv8TnTJ9sl96xBMNk8LApk9tW
 vikIrqqd4PDhjDBDxxaOx3p5Uy+vJLHbM9w4aLIY/LDMfZcqoPnZyaNcgpJJvYer5fgx
 KQ/ZMN2Fi3m08gvxx3C0FzxMQXGPVHWf1QiJhDbm+0WMzHWHbsiDsAoliINOxVeBMy0U
 P2bC81SyjXIWIkFyoKc1v8xnyThcTfi7U3vRw2AWdBHLMTyDZWecfGNhVxbRI67/1czB
 zUm4Yby//zW7rflUh97QhDh/I0DI1qHZvM7/xhcmCrJEstXbtLlibSRqwrqJslL7fSpP
 mRWQ==
X-Gm-Message-State: AOJu0Yz8/ymcYoz/bHEN1muWIHEDQ3oZbEm1NMmjsvMkmr+OcTyl8/Ts
 vRYwH4iDb1XhsC7Ss0SPbg==
X-Google-Smtp-Source: AGHT+IGEcbQ20zL8VfJo7vaJHeSnFBDczuJI73eIk9D6ghdxribg8KJUIIU6DKKNnhyLuCnYwDPQYg==
X-Received: by 2002:a50:a45e:0:b0:553:354a:9a81 with SMTP id
 v30-20020a50a45e000000b00553354a9a81mr4529475edb.26.1703168338069; 
 Thu, 21 Dec 2023 06:18:58 -0800 (PST)
Received: from ?IPV6:2a02:810b:f40:4300:1c49:5d1e:f6f3:77a0?
 ([2a02:810b:f40:4300:1c49:5d1e:f6f3:77a0])
 by smtp.gmail.com with ESMTPSA id
 dj25-20020a05640231b900b00552743342c8sm1232410edb.59.2023.12.21.06.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 06:18:57 -0800 (PST)
Message-ID: <5095f695-6dad-45e2-9cff-1b79003355c9@gmail.com>
Date: Thu, 21 Dec 2023 15:18:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
To: Hugues FRUCHET <hugues.fruchet@foss.st.com>
References: <20231221084723.2152034-1-hugues.fruchet@foss.st.com>
 <769a1510-f8d2-4095-9879-42f413141dee@gmail.com>
 <a240d2ac-db0e-481b-8d13-3ae76cfd2fe7@foss.st.com>
 <e5ba1e14-4bbf-43e3-933a-fee6d4b90641@gmail.com>
 <CAHCN7xJ3Ktn+TnoOYdnNvKTddGCfLp4OQ+gM0WonWj-aqnsGuA@mail.gmail.com>
 <b03a7ddc-65c5-44c3-a563-d52ee938148a@gmail.com>
 <6d26d307-eb7a-43ad-b4f3-57f8ac7ce8f0@foss.st.com>
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <6d26d307-eb7a-43ad-b4f3-57f8ac7ce8f0@foss.st.com>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-rockchip@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v5 0/5] Add support for video hardware
 codec of STMicroelectronics STM32 SoC series
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

SGkgSHVndWVzLAoKQW0gMjEuMTIuMjMgdW0gMTQ6NTUgc2NocmllYiBIdWd1ZXMgRlJVQ0hFVDoK
PiBIaSBBbGV4LAo+Cj4gT24gMTIvMjEvMjMgMTQ6NDYsIEFsZXggQmVlIHdyb3RlOgo+Pgo+PiBB
bSAyMS4xMi4yMyB1bSAxNDozOCBzY2hyaWViIEFkYW0gRm9yZDoKPj4+IE9uIFRodSwgRGVjIDIx
LCAyMDIzIGF0IDc6MzHigK9BTSBBbGV4IEJlZSA8a25hZXJ6Y2hlQGdtYWlsLmNvbT4gd3JvdGU6
Cj4+Pj4gSGkgSHVndWVzLAo+Pj4+Cj4+Pj4gQW0gMjEuMTIuMjMgdW0gMTQ6MDggc2NocmllYiBI
dWd1ZXMgRlJVQ0hFVDoKPj4+Pj4gSGkgQWxleCwKPj4+Pj4KPj4+Pj4gVGhpcyBpcyBiZWNhdXNl
IFZERUMgYW5kIFZFTkMgYXJlIHR3byBzZXBhcmF0ZWQgSVBzIHdpdGggdGhlaXIgb3duCj4+Pj4+
IGhhcmR3YXJlIHJlc291cmNlcyBhbmQgbm8gbGlua3MgYmV0d2VlbiBib3RoLgo+Pj4+PiBPbiBm
dXR1cmUgU29DcywgVkRFQyBjYW4gc2hpcCBvbiBpdHMgb3duLCBzYW1lIGZvciBWRU5DLgo+Pj4+
Pgo+Pj4+IEkgdGhpbmsgdGhhdCdzIHdoYXQgdGhlIGRyaXZlciBpcy93YXMgZGVzaWduZWQgZm9y
IDopCj4+Pj4KPj4+PiBJIGRvbid0wqAgdGhpbmsgdGhlcmUgX2hhc18gdG8gYmUgYSBsaW5rIGJl
dHdlZW4gdmFyaWFudHMgaW4gdGhlIAo+Pj4+IHNhbWUgZmlsZS4KPj4+PiBGb3IgUm9ja2NoaXAg
d2Ugb25seSBoYWQgdGhlIGlzc3VlIHRoYXQgdGhlcmUgX2lzXyBhIGxpbmsgKHNoYXJlZAo+Pj4+
IHJlc291cmNlcykgYmV0d2VlbiBlbmNvZGVyIGFuZCBkZWNvZGVyIGFuZCB0aGV5IGhhZCAoZm9y
IHRoYXQgCj4+Pj4gcmVhc29uKSB0byBiZQo+Pj4+IGRlZmluZWQgaGFzIGEgX3NpbmdsZV8gdmFy
aWFudC4gQW5kIHRoZXJlIGlzIG5vIHJlYXNvbiB5b3UgY2FuIHNoaXAgCj4+Pj4gZGVjb2Rlcgo+
Pj4+IGFuZCBlbmNvZGVyIHNlcGVyYXRlZCB3aGVuIHlvdSBoYXZlIHR3byB2YXJpYW50cyAod2l0
aCBkaWZmZXJlbnQKPj4+PiBjb21wYXRpYmxlcykuCj4+Pj4gRm9yIFJvY2tjaGlwIGFuZCBpTVgg
dGhvc2UgZmlsZXMgYXJlIGV2ZW4gY29udGFpbmluZyB2YXJpYW50cyBmb3IgCj4+Pj4gY29tcGxl
dGx5Cj4+Pj4gZGlmZmVyZW50IGdlbmVyYXRpb25zIC8gZGlmZmVyZW50IFNvQ3MuIEkgaGFkIHRv
IGNsZWFudXAgdGhpcyBtZXNzIGZvcgo+Pj4gVGhlIGkuTVg4TSBNaW5pIGFuZCBQbHVzIGhhdmUg
ZGlmZmVyZW50IHBvd2VyIGRvbWFpbnMgZm9yIGVuY29kZXIgYW5kCj4+PiBkZWNvZGVycyBhcyB3
ZWxsIGFzIGRpZmZlcmVudCBjbG9ja3MuwqAgS2VlcGluZyB0aGVtIHNlcGFyYXRlIHdvdWxkCj4+
PiBhbG1vc3QgYmUgbmVjZXNzYXJ5Lgo+PiBJIGd1ZXNzIHRoZXJlIGlzIG1pc3N1bmRlcnN0YW5k
aW5nOiBJIGRpZG4ndCBzYXkgdGhlIHR3byBTVE0gdmFyaWFudHMKPj4gc2hvdWxkIGJlIG1lcmdl
ZCBpbiBvbmUgdmFyaWFudCwgYnV0IHRoZSB0d28gdmFyaWFudHMgc2hvdWxkIGJlIAo+PiB3aXRo
aW4gdGhlCj4+IHNhbWUgX2ZpbGVfLCBsaWtlIHRoZSBvdGhlciBwbGF0Zm9ybXMgYXJlIGRvaW5n
IDopCj4KPiBJIGhhdmUgdHdvIHNlcGFyYXRlZCBoYXJkd2FyZTogVkRFQyBhbmQgVkVOQywgbm90
IGEgc2luZ2xlIGJsb2NrIGxpa2UgCj4gIlZQVSIgZm9yIGV4YW1wbGUuIFNvIHdoYXQgbmFtZSBz
aG91bGQgaGF2ZSB0aGlzIGZpbGUgPwo+IE90aGVyIHBsYXRmb3JtcyBoYWQgYSBjb21tb24gZmls
ZSBiZWNhdXNlIHRoZXJlIHdhcyBhIGNvbW1vbiBibG9jayAKPiBlbWJlZGRpbmcgYm90aCBkZWNv
ZGVyIGFuZCBlbmNvZGVyLCBzb21ldGltZXMgd2l0aCBsaW5rcy9kZXBlbmRlbmNpZXMgCj4gYmV0
d2VlbiBib3RoLgo+IFNBTUE1RDQgaGFzIG9ubHkgYSBkZWNvZGVyLCBvbmx5IGEgc2luZ2xlIGZp
bGUgY2FsbGVkICJfdmRlY19ody5jIi4uLgo+IHNvIGl0IGlzIHF1aXRlIGxvZ2ljYWwgZm9yIG1l
IHRvIGhhdmUgb25lIGZpbGUgcGVyIGluZGVwZW5kZW50IElQLgo+Ck1heWJlIC0gYnV0IHRoYXQn
cyBub3Qgd2F5IHRoZSBkcml2ZXIgaXMgY3VycmVudGx5IG9yZ2FuemllZC4Kcm9ja2NoaXBfdnB1
X2h3LmMgYWxzbyBob2xkcyB2YXJpYW50cyB3aGljaCBoYXZlIG9ubHkgaGF2ZSBhIGRlY29kZXIg
YW5kCmFsc28gc29tZSB3aGljaCBvbmx5IGhhdmUgYSBlbmNvZGVyLiBTbyAidnB1IiBpcyBxdWl0
ZSBuZXV0cmFsLCBJIGd1ZXNzLiBJdApkb2Vzbid0IHNheSBhbnl0aGluZyBpZiBpdCBiZWxvbmdz
IHRvIGVuY29kZXIgb3IgZGVjb2Rlci4KV2hlbiBJIHdhcyBhZGRpbmcgdGhlIFJLMzA2NiB2YXJp
YW50IGEgSSB3YXMgZXZlbiBhc2tlZCB0byBhZGQgYSBleHBsaWNpdApjb21tZW50LCB3aHkgdGhp
cyBpbnRlZ3JhdGlvbiBjYW4ndCBiZSBzcGxpdHRlZCBpbiBlbmNvZGVyIGFuZCBkZWNvZGVyCnZh
cmlhbnQuCgpXZSB3ZXJlIGhhdmluZyBhIGEgbG90IG9mIHRoZXNlIHNwbGl0LXVwcyBpbiB0aGUg
ZWFybHkgZGF5cyBvZiBoYW50cm8KZHJpdmVyIGFuZCBpdCB3YXMgbm8gZnVuIHRvIGNsZWFuIHRo
ZW0gdXAuCgpBbGV4Cgo+Pj4gYWRhbQo+Pj4KPj4+PiBSb2NrY2hpcCBvbmNlIC0gYW5kIGl0IHdh
cyBubyBmdW4gOikgQW55d2F5czogSXQncyB1cCB0byB0aGUgCj4+Pj4gbWFpbnRhaW5lcnMgSQo+
Pj4+IGd1ZXNzIC0gSSBqdXN0IHdhbnRlZCB0byBhc2sgaWYgSSBtaXNzdW5kZXJzdGFuZCBzb21l
dGhpbmcgaGVyZS4KPj4+Pgo+Pj4+IEdyZWV0aW5ncywKPj4+Pgo+Pj4+IEFsZXgKPj4+Pgo+Pj4+
PiBIb3BpbmcgdGhhdCB0aGlzIGNsYXJpZnkuCj4+Pj4+Cj4+Pj4+IEJlc3QgcmVnYXJkcywKPj4+
Pj4gSHVndWVzLgo+Pj4+Pgo+Pj4+PiBPbiAxMi8yMS8yMyAxMzo0MCwgQWxleCBCZWUgd3JvdGU6
Cj4+Pj4+PiBIaSBIdWd1ZXMsIEhpIE5pY29sYXMsCj4+Pj4+Pgo+Pj4+Pj4gaXMgdGhlcmUgYW55
IHNwZWNpZmljIHJlYXNvbiBJJ20gbm90IHVuZGVyc3RhbmRpbmcgLyBzZWVpbmcgd2h5IHRoaXMK
Pj4+Pj4+IGlzIGFkZGVkIGluIHR3byBzZXBlcmF0ZSB2ZGVjKiAvIHZlbmMqIGZpbGVzIGFuZCBu
b3QgYSBzaW5nbGUgdnB1Kgo+Pj4+Pj4gZmlsZT8gSXMgaXQgb25seSBmb3IgdGhlIHNlcGVyYXRl
IGNsb2NrcyAoLW5hbWVzKSAvIGlycXMgKC1uYW1lcykgLwo+Pj4+Pj4gY2FsbGJhY2tzPyBUaG9z
ZSBhcmUgZGVmaW5lZCBwZXIgdmFyaWFudCBhbmQgcGVyZmVjdGx5IGZpdCBpbiBhCj4+Pj4+PiBz
aW5nbGUgZmlsZSBob2xkaW5nIG9uZSB2ZGVjIGFuZCBvbmUgdmVuYyB2YXJpYW50Lgo+Pj4+Pj4K
Pj4+Pj4+IEFsZXgKPj4+Pj4+Cj4+Pj4+PiBBbSAyMS4xMi4yMyB1bSAwOTo0NyBzY2hyaWViIEh1
Z3VlcyBGcnVjaGV0Ogo+Pj4+Pj4+IFRoaXMgcGF0Y2hzZXQgaW50cm9kdWNlcyBzdXBwb3J0IGZv
ciBWREVDIHZpZGVvIGhhcmR3YXJlIGRlY29kZXIKPj4+Pj4+PiBhbmQgVkVOQyB2aWRlbyBoYXJk
d2FyZSBlbmNvZGVyIG9mIFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMjUKPj4+Pj4+PiBTb0Mg
c2VyaWVzLgo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyBpbml0aWFsIHN1cHBvcnQgaW1wbGVtZW50cyBI
MjY0IGRlY29kaW5nLCBWUDggZGVjb2RpbmcgYW5kCj4+Pj4+Pj4gSlBFRyBlbmNvZGluZy4KPj4+
Pj4+Pgo+Pj4+Pj4+IFRoaXMgaGFzIGJlZW4gdGVzdGVkIG9uIFNUTTMyTVAyNTdGLUVWMSBldmFs
dWF0aW9uIGJvYXJkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gPT09PT09PT09PT0KPj4+Pj4+PiA9IGhpc3Rv
cnkgPQo+Pj4+Pj4+ID09PT09PT09PT09Cj4+Pj4+Pj4gdmVyc2lvbiA1Ogo+Pj4+Pj4+IMKgwqDC
oMKgIC0gUHJlY2lzZSB0aGF0IHZpZGVvIGRlY29kaW5nIGFzIGJlZW4gc3VjY2Vzc2Z1bGx5IHRl
c3RlZCAKPj4+Pj4+PiB1cCB0bwo+Pj4+Pj4+IGZ1bGwgSEQKPj4+Pj4+PiDCoMKgwqDCoCAtIEFk
ZCBOaWNvbGFzIER1ZnJlc25lIHJldmlld2VkLWJ5Cj4+Pj4+Pj4KPj4+Pj4+PiB2ZXJzaW9uIDQ6
Cj4+Pj4+Pj4gwqDCoMKgwqAgLSBGaXggY29tbWVudHMgZnJvbSBOaWNvbGFzIGFib3V0IGRyb3Bw
aW5nIGVuY29kZXIgcmF3IHN0ZXBzCj4+Pj4+Pj4KPj4+Pj4+PiB2ZXJzaW9uIDM6Cj4+Pj4+Pj4g
wqDCoMKgwqAgLSBGaXggcmVtYXJrcyBmcm9tIEtyenlzenRvZiBLb3psb3dza2k6Cj4+Pj4+Pj4g
wqDCoMKgwqDCoCAtIGRyb3AgIml0ZW1zIiwgd2Uga2VlcCBzaW1wbGUgZW51bSBpbiBzdWNoIGNh
c2UKPj4+Pj4+PiDCoMKgwqDCoMKgIC0gZHJvcCBzZWNvbmQgZXhhbXBsZSAtIGl0IGlzIHRoZSBz
YW1lIGFzIHRoZSBmaXJzdAo+Pj4+Pj4+IMKgwqDCoMKgIC0gRHJvcCB1bnVzZWQgbm9kZSBsYWJl
bHMgYXMgc3VnZ2VzdGVkIGJ5IENvbm9yIERvb2xleQo+Pj4+Pj4+IMKgwqDCoMKgIC0gUmV2aXNp
dCBtaW4vbWF4IHJlc29sdXRpb25zIGFzIHN1Z2dlc3RlZCBieSBOaWNvbGFzIER1ZnJlc25lCj4+
Pj4+Pj4KPj4+Pj4+PiB2ZXJzaW9uIDI6Cj4+Pj4+Pj4gwqDCoMKgwqAgLSBGaXggcmVtYXJrcyBm
cm9tIEtyenlzenRvZiBLb3psb3dza2kgb24gdjE6Cj4+Pj4+Pj4gwqDCoMKgwqDCoCAtIHNpbmds
ZSB2aWRlby1jb2RlYyBiaW5kaW5nIGZvciBib3RoIFZERUMvVkVOQwo+Pj4+Pj4+IMKgwqDCoMKg
wqAgLSBnZXQgcmlkIG9mICItbmFtZXMiCj4+Pj4+Pj4gwqDCoMKgwqDCoCAtIHVzZSBvZiBnZW5l
cmljIG5vZGUgbmFtZSAidmlkZW8tY29kZWMiCj4+Pj4+Pj4KPj4+Pj4+PiB2ZXJzaW9uIDE6Cj4+
Pj4+Pj4gwqDCoMKgIC0gSW5pdGlhbCBzdWJtaXNzaW9uCj4+Pj4+Pj4KPj4+Pj4+PiBIdWd1ZXMg
RnJ1Y2hldCAoNSk6Cj4+Pj4+Pj4gwqDCoMKgIGR0LWJpbmRpbmdzOiBtZWRpYTogRG9jdW1lbnQg
U1RNMzJNUDI1IFZERUMgJiBWRU5DIHZpZGVvIGNvZGVjcwo+Pj4+Pj4+IMKgwqDCoCBtZWRpYTog
aGFudHJvOiBhZGQgc3VwcG9ydCBmb3IgU1RNMzJNUDI1IFZERUMKPj4+Pj4+PiDCoMKgwqAgbWVk
aWE6IGhhbnRybzogYWRkIHN1cHBvcnQgZm9yIFNUTTMyTVAyNSBWRU5DCj4+Pj4+Pj4gwqDCoMKg
IGFybTY0OiBkdHM6IHN0OiBhZGQgdmlkZW8gZGVjb2RlciBzdXBwb3J0IHRvIHN0bTMybXAyNTUK
Pj4+Pj4+PiDCoMKgwqAgYXJtNjQ6IGR0czogc3Q6IGFkZCB2aWRlbyBlbmNvZGVyIHN1cHBvcnQg
dG8gc3RtMzJtcDI1NQo+Pj4+Pj4+Cj4+Pj4+Pj4gwqDCoCAuLi4vbWVkaWEvc3Qsc3RtMzJtcDI1
LXZpZGVvLWNvZGVjLnlhbWzCoMKgwqDCoMKgwqAgfMKgIDUwICsrKysrKysrCj4+Pj4+Pj4gwqDC
oCBhcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEuZHRzacKgwqDCoMKgwqDCoMKgIHzC
oCAxMiArKwo+Pj4+Pj4+IMKgwqAgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjU1LmR0
c2nCoMKgwqDCoMKgwqDCoCB8wqAgMTcgKysrCj4+Pj4+Pj4gwqDCoCBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL3ZlcmlzaWxpY29uL0tjb25maWfCoMKgwqAgfMKgIDE0ICsrLQo+Pj4+Pj4+IMKgwqAg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9NYWtlZmlsZcKgwqAgfMKgwqAgNCAr
Cj4+Pj4+Pj4gwqDCoCAuLi4vbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vaGFudHJvX2Rydi5j
wqDCoCB8wqDCoCA0ICsKPj4+Pj4+PiDCoMKgIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNv
bi9oYW50cm9faHcuaMKgwqDCoCB8wqDCoCAyICsKPj4+Pj4+PiDCoMKgIC4uLi9wbGF0Zm9ybS92
ZXJpc2lsaWNvbi9zdG0zMm1wMjVfdmRlY19ody5jwqAgfMKgIDkyIAo+Pj4+Pj4+ICsrKysrKysr
KysrKysrCj4+Pj4+Pj4gwqDCoCAuLi4vcGxhdGZvcm0vdmVyaXNpbGljb24vc3RtMzJtcDI1X3Zl
bmNfaHcuY8KgIHwgMTE1Cj4+Pj4+Pj4gKysrKysrKysrKysrKysrKysrCj4+Pj4+Pj4gwqDCoCA5
IGZpbGVzIGNoYW5nZWQsIDMwNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pj4+
IMKgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4+Pj4+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL3N0LHN0bTMybXAyNS12aWRlby1jb2RlYy55YW1sIAo+Pj4+Pj4+Cj4+
Pj4+Pj4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQKPj4+Pj4+PiBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL3ZlcmlzaWxpY29uL3N0bTMybXAyNV92ZGVjX2h3LmMKPj4+Pj4+PiDCoMKgIGNyZWF0ZSBt
b2RlIDEwMDY0NAo+Pj4+Pj4+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vdmVyaXNpbGljb24vc3Rt
MzJtcDI1X3ZlbmNfaHcuYwo+Pj4+Pj4+Cj4KPiBCZXN0IHJlZ2FyZHMsCj4gSHVndWVzLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
