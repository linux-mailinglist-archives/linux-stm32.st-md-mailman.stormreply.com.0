Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0113532B50B
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 07:09:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB842C57B70;
	Wed,  3 Mar 2021 06:09:44 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C581C56631
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 06:09:42 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id e23so4124852wmh.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Mar 2021 22:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4qCl2xTMEnGwHMZihEf6F2RLD0MFzn8n767BOSW3ZLY=;
 b=BTDWTl9GOreLmZ99H7YpSxoCsdIGP0UpXFOj2rko3R8s/1aCDQBa6S1fXptXgN++5r
 31JbnhHu89/UMruITL6C+lfaQrZE+7uoAeu6wPNHKmXObekmOYkWEgKXr38xJOYG3hsL
 U7fc61CHWHQN/ko9psybOPR080Wh1/hs6X3KC6pzgVa2ay3jYnrd8ykDcFoQW8GusOnu
 1+jJ9S9Xi1yqm112/oUxVOWYVifzj6voHwgw3r/itHtjDN9I+8kk2Zo4Fwbg02f8kEWu
 SEjA/AuxYZaUEgASqOzdLkqs7Ngw1eU70gzI6/RZw52edxiNoQ1GsItvf57utuDCbjNK
 62eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4qCl2xTMEnGwHMZihEf6F2RLD0MFzn8n767BOSW3ZLY=;
 b=EBWM1XNJIL4G0fmXG8NPlHjcqstbkXJiu0TdBasbJ5mzDqZZ+DQqTA5Wc0K+Z5z6PR
 dhle5oXNf3vFNuPn6589oXCYL/UDSuoddtsUotnhmCZA7pnRTavVLtzCJLi3jDfjTYPH
 pgR3wcHpREtQJ2LKQ4o2AMNVmx2v1V3rAcRilTdsVHoial/qONxSKAHppvIvXYWsKfll
 NA2wzRJ3GcN0TC8hhPyjdK7N7EGT+knrQowb9s0ppuHUV1uR8bL59TPuxKaI/qTARxId
 t71h2mQejGddKW5IJJNusCYgiH6OyBS0V61xKq1mfg3vZzLfqqn7IB7QQRX1S4tHQniL
 W7mg==
X-Gm-Message-State: AOAM533mBF+cKi46V3RLJNJ3GVm/TVdkbXMun+enemnVXIx2pHUfCcTy
 fRog877KqlC/Fu+CrClOUkS4Aw==
X-Google-Smtp-Source: ABdhPJyATzAN6BDlUtwLGCxJi1UOsYOTLnb1sE8MN9Ef75tsKP+GyZxuwvb1JuD/r1uQUvdtXGO73A==
X-Received: by 2002:a7b:c7ca:: with SMTP id z10mr1307886wmk.117.1614751780934; 
 Tue, 02 Mar 2021 22:09:40 -0800 (PST)
Received: from [192.168.0.41] (lns-bzn-59-82-252-144-192.adsl.proxad.net.
 [82.252.144.192])
 by smtp.googlemail.com with ESMTPSA id u20sm4088170wru.6.2021.03.02.22.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 22:09:40 -0800 (PST)
To: Vinod Koul <vkoul@kernel.org>
References: <20210224144222.23762-1-daniel.lezcano@linaro.org>
 <20210224144222.23762-9-daniel.lezcano@linaro.org>
 <YD5olWDZ50sLVn7w@vkoul-mobl>
 <e44809f1-63a6-8c8b-a05f-52516fb2141f@linaro.org>
 <YD8hNs98g172DiF8@vkoul-mobl>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <207d37f7-f99f-03ab-7914-d2b82977a95f@linaro.org>
Date: Wed, 3 Mar 2021 07:09:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YD8hNs98g172DiF8@vkoul-mobl>
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

