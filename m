Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F819D6C86
	for <lists+linux-stm32@lfdr.de>; Sun, 24 Nov 2024 04:09:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65CCAC78F70;
	Sun, 24 Nov 2024 03:09:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89D2DC78F6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 24 Nov 2024 03:09:36 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-724e14b90cfso1536902b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Nov 2024 19:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732417775; x=1733022575;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+SmZ5O1idyx9nxxUYpNJ/ay8b6RbqKKFo2QgDR4SSw=;
 b=Ir8fF+JebkyV/SldAwFlXbZ+ZvBHH1Wuv8sZHtzNdGTegNWHB0N0d+L5BYuCODLSa4
 jQWqOpZD/njNKEtOUuLqxBu820RFe8ggE+4QT8AqQtQBprlHE4KUzEdUKCR602vQ8J99
 3WuEvw7XI3rbQiEvmI+EBqWIlEUCjZSz3e9OrmSDt8ps/oUhQhLF79bZqnWh2zv7forz
 ii6ha4VIsscXAaPtviPZflTpRAQuHY8B2bB+Kx81AFqk/ATb4cH+IH0j+m04UEGB6fGf
 JUk0nB5IMcwDEMpi1x1SVaf8rh5wCvohnwJ2BTq0KHYr48vk+zJomjcOJF2Hr3TKz0vv
 p6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732417775; x=1733022575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+SmZ5O1idyx9nxxUYpNJ/ay8b6RbqKKFo2QgDR4SSw=;
 b=SGkbfciSGE1iPqflMKocFmVeLo8VFfWk5fZDaOsaBc+tNGBmwu91AQCYC66w+TPlcC
 3QqNn56DtGhLB7i0eamhMO2XQrWZXu0NeGHnO5YvDY6acbRgETOkgxMo4MM+or5UuQRO
 Ng9Nw7JP8nyE8yyTO4rgZS1PF0Wv/NfUb0xTjXr+kj7S/W3pXkKqRrnmUjNhp7hzjhWn
 xuaNE+47w41opuHhvSXyoQhvT8SHtITzh8JrGyZ7PiuZz7zOXrLMrQ5Pb3GJ5L8U8QLg
 A6xr/5K5PL6hftL15W96uSmny97C2os+GP5jat8NHqR0VkHdplPemz9bDWH+TGM0vjfv
 vckw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWLbqiPKpH8IlwtRs+0/gC6aIj/83u/jogwg0JIrX2dvFGhhgG0PeaBnfF/pXUj1fNoZqQvsibqksOvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyqQhN42EvavGBh5HiG1yLzZv7zwWXGD5oSeTUcbQ4vc3GLue88
 tUlYjbmAiK/VaIzvwRN82a/mBQ1i1jBIzn2ruBm/U3fSa6DjiZC6j0mJrPVu8pB7Uqz4GOaccka
 fuYZ4DM09ylJfUEM/RrEDNDetjPs=
X-Gm-Gg: ASbGncu+YOkvJfwkScYZ2FnNHZ2ZqfOQ04c4egPotCyDKGlGykkEfsSGBcVwOe8mG/B
 1DXH+AvKoFe50Gy1zMhc38fSylqsq1P0=
X-Google-Smtp-Source: AGHT+IG0Y23MhsftEXKYRfu9HiZmUraCNXR69wteGncoeREYFexmu0TkcVsDHI751SLBgXR/i8ns8wQeV0KiejYebOU=
X-Received: by 2002:a17:903:244b:b0:211:f6e4:d68e with SMTP id
 d9443c01a7336-2129fce2e23mr120152755ad.10.1732417774793; Sat, 23 Nov 2024
 19:09:34 -0800 (PST)
MIME-Version: 1.0
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 23 Nov 2024 21:09:23 -0600
Message-ID: <CAHCN7xJr-sXPGMr7aPH=-Cg+-YQMYChY0u6UNuH5rH8g6cpXhg@mail.gmail.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Erling Ljunggren <hljunggr@cisco.com>, linux-media@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Ricardo Ribalda <ribalda@chromium.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [Linux-stm32] [PATCH v3 0/3] Add WebP support to hantro decoder
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

