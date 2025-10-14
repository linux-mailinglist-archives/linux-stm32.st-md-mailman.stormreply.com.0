Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C84FBBDB111
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Oct 2025 21:33:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27845C56611;
	Tue, 14 Oct 2025 19:33:30 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79E3CC56608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 19:33:28 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-7815092cd0bso10284707b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Oct 2025 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760470407; x=1761075207;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ARDdDrOQu66S70j2Pcr0PW3/0XEEAOGuC2dcR/3tLc=;
 b=slzjUcpBWlnyUo1XHvkUPevGErBBeXi3FevqVkgWsFTcsW1QpObKpYFTJ+Gf75pp2Z
 O327zMS6LGZmMW1r4DBwxCiukQE9zFajM39EKBWCXGmr3pjfqM9mMvgGb3WDoSEoA/gB
 WKGLuceRe7U6OkQVwRLxaCB8B8sl2yvzMESHYgyeYzwaL9ALyceOTiYs/wxoyw8512zB
 G75bRsGr6CjTz7R8sNPRHY/sm9tcSgwoBrx+rqh4uuWEtSksxr2d0dUPh8GyrY+MEXq5
 DvW39OKXL5eJ/V/+QqIiHjiEmTMjzx0m9cFYllcwX+xTUa+RrZu7NhGaONc4/5rk22P5
 9w3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760470407; x=1761075207;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ARDdDrOQu66S70j2Pcr0PW3/0XEEAOGuC2dcR/3tLc=;
 b=jDKlcloJoadQxDvPiOAIpY0b3RutCTQZAss+mEV/fQ0Qgll0Bz0vyKttfX89RqiLy3
 i27UZ1LTEik6ODI1ySqpLOuVSmTH1x4Y831EtjUr7fUgLhXXxn6NZcsaxpUK1DC5VoRU
 CIxmXWBDCV98Z7MlSxaxBgyMSkfKuOgy7JZ97HYvkBmv/eQPQ77hcnAuIa0j01j1AhAe
 o3mlBC/Oz5qJunOSE89w9n0IN463cq9IW+CFURGltH76gwxeIPpKnouGfbt7r+PTRHBr
 1kBoHoq+Y7EUoy3ybD1zF3XQI18xEOn4ZdJ7F9wPgD29v83b61OdmsAxT5qLmQO0egDF
 ZZ6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXThA3LM1m5WLdqQ7eNzmX43kp14BqfjXsB35cTHqurrMkilIEIgErsopNnoLD2AUT0QE4SvrsurT2YPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx9X8ZZBsBQtxpfwbvpUBp+AnJvDibejg6duMEx05ljHWYJFTtB
 4Amj7FUqUDhGaVhmW+pAp47ciQNjQxBpJ/rgE1rwN2833FDL6lyNgswGg/Nrt5MoDjeuJgW4yG0
 vf9UNjaMARCHBJHhSqwE0IiVOsOEPNO5z3xC9ZmJalg==
X-Gm-Gg: ASbGncuvwHslXwlo63VSb7H3f5i+nbx4yUbrFYc51Y4nVJ0DCoWg25f4fYWS9ZCjKIK
 dA/FUWPX0adBqzM7BP51SOXRz+D8r63GdbdrUy0p4L1AKrxZv93CpjZ2WAPJNqhlR58lq7rXwxO
 ziYucRezuDo2gywR8Ag84SWvzL7f5hFt2gblI6UHkdYjhZUD9DQwQQJg+aROigRtCVHJzOGhQP1
 zlfAXTY6ndbIZC75sgDJeEwNYI03w==
X-Google-Smtp-Source: AGHT+IEUUPaRH5+Gxizt81iSypGUspUlnjKY5P6YXyV0VyPOzdQrWUfDr4OvmwdgxbP2fD1h3jeRBtg0eMKmQu2V+ic=
X-Received: by 2002:a05:690c:6204:b0:77e:5eb8:278c with SMTP id
 00721157ae682-780e16fc173mr396492737b3.46.1760470407083; Tue, 14 Oct 2025
 12:33:27 -0700 (PDT)
