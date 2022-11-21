Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0363221B
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 13:31:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B466C65065;
	Mon, 21 Nov 2022 12:31:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9323C6504A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 12:31:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso12629623wme.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Nov 2022 04:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FnfQ6ISxK8RloWdHimWZZCwZlxQOVw743/patpAY6b0=;
 b=hq7TGJPwl+9Z6/uN8eGb1DczClEE77ILU6BLdVbxSUGfGLMvPqyIzOi+uzMXt5HaU/
 K/FJc62OucBxht+eGBQ7c9lyinkAztGtbe8SbP8/KPRNWeRbnACK1tWWPNWHzQhfUZDj
 sdHNGSCLjPJqOspnE3U0gGIMNpmxm+Fxfx8L8mjE03yH8b2ae+el1V1XPutYM4CHT4N8
 kl4TWtB8HSIJJwV82pGtQQ5UQ1M0YQXwZ5wKRUQVD9HMpCqT+NXnn1ev12nJYXYSFYJF
 jhcAAzqZy6LRgw0uGNZh7kiylC1TZ18mWqviPMIRURcrvgfk2ZMnhvL1TwFs/fwIizkJ
 WytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FnfQ6ISxK8RloWdHimWZZCwZlxQOVw743/patpAY6b0=;
 b=xStgTMRc6BveGnCJaxaoY9tV5n7E1rtYRleDgFYiw2atEYsP+6GC+Q4AoznVEBKIjQ
 /fBZQQv+FU3BfRsTSPewfLPS0GqwtKuMFYOwYXsTCM4yi0xgR8FNEUruKwY3nQsSoK43
 k5U6WOcrwLITsBI3owXAVWsglIlOE3BhrKOrZhNQ+G5Dp57JA7lYm950wnaiaB2Qpmiy
 /smr7C58QgvLno0OclcqB1sYHFZ/wy7nWh0wokwb3IMkFkt4nUI950xQSygtuNNREkGL
 fiNtyMG6h+NpNwfCIGj1GKCp8Ty5Qf0vWI+yLl6N1FtDtQJKONXgjkfSV/NKdn2emqqE
 bvgg==
X-Gm-Message-State: ANoB5pm9CBxqDc2IrP/JlzdDf9J1auEtYi3Mp9nnhJZj1QVMeC/p//XY
 WnNKf/5NHVel9vjsjOoUOCY=
X-Google-Smtp-Source: AA0mqf4Dqhm4B9v8P3G/NSei3zr8tKNE8Wh1t9jOakbPmLkjt0G32fm5C50hQ8TJ3iG4wN8jqQzyxw==
X-Received: by 2002:a05:600c:4a99:b0:3cf:91e5:3d69 with SMTP id
 b25-20020a05600c4a9900b003cf91e53d69mr16244393wmp.160.1669033871448; 
 Mon, 21 Nov 2022 04:31:11 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003cffd3c3d6csm14664856wmq.12.2022.11.21.04.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:31:10 -0800 (PST)
Message-ID: <2cc7a3c5-563d-cdf6-f49b-5e0a9852fb54@gmail.com>
Date: Mon, 21 Nov 2022 13:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
References: <20221121015451.2471196-1-bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221121015451.2471196-1-bero@baylibre.com>
Cc: khilman@baylibre.com, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgQmVybmhhcmQsCgpPbiAyMS8xMS8yMDIyIDAyOjU0LCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVy
IHdyb3RlOgo+IER1cmluZyB0aGUgcmV2aWV3IG9mIG15IE1UODM2NSBzdXBwb3J0IHBhdGNoc2V0
Cj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzIwMjIxMTE3MjEwMzU2
LjMxNzg1NzgtMS1iZXJvQGJheWxpYnJlLmNvbS8pLAo+IHRoZSBpc3N1ZSBvZiB0aGUgInBpbnMt
YXJlLW51bWJlcmVkIiBEZXZpY2VUcmVlIHByb3BlcnR5IGhhcyBjb21lIHVwLgo+IAo+IFRoaXMg
cHJvcGVydHkgaXMgdW5pcXVlIHRvIE1lZGlhdGVrIE1UNjV4eCBhbmQgU1RNMzIgcGluY3RybHMs
IGFuZAo+IGRvZXNuJ3Qgc2VlbSB0byBzZXJ2ZSBhbnkgcHVycG9zZSAoYm90aCB0aGUgTWVkaWF0
ZWsgYW5kIFNUTTMyIGRyaXZlcnMKPiBzaW1wbHkgcmVmdXNlIHRvIGRlYWwgd2l0aCBhIGRldmlj
ZSB1bmxlc3MgcGlucy1hcmUtbnVtYmVyZWQgaXMgc2V0IHRvCj4gdHJ1ZSkuCj4gCj4gVGhlcmUg
aXMgbm8gb3RoZXIgdXNlIG9mIHRoaXMgcHJvcGVydHkgaW4gdGhlIGtlcm5lbCBvciBpbiBvdGhl
ciBwcm9qZWN0cwo+IHVzaW5nIERldmljZVRyZWVzIChjaGVja2VkIHUtYm9vdCBhbmQgRnJlZUJT
RCAtLSBpbiBib3RoIG9mIHRob3NlLCB0aGUKPiBmbGFnIGlzIHByZXNlbnQgaW4gTWVkaWF0ZWsg
YW5kIFNUTSBkZXZpY2V0cmVlcywgYnV0IG5vdCB1c2VkIGFueXdoZXJlKS4KPiAKPiBUaGVyZSBp
cyBhbHNvIG5vIGtub3duIHVzZSBpbiB1c2Vyc3BhY2UgKGluIGZhY3QsIGEgdXNlcmxhbmQgYXBw
bGljYXRpb24KPiByZWx5aW5nIG9uIHRoZSBwcm9wZXJ0eSB3b3VsZCBiZSBicm9rZW4gYmVjYXVz
ZSBpdCB3b3VsZCBnZXQgdHJ1ZSBvbgo+IGFueSBNZWRpYXRlayBvciBTVE0gY2hpcHNldCBhbmQg
ZmFsc2Ugb24gYWxsIG90aGVycywgZXZlbiB0aG91Z2ggb3RoZXIKPiBjaGlwc2V0cyB1c2UgbnVt
YmVyZWQgcGlucykuCj4gCj4gVGhpcyBwYXRjaHNldCByZW1vdmVzIGFsbCB1c2VzIG9mIHBpbnMt
YXJlLW51bWJlcmVkLgo+IAo+IAoKTXkgcGVyc29uYWwgcHJlZmVyZW5jZSBpcyB0byBhZGQgYSBz
dW1tYXJ5IG9mIHRoZSBmaWxlcyB0b3VjaGVkIGJ5IHRoZSBzZXJpZXMgaW4gCnRoZSBjb3ZlciBs
ZXR0ZXIgKHRoZSB0b29scyB3aWxsIGRvIHRoYXQgZm9yIHlvdSkuIFRoaXMgYWxsb3dzIG1haW50
YWluZXJzIHRvIAplYXNpZXIgdW5kZXJzdGFuZCBpZiB0aGV5IGhhdmUgdG8gbG9vayBkZWVwZXIg
aW50byB0aGUgc2VyaWVzIG9yIGNhbiBpZ25vcmUgaXQuCgpObyBuZWVkIHRvIHNlbmQgYWdhaW4s
IGp1c3Qgc2F5aW5nIGZvciB0aGUgZnV0dXJlLgoKUmVnYXJkcywKTWF0dGhpYXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
