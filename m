Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9566C6FA334
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 11:26:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43B2DC6904E;
	Mon,  8 May 2023 09:26:39 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80C8AC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 09:26:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-50bc4ba28cbso7884151a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 May 2023 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683537997; x=1686129997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MiCCw6JVpqLvBjxuPw1yzCHzKR/sVakiwZutl82ltXI=;
 b=m9j3yNB/3j3E/6fpurCNLFASZERGHi46OQt8kzyW9FNlCQ1FNT2GhqeqzkgnwNp0bv
 lw1gBq9VdCQKkLzQRSqETJxJLMMy3swM+q/f3uF3Nkx3x+Tn1s1YcvrCigyW/Iz/9pVu
 HiOfeFM3VG36hNPUEcLEmYl7mVxJP0FxMaFs7Np7IfVzK47SgiuD3/PVGPXd2L/JBAOo
 8jNVmbkaQ8f6+qPEnzjIEkWBfmFUKSarsZjwAzQ22pZDHAkP/h9tjrVOH05Sgpy9a01J
 prvhC+u28HxUK8MtETLvXyKbbbH5St35kNER3QA3rrVDEkVm+KqT9x3uWKvN4AtkmnLM
 ht6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683537997; x=1686129997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MiCCw6JVpqLvBjxuPw1yzCHzKR/sVakiwZutl82ltXI=;
 b=FpypT8r9gegDf+FcSBBqDmBjys2swT3+THu9HufY/NBDTmY8pmcQNnVX7L0r+k9bDA
 vgZ6ES5juZGhbn25ElXlA9n/xQFmJyrpOIaZgsJv2aXQeTEsBiu6Af6lTHI+E4TVI9s+
 509IfpGpZSECrp9qw+rvg3qNhnv26pewtJFF0AaK3Wdnncet+1E+P+iFuWmpKcecvH3W
 LmRmvjz5il7bWURDKRkUGYQBk4IVMuqwehZTDaAUnzyoh4koFpov2St3VX0RreA5QKyu
 1DrrPhFDvy7qKMUOqrSNV/we3U6j+fKVc63RMKW33Oazo+VlEViZdUJ4/E9vBPQ2ctpx
 3pcw==
X-Gm-Message-State: AC+VfDzVnTWAtW6j/QYU4lpW/4f5VJTNbJeTl9II0lFa6wzQR6xcPkxt
 8pHaFlPlQU7StvgJQD7J56F7bg==
X-Google-Smtp-Source: ACHHUZ4oSPt/qB3Tyl8i9/yHcjt2sV4nl/PsiHtr0b18C6HMzsQHpCse2qMCin1fQ33JLgiu0JjN+g==
X-Received: by 2002:a05:6402:28d:b0:506:fcd5:6159 with SMTP id
 l13-20020a056402028d00b00506fcd56159mr7754402edv.21.1683537997025; 
 Mon, 08 May 2023 02:26:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300?
 ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
 by smtp.gmail.com with ESMTPSA id
 f18-20020a056402151200b0050daa883545sm578585edw.64.2023.05.08.02.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 02:26:36 -0700 (PDT)
Message-ID: <1da9fbcb-07c7-5bf8-4461-dc6578101f84@linaro.org>
Date: Mon, 8 May 2023 11:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
 <20230426-stmpe-dt-bindings-v3-1-eac1d736e488@linaro.org>
 <168349835606.3623231.4270033272905089508.robh@kernel.org>
 <CACRpkdZsC6s3MjX5Mkr5u763CYSAotJKcK5wZMwCQxgEzvw+vQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkdZsC6s3MjX5Mkr5u763CYSAotJKcK5wZMwCQxgEzvw+vQ@mail.gmail.com>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/2] dt-bindings: gpio: Add STMPE YAML
	DT schema
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

