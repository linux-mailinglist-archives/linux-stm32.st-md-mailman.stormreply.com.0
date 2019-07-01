Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AD75B741
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 10:53:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64FA1D2689B
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 08:53:12 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE9FCD26899
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2019 08:53:10 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id i34so13781502qta.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Jul 2019 01:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yEydmtnCDiKOYKSAVEGulQp1MLxqt3sZi6sZBX94kKY=;
 b=vBNi+IyoW5BtngLeAC6WLbJv2qNSYVGYTBf5aeYr/G9/9f79GCL8+d3YkNK/Vxyn3z
 nKeMteN+qRYhm+8nyzPaKRhG/zc0oTk3ov1KesWQVQRieNvGlEc/csx2JCkaJoiW7FsT
 ISMiIRcZ2NcnspJEqgG8Nm7fO8RSJFPS2ZvP36W/uSjlla4A0wdEJyIAsmTPw+C3rO+w
 toqyODSt9SpwtkVgaOt8Jnf8xnmI4AxL270fPzLdVxSxj9+ZQmud5RGt1kbGEjPaCKaO
 OncydU0P3fRObJlaBo+iMnC8AZ5jel5TfroKOFc9XBmIx0/fJe/YmDyPDqf1ctoduS9q
 fu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yEydmtnCDiKOYKSAVEGulQp1MLxqt3sZi6sZBX94kKY=;
 b=Kg9Zr608/QUy09N/j9mLOrJxFwsBsXegrlm7WW+ykAL5jgbXK1GZmYaJSMPjEQDYER
 f6xlluMnHeB2izOAo/HhjPU0JVhUhXWJEcqMmqR2HG/FADtEbbs3iv896YKo0A/I3tbg
 BOjesmx4Kq4HzdnJBtZAQwPLxi0vFV82XIG3YzV4CYtadogl1Wu1LU+ta7Og/5yjYRi7
 zP0h3dpT+LMp2b3HJoX6mS+7jrlUndFBwxo1o8L1YsdqEQGed1tTrUDdj1J1N2/9xctC
 XgOO3dh+FZuQ5mWDdFwdbbt5XBtbOlqzkibRxgYCItUCsrWYKfQQE7/X5ztdEhOB+GIi
 YqDA==
X-Gm-Message-State: APjAAAVGSG3zLiDqm7BvJkRSaIRT7R3ty0zIJGdJq8qqIj49D/RpamiS
 mRJTY71Vdfd/gCxuW/9IJNyZKzwYTk04SQ68HWXv+Q==
X-Google-Smtp-Source: APXvYqy/mrvToBYfrETzRYxgV9TqtLA6Mw+WkpF6Pa31jr/E+2o2Ywn0MkpkLw7P7SBwy/yCgsgpwdQg+ZMoi4bZLWs=
X-Received: by 2002:ac8:3301:: with SMTP id t1mr19458961qta.209.1561971189535; 
 Mon, 01 Jul 2019 01:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190630061922.7254-1-sam@ravnborg.org>
 <20190630061922.7254-4-sam@ravnborg.org>
In-Reply-To: <20190630061922.7254-4-sam@ravnborg.org>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Mon, 1 Jul 2019 10:52:58 +0200
Message-ID: <CA+M3ks72=1-DBf7sX7oF1u5e0TyS1R_ha4o9oXOu=Y90PyC3og@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v1 03/33] drm/stm: drop use of drmP.h
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

TGUgZGltLiAzMCBqdWluIDIwMTkgw6AgMDg6MTksIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gYSDDqWNyaXQgOgo+Cj4gRHJvcCB1c2Ugb2YgdGhlIGRlcHJlY2F0ZWQgaGVhZGVyIGZp
bGUgZHJtUC5oCj4gZnJvbSB0aGUgc29sZSB1c2VyIGluIHRoZSBzdG0gZHJpdmVyLgo+IFJlcGxh
Y2Ugd2l0aCBuZWNlc3NhcnkgaW5jbHVkZSBmaWxlcy4KCkFwcGxpZWQgb24gZHJtLW1pc2MtbmV4
dC4KClRoYW5rcywKQmVuamFtaW4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFlhbm5pY2sgRmVydHJlIDx5YW5uaWNrLmZlcnRyZUBzdC5j
b20+Cj4gQ2M6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3JudUBzdC5jb20+Cj4gQ2M6IEJl
bmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgo+IENjOiBWaW5j
ZW50IEFicmlvdSA8dmluY2VudC5hYnJpb3VAc3QuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBD
YzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+IENjOiBBbGV4
YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQHN0LmNvbT4KPiBDYzogbGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtLS0KPiBU
aGUgbGlzdCBvZiBjYzogd2FzIHRvbyBsYXJnZSB0byBhZGQgYWxsIHJlY2lwaWVudHMgdG8gdGhl
IGNvdmVyIGxldHRlci4KPiBQbGVhc2UgZmluZCBjb3ZlciBsZXR0ZXIgaGVyZToKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdW5lL3RocmVh
ZC5odG1sCj4gU2VhcmNoIGZvciAiZHJtOiBkcm9wIHVzZSBvZiBkcm1wLmggaW4gZHJtLW1pc2Mi
Cj4KPiAgICAgICAgIFNhbQo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3Rt
LmMgfCAxMCArKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19taXBp
X2RzaS1zdG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vZHdfbWlwaV9kc2ktc3RtLmMKPiBpbmRl
eCAwYWIzMmZlZTZjMWIuLmEwM2E2NDJjMTQ3YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0bS9kd19t
aXBpX2RzaS1zdG0uYwo+IEBAIC04LDEzICs4LDE3IEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L2Ns
ay5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2Rf
ZGV2aWNldGFibGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9yZWd1bGF0b3IvY29u
c3VtZXIuaD4KPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gLSNpbmNsdWRlIDxkcm0vZHJtX21p
cGlfZHNpLmg+Cj4gLSNpbmNsdWRlIDxkcm0vYnJpZGdlL2R3X21pcGlfZHNpLmg+Cj4gKwo+ICAj
aW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+Cj4KPiArI2luY2x1ZGUgPGRybS9icmlkZ2Uv
ZHdfbWlwaV9kc2kuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KPiArI2luY2x1
ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiArCj4gICNkZWZpbmUgSFdWRVJfMTMwICAgICAgICAgICAg
ICAgICAgICAgIDB4MzEzMzMwMDAgICAgICAvKiBJUCB2ZXJzaW9uIDEuMzAgKi8KPiAgI2RlZmlu
ZSBIV1ZFUl8xMzEgICAgICAgICAgICAgICAgICAgICAgMHgzMTMzMzEwMCAgICAgIC8qIElQIHZl
cnNpb24gMS4zMSAqLwo+Cj4gLS0KPiAyLjIwLjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
