Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D3C6D98A1
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 15:54:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E50DC6A61D;
	Thu,  6 Apr 2023 13:54:14 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 173A3C6A61B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 13:54:14 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t4so34365155wra.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Apr 2023 06:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680789253; x=1683381253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ezT0NDsUMsm10HBHulD+tvoUb5KJlGUy+bX2OIndrqE=;
 b=uDn1XPw9QQnbG4CQ/ZnIv0s2GKDkcAOuVrNy4bSd/rPD71Z1tjzz2Yl4Ib//qRquqD
 ijBC8iwNnJWx0dlc0+sWzs3VwmKgE2tcP5THEEd2WuecNJ+ZxtRKg6iZ47HU+QQsIeTJ
 NxpnTAhbMSfnaB1BC4rMxBBMQak4EtC3iuzo1WEVBVSwgsM00tJbpNo6GUusIJRfs+XB
 KXyTUHQ4clWDylm8qqroPxqDPz9Gg/FUmdrYFCGd+CfrJy+9a44kn3PCMa3bVvf+pcR8
 rccg+q9IXhXCWV1jdJtirFTmD7r/POHza+D6RjOpeocWbQJ1ktALfp64bs+z9Z2O6eoO
 tpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680789253; x=1683381253;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ezT0NDsUMsm10HBHulD+tvoUb5KJlGUy+bX2OIndrqE=;
 b=a7Njj31Vi6eTbUIGqhkWm2V2rwV7t2fXdTrUHzThoEUiOHilcJlRXWv04B9/4Qjmi6
 QeCBYNbsE+yI9RCXEbY0EeSGdyAM7PtN9ViIt4XLZDBWL3JyPSZjZfvwWEWfGgpawR+r
 swbrFRDs65iNriCjOk4o7zWG62U++sR5F3E6Mcud79NmN4yZOaA8TxTHk2RPTPqoLHcX
 9+PXC3ypgmNSp1F2QFq7etbGYyKOE6OpvHWIXSsNJFI4/KHexkQccvU+q2cCbjz9+atV
 rlXMpcZeuSgWda8w6zp+ZrId18bYseIzfK00PVAVcQTR3xO/d+jA9/upUzfzCC6QAal6
 zEbQ==
X-Gm-Message-State: AAQBX9fOBiala/ilTiSCMSQjLlj6hVkTWeBxqyUgbdgsOiH9PrJjAlrX
 FbFQhPaCv89SEx3qUe5H8UF19A==
X-Google-Smtp-Source: AKy350bC0LRKYynmaTA4IXUV15q6OdxA7m8TujnIRxxxtl9PPIg0UCGI2eOFvvdpUHN2V+bZpayO6A==
X-Received: by 2002:a5d:4846:0:b0:2ce:a8d6:309a with SMTP id
 n6-20020a5d4846000000b002cea8d6309amr6795139wrs.61.1680789253438; 
 Thu, 06 Apr 2023 06:54:13 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6630:ee96:3710:24c8?
 ([2a05:6e02:1041:c10:6630:ee96:3710:24c8])
 by smtp.googlemail.com with ESMTPSA id
 k15-20020a056000004f00b002c71dd1109fsm1860813wrx.47.2023.04.06.06.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 06:54:12 -0700 (PDT)
Message-ID: <0a42d419-7ec2-6d09-9b19-15aa25888625@linaro.org>
Date: Thu, 6 Apr 2023 15:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
Cc: linux-tegra@vger.kernel.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 0/5] clocksource: Convert to platform
 remove callback returning void
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

T24gMTMvMDMvMjAyMyAwODo1NCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gdGhpcyBwYXRjaCBzZXJpZXMgYWRhcHRzIHRoZSBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRy
aXZlcnMvY2xrCj4gdG8gdXNlIHRoZSAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJlZCB0
byB0aGUgdHJhZGl0aW9uYWwgLnJlbW92ZSgpCj4gY2FsbGJhY2sgLnJlbW92ZV9uZXcoKSByZXR1
cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlCj4gdGhlIGRyaXZlciBj
b3JlIGRvZXNuJ3QgKGFuZCBjYW5ub3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3ZlLiBU
aGUKPiBvbmx5IGVmZmVjdCBvZiBhIG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkg
aXMgdGhhdCB0aGUgZHJpdmVyCj4gY29yZSBlbWl0cyBhIHdhcm5pbmcuIFRoZSBkZXZpY2UgaXMg
cmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybgo+IGZyb20gLnJlbW92ZSgpIHVzdWFs
bHkgeWllbGRzIGEgcmVzb3VyY2UgbGVhay4KPiAKPiBNb3N0IGNsb2Nrc291cmNlIGRyaXZlcnMg
YXJlIG5vdCBzdXBwb3NlZCB0byBiZSByZW1vdmVkLiBUd28gZHJpdmVycyBhcmUKPiBhZGFwdGVk
IGhlcmUgdG8gYWN0dWFsbHkgcHJldmVudCByZW1vdmFsLiBPbmUgZHJpdmVyIGlzIGZpeGVkIG5v
dCB0bwo+IHJldHVybiBhbiBlcnJvciBjb2RlIGluIC5yZW1vdmUoKSBhbmQgdGhlbiB0aGUgdHdv
IHJlbWFpbmluZyBkcml2ZXJzCj4gd2l0aCBhIHJlbW92ZSBjYWxsYmFjayBhcmUgdHJpdmlhbGx5
IGNvbnZlcnRlZCB0byAucmVtb3ZlX25ldygpLgo+IAoKQXBwbGllZCBhbmQgZml4ZWQgdXAgcGF0
Y2ggIzIKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3
LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNv
bS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1i
bG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
