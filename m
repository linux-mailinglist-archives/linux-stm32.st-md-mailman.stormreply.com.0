Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F8946578
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 23:49:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F170FC7129D;
	Fri,  2 Aug 2024 21:49:27 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12F96C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 21:49:27 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7104f939aa7so3038651b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 14:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722635366; x=1723240166;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M3xun6ZAo9oUFbxVpXf94TJW8gwMbVmF/wsipE1ixAQ=;
 b=atdbaLcLeolTW+8wof9M97qu0FqzWXW2y+Vmbl6hwbWuYp4o7NW+QaEhHurxr8rdsr
 IQ1+lEvjJyKKs9aLAHodF68jVbVyHrYvQ2UWocvg8RejmFnlltInuZ035lB6t9QqysMS
 XAwUduLi5L9OFmS/n8jPgkI4WXmDEtAT/JWEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722635366; x=1723240166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M3xun6ZAo9oUFbxVpXf94TJW8gwMbVmF/wsipE1ixAQ=;
 b=PhMXz/51nAytoAioTF2cJYmAJXfCzFVhxZNKMJuPTAGG81X+3X8a0F8zfWlZ9SzyUC
 8bZMvW5q3gPwYfwC6/yFYok3BAKja1KqZcx+VK1Dq/Y8cLEc6LMbt0q6+1OUOHUVzPDR
 ZVnndukAd6Zbq3CiMmyv/uTD26LKYcI869vd28YmK/ZQfmS7nLvWSauEGx/W1pOCre+G
 uu51M5B8AZhDwbAHON5QWlr50/D0Xk3GOqQ3xddvag2T+Jfvns/Uie+I/cm3V23MIdWw
 K/vKMxoQxuTyUALzdxbOXjvXdk3dYUSoqSgA/S2GtnzJ6bPjVE0ExGoDW6crUp7qI0Vo
 kyIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh0UoXJErn01KDtBS2vKg+n5LOeevX0mdSC0fEy+GU8yjAds4dRvueTKJQis9bxAhDOo3lauF0IrbreFQeI6b7ktpqLUDWkUxxmLKBR4UtyLxuNVMO5ZhU
X-Gm-Message-State: AOJu0YyrGjofCK94Ef/pzjlMPNkxC0HcYpeT6XhrhFq3z3jFYzK7Tk/j
 IYdPhSVKqZlHyIEnhu6xKBrGHUI3BHeVZYOUZ0TsLaHg/Wtes98wOFpOooRTcrZIG/roZjdLvwP
 q29xh7kNMRIvCypPxa3+gdIQPFoXV47kN+6AC
X-Google-Smtp-Source: AGHT+IHEdcupwcgV7ddSI8MH7LC3yQiJWlc6iHg4NY7jwa0Xdj7aQ/eTSphT4Nip4j1IqjjX/NtSYYnTEN8JBwS7BjQ=
X-Received: by 2002:a05:6a00:9187:b0:70e:9383:e166 with SMTP id
 d2e1a72fcca58-7106d047460mr5185025b3a.29.1722635365498; Fri, 02 Aug 2024
 14:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
 <ZqyXfonFv1GNlbvK@shell.armlinux.org.uk>
In-Reply-To: <ZqyXfonFv1GNlbvK@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 2 Aug 2024 14:49:14 -0700
Message-ID: <CAMdnO-+51MVQjdJAs5XXqcOzjK7=JZJ5KhELKcws8h3JgM7FOw@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hawk@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
 dwxgmac4 into stmmac hwif handling
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAxOjIz4oCvQU0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCjxs
aW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMDEsIDIwMjQgYXQg
MDg6MTg6MjFQTSAtMDcwMCwgaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tIHdyb3RlOgo+
ID4gK3N0YXRpYyB1MzIgc3RtbWFjX2dldF91c2VyX3ZlcnNpb24oc3RydWN0IHN0bW1hY19wcml2
ICpwcml2LCB1MzIgaWRfcmVnKQo+ID4gK3sKPiA+ICsgICAgIHUzMiByZWcgPSByZWFkbChwcml2
LT5pb2FkZHIgKyBpZF9yZWcpOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFyZWcpIHsKPiA+ICsgICAg
ICAgICAgICAgZGV2X2luZm8ocHJpdi0+ZGV2aWNlLCAiVXNlciBWZXJzaW9uIG5vdCBhdmFpbGFi
bGVcbiIpOwo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMHgwOwo+ID4gKyAgICAgfQo+ID4gKwo+
ID4gKyAgICAgcmV0dXJuIChyZWcgJiBHRU5NQVNLKDIzLCAxNikpID4+IDE2Owo+Cj4gICAgICAg
ICByZXR1cm4gRklFTERfR0VUKEdFTk1BU0soMjMsIDE2KSwgcmVnKTsKPgo+IEZvciBldmVuIG1v
cmUgYm9udXMgcG9pbnRzLCB1c2UgYSAjZGVmaW5lIGZvciB0aGUgZmllbGQgbWFzay4KVGhhbmtz
LCBJIHdpbGwgbWFrZSB0aGUgY2hhbmdlLgo+Cj4gVGhhbmtzLgo+Cj4gLS0KPiBSTUsncyBQYXRj
aCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIvcGF0Y2hlcy8K
PiBGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVjZW50IGNvbm5lY3Rpdml0
eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
