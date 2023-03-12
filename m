Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A26B66F3
	for <lists+linux-stm32@lfdr.de>; Sun, 12 Mar 2023 14:47:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE943C6A610;
	Sun, 12 Mar 2023 13:47:40 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21506C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 13:47:40 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id k10so38598278edk.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 12 Mar 2023 06:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678628859;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Icoi3sgs1OSGfCrQlXn3HpafJfSEzKy93f0un4YDkDo=;
 b=ZRZ0ubtCMWBWGSmyqsep9DaxJZtq+u77ts7HoKkf0lWXNcNomQ98FOSBWDYqkjLkpo
 p3ihl4eqqWEQFzetDjYzDQYQ9Hysls+LjA0bWj2Gt1jgugzpWHjr0qNJj+eL2kqYovV2
 hauEoU8FLnEQETz3+MaK97kP/9DnvjPIvBIDeXXLAugJBIuwBUwx5DEvXdxg+X3ReOQN
 0Gw2ZIA2uXCMz6mZsjxoGKMQebaVxfXvz5kNapeOXQMiWOvVtoD8+w97Fu3n7ZrwzXa/
 YQ6KSgjPdpFIIR1K29x/FlYAJpyusiZZWUrCtDGw7AE+GMAOoaaE0s79n2tc9dvzctRh
 dGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678628859;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Icoi3sgs1OSGfCrQlXn3HpafJfSEzKy93f0un4YDkDo=;
 b=uC0KjXtODCTVR86xL9MCT58/pncGUmLtNTynvpemNg0p2mEoeFCqeEBShwuNhKVfXa
 PA+kXStsyXZqhurka9GYQuEoof0iryI6IYjrer7GLsMvo2rUjUG7mJskD7ZbeHv2fJHx
 +7DsORQFHWI5Oi4f38HdEZoZUjTnsCSvq0W5EjcRMAN36WFttBZ8GLmsuNKuBdSHZdhF
 j5YnsFTgyu7hqrNrkYM8Kj7fZoQ/fpR5XjKc+AU+7SugyP8QT+uZz1vA/lhrXOioQDiy
 yM8y2IkQ761cv88aipKrOvW+CTAqggGwmLP/VSbkE7u7IUtM1Kx2Eu2RI7MPo3MO59Bt
 Njww==
X-Gm-Message-State: AO0yUKW1UMC8DfEJK1EO7QGHF8h4uaCtU6eyGJC0OGMw98v+c3+3/HCs
 YGLJw/s+jh+zMng9zkTIlh71ZQ==
X-Google-Smtp-Source: AK7set+1xK1uONKIghi8hrKPFFaXbpKQv6Wy4cZt5hKYhevvoavbYOarVt4AwomFSc4gi4m81mlgwQ==
X-Received: by 2002:a17:907:980b:b0:88c:4f0d:85af with SMTP id
 ji11-20020a170907980b00b0088c4f0d85afmr39929837ejc.75.1678628859714; 
 Sun, 12 Mar 2023 06:47:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a?
 ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm2261019ejh.179.2023.03.12.06.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Mar 2023 06:47:39 -0700 (PDT)
Message-ID: <3fefcfd9-5783-3f83-da30-c14196958c0b@linaro.org>
Date: Sun, 12 Mar 2023 14:47:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20230311173735.263293-1-krzysztof.kozlowski@linaro.org>
 <20230312134647.kmjcbilb3puumcu6@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312134647.kmjcbilb3puumcu6@pengutronix.de>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: rcar: drop of_match_ptr for ID
	table
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

T24gMTIvMDMvMjAyMyAxNDo0NiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gU2F0LCBN
YXIgMTEsIDIwMjMgYXQgMDY6Mzc6MzRQTSArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPj4gVGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERUIHRhYmxlIHNvIHRoZSB0
YWJsZSBzaG91bGQgYmUgYWx3YXlzCj4+IHVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBu
b3QgaGF2ZSBhbnkgc2Vuc2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQo+PiBtYXRjaGluZyB2aWEg
UFJQMDAwMSwgZXZlbiB0aG91Z2ggaXQgbWlnaHQgbm90IGJlIHJlbGV2YW50IGhlcmUpLgo+Pgo+
PiAgIGRyaXZlcnMvcHdtL3B3bS1yY2FyLmM6MjUyOjM0OiBlcnJvcjog4oCYcmNhcl9wd21fb2Zf
dGFibGXigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWNvbnN0LXZhcmlh
YmxlPV0KPiAKPiBUaGUgY29tbWl0IGxvZyB0ZXh0IHNvdW5kcyBsaWtlIGEgaGFybWxlc3Mgb3B0
aW1pc2F0aW9uLCBidXQgdGhlIGVycm9yCj4gbWVzc2FnZSBoZXJlIGVpdGhlciBtZWFucyB5b3Un
cmUgZml4aW5nIGEgY29tcGlsZSBmYWlsdXJlLCBvciAoYW5kPykgdGhlCj4gcGF0Y2ggd2FzIHNl
bnQgb3V0IGJlZm9yZSB0aGUgY29tbWl0IGxvZyB3YXMgZmluYWxpemVkLgo+IAo+IExvb2tpbmcg
YXQgaXQgdGhpcyBpcyB0aGUgZXJyb3IgbWVzc2FnZSB0aGF0IHRyaWdnZXJzIGlmIHlvdSBjb21w
aWxlCj4gdGhpcyBkcml2ZXIgd2l0aCBPRiB1bnNldC4gSSdkIGxpa2UgdG8gaGF2ZSB0aGF0IG1l
bnRpb25lZCwgdGhlbiB0aGUKPiBwYXRjaCBsb29rcyBmaW5lLiBEaXR0byBmb3IgdGhlIDJuZCBw
YXRjaCBpbiB0aGlzIHNlcmllcy4KClN1cmUsIGFjayEKCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9m
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
