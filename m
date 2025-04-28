Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6E9A9F08F
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 14:23:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DDD8C78034;
	Mon, 28 Apr 2025 12:23:17 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50EDFC78011
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 12:23:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5A39F61160
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 12:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E735CC4CEF0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745842993;
 bh=HCz8DLodaQbrm+46dctr2oR/E7+SUsbNqLwypXlR7Sg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KpyCaYsQGtAyJOuUAwAEyx7KH4FWEFstaN/zDK8iSr8LyiS43doSjlzBK/wI1iEYm
 tgltI8g4gMIx2MAeXNiOdykXknUzjTvpubM6ehz0yaVFKHzQXaQUOyFmCZx3k413BB
 tfnURaLUnxKiRIyvL8DGHbkLk+Kx1ohTaHsH8g58pOmgiRdruSwPjKACmsGsVyTiVW
 tZWZ/2y+8b0eCTHHogjd5Z0oblaXN4DIFernU+aFGPypp7eCO3ZmIM4EYpcEgN3I4s
 4RXQk8u5PJhPyW3gWtw0gAuwQ6m9wsFEWVlC5Ydc945pAAkOLb023byD5wZcww8qzW
 zsry93j2gntNw==
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5e61da95244so8715132a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 05:23:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUpGwXzaoFEkajZcyaB84uthQ8ldlaztB5C5PZv/l0M6/MjMeunBrY3LxwglKZwyvgOlqVf/t8uWidfBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzYoqCfhogB1mQxvjf75Kw2rPQaXPYcQlIQ4hUU1HubQjYLyUzT
 d3WC289bAxU9PpZHth/2KsQR/k61EpKG2rD2xCuzSlEvkfV2iZqiFeWLzj5GDumRsFI7TuE5CK1
 Y5V4RAuJCO+1FyxQp6oIw53CL8A==
X-Google-Smtp-Source: AGHT+IG+CACbiiD2abOkp8tXfXmRr505UnyuCRTrkEYyr07DsjIb1ktiKdJ4ARe6OcGznQb9vjFUFmdjHww0FD53lpk=
X-Received: by 2002:a05:6402:d08:b0:5f4:370d:96c4 with SMTP id
 4fb4d7f45d1cf-5f7394d37ccmr7705350a12.0.1745842992502; Mon, 28 Apr 2025
 05:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
 <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
In-Reply-To: <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Apr 2025 07:23:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
X-Gm-Features: ATxdqUFE1MZW4VzC8-fvJOOKPGQbbAo554PCqhNSEgkFv0dfgvJlVI74jm4fy4w
Message-ID: <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: imx@lists.linux.dev, "Shah, Tanmay" <tanmay.shah@amd.com>,
 linux-remoteproc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 "Andrew F. Davis" <afd@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/4] of: Common "memory-region" parsing
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

