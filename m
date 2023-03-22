Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C99E46C5359
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 19:12:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FE2AC6A5F6;
	Wed, 22 Mar 2023 18:12:12 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8BD3C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 18:12:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id eh3so76478936edb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679508730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=puINCtdjibA0BYbSrHoIfwhwVYXsutPsDY4I7ib4bzM=;
 b=J7Ks+YQakaDhUbwe8fWKUNhebNRsFdwb/Lt2TOCFMNg+p9GiUx1mGrdm+ePPnPiToA
 joVvFXZ9IRD5fpifPU4c6U+tOqPfs4b5/hFXOUQXGaHUMdrpDnzHgUfsLtoggBWT7Xzw
 kmaFq+69ED1xC9xB5ZfCJha8yF5WS0xB1wIu9u74lHB0WBIRKArwWjkMY627UXPANUU1
 uP8HarJiZUN1dCQqJoR+JCZ26kewvnKyt+h1HlQKFxeH5+SHm71Gdcsao96kZGCJ+d3Y
 nI00zCQ86niFQuFoR/A54EHftmRZ4p7/FmMiiEStiSS+lFIH+6h35+46PBejBJJrwfGJ
 g3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679508730;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=puINCtdjibA0BYbSrHoIfwhwVYXsutPsDY4I7ib4bzM=;
 b=gUe8eM+PSeXbltDr9BQ8lTK9MPjk++aotqZzIad28IIVaPgbswGQhezwvG+Prcsdxd
 ZjlH/7KKIi/dOHTElnE25jiLAHUwoJ+kOL+JrCGJjg/Ws3V1F40LS4kIMVKbBaoN0GEe
 x81FqGMPYNTfFJdSad1j2B9y7GnJZcsWhk/EfT50YUxqMZ08i0o1ZCYi5RQWPj8IVHmJ
 irienk5HLlhXCPrKG2wHFoeCkQhjx+n82q1o+4OgTMavt+AzGUyeUYbr0ZKivwicTVR+
 PG0p6AX/OjkVVQrg0J98LeGuWycKgPoKb/9VVlWZuSxDK3G8raqdoZGxEohq6S+HARbB
 6z2Q==
X-Gm-Message-State: AO0yUKW9FTv+Iopf870N8i6tJk1B+Jkn1Tn5b0/WdDLGfj1sxwp7vfot
 u0YkIoCyTvAhMH2ef1SiSozUsQ==
X-Google-Smtp-Source: AK7set+vT8b6vldZsA+TIPblzpsRJ83hqYXESjC2wwa3hOGcErQIr0FtnbAyQvVwSpd8ejjf0q1adQ==
X-Received: by 2002:a17:906:720f:b0:8b1:2bde:5c70 with SMTP id
 m15-20020a170906720f00b008b12bde5c70mr7719669ejk.2.1679508730430; 
 Wed, 22 Mar 2023 11:12:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6?
 ([2a02:810d:15c0:828:5050:151b:e755:1c6])
 by smtp.gmail.com with ESMTPSA id
 a27-20020a509b5b000000b00501dd53dbfbsm2681070edj.75.2023.03.22.11.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 11:12:09 -0700 (PDT)
Message-ID: <74309bed-e46c-69fc-e0c7-6d06c30fbc4f@linaro.org>
Date: Wed, 22 Mar 2023 19:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230312135120.357713-1-krzysztof.kozlowski@linaro.org>
 <20230312154210.ovm54x2qtcv7fp7r@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312154210.ovm54x2qtcv7fp7r@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] pwm: rcar: drop of_match_ptr for
	ID table
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

T24gMTIvMDMvMjAyMyAxNjo0MiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgMDI6NTE6MTlQTSArMDEwMCwgS3J6eXN6dG9mIEtv
emxvd3NraSB3cm90ZToKPj4gVGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRh
YmxlIHNvIHRoZSB0YWJsZSBzaG91bGQgYmUgYWx3YXlzCj4+IHVzZWQgYW5kIHRoZSBvZl9tYXRj
aF9wdHIgZG9lcyBub3QgaGF2ZSBhbnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQo+PiBt
YXRjaGluZyB2aWEgUFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50
IGhlcmUpLiAgVGhpcwo+PiBhbHNvIGZpeGVzICFDT05GSUdfT0YgZXJyb3I6Cj4+Cj4+ICAgZHJp
dmVycy9wd20vcHdtLXJjYXIuYzoyNTI6MzQ6IGVycm9yOiDigJhyY2FyX3B3bV9vZl90YWJsZeKA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtY29uc3QtdmFyaWFibGU9XQo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93
c2tpQGxpbmFyby5vcmc+Cj4gCj4gSG1tLCBJIHdvbmRlciB3aGF0IGVsc2UgaXMgcmVxdWlyZWQg
aGVyZSB0byB0cmlnZ2VyIHRoYXQgd2FybmluZy4gT24KPiBhbWQ2NCBJIGFsc28gZGlzYWJsZWQg
Q09ORklHX01PRFVMRVMgYXMgb3RoZXJ3aXNlIHJjYXJfcHdtX29mX3RhYmxlIGlzCj4gdXNlZCBi
eQo+IAo+IAlNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCByY2FyX3B3bV9vZl90YWJsZSk7CgoxLiB4
ODZfNjQgYWxseWVzY29uZmlnLCByZW1vdmUgQ09ORklHX09GCjIuIEJ1aWxkIHdpdGggVz0xICh0
aGlzIHdhcyBHQ0MpCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
