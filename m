Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2EA99EFD2
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Oct 2024 16:40:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BB1BC78030;
	Tue, 15 Oct 2024 14:40:45 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC7BEC6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 14:40:37 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2fb49510250so19749131fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729003237; x=1729608037;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9RHFt59eWSwg6rR5umFEHG7c8+TVXjMCAAUxqgpUrHk=;
 b=RXMWuAar8S9ka+pc4s3L81LF9uBxYnGBPa0rt9+DWwVqTYHYQtodq5YvoEnzII5MAf
 o9xWJo87N/A2gvo5pduo7VYQLQK4GKqVAgZNuwC1uDTKunxAejEFXT7mmnamLkCv3iUp
 s22NUXZSGiL4VC7D3SRrR8eu+faa6/aWWkK+ba7enX1Re8v/3twQssfGuJg2fdE9bKBI
 RhyBhud89hrVwYha9PDXsD7ebT9Ky//5l8q8uk2oFTNKxxxGGz/bUOXEZAOlmGWo/oba
 WRFTa6yjEYEQiM6vKB+rFMSjSYmqf3SLOXHIMRTUYifx7k2M73WllgzoZqFtQSc97O6l
 cq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729003237; x=1729608037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9RHFt59eWSwg6rR5umFEHG7c8+TVXjMCAAUxqgpUrHk=;
 b=NlvFVbtrk2bVmCNJxVJlGDHchuc0Ew42BR5od46nE7IWfPI43G5kPzvFtCyaUHtN+D
 4gGzgCMzPxlZ4W3/cLfXCrnMnvblLLKtG/59zhkAevuPlkuOUfQp7jUr/EBWau24g7Mr
 nIUdkkkGHxRHJICFo0pvwtPbexWUOzU8onHA7pO1iGEuWakTVhbi81BoCgEv3AMGwxTW
 Diq8BsKxV8vHaSPv6FH4RN/pesd8qgsRosGC7XwkUfggCgCBSIU55kFWnOio1qpL3RlS
 Vw2M/kCTmZnkmvK7io5ySGawfrtnkAr7xszD1z8awiSsBojkx5fIg05u/4AF3pO3dica
 n/IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFCSeDE0OvJzKe3KznzV3q8kRPIMEMzOtd1/QRV1Ar0M0/RxcoyGKfphVCmrlFJSN7ZsngBpZUVLuqhQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+Q+7xh9MCwDkvUICdBBkP8pc3OmqH+gSgO6+P6MxGVJZU0+qL
 aeftrQuKOUIvWKRaJNgTRmmfsVueDGkVU6LyjEtgGOlpCKKgxJkxEwZboVZ53d5XSKd6tTDPkdE
 KzUXSh1Yeww2riNc+l1nv8daClD97UVaHNw5zUw==
X-Google-Smtp-Source: AGHT+IFBD/NpUBNASpm9Pm02Y0xd1N3oLFXF15F3qVTflCwTdMvk9untezG2ykmjZkunqlCq32Td6LIqj3nEL+bSZ54=
X-Received: by 2002:a2e:4e1a:0:b0:2fa:e896:3191 with SMTP id
 38308e7fff4ca-2fb329b428bmr58373511fa.23.1729003236800; Tue, 15 Oct 2024
 07:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <a1a1d062-f3a2-4d05-9836-3b098de9db6d@foss.st.com>
 <Zw5D2aTkkUVOK89g@J2N7QTR9R3>
 <CACRpkdY79nbBoaHe6ijuyJS9dDduNw_sv1J90pz121YDgCvC3Q@mail.gmail.com>
 <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
In-Reply-To: <Zw51fhCkmCYrTOeV@J2N7QTR9R3.cambridge.arm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Oct 2024 16:40:24 +0200
Message-ID: <CACRpkda-Hey3PJe1SuCLZs35QNT22dnMc1HWd1UnZ-iec5xXGw@mail.gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Kees Cook <kees@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Mark Brown <broonie@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] Crash on armv7-a using KASAN
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

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgNDowMOKAr1BNIE1hcmsgUnV0bGFuZCA8bWFyay5ydXRs
YW5kQGFybS5jb20+IHdyb3RlOgoKPiA+IEkgYW0gdHJ5aW5nIHRvIHJlcHJvZHVjZSBpdCBhbmQg
ZmFpbGluZyA6Lwo+ID4gKFVzaW5nIFRvcnZhbGQncyBIRUFEKQooLi4uKQo+IEkgdXNlZCBhIGNv
bmZpZyBwZXIgQ2xlbWVudCdzIGluc3RydWN0aW9ucywgaS5lLgo+Cj4gfCBbbWFya0BsYWtyaWRz
On4vc3JjL2xpbnV4XSUgZ2l0IGNoZWNrb3V0IHY2LjEyLXJjMwo+IHwgSEVBRCBpcyBub3cgYXQg
OGU5MjljYjU0NmVlNCBMaW51eCA2LjEyLXJjMwo+IHwgW21hcmtAbGFrcmlkczp+L3NyYy9saW51
eF0lIGdpdCBjbGVhbiAtcWZkeAo+IHwgW21hcmtAbGFrcmlkczp+L3NyYy9saW51eF0lIGVjaG8g
J0NPTkZJR19LQVNBTj15JyA+IGFyY2gvYXJtL2NvbmZpZ3MvZnJhZ21lbnQta2FzYW4uY29uZmln
Cj4gfCBbbWFya0BsYWtyaWRzOn4vc3JjL2xpbnV4XSUgdXNla29yZyAxNC4yLjAgbWFrZSBBUkNI
PWFybSBDUk9TU19DT01QSUxFPWFybS1saW51eC1nbnVlYWJpLSB2ZXhwcmVzc19kZWZjb25maWcg
ZnJhZ21lbnQta2FzYW4uY29uZmlnCgpPSyBJIGdvdCB0aGUgY3Jhc2gsIG5vdyBhbHNvIHdpdGgg
bXkgYnVpbGQgc2NyaXB0cy4KCkR1bm5vIHdoYXQgSSBkaWQgd3JvbmcuLi4KCllvdXJzLApMaW51
cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
