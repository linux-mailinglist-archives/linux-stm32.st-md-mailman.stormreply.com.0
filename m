Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 756DE74B10
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jul 2019 12:06:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 379C4C24029;
	Thu, 25 Jul 2019 10:06:24 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A423C28E31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 10:06:22 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d17so48387781qtj.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Jul 2019 03:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zQMVxe3WoXIZNphAhnksatgFc1GF8rTdTdgr2SLV9iE=;
 b=kDPaigz0G8Pu7nH11KHGXyzXzcWIGm8p48us4Zolu2noXTfmgTxNEGRY9ENB0JwjaL
 GAuiJMo3VWyDGeJ8iaGqgT7ou/XAFWXqi4J7XyA3YnPE2QbNirtXBhWdIiQ3j0sJGPL+
 55c+K3owfz2iMnuXKKivBARspjVkdOjLySJyyNiiNhiEY0yHomFtSMJp6HDRLu5fnQrg
 iNLM1w9zDj/QxyOFNkat6bw50e6EP0NMzk6p3cBmi5UGRM4XhEXiRpCCienLXFg6+RJB
 lgjO869eVfc0mfQSTuuUSAJxC0LmLbDN9AfP4IqsCCvOOtPrjuZVxSZ75f3PRtPV4oXj
 9KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zQMVxe3WoXIZNphAhnksatgFc1GF8rTdTdgr2SLV9iE=;
 b=FSYxGGW7Oz8uzTQdeiUn6fItSIHRVEe6w0Z0jx6FPquDhKFLhyG0BfdDIIEstaN+fX
 IqdB0I/pe6LmCUXMfZ05k5XVc/jbn+6B4CGJXJn0BgkBhdfqKX6E4Ir23xMybqVJkOOW
 SKCeEx6yM8QIseQHbou0ObXQUNOlq9tZQU2zDKzSmLHeSHY4jNC9ArtrNgVyIDyPbNT8
 GBPhR1ZM5VjbRUdVrFIyec5WLD9QTupN992lSi1LewzJuZzlVnV3xCi/WCJ6CRWVr+/b
 0Y9KVl4XVrbXYv1u16+htZTzYgRbKNi2SS6QOsh6BnTHdZl1MCrjqZVhWrsvc76SIEed
 ebCA==
X-Gm-Message-State: APjAAAUITOLEfA9VNqmTfz93Eps+vsTdkW58/BfJ0dI1DJbGzQ39uRxv
 zxzcmqJftsaTnIUbsIwRhqLG/KxejGAp6xZ2eithIQ==
X-Google-Smtp-Source: APXvYqxiUgtD1Oqp5s64OPc9Tv6xDA0YAOE0HLwM37Elo/1REVFSdGgH6ZMP+A2uMINEanG0dwqemHajRYVCdHtY8NM=
X-Received: by 2002:ac8:7402:: with SMTP id p2mr59799351qtq.250.1564049181185; 
 Thu, 25 Jul 2019 03:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <1563811560-29589-1-git-send-email-olivier.moysan@st.com>
 <1563811560-29589-4-git-send-email-olivier.moysan@st.com>
In-Reply-To: <1563811560-29589-4-git-send-email-olivier.moysan@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Thu, 25 Jul 2019 12:06:10 +0200
Message-ID: <CA+M3ks6ZRrLAa=xMPi5UfdLEzMCBCjeovUei2O9m8V4PW3bh-Q@mail.gmail.com>
To: Olivier Moysan <olivier.moysan@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 jernej.skrabec@siol.net, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Jyri Sarha <jsarha@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/bridge: sii902x: make audio
	mclk optional
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

