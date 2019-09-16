Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB7DB3B16
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Sep 2019 15:16:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46351C35E01;
	Mon, 16 Sep 2019 13:16:19 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E489C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 13:16:17 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id h126so28608777qke.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Sep 2019 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p8H14b8QOC7xyThE796vVQTVHwHGb7hWB3A0YDyKzi8=;
 b=vZIYuwEiPxNk76J3bqFOPMb7hAUUS/X0U7oo+vJzdyuvvkHgRlmK3AFwdDGKPHgJce
 jraHYg6hm4koJfMvBz5DtqLV9BOB7NXmHwMzOsoPDSPJ2BbT6sCeyUTeB2VnjPGQaw9c
 /C3Y8Gj3E9j44l1WvkOQqemf+GvIOoW3kJyNE8cwCp+WdtC/MgML25kVKfu2GzTpy9Ep
 LSSJKi299lQyNl1R5e6sCkvdIo4VuUlksmvaX9lLO6AgoW5olf2/1pn30OOp8TtUdqBC
 wNqvxSVlu5yEmm2Tr9kSx7x+3rWq34rVq3sncVuIm64rI8+cYHjcHPKTDCpW9j0pVOMW
 tuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p8H14b8QOC7xyThE796vVQTVHwHGb7hWB3A0YDyKzi8=;
 b=jiYOubEodWl8/BKVd6sUncWAxh6c5nIMhG2TzIp5orI92NDd2U9UhclsJXExbDh2du
 TF1iIfBClCZStErTiJ4AS77zQaPMSlw5qMfcO5+tVBDpcY3rUzSNT6AK7QBD+pSr0Uk8
 uaoR2+K+SqUlObuyIu1e8tPa51oWxRJ+eg8htxZe8xgNNhoTfB+SlBxsRX3GdlS4B5Be
 yuwOVF/cLLn+UtvwLwXClbVHH0CGenmz4/K7p9I5sUEQiQoMWjrbdHKXJtWKegRVGM0A
 SkS3dGEvsCROdZMF29VlQSBSRphc572yPf+Sx8p5KKRN8JRXUGeS3Ok0ltfffVdWoIOd
 aXiw==
X-Gm-Message-State: APjAAAVonvjwnqS5k/7Dp8zkmXqSwfcTeJCQRl8Bi/rSTLP7qNeRRzkW
 b3ZuKs8U3f+oIfY7zpHicyB3UgVtbvCrU3LfEqZJJw==
X-Google-Smtp-Source: APXvYqw2JIJaTfERF5pMhfhzLnLH23suF9vY3fd49RTGa+0vQVfMcg4dlOfYT6eDDrXzOlwQxh/GlMpqslbpzY+szUQ=
X-Received: by 2002:a05:620a:16d2:: with SMTP id
 a18mr29075565qkn.104.1568639776108; 
 Mon, 16 Sep 2019 06:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <1568278589-20400-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1568278589-20400-1-git-send-email-yannick.fertre@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 16 Sep 2019 15:16:05 +0200
Message-ID: <CA+M3ks56v__Lef4wN8KthoLoJ_yYYou8u+-PsJXSUVJQHaimdA@mail.gmail.com>
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: dsi: higher pll out only in
	video burst mode
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

TGUgamV1LiAxMiBzZXB0LiAyMDE5IMOgIDEwOjU3LCBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4gYSDDqWNyaXQgOgo+Cj4gSW4gb3JkZXIgdG8gYmV0dGVyIHN1cHBvcnQg
dmlkZW8gbm9uLWJ1cnN0IG1vZGVzLAo+IHRoZSArMjAlIG9uIHBsbCBvdXQgaXMgYWRkZWQgb25s
eSBpbiBidXJzdCBtb2RlLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgQ29ybnUgPHBoaWxp
cHBlLmNvcm51QHN0LmNvbT4KPiBSZXZpZXdlZC1ieTogWWFubmljayBGRVJUUkUgPHlhbm5pY2su
ZmVydHJlQHN0LmNvbT4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4dCwKVGhhbmtzLApCZW5qYW1p
bgoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYyB8IDUgKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gaW5kZXggYTAzYTY0Mi4uNTE0ZWZl
ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBpX2RzaS1zdG0uYwo+IEBAIC0yNjAsOCAr
MjYwLDExIEBAIGR3X21pcGlfZHNpX2dldF9sYW5lX21icHModm9pZCAqcHJpdl9kYXRhLCBjb25z
dCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSwKPiAgICAgICAgIC8qIENvbXB1dGUgcmVx
dWVzdGVkIHBsbCBvdXQgKi8KPiAgICAgICAgIGJwcCA9IG1pcGlfZHNpX3BpeGVsX2Zvcm1hdF90
b19icHAoZm9ybWF0KTsKPiAgICAgICAgIHBsbF9vdXRfa2h6ID0gbW9kZS0+Y2xvY2sgKiBicHAg
LyBsYW5lczsKPiArCj4gICAgICAgICAvKiBBZGQgMjAlIHRvIHBsbCBvdXQgdG8gYmUgaGlnaGVy
IHRoYW4gcGl4ZWwgYncgKGJ1cnN0IG1vZGUgb25seSkgKi8KPiAtICAgICAgIHBsbF9vdXRfa2h6
ID0gKHBsbF9vdXRfa2h6ICogMTIpIC8gMTA7Cj4gKyAgICAgICBpZiAobW9kZV9mbGFncyAmIE1J
UElfRFNJX01PREVfVklERU9fQlVSU1QpCj4gKyAgICAgICAgICAgICAgIHBsbF9vdXRfa2h6ID0g
KHBsbF9vdXRfa2h6ICogMTIpIC8gMTA7Cj4gKwo+ICAgICAgICAgaWYgKHBsbF9vdXRfa2h6ID4g
ZHNpLT5sYW5lX21heF9rYnBzKSB7Cj4gICAgICAgICAgICAgICAgIHBsbF9vdXRfa2h6ID0gZHNp
LT5sYW5lX21heF9rYnBzOwo+ICAgICAgICAgICAgICAgICBEUk1fV0FSTigiV2FybmluZyBtYXgg
cGh5IG1icHMgaXMgdXNlZFxuIik7Cj4gLS0KPiAyLjcuNAo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
