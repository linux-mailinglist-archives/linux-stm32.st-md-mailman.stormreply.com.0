Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FED8362E8
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 13:16:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2200CC6B442;
	Mon, 22 Jan 2024 12:16:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F2EFC6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 12:16:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-40d6b4e2945so37522375e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 04:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705925770; x=1706530570;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fpW61aGgXRpH2FMku4Toj0xfUJGLWKFyCTfLMNYZlmU=;
 b=KD7OtHCjnNlyCj04XQv/ZPv+n3+CyvEV0JdDqZmWRe5kURq6oWvK7dzE1Tkq0YDJsq
 hWJ2PZGjk2Fa+ktbAiDJybmjmf/k+6cKtUtjbX8l5iDEPBVLhQlHQTnYukbufZs3fLrv
 ZIPgxGK3qNB4O7fvBhaDukj4MTcgmtsD0f075xfUYp4efiBbTQtOFKf9yOEKL5d7abyO
 VOtenjaJfWy/QdJtdE0R9KT3LHaZL3zehvUutzADUCt1Q2apeTbxdi5nKAxeA6NryTK7
 yId+4k1kxHeidx8z9/AJYAQlSBukW+/FaIByF3dEIM36npLjHxYbflioJ1QnRQRB9w0i
 jyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705925770; x=1706530570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fpW61aGgXRpH2FMku4Toj0xfUJGLWKFyCTfLMNYZlmU=;
 b=YBPLx9zI1e1T60RbeDH1lBBVAurAb9ZVkgBWb0nrpPMn6ObfdQTcV2SxeEJ3ikuHIB
 WJHtxHo0YVrD4v3fghOitqwy08e3nOKQ5i/im1YPXG2FNTjLvt00YpbBU0Q3sme5mOxQ
 7+1dGDCIPKh4ekXUvK8wF9v2Mm+QqYt6koHkN72RRMlqkNmMBXg4Gjtvlffv9kf3LQC3
 9gcbVyv6IbpuXZni+RpFIZZe/D7fzbCFcTwKXuv0Xf4OXl0RVZUN99r8RmV/VrSaAv/2
 oqbYoNwrogCqhnScLdfXXtljtMZiD+XlvlOIYUYtmbRqem64/m7mYbLUCmdSExvxy9Pd
 wq7Q==
X-Gm-Message-State: AOJu0YzGILJ2YVqC5N9STQBIg9nz7NexZ82jRuRIdELWawnKSREZdQXN
 2HrWk1VMQHmme9BA4G/pAl6EdfyiQtlBKIvZHMu8e2fZa+MrqCBROR7Hol8a00k=
X-Google-Smtp-Source: AGHT+IES7d4z9U6TGxHRSc/cjcO6+fJK+fqx08kexujJvJuE4IU9gnqzaWqVNLMFIlYgDIZ6xmQFSw==
X-Received: by 2002:a05:600c:3d89:b0:40e:866c:e96d with SMTP id
 bi9-20020a05600c3d8900b0040e866ce96dmr1496117wmb.69.1705925769747; 
 Mon, 22 Jan 2024 04:16:09 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:371e:2a86:62f0:bc48?
 ([2a05:6e02:1041:c10:371e:2a86:62f0:bc48])
 by smtp.googlemail.com with ESMTPSA id
 p10-20020a05600c358a00b0040e559e0ba7sm42581477wmq.26.2024.01.22.04.16.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 04:16:09 -0800 (PST)
Message-ID: <1567c194-f431-433e-9cb8-b0c407061130@linaro.org>
Date: Mon, 22 Jan 2024 13:16:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20240120173615.14618-1-rdunlap@infradead.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240120173615.14618-1-rdunlap@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] clocksource: stm32: fix all kernel-doc
	warnings
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

T24gMjAvMDEvMjAyNCAxODozNiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+IEFkZCBhICJSZXR1cm5z
OiIgc2VjdGlvbiBpbiBvbmUgZnVuY3Rpb24gZGVzY3JpcHRpb24uCj4gVXNlIHRoZSBjb3JyZWN0
IGZ1bmN0aW9uIG5hbWUgaW4gYW5vdGhlciBmdW5jdGlvbiBkZXNjcmlwdGlvbi4KPiAKPiBUaGVz
ZSBjaGFuZ2VzIHByZXZlbnQgMiB3YXJuaW5nczoKPiAKPiB0aW1lci1zdG0zMi5jOjc5OiB3YXJu
aW5nOiBObyBkZXNjcmlwdGlvbiBmb3VuZCBmb3IgcmV0dXJuIHZhbHVlIG9mICdzdG0zMl90aW1l
cl9vZl9iaXRzX2dldCcKPiB0aW1lci1zdG0zMi5jOjE4OTogd2FybmluZzogZXhwZWN0aW5nIHBy
b3RvdHlwZSBmb3Igc3RtMzJfdGltZXJfd2lkdGgoKS4gUHJvdG90eXBlIHdhcyBmb3Igc3RtMzJf
dGltZXJfc2V0X3dpZHRoKCkgaW5zdGVhZAo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgo+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxl
emNhbm9AbGluYXJvLm9yZz4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXgu
ZGU+Cj4gQ2M6IEZhYnJpY2UgR2FzbmllciA8ZmFicmljZS5nYXNuaWVyQGZvc3Muc3QuY29tPgo+
IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gQ2M6IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IC0tLQoKQXBwbGllZCwgdGhhbmtzCgot
LSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNv
ZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29r
LmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5h
cm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
