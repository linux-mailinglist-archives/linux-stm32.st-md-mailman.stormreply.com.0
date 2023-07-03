Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C0745C33
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jul 2023 14:28:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BF8BC6B45A;
	Mon,  3 Jul 2023 12:28:31 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 102A6C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jul 2023 12:28:29 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-98d34f1e54fso410454466b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jul 2023 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688387309; x=1690979309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+6M152gdY/lBTJnlZGUQ74XMgASY/+UfhDS7moIYzgc=;
 b=ueP9DH+RCuR7d/Eb3Tl6FM81FNi5B+ZGthqHlULhWOQEW4GACtYosybTXU8F1WjCOm
 XMnSL6j4JyMNQZ285JysTI7LbK1xjsBVJCKcqwmlXZa7Rtgine/lxt/vTZv2cSY9NPO7
 1t/uVFiNDaadc4l4nESKqIPgL7jdS7Sb1IXwolrrAVwGNvQXIf9kFbaJLAAuJqVnCUgc
 x9WRMCL+zGDOajscVz5gVa8x5aeakL2SgKUU0VziTk7CMSeNliAQy+3e8lcJtK0TYY//
 Wng/lEgJnOHJP020f/CQQiytbwFCAdgZcNkZUgMmdTQDD2qAy94Vk5gWAVEk2Om+VD4I
 8VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688387309; x=1690979309;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6M152gdY/lBTJnlZGUQ74XMgASY/+UfhDS7moIYzgc=;
 b=TByZ6iY75Cyh4j2++vynA1ni9UAqTQJ+02cBQGGZ941ju4fMBnhTSHESxso5G3y3Jm
 lG6+RB71IdZFbJuLrIXq4UcoQ+ZqWtHzw3ScI52YV7brs7ICH5CbEH71SMU/8wnsbyJr
 UPE/lUyavms6+m6JU9dUYRe8nfCBy17F/07sgn+Tmm0Qc8gFZqegzKRJcgdmOgHz5nE7
 Ie4Rsii+zJzv24IPkdv0UIzUAcKXmvkUA/kFji8OZmfXfDYP7clu844BQjIRvKb6MO0C
 w16ReaTqfTdSv1ZQEHAQ/MFMey6pxzo1ZKJQxLeW53Kt3voi58eUXC+E3nTlVyFii+Uj
 eZYg==
X-Gm-Message-State: ABy/qLbStsR5QN0tnZ1GtniNgllQ+lhCRZ4w5vtt3W9G96I3Kg8DkS+c
 tip7Bsl0/l7u5mC7tz9hDD/C2Q==
X-Google-Smtp-Source: ACHHUZ5z9X4wnEecRoQBccdRRk1O19p3dtkMCjmwrIO1xJ1bN3Oa+qfbZPRY1w6NaUL14nbysKhzZg==
X-Received: by 2002:a17:906:4a91:b0:98e:26ae:9b07 with SMTP id
 x17-20020a1709064a9100b0098e26ae9b07mr5185183eju.35.1688387309422; 
 Mon, 03 Jul 2023 05:28:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 x26-20020a1709064a9a00b009786ae9ed50sm11848089eju.194.2023.07.03.05.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 05:28:29 -0700 (PDT)
Message-ID: <9d0ce727-6473-e326-6b75-f8415fdb85b9@linaro.org>
Date: Mon, 3 Jul 2023 14:28:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230627101215.58798-1-frank.li@vivo.com>
 <20230627110025.vgtplc6nluiiuvoh@pengutronix.de> <87h6qpyzkd.ffs@tglx>
 <247a8166-f131-2d07-ec2b-479a4c19297f@vivo.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <247a8166-f131-2d07-ec2b-479a4c19297f@vivo.com>
Cc: heiko@sntech.de, hayashi.kunihiko@socionext.com, rafael@kernel.org,
 amitk@kernel.org, linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 jernej.skrabec@gmail.com, miquel.raynal@bootlin.com,
 srinivas.pandruvada@linux.intel.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, bchihi@baylibre.com,
 florian.fainelli@broadcom.com, daniel.lezcano@linaro.org,
 chi.minghao@zte.com.cn, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com, wenst@chromium.org,
 rui.zhang@intel.com, thara.gopinath@gmail.com, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linux-mediatek@lists.infradead.org,
 mmayer@broadcom.com, matthias.bgg@gmail.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, johan+linaro@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org,
 niklas.soderlund+renesas@ragnatech.se, andersson@kernel.org,
 linux-kernel@vger.kernel.org, shangxiaojing@huawei.com,
 konrad.dybcio@linaro.org, mcoquelin.stm32@gmail.com, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 01/15] genirq/devres: Add error
 information printing for devm_request_threaded_irq()
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

