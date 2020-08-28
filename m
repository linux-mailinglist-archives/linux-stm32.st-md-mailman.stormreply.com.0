Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3884A255861
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 12:09:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA50BC32EA6;
	Fri, 28 Aug 2020 10:09:43 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67B08C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 10:09:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id k20so381199wmi.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 03:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=m1YLyJUJCn3oBul9/khpe2532Xp6POTXvt7taeRkGPU=;
 b=YDvbZll7Ma7sTT+UPVORezULJlnx2tLfQ5IeE3Ehw57Kq2kkU/64SeqXuWw20swHB3
 DRSP1n7jHPr8urmDdaKZSWN+tS6LcvCpPSGokVwqyHBZ5IvOprC+08jw+ruC99ayLMuG
 8atji1mzhlt/j6cS1lgrOfyGuwEcNpksJ0etGBqElxC6aXiAhR+hQzrS0PzcfF7Qd6Ux
 oXeBNlOxbPHK4b0Zo0A84nlF+KGFkhzVo040o6iK1myBSFcKSWVru5dkp0z4tzSwLfK7
 LP9lNSlKR5ZaMMfDdYgCsNu4oLwPZAVk2SssF2ZcRVPK5CD3bjwFQU1KXK3W6xzh8aEN
 yqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=m1YLyJUJCn3oBul9/khpe2532Xp6POTXvt7taeRkGPU=;
 b=JrkwZD4Z+gEotn+3Oz2FMFrrxKZclatn5RQTIlWkA4MBZZuqB4vFq8FZ7rlkGJeauP
 AY70ircXuLP9TI1IsRHjQO8FRjxrlLPlpdA4D21sj6zqW0ywB/LyYsn5gisR8+I0877b
 QoVv6K5TqQtGvysQg3AzXaKV4kQlnsDf3bcKjt4xsR/pzHIsygDECerLWhFih/YIENmy
 kxxm1gtba06PSsiQcSOgcSJIW0bAuSmazKhi4OGgbkB8t0EXzBQ1InNIvDNCS/fvUVm1
 EVp0RQsLn4O2CsW4Qwkx3BAzIGetc+GM6rT8U13uKcCs9B6y0zaE3JGHBUyxccDjWYw2
 +o7g==
X-Gm-Message-State: AOAM531hJCep2N9f39JctqFv+F3U+5Heyw+TzSdz2vVoszdsVAMZfHpo
 +rxWQC79SkeENXMJt83nnG9Z/Q==
X-Google-Smtp-Source: ABdhPJxgckZPiiORSGh1t7YPnXLaoCx7sqGLxWs0rDpMahar5tKh4ddv01PRLYLdrPq+EKDyrsXwZg==
X-Received: by 2002:a1c:541b:: with SMTP id i27mr837248wmb.179.1598609380973; 
 Fri, 28 Aug 2020 03:09:40 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id c206sm1419164wmf.47.2020.08.28.03.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:09:40 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:09:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20200828100938.GH1826686@dell>
References: <20200826144935.10067-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826144935.10067-1-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] mfd: madera: Simplify with
	dev_err_probe()
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

T24gV2VkLCAyNiBBdWcgMjAyMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gQ29tbW9u
IHBhdHRlcm4gb2YgaGFuZGxpbmcgZGVmZXJyZWQgcHJvYmUgY2FuIGJlIHNpbXBsaWZpZWQgd2l0
aAo+IGRldl9lcnJfcHJvYmUoKS4gIExlc3MgY29kZSBhbmQgYWxzbyBpdCBwcmludHMgdGhlIGVy
cm9yIHZhbHVlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtA
a2VybmVsLm9yZz4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbWFkZXJhLWNvcmUuYyB8IDExICsrKy0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
CgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNo
bmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVy
IHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
