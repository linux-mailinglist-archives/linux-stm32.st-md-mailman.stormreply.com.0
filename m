Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D5F171FC
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2019 09:01:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70353C36B3F
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2019 07:01:12 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84E0BC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2019 07:01:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l2so25667883wrb.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 08 May 2019 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=Jgc8tHCqCzHZc3qhbbI5pSp+Yx7TXVxlmwULDXcgErQ=;
 b=f5zEBuYHZeBkLFMRO2NhfXM25Cd+QEnnZaCuimuK3skx86XUNpgCO6magbg/pJIHpd
 2VCLFYSx34ENbvYzlrSGMa75iXhXuibmKPzDxRvQ6ll9yU89uNsKCB67hO9D8EJH1amu
 GKE/K5rDGCI62PTK9sxpN2EcyiFtx2pdqOP2ilQQ94Vw8wiSQGN4AgjNJkX3TJ/vAuxp
 900wcsdES0l7a9TmlDEQPYHb0Lh0hvvhiJnWo2iFUv1gFEGKMNTXK+ABnAkMBsK5Ctrv
 Mwc//YmUX/NDi5VC9SKBpG3x2xI5B2R3STAcX7xZdeLCpR7hiLf8pai8uDM37vQ6eSd1
 4srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=Jgc8tHCqCzHZc3qhbbI5pSp+Yx7TXVxlmwULDXcgErQ=;
 b=O6NkEeePKgmERBD1niBaONpCug8vgDmrGAYI+VY5q07pY+hX5DwMDKT9VCz54MUAdu
 82DTkxItGrhrYKmmqwmx/KW8g4yplTC1PWWiv82UB4Qf/58rlwsyF4H7OVR/8QczHTje
 PVQyYnXfG3xMKJ6EODkYI1nlyjX6fZXOtfwTdUd5ce7khD+y3kXi4X9IBjy0FhNo0Euc
 R5ZPuJ3+isMYBj/8eyg8qyETH+k4rvcewagFDouQAkHUQyTwmh4EqO0YU0JH1ZIeerl9
 x/LtH77G3IPbE7wrlSxVEmZ06eDVXXqV1NHnaJgHUBkrdZrO8egJPOAVcLelJVKyT+bm
 jEHA==
X-Gm-Message-State: APjAAAXT6l5yTTU5G2R+hsIgBl4x4iBj5Yl2+eQzt1tX2otQJbqLMtqC
 Hqk1aKBi7Nu/7e6RE7uhwfRgaw==
X-Google-Smtp-Source: APXvYqzH6iM6RnE4EChPWDuvGbuVhd/S7odkzz/aRHxlQLliQCVC3T+tM0j+VmKEfslHzUm1PP9DtQ==
X-Received: by 2002:adf:d081:: with SMTP id y1mr20069624wrh.283.1557298870131; 
 Wed, 08 May 2019 00:01:10 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id r10sm1802946wml.10.2019.05.08.00.01.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 00:01:09 -0700 (PDT)
Date: Wed, 8 May 2019 08:01:07 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Philippe Schenker <dev@pschenker.ch>
Message-ID: <20190508070107.GG7627@dell>
References: <20190507143615.28477-1-dev@pschenker.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507143615.28477-1-dev@pschenker.ch>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Philippe Schenker <philippe.schenker@toradex.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 David Laight <David.Laight@ACULAB.COM>, linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/5] iio: stmpe-adc: Add compatible name
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

T24gVHVlLCAwNyBNYXkgMjAxOSwgUGhpbGlwcGUgU2NoZW5rZXIgd3JvdGU6Cgo+IEZyb206IFBo
aWxpcHBlIFNjaGVua2VyIDxwaGlsaXBwZS5zY2hlbmtlckB0b3JhZGV4LmNvbT4KPiAKPiBBZGQg
dGhlIGNvbXBhdGlibGUgbmFtZSB0byB0aGUgZHJpdmVyIHNvIGl0IGdldHMgbG9hZGVkIHdoZW4g
dGhlIHByb3Blcgo+IG5vZGUgaW4gRFQgaXMgZGV0ZWN0ZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
UGhpbGlwcGUgU2NoZW5rZXIgPHBoaWxpcHBlLnNjaGVua2VyQHRvcmFkZXguY29tPgo+IC0tLQo+
IAo+ICBkcml2ZXJzL2lpby9hZGMvc3RtcGUtYWRjLmMgfCA3ICsrKysrKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKV2h5IGhhdmUgeW91IHNlbnQg
dGhpcyBzZXQgdG8gbWU/CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNl
cyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3Ig
QVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