T24gRnJpLCBBcHIgMjUsIDIwMjUgYXQgNjozNOKAr1BNIEl1bGlhbmEgUHJvZGFuIDxpdWxpYW5h
LnByb2RhbkBueHAuY29tPiB3cm90ZToKPgo+IEhlbGxvIE1hdGhpZXUsIFJvYiwKPgo+IEkndmUg
dGVzdGVkIGlteF9kc3BfcnByb2MgYW5kIGl0IGZhaWxzIHdpdGg6Cj4KPiBbICAgMzkuNzQzNzcw
XSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIGFkZHJl
c3MKPiBmZmZmZmZmZmZmZmZmZmVhCj4gLi4uCj4gWyAgIDM5LjgwNTA3OF0gSGFyZHdhcmUgbmFt
ZTogTlhQIGkuTVg4TVBsdXMgRVZLIGJvYXJkIChEVCkKPiBbICAgMzkuODEwMzkwXSBwc3RhdGU6
IDAwMDAwMDA1IChuemN2IGRhaWYgLVBBTiAtVUFPIC1UQ08gLURJVCAtU1NCUwo+IEJUWVBFPS0t
KQo+IFsgICAzOS44MTczNTNdIHBjIDogX19waV9tZW1zZXRfZ2VuZXJpYysweDUwLzB4MTg4Cj4g
WyAgIDM5LjgyMTg5Ml0gbHIgOiBpbXhfZHNwX3Jwcm9jX3ByZXBhcmUrMHgzYTQvMHhlYTQgW2lt
eF9kc3BfcnByb2NdCj4gWyAgIDM5LjgyODA3OV0gc3AgOiBmZmZmODAwMDg1M2RiYjEwCj4gWyAg
IDM5LjgzMTM5Nl0geDI5OiBmZmZmODAwMDg1M2RiYjkwIHgyODogMDAwMDAwMDA5MjQwMDAwMCB4
Mjc6Cj4gZmZmZjgwMDA3YTM2ZDNkOAo+IFsgICAzOS44Mzg1NDBdIHgyNjogZmZmZjAwMDBkMGE1
ZTQxMCB4MjU6IGZmZmY4MDAwN2EzNmQzZjAgeDI0Ogo+IDAwMDAwMDAwMDAwMDAwMDQKPiBbICAg
MzkuODQ1Njg1XSB4MjM6IGZmZmYwMDAwZDU0MTQ4ODAgeDIyOiBmZmZmMDAwMGQ1ZTFkY2U4IHgy
MToKPiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgIDM5Ljg1MjgyN10geDIwOiBmZmZmMDAwMGQ1ZTFk
Yjk4IHgxOTogZmZmZjAwMDBkNTQxNGI4MCB4MTg6Cj4gMDAwMDAwMDBmZmZmZmZmZgo+IFsgICAz
OS44NTk5NzBdIHgxNzogMjAyYzY1NmM2OTY4NzcyMCB4MTY6IDNlMjA3NDc1NmY2NTc2NzIgeDE1
Ogo+IGZmZmY4MDAwODFmOGQwNTAKPiBbICAgMzkuODY3MTE0XSB4MTQ6IGZmZmYwMDAwZGI1ODQ2
ODAgeDEzOiAwMDAwMDAwMDAwMDAwMDAzIHgxMjoKPiAwMDAwN2ZmZmEzMzMwMDAwCj4gWyAgIDM5
Ljg3NDI1N10geDExOiAwMDAwMDAwMDAwMDAwMDA0IHgxMDogMDAwMDAwMDAwMDAwMGFiMCB4OSA6
Cj4gMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAzOS44ODE0MDBdIHg4IDogZmZmZmZmZmZmZmZmZmZl
YSB4NyA6IDAwMDAwMDAwMDAwMDAwMDAgeDYgOgo+IDAwMDAwMDAwMDAwMDAwM2YKPiBbICAgMzku
ODg4NTQ2XSB4NSA6IDAwMDAwMDAwMDAwMDAwNDAgeDQgOiAwMDAwMDAwMDAwMDAwMDA2IHgzIDoK
PiAwMDAwMDAwMDAwMDAwMDA0Cj4gWyAgIDM5Ljg5NTY4OV0geDIgOiAwMDAwMDAwMDAwMDA4MDAw
IHgxIDogMDAwMDAwMDAwMDAwMDAwMCB4MCA6Cj4gZmZmZmZmZmZmZmZmZmZlYQo+IFsgICAzOS45
MDI4MzddIENhbGwgdHJhY2U6Cj4gWyAgIDM5LjkwNTI4NF0gIF9fcGlfbWVtc2V0X2dlbmVyaWMr
MHg1MC8weDE4OCAoUCkKPiBbICAgMzkuOTA5ODIxXSAgcnByb2NfYm9vdCsweDJjMC8weDUyNAo+
IFsgICAzOS45MTMzMTddICBzdGF0ZV9zdG9yZSsweDQwLzB4MTAwCj4gWyAgIDM5LjkxNjgxMl0g
IGRldl9hdHRyX3N0b3JlKzB4MTgvMHgyYwo+IFsgICAzOS45MjA0NzhdICBzeXNmc19rZl93cml0
ZSsweDdjLzB4OTQKPiBbICAgMzkuOTI0MTQ2XSAga2VybmZzX2ZvcF93cml0ZV9pdGVyKzB4MTIw
LzB4MWU4Cj4gWyAgIDM5LjkyODU5OF0gIHZmc193cml0ZSsweDI0NC8weDM3Ywo+IFsgICAzOS45
MzIwMDhdICBrc3lzX3dyaXRlKzB4NzAvMHgxMTAKPiBbICAgMzkuOTM1NDEzXSAgX19hcm02NF9z
eXNfd3JpdGUrMHgxYy8weDI4Cj4gWyAgIDM5LjkzOTM0Ml0gIGludm9rZV9zeXNjYWxsKzB4NDgv
MHgxMDQKPiBbICAgMzkuOTQzMDk0XSAgZWwwX3N2Y19jb21tb24uY29uc3Rwcm9wLjArMHhjMC8w
eGUwCj4gWyAgIDM5Ljk0NzgwNV0gIGRvX2VsMF9zdmMrMHgxYy8weDI4Cj4gWyAgIDM5Ljk1MTEy
M10gIGVsMF9zdmMrMHgzMC8weGNjCj4gWyAgIDM5Ljk1NDE4OF0gIGVsMHRfNjRfc3luY19oYW5k
bGVyKzB4MTBjLzB4MTM4Cj4gWyAgIDM5Ljk1ODU0OV0gIGVsMHRfNjRfc3luYysweDE5OC8weDE5
Ywo+IFsgICAzOS45NjIyMjJdIENvZGU6IGQ2NWYwM2MwIGNiMDgwM2U0IGYyNDAwYzg0IDU0MDAw
MDgwIChhOTAwMWQwNykKPiBbICAgMzkuOTY4MzE3XSAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAw
MDAwMDAwIF0tLS0KPgo+IFRoZSBwcm9ibGVtIHNlZW1zIHRvIGJlIHdoZW4gY29tcHV0aW5nIGBj
cHVfYWRkciA9Cj4gZGV2bV9pb3JlbWFwX3Jlc291cmNlX3djKGRldiwgJnJlcyk7YCwgaW4gcGF0
Y2ggNC4KPiBJbiBgX19kZXZtX2lvcmVtYXBfcmVzb3VyY2VgIChzZWUgWzFdKSwgaXQncyBleHBl
Y3RpbmcgdGhlIHJlc291cmNlIHR5cGUKPiB0byBiZSBgSU9SRVNPVVJDRV9NRU1gLCB3aGljaCBp
cyBub3QgdGhlIGNhc2UgaGVyZSAoYXQgbGVhc3QgdGhlIGZsYWdzCj4gYXJlIG5vd2hlcmUgc2V0
IGZvciB0aGlzKS4KClRoYW5rcyBmb3IgdGVzdGluZyBhbmQgZGlhZ25vc2luZy4gSU9SRVNPVVJD
RV9NRU0gbmVlZHMgdG8gYmUgc2V0LiBDYW4KeW91IHRlc3Qgd2l0aCB0aGlzIGNoYW5nZToKCmlu
ZGV4IGY4NzkxNWNjZTk2MS4uMDBjOTM1ODU3NThmIDEwMDY0NAotLS0gYS9kcml2ZXJzL29mL29m
X3Jlc2VydmVkX21lbS5jCisrKyBiL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKQEAgLTc3
MSw2ICs3NzEsNyBAQCBpbnQgb2ZfcmVzZXJ2ZWRfbWVtX3JlZ2lvbl90b19yZXNvdXJjZShjb25z
dApzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
CgogICAgICAgIHJlc291cmNlX3NldF9yYW5nZShyZXMsIHJtZW0tPmJhc2UsIHJtZW0tPnNpemUp
OworICAgICAgIHJlcy0+ZmxhZ3MgPSBJT1JFU09VUkNFX01FTTsKICAgICAgICByZXMtPm5hbWUg
PSBybWVtLT5uYW1lOwogICAgICAgIHJldHVybiAwOwogfQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