TGUgbHVuLiAyMiBqdWlsLiAyMDE5IMOgIDE4OjA2LCBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5t
b3lzYW5Ac3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBUaGUgbWFzdGVyIGNsb2NrIG9uIGkycyBidXMg
aXMgbm90IG1hbmRhdG9yeSwKPiBhcyBzaWk5MDJYIGludGVybmFsIFBMTCBjYW4gYmUgdXNlZCBp
bnN0ZWFkLgo+IE1ha2UgdXNlIG9mIG1jbGsgb3B0aW9uYWwuCgpBcHBsaWVkIG9uIGRybS1taXNj
LW5leHQuClRoYW5rcywKQmVuamFtaW4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNh
biA8b2xpdmllci5tb3lzYW5Ac3QuY29tPgo+IFJldmlld2VkLWJ5OiBKeXJpIFNhcmhhIDxqc2Fy
aGFAdGkuY29tPgo+IEFja2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDE5ICsrKysrKysr
KystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYwo+IGluZGV4IDk2MjkzMWMyMGVmZS4u
YTMyMzgxNWFhOWI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAy
eC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKPiBAQCAtNTY4LDEz
ICs1NjgsMTQgQEAgc3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAg
ICAgICB9Cj4KPiAtICAgICAgIG1jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShzaWk5MDJ4LT5hdWRp
by5tY2xrKTsKPiAtCj4gLSAgICAgICByZXQgPSBzaWk5MDJ4X3NlbGVjdF9tY2xrX2RpdigmaTJz
X2NvbmZpZ19yZWcsIHBhcmFtcy0+c2FtcGxlX3JhdGUsCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBtY2xrX3JhdGUpOwo+IC0gICAgICAgaWYgKG1jbGtfcmF0ZSAhPSBy
ZXQgKiBwYXJhbXMtPnNhbXBsZV9yYXRlKQo+IC0gICAgICAgICAgICAgICBkZXZfZGJnKGRldiwg
IkluYWNjdXJhdGUgcmVmZXJlbmNlIGNsb2NrICglbGQvJWQgIT0gJXUpXG4iLAo+IC0gICAgICAg
ICAgICAgICAgICAgICAgIG1jbGtfcmF0ZSwgcmV0LCBwYXJhbXMtPnNhbXBsZV9yYXRlKTsKPiAr
ICAgICAgIGlmIChzaWk5MDJ4LT5hdWRpby5tY2xrKSB7Cj4gKyAgICAgICAgICAgICAgIG1jbGtf
cmF0ZSA9IGNsa19nZXRfcmF0ZShzaWk5MDJ4LT5hdWRpby5tY2xrKTsKPiArICAgICAgICAgICAg
ICAgcmV0ID0gc2lpOTAyeF9zZWxlY3RfbWNsa19kaXYoJmkyc19jb25maWdfcmVnLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJhbXMtPnNhbXBsZV9y
YXRlLCBtY2xrX3JhdGUpOwo+ICsgICAgICAgICAgICAgICBpZiAobWNsa19yYXRlICE9IHJldCAq
IHBhcmFtcy0+c2FtcGxlX3JhdGUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2X2RiZyhk
ZXYsICJJbmFjY3VyYXRlIHJlZmVyZW5jZSBjbG9jayAoJWxkLyVkICE9ICV1KVxuIiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1jbGtfcmF0ZSwgcmV0LCBwYXJhbXMtPnNhbXBs
ZV9yYXRlKTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgbXV0ZXhfbG9jaygmc2lpOTAyeC0+bXV0
ZXgpOwo+Cj4gQEAgLTc1MSwxMSArNzUyLDExIEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9hdWRpb19j
b2RlY19pbml0KHN0cnVjdCBzaWk5MDJ4ICpzaWk5MDJ4LAo+ICAgICAgICAgICAgICAgICBzaWk5
MDJ4LT5hdWRpby5pMnNfZmlmb19zZXF1ZW5jZVtpXSB8PSBhdWRpb19maWZvX2lkW2ldIHwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBpMnNfbGFuZV9pZFtsYW5lc1tpXV0gfCBTSUk5MDJYX1RQ
SV9JMlNfRklGT19FTkFCTEU7Cj4KPiAtICAgICAgIHNpaTkwMngtPmF1ZGlvLm1jbGsgPSBkZXZt
X2Nsa19nZXQoZGV2LCAibWNsayIpOwo+ICsgICAgICAgc2lpOTAyeC0+YXVkaW8ubWNsayA9IGRl
dm1fY2xrX2dldF9vcHRpb25hbChkZXYsICJtY2xrIik7Cj4gICAgICAgICBpZiAoSVNfRVJSKHNp
aTkwMngtPmF1ZGlvLm1jbGspKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiJXM6
IE5vIGNsb2NrIChhdWRpbyBtY2xrKSBmb3VuZDogJWxkXG4iLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIF9fZnVuY19fLCBQVFJfRVJSKHNpaTkwMngtPmF1ZGlvLm1jbGspKTsKPiAtICAgICAg
ICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHNpaTkw
MngtPmF1ZGlvLm1jbGspOwo+ICAgICAgICAgfQo+Cj4gICAgICAgICBzaWk5MDJ4LT5hdWRpby5w
ZGV2ID0gcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2RhdGEoCj4gLS0KPiAyLjcuNAo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