T24gMDMvMDcvMjAyMyAxMzo1NCwgWWFuZ3RhbyBMaSB3cm90ZToKPiBIaSBLcnp5c3p0b2YsCj4g
Cj4gT24gMjAyMy82LzMwIDE5OjExLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+IE9uIFR1ZSwg
SnVuIDI3IDIwMjMgYXQgMTM6MDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+Pj4gT24gVHVl
LCBKdW4gMjcsIDIwMjMgYXQgMDY6MTI6MDFQTSArMDgwMCwgWWFuZ3RhbyBMaSB3cm90ZToKPj4+
Cj4+PiBXaGlsZSBJIGFzc3VtZSBjaGFuZ2luZyB0byBkZXZfZXJyX3Byb2JlIGlzIGEgcmVzdWx0
IG9mIG15IGNvbmNlcm4gdGhhdAo+Pj4gbm8gZXJyb3Igc2hvdWxkIGJlIHByaW50ZWQgd2hlbiBy
Yz0tRVBST0JFREVGRVIsIG15IG90aGVyIGNvbmNlcm4gdGhhdAo+Pj4gYWRkaW5nIGFuIGVycm9y
IG1lc3NhZ2UgdG8gYSBnZW5lcmljIGFsbG9jYXRpb24gZnVuY3Rpb24gaXMgYSBiYWQgaWRlYQo+
Pj4gc3RpbGwgc3RhbmRzLgo+PiBJIGFncmVlIGluIGdlbmVyYWwsIGJ1dCBpZiB5b3UgYWN0dWFs
bHkgbG9vayBhdCB0aGUgY2FsbCBzaXRlcyBvZgo+PiBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJx
KCkgdGhlbiB0aGUgdmFzdCBtYWpvcml0eSBvZiB0aGVtIHByaW50IG1vcmUgb3IKPj4gbGVzcyBs
b3VzeSBlcnJvciBtZXNzYWdlcy4gQSBxdWljayBncmVwL3NlZC9hd2svc29ydC91bmlxIHJldmVh
bGVkCj4+Cj4+ICAgICAgIDUxOSBtZXNzYWdlcyB0b3RhbCAodGhlcmUgYXJlIHByb2JhYmx5IG1v
cmUpCj4+Cj4+ICAgICAgIDM1MiB1bmlxdWUgbWVzc2FnZXMKPj4KPj4gICAgICAgMzIzIHVuaXF1
ZSBtZXNzYWdlcyBhZnRlciBsb3dlciBjYXNpbmcKPj4KPj4gICAgICAgICAgIFRob3NlIDMyMyBh
cmUgbW9zdGx5IGp1c3QgdmFyaWFudHMgb2YgdGhlIHNhbWUgcGF0dGVybnMgd2l0aCBzbGlnaHQK
Pj4gICAgICAgICAgIG1vZGlmaWNhdGlvbnMgaW4gZm9ybWF0dGluZyBhbmQgaW5mb3JtYXRpb24g
cHJvdmlkZWQuCj4+Cj4+ICAgICAgIDE4NiBvZiB0aGVzZSBtZXNzYWdlcyBkbyBub3QgZGVsaXZl
ciBhbnkgdXNlZnVsIGluZm9ybWF0aW9uLAo+PiAgICAgICAgICAgZS5nLiAibm8gaXJxIiwgIgo+
Pgo+PiAgICAgICBUaGUgbW9zdCB1c2VmdWwgb25lIG9mIGFsbCBpczogImNvdWxkIHJlcXVlc3Qg
d2FrZXVwIGlycTogJWQiCj4+Cj4+IFNvIHRoZXJlIGlzIGNlcnRhaW5seSBhbiBhcmd1bWVudCB0
byBiZSBtYWRlIHRoYXQgdGhpcyBwYXJ0aWN1bGFyCj4+IGZ1bmN0aW9uIHNob3VsZCBwcmludCBh
IHdlbGwgZm9ybWF0dGVkIGFuZCBpbmZvcm1hdGl2ZSBlcnJvciBtZXNzYWdlLgo+Pgo+PiBJdCdz
IG5vdCBhIGdlbmVyYWwgYWxsb2NhdG9yIGxpa2Uga21hbGxvYygpLiBJdCdzIHNwZWNpYWxpemVk
IGFuZCBpbiB0aGUKPj4gdmFzdCBtYWpvcml0eSBvZiBjYXNlcyBmYWlsaW5nIHRvIHJlcXVlc3Qg
dGhlIGludGVycnVwdCBjYXVzZXMgdGhlCj4+IGRldmljZSBwcm9iZSB0byBmYWlsLiBTbyBoYXZp
bmcgcHJvcGVyIGFuZCBjb25zaXN0ZW50IGluZm9ybWF0aW9uIHdoeQo+PiB0aGUgZGV2aWNlIGNh
bm5vdCBiZSB1c2VkIF9pc18gdXNlZnVsLgo+Pgo+PiBZYW5ndGFvOiBUaGUgd2F5IGhvdyB0aGlz
IGlzIGF0dGVtcHRlZCBpcyBub3QgdXNlZnVsIGF0IGFsbC4KPj4KPj4gICAgICAxKSBUaGUgY2hh
bmdlbG9nIGlzIHdvcmQgc2FsYWQgYW5kIHByb3ZpZGVzIDAgcmF0aW9uYWxlCj4+Cj4+ICAgICAg
ICAgQWxzbyBzdWNoIHNlcmllcyByZXF1aXJlIGEgY292ZXIgbGV0dGVyLi4uCj4+Cj4+ICAgICAg
MikgVGhlIGRldl9lcnIoKSB3aGljaCBpcyBhZGRlZCBpcyBub3QgaW5mb3JtYXRpdmUgYXQgYWxs
IGFuZCBjYW5ub3QKPj4gICAgICAgICByZXBsYWNlIGFjdHVhbGx5IHVzZWZ1bCBlcnJvciBtZXNz
YWdlcy4gSXQncyBub3QgdGhhdCBoYXJkIHRvCj4+ICAgICAgICAgbWFrZSBpdCB1c2VmdWwuCj4+
Cj4+ICAgICAgMikgQWRkaW5nIHRoZSBwcmludGtzIHVuY29uZGl0aW9uYWxseSBmaXJzdCB3aWxs
IGVtaXQgdHdvIG1lc3NhZ2VzCj4+ICAgICAgICAgd2l0aCBkaWZmZXJlbnQgY29udGVudC4KPj4K
Pj4gICAgICAgICBUaGlzIGlzIG5vdCBob3cgc3VjaCBjaGFuZ2VzIGFyZSBkb25lLgo+Pgo+PiAg
ICAgICAgIFRoZSBwcm9wZXIgYXBwcm9hY2ggaXMgdG8gY3JlYXRlIGEgd3JhcHBlciBmdW5jdGlv
biB3aGljaCBlbWl0cwo+PiAgICAgICAgIHRoZSBlcnJvciBtZXNzYWdlOgo+Pgo+PiAgICAgICAg
IHdyYXBwZXIoLi4uLi4sIGNvbnN0IGNoYXIgKmluZm8pCj4+ICAgICAgICAgewo+PiAgICAgICAg
ICAgICAgcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSguLi4uKTsKPj4gICAgICAgICAg
ICAgIGlmIChyZXQgPCAwKSB7Cj4+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxl
ZCB0byByZXF1ZXN0ICVzaW50ZXJydXB0ICV1ICVzICVzOiAlZFxuLAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICB0aHJlYWRfZm4gPyAidGhyZWFkZWQgIiA6ICIiLAo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICBpcnEsIGRldm5hbWUsIGluZm8gPyA6ICIiLCByZXQpOwo+PiAgICAgICAgICAg
ICAgfQo+PiAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4gICAgICAgICB9Cj4gCj4gCj4gSGVy
ZS4KPiAKPiBWMyB3YXMgbW9kaWZpZWQgYWNjb3JkaW5nIHRvIHRnbHgncyBzdWdnZXN0aW9uLCBp
ZiB0aGVyZSBpcyBhbnkgcHJvYmxlbSwgCj4gcGxlYXNlIHBvaW50IG91dC4KClRoZSBjb21tZW50
IHdhcyBhYm91dCByZXF1ZXN0X3RocmVhZF9pcnEsIG5vdCBhYm91dCBkZXZyZXMgYWxsb2MuIERv
bid0Cm1peCB0aGUgcGxhY2VzLiBSZWFsbHksIHNpbmNlIHdoZW4gZG8gd2UgcHJpbnQgYW55IGVy
cm9ycyBvbiBFTk9NRU0/CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
