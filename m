Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE057B211
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Jul 2022 09:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2F53C640F5;
	Wed, 20 Jul 2022 07:48:41 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1E5DC640F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jul 2022 07:48:40 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id b26so24923388wrc.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Jul 2022 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=9ElSeSk614sHvQ21Olszx7/fOD72S3pdEjMKoWVvV70=;
 b=vhSEKJmVmMARaRWH0xaA2l+kCtoc5Zx/reprZlY45YpxW3DQg9C4qONfodIx8+o4FZ
 158sB+03Rej/8Yf3e7gYSweZ3QyCmBdBh0VytqYAKE+oZyQSUaBygJar2jiBAzoEkfDm
 Xy7z/6IV1uZa5/UMmF0q2rzbG46hJGLHu0glLNe/8bl6J3YbSzA9dXRv9XD4fKfjMchv
 ndvMvmrncYAgprfLQrycI45wKDPfJwlwoaICFQ+hwF1gknT6bSptzTNKEdB+SKsj12Tg
 LRCrO1tXEf1JQAWFoFemlZHgH/7yuZxocrMVCc5L3QF30Q1OI+1IHZ05vmaUDeusjeDV
 n+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9ElSeSk614sHvQ21Olszx7/fOD72S3pdEjMKoWVvV70=;
 b=zPX6vm4zUakXOL3j16I/G7G2o6o55PP4s8ORTMijdJ28xdoT6HCgeSTB7VBfCLeb4k
 MCymvAJFYG4vwlZyefWsENBiWE2UTxQn0LHAKcrCNMzMmGCs7eE/+2NmaCzii9N+tLJ/
 5NItNzZ8/fqVDMT9KJw/gNGzQ6Bd3TGiy3iXWGE9VJziOYuAFIJNqFCCjX0oy/jSA/68
 E74DF8X9ad4vjN0sdt+p6QlyCSyuD2I8FTEMD43c7wnAuHeYagylBxphuk4vqWsXO8NI
 sxbnXV1vG/eiPUTmETQ4u1XG+xdvqC+u3PAR2AyOobNMc5ATRt/KfJ7cTTIPpqsQ4GcU
 y+9Q==
X-Gm-Message-State: AJIora+726EMUPbhvOMhizmnhI/7Ka/pOCCr/BEDaik81b/v1GKMHXgU
 tTt190MaWxSAIJqEIkq4cF+0Ug==
X-Google-Smtp-Source: AGRyM1vuPStHxI48eylnYSZO/6tJTXBaSbjnGnKmJlNTa/CBji3je23kXPmhNPY4cFUIPz3Fu06IOQ==
X-Received: by 2002:a5d:4e49:0:b0:21d:6e8a:fa3 with SMTP id
 r9-20020a5d4e49000000b0021d6e8a0fa3mr28469922wrt.528.1658303320157; 
 Wed, 20 Jul 2022 00:48:40 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b003a32167b8d4sm1444891wmm.13.2022.07.20.00.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 00:48:39 -0700 (PDT)
Date: Wed, 20 Jul 2022 08:48:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <YtezVaZGhEZ1ZEKL@google.com>
References: <20220719215125.1877138-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220719215125.1877138-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: st,
 stm32-timers: Correct 'resets' property name
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

T24gVHVlLCAxOSBKdWwgMjAyMiwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IFRoZSBjb3JyZWN0IHBy
b3BlcnR5IG5hbWUgZm9yIHRoZSByZXNldCBiaW5kaW5nIGlzICdyZXNldHMnLCBub3QgJ3Jlc2V0
Jy4KPiBGaXggdGhlIG5hbWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC9zdCxzdG0zMi10aW1lcnMueWFtbCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dClByaW5jaXBhbCBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