T24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgNzoyMuKAr0FNIEh1Z3VlcyBGcnVjaGV0CjxodWd1ZXMu
ZnJ1Y2hldEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4KPiBBZGQgV2ViUCBpbWFnZSBkZWNvZGluZyBz
dXBwb3J0IHRvIHN0YXRlbGVzcyBWNEwyIFZQOCBkZWNvZGVyLgo+Cj4gVGhpcyBoYXZlIGJlZW4g
dGVzdGVkIG9uIFNUTTMyTVAyNTctRVYgYm9hcmQgdXNpbmcgR1N0cmVhbWVyLgoKSSB3YW50IHRv
IHRlc3QgdGhpcyBvbiBhbiBpLk1YOE0gTWluaS4gIElzIHRoZXJlIGEgY2VydGFpbiBnc3RyZWFt
ZXIKdmVyc2lvbiBvciBicmFuY2ggSSBzaG91bGQgdXNlLCBvciBpcyAxLjI0IHN1ZmZpY2llbnQ/
CgphZGFtCj4KPiBTaW1wbGUgYmFzaWMgdGVzdDoKPiAkPiB3Z2V0IGh0dHBzOi8vd3d3LmdzdGF0
aWMuY29tL3dlYnAvZ2FsbGVyeS8xLndlYnAKPiAkPiBnc3QtbGF1bmNoLTEuMCBmaWxlc3JjIGxv
Y2F0aW9uPSAxLndlYnAgISB0eXBlZmluZCAhIHY0bDJzbHdlYnBkZWMgISBpbWFnZWZyZWV6ZSBu
dW0tYnVmZmVycz0yMCAhIHdheWxhbmRzaW5rIGZ1bGxzY3JlZW49dHJ1ZQo+Cj4gU2xpZGVzaG93
IG9mIGEgc2V0IG9mIFdlYlAgcGljdHVyZXMgYW5kIFdlYk0gdmlkZW8gZmlsZXM6Cj4gJD4gd2dl
dCBodHRwczovL3d3dy5nc3RhdGljLmNvbS93ZWJwL2dhbGxlcnkvMi53ZWJwCj4gJD4gd2dldCBo
dHRwczovL3d3dy5nc3RhdGljLmNvbS93ZWJwL2dhbGxlcnkvMy53ZWJwCj4gJD4gd2dldCBodHRw
czovL3d3dy5nc3RhdGljLmNvbS93ZWJwL2dhbGxlcnkvNC53ZWJwCj4gJD4gd2dldCBodHRwczov
L3d3dy5nc3RhdGljLmNvbS93ZWJwL2dhbGxlcnkvNS53ZWJwCj4gJD4gd2dldCBodHRwczovL3Nh
bXBsZW1lZGlhLmxpbmFyby5vcmcvVlA4L2JpZ19idWNrX2J1bm55XzQ4MHBfVlA4X1ZPUkJJU18y
NWZwc18xOTAwS19zaG9ydC5XZWJNCj4gJD4gZ3N0LXBsYXktMS4wICoud2VicCAqLndlYm0gKi5X
ZWJNIC0td2FpdC1vbi1lb3MKPiA8aGl0IGtleSAiPiIgdG8gZGlzcGxheSBuZXh0IGZpbGUgPgo+
Cj4gTGFyZ2UgV2ViUCBpbWFnZSA+IDE2Nzc3MjE1IChzaXplID4gMl4yNCkKPiAkPiBnc3QtbGF1
bmNoLTEuMCBmYWtlc3JjIG51bS1idWZmZXJzPTEgZm9ybWF0PTQgZG8tdGltZXN0YW1wPXRydWUg
ZmlsbHR5cGU9MyBzaXpldHlwZT0yIHNpemVtYXg9MjUxNjU4MjQgYmxvY2tzaXplPTI1MTY1ODI0
ICEgdmlkZW8veC1yYXcsIGZvcm1hdD1JNDIwLCB3aWR0aD00MDk2LCBoZWlnaHQ9MzA3MiwgZnJh
bWVyYXRlPTEvMSAhIHdlYnBlbmMgcXVhbGl0eT0xMDAgISBmaWxlc2luayBsb2NhdGlvbj00MDk2
eDMwNzJfSFFfcmFuZG9tLndlYnAKPiAkPiBscyAtbCA0MDk2eDMwNzJfSFFfcmFuZG9tLndlYnAK
PiBbLi4uXSAxNjg3NzQwNCBOb3YgMjAgMTE6NDAgNDA5NngzMDcyX0hRX3JhbmRvbS53ZWJwCj4g
JD4gZ3N0LWxhdW5jaC0xLjAgZmlsZXNyYyBsb2NhdGlvbj0gNDA5NngzMDcyX0hRX3JhbmRvbS53
ZWJwIGJsb2Nrc2l6ZT0xNjg3NjYxMCAhIGltYWdlL3dlYnAsIHdpZHRoPTEsIGhlaWdodD0xLCBm
cmFtZXJhdGU9MC8xICEgdjRsMnNsd2VicGRlYyAhIGltYWdlZnJlZXplIG51bS1idWZmZXJzPTIw
ICEgd2F5bGFuZHNpbmsgZnVsbHNjcmVlbj10cnVlCj4KPiBMYXJnZSBXZWJQIGltYWdlIGRlY29k
aW5nIHVzaW5nIHBvc3QtcHJvY2Vzc29yIGlzIHVudGVzdGVkIGJlY2F1c2Ugb2YgbGFjawo+IG9m
IGhhcmR3YXJlIHN1cHBvcnQgb24gdGhpcyBwbGF0Zm9ybSwgbmV2ZXJ0aGVsZXNzIHN1cHBvcnQg
aXMgcHJvdmlkZWQgaW4KPiB0aGlzIHNlcmllIGZvciBmdXJ0aGVyIHRlc3Rpbmcgb24gYW5vdGhl
ciBwbGF0Zm9ybSBoYXZpbmcgcG9zdC1wcm9jZXNzb3IKPiBzdXBwb3J0Lgo+Cj4gPT09PT09PT09
PT0KPiA9IGhpc3RvcnkgPQo+ID09PT09PT09PT09Cj4gdmVyc2lvbiAzOgo+ICAgIC0gRml4IHJl
bWFya3MgZnJvbSBOaWNvbGFzIER1ZnJlc25lOgo+ICAgICAtIERvY3VtZW50IGNvbnN0cmFpbnQg
YWJvdXQga2V5IGZyYW1lIG9ubHkgZm9yIFdlYlAKPiAgICAgLSBGaXggcmViYXNlIGlzc3VlCj4g
ICAgLSBGaXggdHlwbyBkZXRlY3RlZCBieSBEaWVkZXJpayBkZSBIYWFzCj4KPiB2ZXJzaW9uIDI6
Cj4gICAgLSBGaXggcmVtYXJrcyBmcm9tIE5pY29sYXMgRHVmcmVzbmU6Cj4gICAgIC0gVXNlIGJ5
dGVzcGVybGluZSBoZWxwZXIgdG8gY29tcHV0ZSBjaHJvbWEgc2l6ZQo+ICAgICAtIEludHJvZHVj
ZSBhIG5ldyBleHBsaWNpdCBXRUJQIGZyYW1lIGNvbXByZXNzZWQgZm9ybWF0Cj4gICAgICAgaW5z
dGVhZCBvZiByZWx5aW5nIG9uIFZQOCArIFdlYlAgZmxhZwo+ICAgICAtIDRLIHN1cHBvcnQgaW4g
Ym90aCBkZWNvZGVyIGFuZCBwb3N0LXByb2MKPgo+IHZlcnNpb24gMToKPiAgIC0gSW5pdGlhbCBz
dWJtaXNzaW9uCj4KPiBIdWd1ZXMgRnJ1Y2hldCAoMyk6Cj4gICBtZWRpYTogdWFwaTogYWRkIFdl
YlAgdUFQSQo+ICAgbWVkaWE6IHZlcmlzaWxpY29uOiBhZGQgV2ViUCBkZWNvZGluZyBzdXBwb3J0
Cj4gICBtZWRpYTogdmVyaXNpbGljb246IHBvc3Rwcm9jOiA0SyBzdXBwb3J0Cj4KPiAgLi4uL3Vz
ZXJzcGFjZS1hcGkvbWVkaWEvdjRsL2JpYmxpby5yc3QgICAgICAgICAgfCAgOSArKysrKysrKysK
PiAgLi4uL21lZGlhL3Y0bC9waXhmbXQtY29tcHJlc3NlZC5yc3QgICAgICAgICAgICAgfCAxNyAr
KysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3ZlcmlzaWxpY29uL2hh
bnRyby5oICAgICB8ICAyICsrCj4gIC4uLi9tZWRpYS9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50
cm9fZzFfcmVncy5oIHwgIDMgKystCj4gIC4uLi9wbGF0Zm9ybS92ZXJpc2lsaWNvbi9oYW50cm9f
ZzFfdnA4X2RlYy5jICAgIHwgMTQgKysrKysrKysrKysrKysKPiAgLi4uL3BsYXRmb3JtL3Zlcmlz
aWxpY29uL2hhbnRyb19wb3N0cHJvYy5jICAgICAgfCAgNiArKysrKy0KPiAgLi4uL21lZGlhL3Bs
YXRmb3JtL3ZlcmlzaWxpY29uL2hhbnRyb192NGwyLmMgICAgfCAgMiArKwo+ICAuLi4vcGxhdGZv
cm0vdmVyaXNpbGljb24vc3RtMzJtcDI1X3ZwdV9ody5jICAgICB8IDE3ICsrKysrKysrKysrKysr
Ky0tCj4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyAgICAgICAgICAgIHwg
IDEgKwo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmlkZW9kZXYyLmggICAgICAgICAgICAgICAgICB8
ICAxICsKPiAgMTAgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPgo+IC0tCj4gMi4yNS4xCj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