T24gMDMvMDMvMjAyMSAwNjo0MCwgVmlub2QgS291bCB3cm90ZToKPiBPbiAwMi0wMy0yMSwgMTg6
MDMsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBPbiAwMi8wMy8yMDIxIDE3OjMyLCBWaW5vZCBL
b3VsIHdyb3RlOgo+Pj4gT24gMjQtMDItMjEsIDE1OjQyLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToK
Pj4+PiBIWiB1bml0IGNvbnZlcnNpb24gbWFjcm9zIGFyZSBhdmFpbGFibGUgaW4gdW5pdHMuaCwg
dXNlIHRoZW0gYW5kCj4+Pj4gcmVtb3ZlIHRoZSBkdXBsaWNhdGUgZGVmaW5pdGlvbi4KPj4+Pgo+
Pj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8u
b3JnPgo+Pj4+IC0tLQo+Pj4+ICBkcml2ZXJzL3BoeS9zdC9waHktc3RtMzItdXNicGh5Yy5jIHwg
MiArLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BoeS9zdC9waHktc3RtMzItdXNicGh5Yy5j
IGIvZHJpdmVycy9waHkvc3QvcGh5LXN0bTMyLXVzYnBoeWMuYwo+Pj4+IGluZGV4IGE1NDMxN2U5
NmM0MS4uMDJkZDEyYmI0NjkyIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvcGh5L3N0L3BoeS1z
dG0zMi11c2JwaHljLmMKPj4+PiArKysgYi9kcml2ZXJzL3BoeS9zdC9waHktc3RtMzItdXNicGh5
Yy5jCj4+Pj4gQEAgLTE0LDYgKzE0LDcgQEAKPj4+PiAgI2luY2x1ZGUgPGxpbnV4L29mX3BsYXRm
b3JtLmg+Cj4+Pj4gICNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+Cj4+Pj4gICNpbmNsdWRlIDxs
aW51eC9yZXNldC5oPgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvdW5pdHMuaD4KPj4+PiAgCj4+Pj4g
ICNkZWZpbmUgU1RNMzJfVVNCUEhZQ19QTEwJMHgwCj4+Pj4gICNkZWZpbmUgU1RNMzJfVVNCUEhZ
Q19NSVNDCTB4OAo+Pj4+IEBAIC00OCw3ICs0OSw2IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29u
c3Qgc3VwcGxpZXNfbmFtZXNbXSA9IHsKPj4+PiAgI2RlZmluZSBQTExfRlZDT19NSFoJCTI4ODAK
Pj4+PiAgI2RlZmluZSBQTExfSU5GRl9NSU5fUkFURV9IWgkxOTIwMDAwMAo+Pj4+ICAjZGVmaW5l
IFBMTF9JTkZGX01BWF9SQVRFX0haCTM4NDAwMDAwCj4+Pj4gLSNkZWZpbmUgSFpfUEVSX01IWgkJ
MTAwMDAwMEwKPj4+Cj4+PiBJIGRvbnQgc2VlIHRoaXMgaW4gdW5pdHMuaCwgY2FuIHlvdSBzZW5k
IHRoaXMgb25jZSBpdCBpcyBtZXJnZWQgdXBzdHJlYW0KPj4KPj4gQWN0dWFsbHksIGl0IGlzIHRo
ZSBmaXJzdCBwYXRjaCBvZiB0aGUgc2VyaWVzLgo+Pgo+PiBJIGFza2VkIFJhZmFlbCBpZiBoZSBj
YW4gbWVyZ2UgdGhlIGVudGlyZSBzZXJpZXMuCj4gCj4gUGxzIGNjIGZvbGtzIG9uIGNvdmVyIGF0
IGxlYXN0IHNvIHRoYXQgdGhleSBhcmUgYXdhcmUuCgpZZWFoLCBzb3JyeSBmb3IgdGhhdC4gSSB0
ZW5kIHRvIHJlbHkgdG9vIG11Y2ggb24gdGhlIGRlZmF1bHQgJ2NjY21kJy4KCgoKLS0gCjxodHRw
Oi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFn
ZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBU
d2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
