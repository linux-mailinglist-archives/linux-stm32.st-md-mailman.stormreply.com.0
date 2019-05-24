Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2899929333
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 10:35:24 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7AA6C57778
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 08:35:23 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C95E0C57776
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 08:35:21 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id m18so6225846qki.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 01:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=stihjVpyL81uND5ibC7iaE+uqyg/RcZbMfoVKMB+mtE=;
 b=COOin8sWa/lSfTHzEbCe7QsWKGFHiwbo+Kuqmt7jQDTjGn3ID2t5iZEWRjwnG6By71
 uv4qD+B6V+lTSd1cGxfjm6xdUqKzNvZcPCCozGAex2g3HPLoSyGt0NRZJNju326CVrUV
 MZiPPpSrfATRPBRj69TBl8hi4mwSD9d9Ry0RIkDRDarSJhV7v4vh0sMntfyLf1zjBRF6
 ur+A0Nr18atc8xLW4L1cLh+ev5aI/b8CI+deN/SFEn4H6FL/TkNMHhBha/cCFesIbyQj
 44MwusoS5aJ1WsuHrDOHZoGBVhNW/7ciTNwIzlDSGh3AbxWasZnSztVK7nzT87PYKu6H
 HZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=stihjVpyL81uND5ibC7iaE+uqyg/RcZbMfoVKMB+mtE=;
 b=LafaJ09smrFYYv9Ug9tDFSFO9gUfAE0x1nJOc42c7PcC0wrbQqSoa8+yvvT2aO4o71
 VMath7y+gIkMc2kjyL6oDVQTKjPokWqCHHznmfP7a8KMQyyfGFROHrT1SCQ3Aq1DIZQT
 3nSwA9g2KcOnr28/BDlQg8XupY6OEKs/YqN/q3DQAaXqp/akQcb001h6Ba0tinlN0sGL
 yh2CMJZXEPEpZTNKEnOfp/Pb/NPvqUEfeYqGnYqlRr1d2MgV7j0J7ykuPeA9YAnCksgX
 HJ4M09QUpvtoPp/XQ9HSdbEgUEh/9Oxi5ztMztRtQijUP8Tn5Xq14dgD0jmS+MO7l++r
 gZGQ==
X-Gm-Message-State: APjAAAUzj6L0mC0/ME2BLXuwfLsA4WgHlWpSCdNv7Dm3Tqnt5hyXQ4/i
 Zv0Co4j8cjVLShz9XR/f71EdUwgT2kZ/A+HlA21HyA==
X-Google-Smtp-Source: APXvYqzoub85iC3qRkUT/1rqPcbCAqf2PraA42mUh6gZCy1soKl7824Xl/NLHnNFN2zZSje+ohS+z/SwZ9ZQTmdisuQ=
X-Received: by 2002:a0c:ad85:: with SMTP id w5mr11932788qvc.242.1558686920808; 
 Fri, 24 May 2019 01:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <1557753318-11218-1-git-send-email-yannick.fertre@st.com>
 <317f94d6-846f-92e2-bd0f-b44377ea7845@st.com>
In-Reply-To: <317f94d6-846f-92e2-bd0f-b44377ea7845@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 24 May 2019 10:35:10 +0200
Message-ID: <CA+M3ks77XPTZubS8icLdTF3mpQ3OHsvSqX35hHQik3ygRiGSZg@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] drm/stm: ltdc: remove clk_round_rate
	comment
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

