Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213E632259
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:37:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23988C65065;
	Mon, 21 Nov 2022 12:37:53 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5175AC6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:37:52 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id u11so14337427ljk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HfG+hA+uYwDsZ1UdfYKRtVV9KVyXwGJ9M9n0nwa5OFc=;
 b=qVRdaXRkwOZckqHytSlZzPQYqP9Y2TWyDf9/s0fgu823ggTHiRlvplRtwsy0grDGxf
 ccQ7o6o33EtwKwG//itIwf4diZmaVYzRFy9oyaivR2zdfA4I2b4CfEVKWI3hO5i+ik+s
 XgoVHRTKA5XYbIvi4DqaLUZBWxwy7mZl+d9D3fJcvQms9LGfE8beV94uDv3z9PqZ8J1F
 ZkjpXSo+yhIzwyvimRjSJ+Hb1lGfvqflyZpRUtCrZVV2Gtwo+76O1JgWxX7O1CqHjeua
 df8Re6bNRJdR29VlAS2Fnpr0NQCuB6zW5AjJiOzFW59JMr91yIoKltR+0sPf5BCU6TDJ
 VLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfG+hA+uYwDsZ1UdfYKRtVV9KVyXwGJ9M9n0nwa5OFc=;
 b=xcsP3CfcD6v5I2jeoMbQeIR2J6LBBw2e1lVSgLVLpt3/HVIpZvyFEh56Ri7EPMDGMZ
 j269eW/CSjOIsGpXMpVg//dZsuUVpg9bZcJDHKUij8FazlZS5V/ultm87+I0j2Mf90VT
 E2v7KYVRIs0ceU9D/ymFYT0fpedUYTYnHbIKMgUwYoOqIbWvVZYKHm2JiS/J1xiZmYxG
 d4LL+rLdKVrFUaXqlEDovkkS0nixLNdMGpY4KmNFg0EqhaUgEPAGVch2wg6pR1Niqwgp
 JdMgfopbLCfRLlV2c3YJlG5Z+PeHH6kSLWQjyCVB4UNWYbgrutQ2YLa4BKikJOMF3bpw
 frQw==
X-Gm-Message-State: ANoB5pkqNTok6X4bBzzzSljmwxs3aO8rd/TWXfvj9wXR+5zpFyHX5npL
 nUugpJgQ+zGZ+WjQ13khnYVH/lJ66TzZo2AX
X-Google-Smtp-Source: AA0mqf4lADTH4UBnhnzITCAh4PxE4jvuBtauyFJ39lIlkTlmOgO2oOYF9BQyH7qnNp+r3XAy3V46Cg==
X-Received: by 2002:a2e:b63b:0:b0:277:56d:fcfb with SMTP id
 s27-20020a2eb63b000000b00277056dfcfbmr5221175ljn.264.1669034271700; 
 Mon, 21 Nov 2022 04:37:51 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a0565123d8c00b004979df1c1fasm2006030lfv.61.2022.11.21.04.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:37:51 -0800 (PST)
Message-ID: <fd714745-ea9f-fba5-3154-7c4babfc7ba9@linaro.org>
Date: Mon, 21 Nov 2022 13:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
 <2cc7a3c5-563d-cdf6-f49b-5e0a9852fb54@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2cc7a3c5-563d-cdf6-f49b-5e0a9852fb54@gmail.com>
Cc: khilman@baylibre.com, linux-mediatek@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/9] Remove the pins-are-numbered DT
	property
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

