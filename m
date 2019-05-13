Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4661B160
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 09:44:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D9ECC5B646
	for <lists+linux-stm32@lfdr.de>; Mon, 13 May 2019 07:44:44 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA967C5B645
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 07:44:42 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d12so13970265wrm.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2019 00:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=OT71EAwxl4wA6+YtX4rN0OJahyazfPvJiN7l6rKFsek=;
 b=Zyz0HHajuuueQ14dGBCAfnblxjKE63v6ovBq+xccC0TKAh0JGEjTZdmOOAyXfRourg
 Hkm3tNCyg6tFgqLZVzY7Cq/q84ISaM+vYaAjjbRWOvqHXWzvyV9AmjqMOA7dH2tuPk98
 b4vbcDt0GfpM9yfTGsQM5+ZlX9K2Vzj0irJIZoXo3WlwgGJcGaWEDv5zHknRy1fv2jLY
 qz2bxVbyfYssedNu5+e8xERXXgXfNfHaTrojeAfBfY5ziL70MWZwXQnFJ1fyPgszLCwq
 Q9QdMrBk0bb/0WlljPRgNAwCjGRVjSYDZ3lQinsYUf9o2PDsOCf7jhaB/7seBrb+GMsj
 NWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=OT71EAwxl4wA6+YtX4rN0OJahyazfPvJiN7l6rKFsek=;
 b=bbitlBqRewlfdRAuC6a21K6SZfmf3P0clN898/6i+jpyA3xWCjOhVpR8TbqORge6f8
 3NXR1G6k190sjwsXDomK7Y0AUmWE34CkKdfXNms5NDI1KM+8daPyWRj2LEhRfZZtpvBa
 cKvBTE7uLx3nm4iaAeizfDvCMczvV2VWb8j8k8FD+lLtVZyXydeHKPngqvZOFcho3UfS
 ksyvHqxCXGFlvqS1B6YsVbQDOp9jPWWOGn/BACaW7Za3JA0Wza+lt/Jt0mM4d0iJJ4SF
 AW++FBnk0R342L7FA5IelGTsTG840KxluW3msfjNwsfvajA0TaXKkFSIMB/R3VBLBehH
 wgcA==
X-Gm-Message-State: APjAAAUorVzLuGz7G+AhJcOXg6c7+8f8F5pQm14Jk8KJbOCj1xvpUT+3
 qHjGAu7xRivHwFmkfCEJTiCE/w==
X-Google-Smtp-Source: APXvYqxAXI43awYbJUlo3tZn1JOtkzPnPJ5Kpu6uf5DsvNl0ikrAa2gpF4ov4OG9hj0nfcDVurgUjA==
X-Received: by 2002:a5d:6cae:: with SMTP id a14mr1830626wra.214.1557733482420; 
 Mon, 13 May 2019 00:44:42 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id h12sm9258467wrq.95.2019.05.13.00.44.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 00:44:41 -0700 (PDT)
Date: Mon, 13 May 2019 08:44:40 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Amelie Delaunay <amelie.delaunay@st.com>
Message-ID: <20190513074440.GK4319@dell>
References: <1557732606-14662-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557732606-14662-1-git-send-email-amelie.delaunay@st.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Julia Lawall <julia.lawall@lip6.fr>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, kbuild-all@01.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix comparison of
 unsigned expression warnings
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

T24gTW9uLCAxMyBNYXkgMjAxOSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgoKPiBUaGlzIHBhdGNo
IGZpeGVzIHRoZSBmb2xsb3dpbmcgd2FybmluZ3M6Cj4gCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0
cmwtc3RtZnguYzoyMjU6NS04OiBXQVJOSU5HOiBVbnNpZ25lZCBleHByZXNzaW9uCj4gY29tcGFy
ZWQgd2l0aCB6ZXJvOiBkaXIgPCAwCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYzoy
MzE6NS05OiBXQVJOSU5HOiBVbnNpZ25lZCBleHByZXNzaW9uCj4gY29tcGFyZWQgd2l0aCB6ZXJv
OiBwdXBkIDwgMAo+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmM6MjI4OjUtOTogV0FS
TklORzogVW5zaWduZWQgZXhwcmVzc2lvbgo+IGNvbXBhcmVkIHdpdGggemVybzogdHlwZSA8IDAK
PiAKPiBGaXhlczogMTQ5MGQ5Zjg0MWIxICgicGluY3RybDogQWRkIFNUTUZYIEdQSU8gZXhwYW5k
ZXIgUGluY3RybC9HUElPIGRyaXZlciIpCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90
IDxsa3BAaW50ZWwuY29tPgo+IFJlcG9ydGVkLWJ5OiBKdWxpYSBMYXdhbGwgPGp1bGlhLmxhd2Fs
bEBsaXA2LmZyPgo+IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1
bmF5QHN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpBbHJl
YWR5IGZpeGVkIHVwIGFuZCBwdXNoZWQuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwv
cGluY3RybC1zdG1meC5jIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc3RtZnguYwo+IGluZGV4
IGJjZDgxMjYuLjNiZDVkNmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwt
c3RtZnguYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9waW5jdHJsLXN0bWZ4LmMKPiBAQCAtMjEz
LDcgKzIxMyw3IEBAIHN0YXRpYyBpbnQgc3RtZnhfcGluY29uZl9nZXQoc3RydWN0IHBpbmN0cmxf
ZGV2ICpwY3RsZGV2LAo+ICAJc3RydWN0IHN0bWZ4X3BpbmN0cmwgKnBjdGwgPSBwaW5jdHJsX2Rl
dl9nZXRfZHJ2ZGF0YShwY3RsZGV2KTsKPiAgCXUzMiBwYXJhbSA9IHBpbmNvbmZfdG9fY29uZmln
X3BhcmFtKCpjb25maWcpOwo+ICAJc3RydWN0IHBpbmN0cmxfZ3Bpb19yYW5nZSAqcmFuZ2U7Cj4g
LQl1MzIgZGlyLCB0eXBlLCBwdXBkOwo+ICsJaW50IGRpciwgdHlwZSwgcHVwZDsKPiAgCXUzMiBh
cmcgPSAwOwo+ICAJaW50IHJldDsKPiAgCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFy
byBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
