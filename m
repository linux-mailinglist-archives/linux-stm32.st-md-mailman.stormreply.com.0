Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A167E33391A
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 10:45:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5547FC57196;
	Wed, 10 Mar 2021 09:45:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B464C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 09:45:30 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id f12so22550605wrx.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 01:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0Erx94zt8ljBM/yS3nXtNjrWvctYWuUVNAQLWpYJJRo=;
 b=gmhG//67uUiQkJT3GRUTS9z+Tq+SpQbswnEQR3XBOpiU7cuv9y1ZxqWW5di7WTiU0z
 5IGBqN7qnmOOotjHLYfwHb3ymzghFWrRTY1lWccM1Jx+OctRRl2HrazL+Ie3zn+oOLg4
 +Cr93FaZA5kDLdCQdfSnM2ocPGfjV/4QFyjlmLL+A/yeCntkZRxL1Y6VHE3Ix0XGWvt0
 6g/f18dGAHNtTske/QJGnxe1q9MAz0KsF1R4s87be2nrW/bOkzR56VrkiKlK8Lct6oeX
 n8ruIEf/G85aTXWUgm6d5CINJa9ul6yAnrKIqzkWyNT+48PSH1UtSBhOAi5f8ntwPNJr
 7JyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0Erx94zt8ljBM/yS3nXtNjrWvctYWuUVNAQLWpYJJRo=;
 b=Dwm+WoOo5Xz+Z5uimD7+Jz1EcxKKM2naO+N+VmcTVAtl00rQLfnz0TBMi7w8l/shfa
 3Eie8skZhwHvssa6wTa7aMIezPNR3ONLuGk9VqKU1acQN3XtRgGl/ai5rM4AvnBUKkK4
 b6V1DB5X4DKMb9xPa9zZWYBhYplqkdnwm88xwb3P8Agp1NGEAMvh50hkcOtVsw76zCfn
 7VkHIr03rW5TjtsrX4xnkXhVlCShkGasXaAsSGeefSen1NWWSNLrTi5+woR/Pjn3sVZQ
 OrojPoELF3REYg6E6my4vO7gBx+1LDY5z4euFMREoOLD8oqhSdaOEHUgb1fXCu1cP8/W
 JGQQ==
X-Gm-Message-State: AOAM530l/DT32ExfdElmBMt/jImsyl5eqia9jAUi7HKLND4xCaah/HD+
 cNE6zGRg5tdN3Icj+VBRqEG1xQ==
X-Google-Smtp-Source: ABdhPJxcv9V5lAz+sEJ4HCtbzjFqfXkdmpxw/ngT7vdSlUljH3RkiAsQdLLVCP49qFAMYuC+GEIjxg==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr2649040wru.266.1615369530343; 
 Wed, 10 Mar 2021 01:45:30 -0800 (PST)
Received: from dell ([91.110.221.204])
 by smtp.gmail.com with ESMTPSA id c9sm11764201wrr.78.2021.03.10.01.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 01:45:29 -0800 (PST)
Date: Wed, 10 Mar 2021 09:45:27 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20210310094527.GA701493@dell>
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
Cc: devicetree@vger.kernel.org, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Dinh Nguyen <dinguyen@kernel.org>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, Olof Johansson <olof@lixom.net>,
 linux-fpga@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org
Subject: Re: [Linux-stm32] [RFC v2 3/5] arm64: socfpga: rename
 ARCH_STRATIX10 to ARCH_SOCFPGA64
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

T24gV2VkLCAxMCBNYXIgMjAyMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKCj4gUHJlcGFy
ZSBmb3IgbWVyZ2luZyBTdHJhdGl4IDEwLCBBZ2lsZXggYW5kIE41WCBpbnRvIG9uZSBhcm02NAo+
IGFyY2hpdGVjdHVyZSBieSBmaXJzdCByZW5hbWluZyB0aGUgQVJDSF9TVFJBVElYMTAgaW50byBB
UkNIX1NPQ0ZQR0E2NC4KPiAKPiBUaGUgZXhpc3RpbmcgQVJDSF9TT0NGUEdBIChpbiBBUk12Nykg
S2NvbmZpZyBzeW1ib2wgY2Fubm90IGJlIHVzZWQKPiBiZWNhdXNlIGFsdGVyYV9lZGFjIGRyaXZl
ciBidWlsZHMgZGlmZmVyZW50bHkgYmV0d2VlbiB0aGVtICh3aXRoCj4gaWZkZWZzKS4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNh
bm9uaWNhbC5jb20+Cj4gLS0tCj4gIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgICAgICAg
ICAgICAgICAgfCAgNyArKysrLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWx0ZXJhL01ha2Vm
aWxlICAgICAgICAgfCAgMiArLQo+ICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9jbGsvTWFrZWZpbGUgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvY2xrL3NvY2ZwZ2EvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgfCAgNCArKy0tCj4gIGRyaXZlcnMvZWRhYy9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+ICBkcml2ZXJzL2VkYWMvYWx0ZXJhX2VkYWMuYyAgICAgICAgICAgICAg
ICAgIHwgMTAgKysrKystLS0tLQo+ICBkcml2ZXJzL2Zpcm13YXJlL0tjb25maWcgICAgICAgICAg
ICAgICAgICAgIHwgIDIgKy0KPiAgZHJpdmVycy9mcGdhL0tjb25maWcgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCgo+ICBkcml2ZXJzL21mZC9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0KCklmIGl0J3Mgb2theSB3aXRoIGV2ZXJ5b25lIGVsc2UsIGl0J2xsIGJl
IG9rYXkgd2l0aCBtZToKCkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgoKPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvS2NvbmZpZyB8ICA0ICsr
LS0KPiAgZHJpdmVycy9yZXNldC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIDEyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoK
LS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9w
ZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBT
b0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