T24gMjEvMTEvMjAyMiAxMzozMSwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPiBIaSBCZXJuaGFy
ZCwKPiAKPiBPbiAyMS8xMS8yMDIyIDAyOjU0LCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIHdyb3Rl
Ogo+PiBEdXJpbmcgdGhlIHJldmlldyBvZiBteSBNVDgzNjUgc3VwcG9ydCBwYXRjaHNldAo+PiAo
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMjExMTcyMTAzNTYuMzE3
ODU3OC0xLWJlcm9AYmF5bGlicmUuY29tLyksCj4+IHRoZSBpc3N1ZSBvZiB0aGUgInBpbnMtYXJl
LW51bWJlcmVkIiBEZXZpY2VUcmVlIHByb3BlcnR5IGhhcyBjb21lIHVwLgo+Pgo+PiBUaGlzIHBy
b3BlcnR5IGlzIHVuaXF1ZSB0byBNZWRpYXRlayBNVDY1eHggYW5kIFNUTTMyIHBpbmN0cmxzLCBh
bmQKPj4gZG9lc24ndCBzZWVtIHRvIHNlcnZlIGFueSBwdXJwb3NlIChib3RoIHRoZSBNZWRpYXRl
ayBhbmQgU1RNMzIgZHJpdmVycwo+PiBzaW1wbHkgcmVmdXNlIHRvIGRlYWwgd2l0aCBhIGRldmlj
ZSB1bmxlc3MgcGlucy1hcmUtbnVtYmVyZWQgaXMgc2V0IHRvCj4+IHRydWUpLgo+Pgo+PiBUaGVy
ZSBpcyBubyBvdGhlciB1c2Ugb2YgdGhpcyBwcm9wZXJ0eSBpbiB0aGUga2VybmVsIG9yIGluIG90
aGVyIHByb2plY3RzCj4+IHVzaW5nIERldmljZVRyZWVzIChjaGVja2VkIHUtYm9vdCBhbmQgRnJl
ZUJTRCAtLSBpbiBib3RoIG9mIHRob3NlLCB0aGUKPj4gZmxhZyBpcyBwcmVzZW50IGluIE1lZGlh
dGVrIGFuZCBTVE0gZGV2aWNldHJlZXMsIGJ1dCBub3QgdXNlZCBhbnl3aGVyZSkuCj4+Cj4+IFRo
ZXJlIGlzIGFsc28gbm8ga25vd24gdXNlIGluIHVzZXJzcGFjZSAoaW4gZmFjdCwgYSB1c2VybGFu
ZCBhcHBsaWNhdGlvbgo+PiByZWx5aW5nIG9uIHRoZSBwcm9wZXJ0eSB3b3VsZCBiZSBicm9rZW4g
YmVjYXVzZSBpdCB3b3VsZCBnZXQgdHJ1ZSBvbgo+PiBhbnkgTWVkaWF0ZWsgb3IgU1RNIGNoaXBz
ZXQgYW5kIGZhbHNlIG9uIGFsbCBvdGhlcnMsIGV2ZW4gdGhvdWdoIG90aGVyCj4+IGNoaXBzZXRz
IHVzZSBudW1iZXJlZCBwaW5zKS4KPj4KPj4gVGhpcyBwYXRjaHNldCByZW1vdmVzIGFsbCB1c2Vz
IG9mIHBpbnMtYXJlLW51bWJlcmVkLgo+Pgo+Pgo+IAo+IE15IHBlcnNvbmFsIHByZWZlcmVuY2Ug
aXMgdG8gYWRkIGEgc3VtbWFyeSBvZiB0aGUgZmlsZXMgdG91Y2hlZCBieSB0aGUgc2VyaWVzIGlu
IAo+IHRoZSBjb3ZlciBsZXR0ZXIgKHRoZSB0b29scyB3aWxsIGRvIHRoYXQgZm9yIHlvdSkuIFRo
aXMgYWxsb3dzIG1haW50YWluZXJzIHRvIAo+IGVhc2llciB1bmRlcnN0YW5kIGlmIHRoZXkgaGF2
ZSB0byBsb29rIGRlZXBlciBpbnRvIHRoZSBzZXJpZXMgb3IgY2FuIGlnbm9yZSBpdC4KPiAKPiBO
byBuZWVkIHRvIHNlbmQgYWdhaW4sIGp1c3Qgc2F5aW5nIGZvciB0aGUgZnV0dXJlLgoKWWVwLiBB
bmQgZ2l0IGZvcm1hdC1wYXRjaCBkb2VzIGl0IGF1dG9tYXRpY2FsbHkgaW4gYm90aCBjb21tb24g
Y2FzZXMgLQp3cml0aW5nIGNvdmVyIGxldHRlciBtYW51YWxseSBvciB0YWtpbmcgaXQgZnJvbSBi
cmFuY2ggZGVzY3JpcHRpb24KKHdoaWNoIGlzIGFic29sdXRlbHkgY29vbCwgSU1ITykuCgpCZXN0
IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
