Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F01038AA0
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2019 14:49:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B0BDC676B3
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2019 12:49:26 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 546ECC676B0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2019 12:49:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z24so2023913qtj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Jun 2019 05:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Wfc0ONRiE7if96re9IgwhqZxlxJKyUTTfg/JtYHw6Xs=;
 b=epxnDKo4vb2qpmp6p0AVIYMa9cl9iKK1LLOl5bMlGKR0AY6TJWtGjVXLspm3fDzjpk
 08cqKA5rMFu7QLp1C6F8FdK9n7Q8dw8tZF0E8uRQpfst5CtV3OhRFRVt5SAbGgrFB7Ob
 No+5OQktEuAF0RZ9GvgbPA/OhYIEY9Wt8KaKNtguH25pGRm8L2WXIG962zD3Ohs3cfw1
 OZEYVyHjjWDPBuFSYoDhDQinBJoIMk32aYaCF0k590G0ZnhK09Jm0om6LtTETvTKL5ub
 aK1wbChp7D+i9mX1eTTbaUVO+sWS7XQJTCL3hsuASYEWuhpWN5OzC1X9GGn0tyskeF25
 3T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Wfc0ONRiE7if96re9IgwhqZxlxJKyUTTfg/JtYHw6Xs=;
 b=dojdD7JB3cTQaNrDAbbXX++n9Qf8OJE6bl22MDMpS7u1dTPzPlRY9Aso9qezYcE2mP
 tYiiuoiH4K2wbIIEi1mOCoy5JmHIy0cLDwEIAWeIEXIa4PtvTAohT41MmJVB9Oe0WSj4
 qqIWXeAnBlX17jCBk0PXqNJZjzqGAnX6AbFJ5FfhiLeStUKXdcNLvUudj1nkdK3dGGRW
 4gncMVl+Ps1ExdSo/VhbHl266zqxu5V1wP5ej68CRYSsT37N/G+Vme041zmL48rMjVdj
 CywhThqsta9bSX7nECxZItaLklK/USGU06rH1sHGxmQ/LD71McFE34bRUF8gglRU4a1f
 oxtw==
X-Gm-Message-State: APjAAAVXFFN9S/KjbqSaFaY0McPk575+PZMMvF6Iy0lgcrEL0JmWePIm
 uRWgr5JEWRUBxcgSz7zAdMG4mLHjqHJ71q8zVWpy5Q==
X-Google-Smtp-Source: APXvYqxikxR4bWp/IUM1Vo5wMutzlbB13crxKTadcYTVL5fEBAhSxYAflS6HqhnaINjHAyc+TYR4oIJwdCMD1i+/IoM=
X-Received: by 2002:ac8:395b:: with SMTP id t27mr46770308qtb.115.1559911763243; 
 Fri, 07 Jun 2019 05:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <1559550694-14042-1-git-send-email-yannick.fertre@st.com>
 <ca5d4bcf-6020-e924-5577-d7cf9134958b@st.com>
In-Reply-To: <ca5d4bcf-6020-e924-5577-d7cf9134958b@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 7 Jun 2019 14:49:12 +0200
Message-ID: <CA+M3ks6uUXVCHvzAW90GWMgOpkpQUwFhTo_MWdLwur4ZGmsMXQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH] drm/stm: ltdc: No message if probe
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

TGUgdmVuLiA3IGp1aW4gMjAxOSDDoCAxMDo1MSwgUGhpbGlwcGUgQ09STlUgPHBoaWxpcHBlLmNv
cm51QHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gSGkgWWFubmljaywKPgo+IFRoYW5rIHlvdSBmb3Ig
eW91ciBwYXRjaAo+Cj4gQWNrZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBz
dC5jb20+CgpBcHBsaWVkIG9uIGRybS1taXNjLW5leHQKClRoYW5rcywKQmVuamFtaW4KCj4gUGhp
bGlwcGUgOi0pCj4KPiBPbiA2LzMvMTkgMTA6MzEgQU0sIFlhbm5pY2sgRmVydHLDqSB3cm90ZToK
PiA+IFByaW50IGRpc3BsYXkgY29udHJvbGxlciBoYXJkd2FyZSB2ZXJzaW9uIGluIGRlYnVnIG1v
ZGUgb25seS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYyB8
IDIgKy0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3N0bS9sdGRjLmMKPiA+IGluZGV4IGE0MDg3MGIuLjJmZTZjNGEgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2x0ZGMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3N0bS9sdGRjLmMKPiA+IEBAIC0xMjI5LDcgKzEyMjksNyBAQCBpbnQgbHRkY19sb2FkKHN0
cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+ID4gICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+ICAg
ICAgIH0KPiA+Cj4gPiAtICAgICBEUk1fSU5GTygibHRkYyBodyB2ZXJzaW9uIDB4JTA4eCAtIHJl
YWR5XG4iLCBsZGV2LT5jYXBzLmh3X3ZlcnNpb24pOwo+ID4gKyAgICAgRFJNX0RFQlVHX0RSSVZF
UigibHRkYyBodyB2ZXJzaW9uIDB4JTA4eFxuIiwgbGRldi0+Y2Fwcy5od192ZXJzaW9uKTsKPiA+
Cj4gPiAgICAgICAvKiBBZGQgZW5kcG9pbnRzIHBhbmVscyBvciBicmlkZ2VzIGlmIGFueSAqLwo+
ID4gICAgICAgZm9yIChpID0gMDsgaSA8IE1BWF9FTkRQT0lOVFM7IGkrKykgewo+ID4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
