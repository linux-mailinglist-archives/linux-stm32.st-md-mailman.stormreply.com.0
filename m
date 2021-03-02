Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779B32A6DD
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Mar 2021 18:03:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C60DC56638;
	Tue,  2 Mar 2021 17:03:26 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DDF2C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Mar 2021 17:03:25 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id u125so3475519wmg.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 09:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FSLB6bwvcceEbYUIq7Kx78eQMei40IgrAI2OU/cApK0=;
 b=bOsWX3IkRuVjIW/3Rb02KgbgfXirqc+6uiUMTGwkCN3XDS4HQQkXb7GqB6Mbg5IajP
 bEba5IuO4g4zOL9bOQIIuBDcdjv1L+jE7NzIJdqLrj6f4Vj6eQWEcSYpuToTBQkUK1Ke
 zQy2O6wz9NbCW8+Xq0eMfTDs6uW0jTmHPq2W8A0Wkys6h3BN3SzdZEQNXcUR3Ekv8/zz
 1y3z6oQUq6Dzv/4b2CvUGlpx2jdiU0xi52XvZH4CXVvLrxwI6icDW90tjiCnoKDuefwH
 5hsex/v/B2FHf7sM1KoW4sz234J/7dShqxjXV6MpyopRkSsJOZ9DTCtSypv9VsoTP9vB
 sVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FSLB6bwvcceEbYUIq7Kx78eQMei40IgrAI2OU/cApK0=;
 b=YaUBK6c4xXtFHKM1JlPDRU5O2pXIQXsPyk1YjbtbCT7TOGY1yvPl1lN2Z6eXwfdOTy
 5s5C9TvKX66HlrefmMFCD4PeQTts0gegELXOhRiSEjgJP7waeSeJKIlMoec2K9vKMYOM
 ulTT9lw2x/6ui2t24PrxulF0TwJCH0P7k6HvIe/s2u56caA800nUaS8Mu9em1MfFw73+
 dL44SYk20qm1CZ7e/2h8lfdC0ya598qeAgRnfQlnwhBEQRO19g1jZJe9Dxc/G4C61jLs
 XeXQDyolGGp+2iSPFXqCiYOObtOjFFWhNDutQmITC1m4+50ad3L9X5PgS5oEvjRfnAmF
 VMTg==
X-Gm-Message-State: AOAM533lpIfE3PiTFjKA6OOCiU3dr1L6xgAmAzgh5zAgfJgtteC8L/aD
 MTQhRRPXgHyokAPVoxjlFNEeiA==
X-Google-Smtp-Source: ABdhPJzvAINR+SaWATC/3ozKIK+bgArnfBET/ow62+RdQBcc5eOgV9EchW3VcrZ84iFTERtdnPHikw==
X-Received: by 2002:a1c:a543:: with SMTP id o64mr4999421wme.107.1614704605010; 
 Tue, 02 Mar 2021 09:03:25 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net.
 [82.252.144.192])
 by smtp.googlemail.com with ESMTPSA id j20sm2878076wmp.30.2021.03.02.09.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 09:03:24 -0800 (PST)
To: Vinod Koul <vkoul@kernel.org>
References: <20210224144222.23762-1-daniel.lezcano@linaro.org>
 <20210224144222.23762-9-daniel.lezcano@linaro.org>
 <YD5olWDZ50sLVn7w@vkoul-mobl>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e44809f1-63a6-8c8b-a05f-52516fb2141f@linaro.org>
Date: Tue, 2 Mar 2021 18:03:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YD5olWDZ50sLVn7w@vkoul-mobl>
Content-Language: en-US
Cc: Etienne Carriere <etienne.carriere@st.com>,
 Amelie Delaunay <amelie.delaunay@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, rafael@kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, andriy.shevchenko@linux.intel.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 9/9] phy/drivers/stm32: Use HZ macros
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

T24gMDIvMDMvMjAyMSAxNzozMiwgVmlub2QgS291bCB3cm90ZToKPiBPbiAyNC0wMi0yMSwgMTU6
NDIsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBIWiB1bml0IGNvbnZlcnNpb24gbWFjcm9zIGFy
ZSBhdmFpbGFibGUgaW4gdW5pdHMuaCwgdXNlIHRoZW0gYW5kCj4+IHJlbW92ZSB0aGUgZHVwbGlj
YXRlIGRlZmluaXRpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5p
ZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgo+PiAtLS0KPj4gIGRyaXZlcnMvcGh5L3N0L3BoeS1zdG0z
Mi11c2JwaHljLmMgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3N0L3BoeS1zdG0zMi11
c2JwaHljLmMgYi9kcml2ZXJzL3BoeS9zdC9waHktc3RtMzItdXNicGh5Yy5jCj4+IGluZGV4IGE1
NDMxN2U5NmM0MS4uMDJkZDEyYmI0NjkyIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3BoeS9zdC9w
aHktc3RtMzItdXNicGh5Yy5jCj4+ICsrKyBiL2RyaXZlcnMvcGh5L3N0L3BoeS1zdG0zMi11c2Jw
aHljLmMKPj4gQEAgLTE0LDYgKzE0LDcgQEAKPj4gICNpbmNsdWRlIDxsaW51eC9vZl9wbGF0Zm9y
bS5oPgo+PiAgI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9y
ZXNldC5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3VuaXRzLmg+Cj4+ICAKPj4gICNkZWZpbmUgU1RN
MzJfVVNCUEhZQ19QTEwJMHgwCj4+ICAjZGVmaW5lIFNUTTMyX1VTQlBIWUNfTUlTQwkweDgKPj4g
QEAgLTQ4LDcgKzQ5LDYgQEAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBzdXBwbGllc19uYW1l
c1tdID0gewo+PiAgI2RlZmluZSBQTExfRlZDT19NSFoJCTI4ODAKPj4gICNkZWZpbmUgUExMX0lO
RkZfTUlOX1JBVEVfSFoJMTkyMDAwMDAKPj4gICNkZWZpbmUgUExMX0lORkZfTUFYX1JBVEVfSFoJ
Mzg0MDAwMDAKPj4gLSNkZWZpbmUgSFpfUEVSX01IWgkJMTAwMDAwMEwKPiAKPiBJIGRvbnQgc2Vl
IHRoaXMgaW4gdW5pdHMuaCwgY2FuIHlvdSBzZW5kIHRoaXMgb25jZSBpdCBpcyBtZXJnZWQgdXBz
dHJlYW0KCkFjdHVhbGx5LCBpdCBpcyB0aGUgZmlyc3QgcGF0Y2ggb2YgdGhlIHNlcmllcy4KCkkg
YXNrZWQgUmFmYWVsIGlmIGhlIGNhbiBtZXJnZSB0aGUgZW50aXJlIHNlcmllcy4KCgoKCi0tIAo8
aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdh
cmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29t
L3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMhL2xpbmFyb29y
Zz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cvPiBCbG9nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
