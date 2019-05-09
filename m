Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FF7187D2
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 11:33:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32216C555BF
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 09:33:45 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 548A0C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 May 2019 09:33:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w12so2058197wrp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 May 2019 02:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=o7y1Eq5XE68bwd6aXqoeahdc2GOPTkNRx2HYwO3zXRM=;
 b=MGyl/NoSKew0c+r/VW5jKj8+RY1Be0lr7+iIyBpWo2JyYY2+4Zj0KIOT5UyS2IH7p6
 Xl8Db2PnGHM3+pD5QLCTzzpzGSmEtTFTZ6XOaQOj2ECmn0uQBKyeIxF4HZBVzRqUiJI2
 NEDAmdlp9PxYJcXxwi7whT1QkFYbEdWMx6tV43o4yLEvaQyl/FMlzPKNIZr4j26kLmou
 amPYy2ATk+pcA9Lju+4267nyRZtaBxE1pCly3geHfLV8Bl8qMtI3tyJAkYKyWCIXlAY2
 nu6Mdw5YSWjgkIa1xZ/wflstOgUkvca0cuPgMnpdZ+lPpSfs8EDVYQWEFaBKZ397A7hp
 Bz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=o7y1Eq5XE68bwd6aXqoeahdc2GOPTkNRx2HYwO3zXRM=;
 b=T0weLtJbevRwr7Bxo7WAD9/UNinUu5DUoM7+ShY4hWbR371EsFHL7IAGKFEdATBDZb
 w+Yci9ij1fkSxq8lkCop7NIERxTOWIfAn+KvwGmYCOAQABBxKLna2dyPrSiGI1TsA6Er
 RG8DoFxYENhhjQ4xrhN7rLSe+B1HalBXNDYM/jJFk1MmC62iTqPt2jvsTd+Z53TGAajI
 Oeh+P9hagKI+PY58Z1aoyrzpGr9DnjY+u6Nd/Vdfpj/8rBrg59Wg/XSNd5V5jQD6dWzg
 t+ok8bcqc3CSoNe2PfVW5gEU5Poh8ptglZKBPnRAoWCy6QZ73gDK70uThx1yYhbRUHk+
 0cYg==
X-Gm-Message-State: APjAAAUFG+kiq9/UittDZ3927hvUDb63FOxUIzUJ3TQVwmQJHi/tkEXt
 Y//KNJABtMvzRAvdZ/mGyWjBqA==
X-Google-Smtp-Source: APXvYqyaoHx3f0sqPQbDtBs8Z9JyejUps85iOp6Wh0y/gQuPQM64c/u7mmfNhXTMA9EEM9TWbH/fpA==
X-Received: by 2002:adf:ec51:: with SMTP id w17mr2358350wrn.326.1557394423897; 
 Thu, 09 May 2019 02:33:43 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id u8sm1141266wmc.14.2019.05.09.02.33.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 02:33:43 -0700 (PDT)
Date: Thu, 9 May 2019 10:33:38 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190509093338.GW31645@dell>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
 <1557392336-28239-3-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557392336-28239-3-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 2/9] mfd: Add ST Multi-Function
 eXpander (STMFX) core driver
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

T24gVGh1LCAwOSBNYXkgMjAxOSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBTVE1pY3JvZWxl
Y3Ryb25pY3MgTXVsdGktRnVuY3Rpb24gZVhwYW5kZXIgKFNUTUZYKSBpcyBhIHNsYXZlIGNvbnRy
b2xsZXIKPiB1c2luZyBJMkMgZm9yIGNvbW11bmljYXRpb24gd2l0aCB0aGUgbWFpbiBNQ1UuIE1h
aW4gZmVhdHVyZXMgYXJlOgo+IC0gMTYgZmFzdCBHUElPcyBpbmRpdmlkdWFsbHkgY29uZmlndXJh
YmxlIGluIGlucHV0L291dHB1dAo+IC0gOCBhbHRlcm5hdGUgR1BJT3MgaW5kaXZpZHVhbGx5IGNv
bmZpZ3VyYWJsZSBpbiBpbnB1dC9vdXRwdXQgd2hlbiBvdGhlcgo+IFNUTUZYIGZ1bmN0aW9ucyBh
cmUgbm90IHVzZWQKPiAtIE1haW4gTUNVIElERCBtZWFzdXJlbWVudAo+IC0gUmVzaXN0aXZlIHRv
dWNoc2NyZWVuIGNvbnRyb2xsZXIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkg
PGFtZWxpZS5kZWxhdW5heUBzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAg
ICAgfCAgMTMgKysKPiAgZHJpdmVycy9tZmQvTWFrZWZpbGUgICAgICB8ICAgMiArLQo+ICBkcml2
ZXJzL21mZC9zdG1meC5jICAgICAgIHwgNTQ1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9saW51eC9tZmQvc3RtZnguaCB8IDEyMyArKysr
KysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDY4MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21mZC9zdG1meC5jCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9zdG1meC5oCgpBcHBsaWVkLCB0aGFua3MuCgot
LSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExp
bmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