T24gMDgvMDUvMjAyMyAwODozMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBNb24sIE1heSA4
LCAyMDIzIGF0IDEyOjI24oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+IE9uIFN1biwgMDcgTWF5IDIwMjMgMjM6MTk6MTkgKzAyMDAsIExpbnVzIFdhbGxlaWogd3Jv
dGU6Cj4gCj4+PiBUaGlzIGFkZHMgYSBzY2hlbWEgZm9yIHRoZSBTVE1QRSBHUElPIHRoYXQgd2hp
bGUgaXQgaXMgdXNlZCBhCj4+PiBsb3QgaW4gdGhlIGtlcm5lbCB0cmVlIGlzIGFueXdheSBtaXNz
aW5nIGl0cyBiaW5kaW5ncy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4+PiAtLS0KPj4+IENoYW5nZUxvZyB2Mi0+djM6Cj4+
PiAtIFVzZSBhIGNvbXBhY3QgaG9nIG5vZGUgc2NoZW1hIGJhY2tlZCBieSB0aGUgc3RhbmRhcmQg
aG9nCj4+PiAgIHNjaGVtYS4KPj4+IENoYW5nZUxvZyB2MS0+djI6Cj4+PiAtIE5ldyBwYXRjaCBz
cGxpdCBvZmYgZnJvbSB0aGUgTUZEIHBhdGNoLgo+Pj4gLS0tCj4+PiAgLi4uL2RldmljZXRyZWUv
YmluZGluZ3MvZ3Bpby9zdCxzdG1wZS1ncGlvLnlhbWwgICAgfCA1MSArKysrKysrKysrKysrKysr
KysrKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKPj4+Cj4+Cj4+IE15
IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2Jp
bmRpbmdfY2hlY2snCj4+IG9uIHlvdXIgcGF0Y2ggKERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGlu
IHY1LjEzKToKPj4KPj4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOgo+Pgo+PiBkdHNjaGVtYS9k
dGMgd2FybmluZ3MvZXJyb3JzOgo+PiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xp
bnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjI2
ODUuZXhhbXBsZS5kdGI6IGNhbWVyYS1zZW5zb3JAM2M6IHBvcnQ6ZW5kcG9pbnQ6ZGF0YS1sYW5l
czogW1sxXV0gaXMgdG9vIHNob3J0Cj4+ICAgICAgICAgRnJvbSBzY2hlbWE6IC9idWlsZHMvcm9i
aGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL2kyYy9vdnRpLG92MjY4NS55YW1sCj4+IC9idWlsZHMvcm9iaGVycmluZy9kdC1y
ZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Jv
Y2tjaGlwLWlzcDEuZXhhbXBsZS5kdGI6IGNhbWVyYUAzYzogcG9ydDplbmRwb2ludDpkYXRhLWxh
bmVzOiBbWzFdXSBpcyB0b28gc2hvcnQKPj4gICAgICAgICBGcm9tIHNjaGVtYTogL2J1aWxkcy9y
b2JoZXJyaW5nL2R0LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL292dGksb3YyNjg1LnlhbWwKPj4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0
LXJldmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2Zz
bCxpbXg2cS1wY2llLWVwLmV4YW1wbGUuZHRiOiBwY2llLWVwQDMzODAwMDAwOiBVbmV2YWx1YXRl
ZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ2Fzc2lnbmVkLWNsb2NrLXBhcmVudHMnLCAn
YXNzaWduZWQtY2xvY2stcmF0ZXMnLCAnYXNzaWduZWQtY2xvY2tzJyB3ZXJlIHVuZXhwZWN0ZWQp
Cj4+ICAgICAgICAgRnJvbSBzY2hlbWE6IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kv
bGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9mc2wsaW14NnEtcGNp
ZS1lcC55YW1sCj4gCj4gTG9va3MgbGlrZSB0aGVzZSBhcmUgbm90IG1pbmUuLi4KClllcCwgdGhl
c2UgYXJlIGNvbWluZyBmcm9tIG90aGVyIGlzc3Vlcywgbm93IGhhcHBlbmluZyBpbiBMaW51cycg
bWFzdGVyLgpJIGZpeGVkIHRoZSBQQ0kgYW5kIEkgd2lsbCBzZW5kIGl0IHRvZ2V0aGVyIHdpdGgg
dGhlIGZpeCBmb3IgbWVkaWEgdG8gTGludXMuCgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
