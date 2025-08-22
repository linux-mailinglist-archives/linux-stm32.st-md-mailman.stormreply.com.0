Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B3B30EB6
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 08:19:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B848C32E8D;
	Fri, 22 Aug 2025 06:19:40 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C7F1C349C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 06:19:38 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-afcb7347e09so290117866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Aug 2025 23:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755843578; x=1756448378;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=;
 b=jzC86mIVtGHvwhmOQYPYUAHi02Cyx7KQ/HBoQfqYE5+oL6p+01sy0yHFQja2LODlmm
 ujA6arGqaMjvCfbGmGsSHcpg1iyp1A+Dvu9eFZa0OV8mcISGgrJpsLnURlb01wnztbv2
 fQEvOyGmNZ9FOaoYFNHG49epB5g/qNrUvzQZwwipzcAvKs7LXJa+jF8xVYiBTa6X9p4k
 19rdXwF8Jyi5S9PSeh6VTAfkkJ8TqqVy9ZcxoO7Uq10qG5y1jbpcw/AcH5e1L3zA27Xf
 Yc4ULtz14e0bEFhketw6txRF/ztF2mGFPLwYjGOSGiczJTUPIX0vJXLI3+VFx3zPdzNy
 rkEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755843578; x=1756448378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v8a3z04Uh0u/uSmoBokGI0Tk49vBcGLpTfeWGAwsaHM=;
 b=lkDvgFSfz9eEPAJFFYe5mgYSnWwwaXsLjOA/2IciAjnOHBDv8+KpPZAP7Ajaip05Ih
 AdEeboEabnkt1m+VQ1leea9cGyquJMQ8wfZdYzUkPzwxz7KX+m2XTrcFDa/pGw14SqOW
 dFW30GluO8N2w0WK0QSnveDXYDD36ZWjSMDHxbHgqWtHEXvHo54JDMfqTxLJJGW3fbdT
 yYRUHF7lCp2K+adBZL+k/KHaYp+PSq6WEzIfrARsRFmyNeBZJBWmhnMLqXAjEPTEBCL7
 gdRBpA5ekWRYjO2iRKh2SnNoipOJO3js+gubvxrL66d8CDRZe+VpwC+rHk0EtAQshh1A
 d3hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+C7rlzkb3IXqhEA1x7GE0hq4Fga2V33CVYkHf9sGaPjMFFoNHqelQJLtp37z3LOoKCTh7EeEoWdBNMg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwPosi5udWX5uHUy3hdlbWbVYcCSdnwdvtTCh6iIBMANBFMk8vO
 40Prbotrf1u/rtf81NKEf17c0D0lHvzQKJ793zQxlSbzPTPhcqJ5FoK8OEgzhPC+qafghjbEOcT
 TI7tR64zh9xM0rMtWhXtRm1lPaG/jj0Y=
X-Gm-Gg: ASbGncsU2sR6QBcHEHgN7r01qdR/nOgWRiwUJ2TuX2nnxkaW/iidcXM40Yomd5ncsnk
 Th7CfG82CJ7gNjz2NeGWOXg+mGDi3sWBc6xkGu4dc3xMq6E0Rh2rXW9tBd5aA+sPGORTzxuLV2B
 YDqrp8zoGcURgqVewzeudOZrjLMe7abmS5IeDUmEtJWdfdIh4NfrUlua8q6FR9rT7YoJNZ/dpuO
 2a/ab18Mp07NOiaew==
X-Google-Smtp-Source: AGHT+IE+QSuwTRWNnEst85zd/nVk0XCWCT3dBHW+V785HwC5spF07O83YE3tf7aS5P/QoM3Upoe1DUKm+4/yzGTsmC4=
X-Received: by 2002:a17:907:1c17:b0:af9:1184:68b3 with SMTP id
 a640c23a62f3a-afe296358ebmr171036766b.55.1755843577528; Thu, 21 Aug 2025
 23:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Aug 2025 09:19:01 +0300
X-Gm-Features: Ac12FXwT5-FuVxm-aLv8k_QiDyCdQQYyidQq38gD1A8xq-6f9ed_haxl-pVwx0A
Message-ID: <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, Haibo Chen <haibo.chen@nxp.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/10] iio: Drop unnecessary -ENOMEM
	messages
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

T24gRnJpLCBBdWcgMjIsIDIwMjUgYXQgNjo1MOKAr0FNIERpeGl0IFBhcm1hciA8ZGl4aXRwYXJt
YXIxOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlcnMgZG8gbm90IHJlcXVpcmUgdGhl
aXIgb3duIGVycm9yIG1lc3NhZ2VzIGZvciBlcnJvcgo+IC1FTk9NRU0sIG1lbW9yeSBhbGxvY2F0
aW9uIGZhaWx1cmVzLiBTbyByZW1vdmUgdGhlIGRldl9lcnIKPiBtZXNzYWdlcyBmcm9tIHRoZSBw
cm9iZSgpLgo+IFdpdGggdGhlc2UgcGF0Y2hlcywgYWxsIHRoZSBpaW8gZHJpdmVycyBub3cgaGFz
IHVuaWZvcm0gaGFuZGxpbmcKPiBvZiB0aGUgLUVOT01FTSB3aGlsZSBkZXZpY2VfYWxsb2NhdGlv
biBhbmQgdHJpZ2dlcl9hbGxvY2F0aW9uCj4gY2FsbHMuCgpJIGRvbid0IHVuZGVyc3RhbmQuIERv
bid0IHlvdSBoYXZlIGEgc3Vic2NyaXB0aW9uIHRvIGxpbnV4LWlpb0AgTUw/Cmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWlpby9DQUhwNzVWZEw5a1YyZnlpNjN6cVBablc0Q2FlWVBtSjc0
dG1HRWdVPU03RlNZQnYwd3dAbWFpbC5nbWFpbC5jb20vVC8jdApJZiB5b3UgZm91bmQgc29tZXRo
aW5nIG5ldywgcGxlYXNlIGJhc2UgaXQgb24gdGhhdCBzZXJpZXMgYXMgaXQgd2FzCmFscmVhZHkg
c2VudCBhbmQgcmV2aWV3ZWQuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5r
bwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