MIME-Version: 1.0
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-3-antonio.borneo@foss.st.com>
 <20251014-barbecue-crewman-717fe614daa6@spud>
In-Reply-To: <20251014-barbecue-crewman-717fe614daa6@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Oct 2025 21:33:14 +0200
X-Gm-Features: AS18NWDBmcyoyPtVx855p7YCo6bUFy5LEzs_BFgLFYqVzycznaj08XFuSAiE18s
Message-ID: <CACRpkdZT20cdH+G6Gjw8PopAkir+gGgMtRR4pkjnXFrmDkdfog@mail.gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 02/10] dt-bindings: pincfg-node: Add
	properties 'skew-delay-{in, out}put'
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

T24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgODowNOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gT24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMDQ6MDQ6NDNQTSArMDIw
MCwgQW50b25pbyBCb3JuZW8gd3JvdGU6Cgo+ID4gKyAgc2tldy1kZWxheS1pbnB1dDoKPiA+ICsg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAg
IGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIHRoaXMgYWZmZWN0cyB0aGUgZXhwZWN0ZWQgY2xvY2sg
c2tldyBvbiBpbnB1dCBwaW5zLgo+ID4gKyAgICAgIFR5cGljYWxseSBpbmRpY2F0ZXMgaG93IG1h
bnkgZG91YmxlLWludmVydGVycyBhcmUgdXNlZCB0bwo+ID4gKyAgICAgIGRlbGF5IHRoZSBzaWdu
YWwuCj4KPiBUaGlzIHByb3BlcnR5IHNlZW1zIHRvIGJlIHRlbXBvcmFsLCBJIHdvdWxkIGV4cGVj
dCB0byBzZWUgYSB1bml0IG9mIHRpbWUKPiBtZW50aW9uZWQgaGVyZSwgb3RoZXJ3aXNlIGl0J2xs
IHRvdGFsbHkgaW5jb25zaXN0ZW50IGluIHVzZSBiZXR3ZWVuCj4gZGV2aWNlcywgYW5kIGFsc28g
YSBzdGFuZGFyZCB1bml0IHN1ZmZpeCBpbiB0aGUgcHJvcGVydHkgbmFtZS4KPiBwdy1ib3Q6IGNo
YW5nZXMtcmVxdWVzdGVkCgpEb24ndCBibGFtZSB0aGUgbWVzc2VuZ2VyLCB0aGUgZXhpc3Rpbmcg
cHJvcGVydHkgc2tldy1kZWxheQpzYXlzOgoKICBza2V3LWRlbGF5OgogICAgJHJlZjogL3NjaGVt
YXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCiAgICBkZXNjcmlwdGlvbjoKICAgICAg
dGhpcyBhZmZlY3RzIHRoZSBleHBlY3RlZCBjbG9jayBza2V3IG9uIGlucHV0IHBpbnMKICAgICAg
YW5kIHRoZSBkZWxheSBiZWZvcmUgbGF0Y2hpbmcgYSB2YWx1ZSB0byBhbiBvdXRwdXQKICAgICAg
cGluLiBUeXBpY2FsbHkgaW5kaWNhdGVzIGhvdyBtYW55IGRvdWJsZS1pbnZlcnRlcnMgYXJlCiAg
ICAgIHVzZWQgdG8gZGVsYXkgdGhlIHNpZ25hbC4KClRoaXMgaW4gdHVybiBjb21lcyBmcm9tIHRo
ZSBvcmlnaW5hbApEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5j
dHJsLWJpbmRpbmdzLnR4dApkb2N1bWVudCwgd2hpY2ggaW4gdHVybiBjb21lcyBmcm9tIHRoaXMg
Y29tbWl0OgoKY29tbWl0IGUwZTFlMzlkZTQ5MGEyZDliOGExNzMzNjNjY2YyNDE1ZGRhZGE4NzEK
QXV0aG9yOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CkRhdGU6ICAg
U2F0IE9jdCAyOCAxNTozNzoxNyAyMDE3ICswMjAwCgogICAgcGluY3RybDogQWRkIHNrZXctZGVs
YXkgcGluIGNvbmZpZyBhbmQgYmluZGluZ3MKCiAgICBTb21lIHBpbiBjb250cm9sbGVycyAoc3Vj
aCBhcyB0aGUgR2VtaW5pKSBjYW4gY29udHJvbCB0aGUKICAgIGV4cGVjdGVkIGNsb2NrIHNrZXcg
YW5kIG91dHB1dCBkZWxheSBvbiBjZXJ0YWluIHBpbnMgd2l0aCBhCiAgICBzdWItbmFub3NlY29u
ZCBncmFudWxhcml0eS4gVGhpcyBpcyB0eXBpY2FsbHkgZG9uZSBieSBzaHVudGluZwogICAgaW4g
YSBudW1iZXIgb2YgZG91YmxlIGludmVydGVycyBpbiBmcm9udCBvZiBvciBiZWhpbmQgdGhlIHBp
bi4KICAgIE1ha2UgaXQgcG9zc2libGUgdG8gY29uZmlndXJlIHRoaXMgd2l0aCBhIGdlbmVyaWMg
YmluZGluZy4KCiAgICBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKICAgIEFja2VkLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgogICAgQWNrZWQtYnk6IEhhbnMgVWxsaSBL
cm9sbCA8dWxsaS5rcm9sbEBnb29nbGVtYWlsLmNvbT4KICAgIFNpZ25lZC1vZmYtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KClNvIGJ5IGxlZ2FjeSBza2V3LWRl
bGF5IGlzIGEgY3VzdG9tIGZvcm1hdCwgdXN1YWxseSB0aGUgbnVtYmVyIG9mCihkb3VibGUpIGlu
dmVydGVycy4KCkkgZG9uJ3QgcmVjYWxsIHRoZSByZWFzb24gZm9yIHRoaXMgd2F5IG9mIGRlZmlu
aW5nIHRoaW5ncywgYnV0IG9uZSByZWFzb24KY291bGQgYmUgdGhhdCB0aGUgc2tldy1kZWxheSBp
bmN1cnJlZCBieSB0d28gaW52ZXJ0ZXJzIGlzIHZlcnkKZGVwZW5kZW50IG9uIHRoZSBwcm9kdWN0
aW9uIG5vZGUgb2YgdGhlIHNpbGljb24sIGFuZCBjYW4gYmUKbmFub3NlY29uZHMgb3IgcGljb3Nl
Y29uZHMsIHRoZXNlIGRheXMgbW9zdGx5IHBpY29zZWNvbmRzLgpFeGFtcGxlOiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2FkaSxhZGluLnlhbWwKCkFudG9uaW8sIHdoYXQg
ZG8geW91IHNheT8gRG8geW91IGhhdmUgdGhlIGFjdHVhbCBza2V3IHBpY29zZWNvbmQKdmFsdWVz
IGZvciB0aGUgZGlmZmVyZW50IHNldHRpbmdzIHNvIHdlIGNvdWxkIGRlZmluZSB0aGlzIGFzCgpz
a2V3LWRlbGF5LWlucHV0LXBzOgpza2V3LWRlbGF5LW91dHB1dC1wczoKCmFuZCB0cmFuc2xhdGUg
aXQgdG8gdGhlIHJpZ2h0IHJlZ2lzdGVyIHZhbHVlcyBpbiB0aGUgZHJpdmVyPwoKSWYgd2UgaGF2
ZSB0aGUgcHJvcGVyIGRhdGEgdGhpcyBjb3VsZCBiZSBhIGdvb2QgdGltZSB0byBhZGQgdGhpcwpJ
U08gdW5pdCB0byB0aGVzZSB0d28gcHJvcHMuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
