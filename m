Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8C91B12F
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:31:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F8D7C5AB8E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:31:03 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 460A1C5AB8D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:31:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w12so13978897wrp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=kGPFbW+hAp4ZfBjUVrsplA4gJ28xyqGrAsYk0A4f3dY=;
 b=lz8fzQ6Gz+asmdxNLtzFcLWkBMrUdSBHelD85bth92l8kTB4hxwCgTqu5/B25eVF5v
 S+B9UiRacIiIjM3Idn833UGwVqpeRUS3e0B6vNsdQnia96Pfnom2j64c6+iPu5PbVFNj
 SyjW4RRVfI8090bOQV3veOlJTBmYKuFaQ8BFp1xhZmc81mgnOF9ywaXeDGQDd7Ifun5m
 U1jw3oz3YobaiK3auuebmGI+u6/RAbT7iSYsE0GKGDxnXZIkSpQaE2LD3qNBPno7ingJ
 1UWVvnlbiXytARZGAgQ5zf8hd7nqLFnizIleWswizIMTQXWTK4hK19EN2XuZIeQ9rr29
 I0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=kGPFbW+hAp4ZfBjUVrsplA4gJ28xyqGrAsYk0A4f3dY=;
 b=s1hUx4NkWyvMfOGcavo/kgfb50CmjmCyozHNHQ8XB8AjxwmR3xIkblWk9iSPNVUjU5
 pnzCTiD8rVNghQrfAw9rsGVUFONL5svtCKot9tVxoHLankuO194r1NPjulGW0Ui2+aPd
 VZBqGBtYFHRRhSZytTrObeeOJEVIO7DBCOCUXyzSuaY2pD31Iy/iYw90VV2pQNbme2Id
 CrN8hWBTR3/+erRM4xiXXkAS8QwM9x6bFENQlLxfQgG1d0YwrncfUZv4QD89u31JHmjk
 bQ5aoK0t0hiuPvi7fErYeyBZGpBBRNUZIHfYrQTFMU/8reM62zFktxBaUpXSv6PcdoLL
 r3OQ==
X-Gm-Message-State: APjAAAU/RUu435pWb6EjffAwKH0g647a2X9sUwLNc/D82GoVXQ7HN2bP
 2bmSOldchrE5rJ4iyXVCWclNWg==
X-Google-Smtp-Source: APXvYqzX49vkFGCT6QTfo03i3mfS7qcl2HtkeUZpVM7cWYP9Z4ZY6HQkd2M1j6oCG52utv6rjLNS+Q==
X-Received: by 2002:adf:b3d1:: with SMTP id x17mr16024449wrd.31.1557732661790; 
 Mon, 13 May 2019 00:31:01 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id h14sm993503wrt.11.2019.05.13.00.31.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 00:31:01 -0700 (PDT)
Date: Mon, 13 May 2019 08:30:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Message-ID: <20190513073059.GH4319@dell>
References: <20190511012301.2661-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190511012301.2661-1-natechancellor@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix macro definition spelling
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

T24gRnJpLCAxMCBNYXkgMjAxOSwgTmF0aGFuIENoYW5jZWxsb3Igd3JvdGU6Cgo+IENsYW5nIHdh
cm5zOgo+IAo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL21mZC9zdG1meC5jOjEzOgo+
IGluY2x1ZGUvbGludXgvbWZkL3N0bWZ4Lmg6Nzo5OiB3YXJuaW5nOiAnTUZEX1NUTUZYX0gnIGlz
IHVzZWQgYXMgYQo+IGhlYWRlciBndWFyZCBoZXJlLCBmb2xsb3dlZCBieSAjZGVmaW5lIG9mIGEg
ZGlmZmVyZW50IG1hY3JvCj4gWy1XaGVhZGVyLWd1YXJkXQo+IAo+IEZpeGVzOiAwNjI1MmFkZTkx
NTYgKCJtZmQ6IEFkZCBTVCBNdWx0aS1GdW5jdGlvbiBlWHBhbmRlciAoU1RNRlgpIGNvcmUgZHJp
dmVyIikKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lz
c3Vlcy80NzUKPiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxs
b3JAZ21haWwuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9zdG1meC5oIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQs
IHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2hu
aWNhbCBMZWFkCkxpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29D
cwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
