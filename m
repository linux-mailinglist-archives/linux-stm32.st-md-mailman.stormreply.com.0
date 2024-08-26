Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6795EC4A
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Aug 2024 10:46:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02532C7801B;
	Mon, 26 Aug 2024 08:46:38 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62970C7801A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 08:46:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5343e75c642so2599364e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2024 01:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724661989; x=1725266789;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRoGc8zZH4oC05abOb5eEX0kRMeyafNXbYdYJflymmE=;
 b=wbPPX4E7h/dsYECI58NZGt2fLw6r8ZQ7oTFbC1U/hjCscDzPqxE9bGEj1KV6QtMmCo
 sAottDBDcL1N/iqdNcY/lEC89N6AClwqSmGT71qJfuYTgf6mwFlJGUXC4h3Rfwio3Qim
 neeqfKEdQM4WLyMdB35kKL1DApqH1vUvUZY9r83USr3/2Te4f7GlK9rZpJ3vRLIY2HHe
 t04ZK2dGcDhBk/bKTO956fPcMLiS0wPZm1q5hxtQwvh6aaseaVWlxVpEuk05g7nkSHMa
 1ovoi/VuKuxoMNnCFEhVhRC/1nfR88DiMsQ0tGZEma6v/W3sAMI470C9nq6RQmQrNr4d
 T+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724661989; x=1725266789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRoGc8zZH4oC05abOb5eEX0kRMeyafNXbYdYJflymmE=;
 b=PyOsvbF3CwdW63cmE6PFctbCDlLip54SnzjT0YvDQ9PIt6SJIxl3P7oInfgkus5Ybx
 2h/zcAdMmVXazBnNEHFsQ/YhxBiUT4uAz4ZHKzU96WObEzpViktECxD7LDk27p+XRBD+
 vIIQRFHcO3mT1IATlHgWsOG/+x6I6bUZ61pPmTxICrJKtqv2HPacRFRbXKOQmOTeWJd/
 OxjmrVZfTr+rtL0+llwYPR58yCLOZTvAtrT4STZlQHKQ8mSbfBHpAFUhnm7PNw516u8w
 fSk6xoov2AWNo4JXloFRmKRW6hFeIAUcAnSED3DEUH5E94Z1AQVaHtBRqqhcuxwKObTa
 oKVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWre8ydCoLiugY5kan7aTdOzwTlsILec+BM+6ZslN5ynkFJDRjg9P2LEvHmeti6l2H+c5wj1jeQwubXbA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yyg/vCtnnmDF0CoF9UVwIlW7FEMQW0+HPZKeHZN5pOZD5wfxDP1
 akKm+hArburXOGc1P1g3Sq1+TT5nYqabO2rQ/UHrmOcGqs0fbHRU4Z6rCb7W6F8zHn53WzTRXWq
 Han1AUDxlhzZa7nemPs+rOMTZKpYo9Tgzb2dMxQ==
X-Google-Smtp-Source: AGHT+IEAKix9avOZKhj3gUarttYPt1B5mxGGiNfGvZNqelGRoDbFczqf/+RGYgGgaLwvWmb22Hq7c+MIRiChzBxFm/8=
X-Received: by 2002:a05:6512:280c:b0:530:ab68:25e6 with SMTP id
 2adb3069b0e04-53438861474mr7188396e87.48.1724661989086; Mon, 26 Aug 2024
 01:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-4-frank.li@vivo.com>
In-Reply-To: <20240823072122.2053401-4-frank.li@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:46:17 +0200
Message-ID: <CACRpkdb0rwN1YxF10MQDkVX1QoYTWot+heOJp4RodAtniCOdsA@mail.gmail.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: andrew@lunn.ch, marcin.s.wojtas@gmail.com, kees@kernel.org,
 edumazet@google.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, sd@queasysnail.net, linux@armlinux.org.uk,
 joabreu@synopsys.com, u.kleine-koenig@pengutronix.de, kuba@kernel.org,
 pabeni@redhat.com, clement.leger@bootlin.com, mcoquelin.stm32@gmail.com,
 ulli.kroll@googlemail.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, horms@kernel.org, justinstitt@google.com,
 olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next v2 3/9] net: ethernet: cortina: Convert
	to devm_clk_get_enabled()
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

T24gRnJpLCBBdWcgMjMsIDIwMjQgYXQgOTowNuKAr0FNIFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZp
dm8uY29tPiB3cm90ZToKCj4gQ29udmVydCBkZXZtX2Nsa19nZXQoKSwgY2xrX3ByZXBhcmVfZW5h
YmxlKCkgdG8gYSBzaW5nbGUKPiBjYWxsIHRvIGRldm1fY2xrX2dldF9lbmFibGVkKCksIGFzIHRo
aXMgaXMgZXhhY3RseQo+IHdoYXQgdGhpcyBmdW5jdGlvbiBkb2VzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4gUmV2aWV3ZWQtYnk6IE1heGltZSBD
aGV2YWxsaWVyIDxtYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbT4KClJldmlld2VkLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2Fs
bGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