TGUgbHVuLiAxMyBtYWkgMjAxOSDDoCAxNjo0NiwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gRGVhciBZYW5uaWNrLAo+Cj4gQWNrZWQtYnk6IFBo
aWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Cj4KQXBwbGllZCBvbiBkcm0tbWlz
Yy1uZXh0LAoKQmVuamFtaW4KCj4gVGhhbmsgeW91LAo+Cj4gUGhpbGlwcGUgOi0pCj4KPiBPbiA1
LzEzLzE5IDM6MTUgUE0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToKPiA+IENsa19yb3VuZF9yYXRl
IHJldHVybnMgcm91bmRlZCBjbG9jayB3aXRob3V0IGNoYW5naW5nCj4gPiB0aGUgaGFyZHdhcmUg
aW4gYW55IHdheS4KPiA+IFRoaXMgZnVuY3Rpb24gY291bGRuJ3QgcmVwbGFjZSBzZXRfcmF0ZS9n
ZXRfcmF0ZSBjYWxscy4KPiA+IFRvZG8gY29tbWVudCBoYXMgYmVlbiByZW1vdmVkICYgYSBuZXcg
bG9nIGluc2VydGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFlhbm5pY2sgRmVydHLDqSA8eWFu
bmljay5mZXJ0cmVAc3QuY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gICAgICAg
LSBDbGtfZW5hYmxlICYgY2xrX2Rpc2FibGUgYXJlIG5lZWRlZCBmb3IgdGhlIFNPQyBTVE0zMkY3
Cj4gPiAgICAgICAgKG5vdCBmb3IgU1RNMzJNUDEpLiBJIHJldHVybiB0aGlzIHBhcnQgb2YgdGhl
IHBhdGNoIHRvIG1ha2Ugc3VyZSB0aGUKPiA+ICAgICAgICBkcml2ZXIgaXMgY29tcGF0aWJsZSB3
aXRoIGFsbCBTT0MgU1RNMzIuCj4gPgo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8
IDggKysrLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gaW5kZXggOTc5MTJlMi4uMTEwNGU3OCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCj4gPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gQEAgLTUwNywxMSArNTA3LDYgQEAgc3RhdGljIGJv
b2wgbHRkY19jcnRjX21vZGVfZml4dXAoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ID4gICAgICAg
c3RydWN0IGx0ZGNfZGV2aWNlICpsZGV2ID0gY3J0Y190b19sdGRjKGNydGMpOwo+ID4gICAgICAg
aW50IHJhdGUgPSBtb2RlLT5jbG9jayAqIDEwMDA7Cj4gPgo+ID4gLSAgICAgLyoKPiA+IC0gICAg
ICAqIFRPRE8gY2xrX3JvdW5kX3JhdGUoKSBkb2VzIG5vdCB3b3JrIHlldC4gV2hlbiByZWFkeSwg
aXQgY2FuCj4gPiAtICAgICAgKiBiZSB1c2VkIGluc3RlYWQgb2YgY2xrX3NldF9yYXRlKCkgdGhl
biBjbGtfZ2V0X3JhdGUoKS4KPiA+IC0gICAgICAqLwo+ID4gLQo+ID4gICAgICAgY2xrX2Rpc2Fi
bGUobGRldi0+cGl4ZWxfY2xrKTsKPiA+ICAgICAgIGlmIChjbGtfc2V0X3JhdGUobGRldi0+cGl4
ZWxfY2xrLCByYXRlKSA8IDApIHsKPiA+ICAgICAgICAgICAgICAgRFJNX0VSUk9SKCJDYW5ub3Qg
c2V0IHJhdGUgKCVkSHopIGZvciBwaXhlbCBjbGtcbiIsIHJhdGUpOwo+ID4gQEAgLTUyMSw2ICs1
MTYsOSBAQCBzdGF0aWMgYm9vbCBsdGRjX2NydGNfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsCj4gPgo+ID4gICAgICAgYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPSBjbGtfZ2V0X3JhdGUo
bGRldi0+cGl4ZWxfY2xrKSAvIDEwMDA7Cj4gPgo+ID4gKyAgICAgRFJNX0RFQlVHX0RSSVZFUigi
cmVxdWVzdGVkIGNsb2NrICVka0h6LCBhZGp1c3RlZCBjbG9jayAlZGtIelxuIiwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgbW9kZS0+Y2xvY2ssIGFkanVzdGVkX21vZGUtPmNsb2NrKTsKPiA+
ICsKPiA+ICAgICAgIHJldHVybiB0cnVlOwo+ID4gICB9Cj4gPgo+ID4gLS0KPiA+IDIuNy40Cj4g
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJp
LWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
