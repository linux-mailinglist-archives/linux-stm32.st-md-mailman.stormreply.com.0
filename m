Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E659B15191E
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2020 11:59:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B22A9C36B0C;
	Tue,  4 Feb 2020 10:59:42 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3DABC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Feb 2020 10:59:41 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w15so17428676qkf.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Feb 2020 02:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OkYuSAHSvR9IiWlcEsrQapzeBiIfaoP2obtZIjgXQhs=;
 b=rITuRlnU5/24sQNwIAAIdWCPBPPBD353FYTZvrULxlwi2ajLaJpHIUmUjtLGA4NvOs
 Vw0gnzxypm5dmKpNeYwo9Jr6qEc/iPregoYplOyR8itbWunGqVIzzFqeAClewPy/eJcI
 pOFpyvvCPqg2QPnaMa1baSZ4Epw9tMeEFv4pHP2tb1behBX1096LA6gMrDoL5XeOGa4A
 wK7wwwp0b3LKC8aub/4AljYlboky34EsIRUjoNs1FF+E09Wfqb+ajh8k8vSd8E1UpTt0
 AGTBrMXe9IWJxZWinTXd5Lk72BZl5qU0BqZiYnxcapLmPdJwY5/EvEVEnhuEaZDyxYOY
 ijuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OkYuSAHSvR9IiWlcEsrQapzeBiIfaoP2obtZIjgXQhs=;
 b=AZH5XlytUnATIAB5ikQNgbstCBeNh136AucIBQCECGI+4gygByBp0TG55HEesbfqmZ
 cis+NSUD/HHO80qEKp3fIWJz9+pULQpqys5BExEf0BdVLNKyM1DTWRPdehIAPnVlYsLA
 rD1xS6bXh+G4UT1bN1ZTUMBl4o5yS88oja/XHxODMn6Bab4JAQb9xz3I68Efk8FGpiLh
 bHP7qjRyjGnENlIeY61oDkrTcrkC4fbjutgDKYbk7iqtCY6sGW/Ph6/9OyKLvbvKxrXw
 QrUIFgztKUVh5Jdp5ZoyUvS+ADUjUEO51bNRl6qhWfPH7xlxW5M1Qd/WYRbDyohYddvp
 LVsA==
X-Gm-Message-State: APjAAAXYPp2qRF2s6JEX108epPif6cm/VYLDgRgS4YL9QPF0V+rNgb5c
 ztFe4NEzXPfJxwKawwMAcQaqQdmend39aLUV3cYGeA==
X-Google-Smtp-Source: APXvYqwW+VXZSsGTnbaiHcIw6633UG2ZmqWmA1RIngmVgnjon5IKG3UFUyO2ideE4wKuZmUV4TLy1aHR+b//QPX9+Qw=
X-Received: by 2002:a37:9c07:: with SMTP id f7mr28696197qke.103.1580813980425; 
 Tue, 04 Feb 2020 02:59:40 -0800 (PST)
MIME-Version: 1.0
References: <1579602245-7577-1-git-send-email-yannick.fertre@st.com>
 <1fd9adf5-873b-2b9d-fe22-278f2ea64746@st.com>
In-Reply-To: <1fd9adf5-873b-2b9d-fe22-278f2ea64746@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 4 Feb 2020 11:59:29 +0100
Message-ID: <CA+M3ks45=r+gQ9bHaiaNObVFBA07XyDm=gPrwSq7o9EHdhVz5g@mail.gmail.com>
To: Philippe CORNU <philippe.cornu@st.com>
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: stm mipi dsi doesn't print
	error on probe deferral
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

TGUgamV1LiAyMyBqYW52LiAyMDIwIMOgIDEwOjU0LCBQaGlsaXBwZSBDT1JOVSA8cGhpbGlwcGUu
Y29ybnVAc3QuY29tPiBhIMOpY3JpdCA6Cj4KPiBEZWFycyBZYW5uaWNrICYgRXRpZW5uZSwKPiBU
aGFuayB5b3UgZm9yIHlvdXIgcGF0Y2gsCj4KPiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgQ29ybnUg
PHBoaWxpcHBlLmNvcm51QHN0LmNvbT4KPgo+IFBoaWxpcHBlIDotKQo+Cj4gT24gMS8yMS8yMCAx
MToyNCBBTSwgWWFubmljayBGZXJ0cmUgd3JvdGU6Cj4gPiBGcm9tOiBFdGllbm5lIENhcnJpZXJl
IDxldGllbm5lLmNhcnJpZXJlQHN0LmNvbT4KPiA+Cj4gPiBDaGFuZ2UgRFNJIGRyaXZlciB0byBu
b3QgcHJpbnQgYW4gZXJyb3IgdHJhY2Ugd2hlbiBwcm9iZQo+ID4gaXMgZGVmZXJyZWQgZm9yIGEg
Y2xvY2sgcmVzb3VyY2UuCgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQ/ClRoYW5rcywKQmVuamFt
aW4KCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJy
aWVyZUBzdC5jb20+Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2Rz
aS1zdG0uYyB8IDQgKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdf
bWlwaV9kc2ktc3RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4g
PiBpbmRleCA0YjE2NTYzLi4yZTFmMjY2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3N0bS9kd19taXBpX2RzaS1zdG0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19t
aXBpX2RzaS1zdG0uYwo+ID4gQEAgLTM3Nyw3ICszNzcsOSBAQCBzdGF0aWMgaW50IGR3X21pcGlf
ZHNpX3N0bV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gICAgICAgZHNp
LT5wbGxyZWZfY2xrID0gZGV2bV9jbGtfZ2V0KGRldiwgInJlZiIpOwo+ID4gICAgICAgaWYgKElT
X0VSUihkc2ktPnBsbHJlZl9jbGspKSB7Cj4gPiAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIo
ZHNpLT5wbGxyZWZfY2xrKTsKPiA+IC0gICAgICAgICAgICAgRFJNX0VSUk9SKCJVbmFibGUgdG8g
Z2V0IHBsbCByZWZlcmVuY2UgY2xvY2s6ICVkXG4iLCByZXQpOwo+ID4gKyAgICAgICAgICAgICBp
ZiAocmV0ICE9IC1FUFJPQkVfREVGRVIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgRFJNX0VS
Uk9SKCJVbmFibGUgdG8gZ2V0IHBsbCByZWZlcmVuY2UgY2xvY2s6ICVkXG4iLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZXQpOwo+ID4gICAgICAgICAgICAgICBnb3RvIGVy
cl9jbGtfZ2V0Owo+ID4gICAgICAgfQo+ID4KPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
