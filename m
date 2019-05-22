Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1F25DC4
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 07:48:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3333C9BCBC
	for <lists+linux-stm32@lfdr.de>; Wed, 22 May 2019 05:48:36 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 340A1C9BCBB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 05:48:36 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c66so3840844wme.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2019 22:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=/tTf0o0S8X8KnChjJDfa2qYc6+8coCPQJrmnG5nMMms=;
 b=uUve0ZipnHu6cyNoI44TVwaoHbwO5Byw+UNySCQATErAkisI+mHPIbXN4XMMGxFRbd
 YU40swFzP8fPVrDfpyRwt0K1sNhjTFKRFTZ0jvSzNnDU0aayBXnXPkYQat15PEkbB7B2
 vdZImcsk6mklId16PzEv6fSWDOnOUW7nUpfiCksXPkZXigHjnI5aKhbvqJXFMXLtR1k2
 r1UkXhC+sh+5Qx+M+vywvf0UdtefyAn9GD2w+2709N6CFU7uSw9jsRL/28jYYhx4QoH4
 JLdQdZRONICn8J4EdMWYVD3d35LNAwi7oVsGBzBZiP2B7vylayIdp89IvWCQxbdPoC41
 LGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=/tTf0o0S8X8KnChjJDfa2qYc6+8coCPQJrmnG5nMMms=;
 b=mTHuZBV6N8FXzZbEcwXrNKAP9wJdJrZnPY0W/3DY0sFBqErvFPlAb2z7SYU1d+ncz/
 yh2Lf6wMsB8agKqGgpu4cpAP07WGUqhfNUsVoHzYDCMKyRBEFA7Ajwf6bLs/YGPKKMjV
 tRTd7txNgV4ILwi5alH2If/n2uLftzCnmNENtv/ycxcruuoIt/DslkSVQjDc92cCNiBV
 Xp3fuhEx77atcFbt79VYRg8UFbinM+DzeVLR+Bz4ZBcbii/un7VIFSg81bwtIqRYg+Dy
 h/BsR0RdKvk4o+LrXEM7ZmXzQK/64sLr5OzErU+OMCW/x2xwu9CGGpGW2RRB1MVrCENK
 CszQ==
X-Gm-Message-State: APjAAAUMjvTx1MSn85sFcs16RpBzQXVEy7D8WQjLwOLFcRDRLoF4zd8Z
 2uQm13cxvP0Pikm10Q03tE0CXA==
X-Google-Smtp-Source: APXvYqw7YHeamUnm0AYxBgRDczx++fDFxFoKXuD29B3Z8t2mMkfJ9/TcKb9Bf8lpkjRJKl0djf95Gw==
X-Received: by 2002:a1c:f10f:: with SMTP id p15mr6051518wmh.150.1558504115720; 
 Tue, 21 May 2019 22:48:35 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id p8sm15177511wro.0.2019.05.21.22.48.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 22:48:34 -0700 (PDT)
Date: Wed, 22 May 2019 06:48:33 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190522054833.GB4574@dell>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, kbuild-all@01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix compile issue when
 CONFIG_OF_GPIO is not defined
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

T24gTW9uLCAyMCBNYXkgMjAxOSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBXaGVuIENPTkZJ
R19HUElPX09GIGlzIG5vdCBkZWZpbmVkLCBzdHJ1Y3QgZ3Bpb19jaGlwICdvZl9ub2RlJyBtZW1i
ZXIgZG9lcwo+IG5vdCBleGlzdDoKPiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zdG1meC5jOiBJ
biBmdW5jdGlvbiAnc3RtZnhfcGluY3RybF9wcm9iZSc6Cj4gZHJpdmVycy9waW5jdHJsL3BpbmN0
cmwtc3RtZnguYzo2NTI6MTc6IGVycm9yOiAnc3RydWN0IGdwaW9fY2hpcCcgaGFzIG5vIG1lbWJl
ciBuYW1lZCAnb2Zfbm9kZScKPiAgICAgIHBjdGwtPmdwaW9fY2hpcC5vZl9ub2RlID0gbnA7Cj4g
Cj4gRml4ZXM6IDE0OTBkOWY4NDFiMSAoInBpbmN0cmw6IEFkZCBTVE1GWCBHUElPIGV4cGFuZGVy
IFBpbmN0cmwvR1BJTyBkcml2ZXIiKQo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5k
ZWxhdW5heUBzdC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMg
fCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYyBiL2RyaXZlcnMvcGluY3RybC9waW5j
dHJsLXN0bWZ4LmMKPiBpbmRleCBlYmE4NzJjLi5iYjY0YWEwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3Ry
bC1zdG1meC5jCj4gQEAgLTY0OCw3ICs2NDgsOSBAQCBzdGF0aWMgaW50IHN0bWZ4X3BpbmN0cmxf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCXBjdGwtPmdwaW9fY2hpcC5i
YXNlID0gLTE7Cj4gIAlwY3RsLT5ncGlvX2NoaXAubmdwaW8gPSBwY3RsLT5wY3RsX2Rlc2MubnBp
bnM7Cj4gIAlwY3RsLT5ncGlvX2NoaXAuY2FuX3NsZWVwID0gdHJ1ZTsKPiArI2lmZGVmIENPTkZJ
R19PRl9HUElPCj4gIAlwY3RsLT5ncGlvX2NoaXAub2Zfbm9kZSA9IG5wOwo+ICsjZW5kaWYKClRo
aXMgaXMgcHJldHR5IHVnbHkuICBXaWxsIFNUTUZYIGV2ZXIgYmUgdXNlZCB3aXRob3V0IE9GIHN1
cHBvcnQ/ICBJZgpub3QsIGl0IG1pZ2h0IGJlIGJldHRlciB0byBwbGFjZSB0aGlzIHJlc3RyaWN0
aW9uIG9uIHRoZSBkcml2ZXIgYXMgYQp3aG9sZS4KCkluY2lkZW50YWxseSwgd2h5IGlzIHRoaXMg
YmxhbmtlZCBvdXQgaW4gdGhlIHN0cnVjdHVyZSBkZWZpbml0aW9uPwpFdmVuICdzdHJ1Y3QgZGV2
aWNlJyBkb2Vzbid0IGRvIHRoaXMuCgo+ICAJcGN0bC0+Z3Bpb19jaGlwLm5lZWRfdmFsaWRfbWFz
ayA9IHRydWU7Cj4gIAo+ICAJcmV0ID0gZGV2bV9ncGlvY2hpcF9hZGRfZGF0YShwY3RsLT5kZXYs
ICZwY3RsLT5ncGlvX2NoaXAsIHBjdGwpOwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5h
cm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29m
dHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
