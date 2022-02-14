Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6D04B5444
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Feb 2022 16:12:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14399C5F1F9;
	Mon, 14 Feb 2022 15:12:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 795F0C5F1D7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 15:12:36 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 y6-20020a7bc186000000b0037bdc5a531eso80665wmi.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Feb 2022 07:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ri75SenAJq39WjG18uKN/hPJVEWkQcUwIKXpcT+q7Fc=;
 b=OEZHe1qlP3GAq+JVJLpyE4GoOeC0Y+H8A4mxPqQa+WMd0F8KzzaquSALHtkRIwoMmX
 15ZAXsh0Xv2EisfG/vSzRuYwahD4JaqU3/iHwlnLucs2b2iNpUr6FuQ+uwUXdXIWoD7s
 ns7FBkc0m3ITWqHS7pe3Ml1kwhHPXOC310/D7aWHMfIO3QcsVOV9F6/8GIp5nN0bM9YZ
 OcqbS5PVa8PUYfqVM+gFHCAvem3dCxUElgbkf940da/KFzEZ1WPqTfP2kZ/pn10IoZoM
 kgWHrVOEd9Q5UEvCM2mILZO4lV6F7ttOsWN7s+dj/uKGTbebX7Fa2jGGsUi+3DOPDAb+
 bVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ri75SenAJq39WjG18uKN/hPJVEWkQcUwIKXpcT+q7Fc=;
 b=6ZPf1DlsM/wwnKC7Ki1DktCDXydjawCqR5k7Tu7s56rPfBtB/DzQF4+SLB/0IJAdOb
 y7npn3ZMxYf6Rzd/CUAov+/qIxxwdA81jOuazyXbmEOQFqvqCSa7MHVcpPThf5qUpmPh
 Pdi9uMkJcFeUzbIimGcO9epLV2i9QU1U0x61jR/t96TKvS4/JQbDFCo0N9+QTK9BupBa
 mwpKBo57eXq4RvZnpPakN/2mwAqmo+ncUZXbQnPezU6ejMsRjg6gh953Xt2m9i9yXS/o
 TnpRPKsW8JcAHk+khLHjm+Nu8DGFOH62iOoZRQ5kP80vK8Y2tJOcnXvCUXWAFXluYEsJ
 /pDA==
X-Gm-Message-State: AOAM5338hWJblRYQwbb8akiJgWs0DauxOHr/uTLi7mU+fV2/3tF3dTxR
 SrBK+lbpqODTTF1df4JsZbXGVg==
X-Google-Smtp-Source: ABdhPJym8F+sdd5169UuY6UoCZSGZxjw1fgYsIOHh2MjisghANK0U+Holxca8I7ozPRvIo9QIY16TQ==
X-Received: by 2002:a05:600c:1547:: with SMTP id
 f7mr5192575wmg.96.1644851555975; 
 Mon, 14 Feb 2022 07:12:35 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88])
 by smtp.gmail.com with ESMTPSA id f9sm10041370wry.27.2022.02.14.07.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 07:12:35 -0800 (PST)
Date: Mon, 14 Feb 2022 15:12:33 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YgpxYfYH8BzBdq/y@google.com>
References: <20220214150710.312269-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214150710.312269-1-u.kleine-koenig@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] mfd: stmfx: Improve error message
 triggered by regulator fault in .remove()
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

T24gTW9uLCAxNCBGZWIgMjAyMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFJldHVybmlu
ZyBhIG5vbi16ZXJvIHZhbHVlIGluIGFuIGkyYyByZW1vdmUgY2FsbGJhY2sgcmVzdWx0cyBpbiB0
aGUgaTJjCj4gY29yZSBlbWl0dGluZyBhIHZlcnkgZ2VuZXJpYyBlcnJvciBtZXNzYWdlICgicmVt
b3ZlIGZhaWxlZCAoLUVTT01FVEhJTkcpLAo+IHdpbGwgYmUgaWdub3JlZCIpIGFuZCBhcyB0aGUg
bWVzc2FnZSBpbmRpY2F0ZXMgbm90IGZ1cnRoZXIgZXJyb3IgaGFuZGxpbmcKPiBpcyBkb25lLgo+
IAo+IEluc3RlYWQgZW1pdCBhIG1vcmUgc3BlY2lmaWMgZXJyb3IgbWVzc2FnZSBhbmQgdGhlbiBy
ZXR1cm4gemVybyBpbgo+IC5yZW1vdmUoKS4KPiAKPiBUaGUgbG9uZy10ZXJtIGdvYWwgaXMgdG8g
bWFrZSB0aGUgaTJjIHJlbW92ZSBwcm90b3R5cGUgcmV0dXJuIHZvaWQsIG1ha2luZwo+IGFsbCBp
bXBsZW1lbnRhdGlvbnMgcmV0dXJuIDAgaXMgcHJlcGFyYXRvcnkgd29yayBmb3IgdGhpcyBjaGFu
Z2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5p
Z0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIChpbXBsaWNpdCkgdjE6Cj4g
Cj4gIC0gcHV0IGRlY2xhcmF0aW9uIG9mIHJldCBhbmQgYXNzaWdubWVudCBpbiB0d28gbGluZXMu
Cj4gICAgKHJlcXVlc3RlZCBieSBMZWUgSm9uZXMpCj4gCj4gIGRyaXZlcnMvbWZkL3N0bWZ4LmMg
fCAxNyArKysrKysrKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQ
vOaWr10KUHJpbmNpcGFsIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFy
by5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJv
OiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
