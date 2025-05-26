Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34DAC44F7
	for <lists+linux-stm32@lfdr.de>; Mon, 26 May 2025 23:46:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF591C36B11;
	Mon, 26 May 2025 21:46:00 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED531C36B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 21:45:59 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id
 ada2fe7eead31-4dad6cc2be0so731323137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 May 2025 14:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748295959; x=1748900759;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=19reQAH/JFXrmKGSfsIuVcMSe5tUTaIhAmGB+5EzAyU=;
 b=dblsJEnmHkXyoZaBH1yeuxoqlQji/AL1DlSIs8BV0Fnu0Zg1zXvF9hTnAl485XDAYg
 slrfLAlKc3ks+hVBuQ3FP4f/P/GJPZmSxh4YuaNd8cnu4h6If84AHxKfJ5hUvEOPmVoh
 RTm/7Cna+Th7XQGtjtfSx2mLFx/zzFEHTjE3aSZtB0XFEgI+vLg6c0R8lrzldUYsngH7
 ExyOWvdmM6A4rlB8dHMp1nIENt7dlTCTO6uIvErFWBYCmXqQlhqVGoUVW5SOrrfQX5AQ
 G4ylBuxKUnOkwU3ocBdgoDCAAP9YTFtuKTgxtbkkZCLfa3AMxoijHgwKq5wOE1Asu/sN
 Squg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748295959; x=1748900759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=19reQAH/JFXrmKGSfsIuVcMSe5tUTaIhAmGB+5EzAyU=;
 b=IKYZClVUHrN3V1sGs5rBnQQ5lPcQQZrd60zwNSBg9sdTZvLB+bgf4swq6Cybx4iAi1
 0DYTv4SkQIpiO+uufFHcMfmhm+13KDAsOnAR8vIY2oiFMDEQ8tGmsSFnF5l2ReGIvIYQ
 4rxCl2NLhWNsZnxMGGpOifsh65H497oCRO7ytg/vFwEeh53xljDFaqzUp9QUIyWm5EXP
 7AIupPO/Q7mTzt11I/MB5Gyc/hDzq8lo1xLfNm8d+yYLLeX8JlWVDd9FwmBCOi7VZ/I1
 hmk8TlxVIk3VFYp8412kYzlcU8cDRaAXu+pEopDx8OgOQPh3pfjUvWNsPJCZeMq5c9+P
 y86Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoB3bIOLZaEkbiQVIcBCgi1CYRRFnJjjdEl4Gdc5FEmniAwMKpAylOkXxmOYJlG3EvQEHmoxEGZ4dtgg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwhdKkjbXr+egpHDKT2XalOGk8lRPq1dIrTVTKlpr3V9dHUTdY7
 X724tKvdDPVH15DU9wtZTtzncOl4GuattnRlzBHXIrrG9LkVix5AChI7LdFlsGlk40ZWOBUKwus
 HUhdn5vdIbZeXdJu4hXYNKrJCA3zMjhE=
X-Gm-Gg: ASbGncuzPHmsgCCMNqguqxOhECJIm0Jw3xk2QIUpejYLY4p0oXphou6Bht8BYF6sGIs
 atq5h+/YdvTgY0/H+IkHCPJSKjcO3+kDWQqr5cGlveFkTKFmoycD3n5I9abTw7OMSdVd9DFpKIs
 +LDU1tsoSEzdVld5hjsm0dHi5LEf/jv1BGPg==
X-Google-Smtp-Source: AGHT+IFotR6RyxU/ifwJ8AmbTwSsnUIU6QL7qlKuPNmt94jWJ9smNJz+SAYTONBfXHAq+tKlLbtbIPgWrf25oFYgN6o=
X-Received: by 2002:a05:6102:5244:b0:4dd:b82d:e0de with SMTP id
 ada2fe7eead31-4e42415fc45mr7977719137.17.1748295958811; Mon, 26 May 2025
 14:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250526182939.2593553-1-james.hilliard1@gmail.com>
 <20250526182939.2593553-2-james.hilliard1@gmail.com>
 <a2ac65eb-e240-48f1-b787-c57b5f3ce135@lunn.ch>
 <CADvTj4rO-thqYE3VZPE0B0fTTR_v=gJDAxBA3=fo501OL+qvNg@mail.gmail.com>
 <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
In-Reply-To: <5b7bf54e-4838-48b3-a357-70f117674523@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 May 2025 15:45:45 -0600
X-Gm-Features: AX0GCFuEfLkt9AfTQ9ECVkRYk1pIwbklJGqsNyxbFKVvoc0OdxtNfymBf0iJQt4
Message-ID: <CADvTj4pt48o0wm-69WfkOtp0c-aP64DSwPFo=znY2Hk_N2ft1w@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Samuel Holland <samuel@sholland.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Yanteng Si <si.yanteng@linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Paul Kocialkowski <paulk@sys-base.io>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Feiyang Chen <chenfeiyang@loongson.cn>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v1 2/3] net: stmmac: dwmac-sun8i: Allow
 runtime AC200/AC300 phy selection
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

T24gTW9uLCBNYXkgMjYsIDIwMjUgYXQgMzoyMuKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVu
bi5jaD4gd3JvdGU6Cj4KPiA+ID4gVGhlIG5vcm1hbCB3YXkgdG8gZG8gdGhpcyBpcyBwaHlfZmlu
ZF9maXJzdCgpLgo+ID4KPiA+IFN1cmUsIGJ1dCB0aGVyZSBhcmUgcHJvYmxlbXMgd2l0aCB0aGF0
IGFwcHJvYWNoIGhlcmUuCj4gPgo+ID4gVGhlIGluaXRpYWxpemF0aW9uIHNlcXVlbmNlcyBhcmUg
cmF0aGVyIGRpZmZlcmVudCBhbmQgdGhlIGRldmljZXMKPiA+IHdvbid0IGJlIHZpc2libGUgb24g
dGhlIG1kaW8gYnVzIHVudGlsIGFmdGVyIHRoZXkgYXJlIGluaXRpYWxpemVkLgo+ID4KPiA+IFRo
ZSByZXNldHMgd2lsbCBiZSBzcGVjaWZpYyB0byBlaXRoZXIgdGhlIEFDMjAwIG9yIEFDMzAwIHNv
IHdlCj4gPiBuZWVkIHRvIGNob29zZSB0aGUgY29ycmVjdCBQSFkgYmFzZWQgb24gdGhlIGVmdXNl
IHZhbHVlIHJhdGhlcgo+ID4gdGhhbiBhIG1kaW8gYnVzIHNjYW4gdG8gYXZvaWQgYSBjaXJjdWxh
ciBkZXBlbmRlbmN5IGVzc2VudGlhbGx5Lgo+ID4KPiA+IEFDMjAwOiBpMmMgYmFzZWQgcmVzZXQv
aW5pdCBzZXF1ZW5jZQo+ID4gQUMzMDA6IG1kaW8gYmFzZWQgcmVzZXQvaW5pdCBzZXF1ZW5jZQo+
Cj4gTy5LLiBzbyB5b3UgbmVlZCB0byBwb3N0IG1vcmUsIHNvIHdlIGdldCB0byBzZWUgdGhlIGNv
bXBsZXRlCj4gcHJvYmxlbS9zb2x1dGlvbi4gSXQgc2VlbXMgdG8gbWUsIEFDMjAwIGFuZCBBQzMw
MCBhcmUgbm90IGNvbXBhdGlibGUsCj4gc28gc2hvdWxkIGhhdmUgZGlmZmVyZW50IGNvbXBhdGli
bGUgc3RyaW5ncy4gVGhhdCBtaWdodCBiZSBwYXJ0IG9mIHRoZQo+IHNvbHV0aW9uLiBCdXQgaXQg
aXMgdG9vIGVhcmx5IHRvIHNheS4KClRoZXkgd2lsbCBuZWVkIHRvIHVzZSBkaWZmZXJlbnQgcmVz
ZXQgZHJpdmVycyBidXQgdGhlIG1hYyBwYXJ0IGlzCmxhcmdlbHkgdGhlIHNhbWUgQUZBSVUuIFRo
ZSBtZGlvIHBhcnQgaXMgc2ltaWxhciBhZnRlciBpbml0aWFsaXphdGlvbgphcyB3ZWxsIEkgdGhp
bmsuCgpUaGVzZSBhcmUgdGhlIHZlbmRvciBkb2NzKEkgb25seSBmb3VuZCBjaGluZXNlIHZlcnNp
b24gc28gZmFyKSB0aGF0CmhhdmUgc29tZSBtb3JlIGRldGFpbHMgb24gdGhlIEFDMjAwIGFuZCBB
QzMwMCBFUEhZJ3M6Cmh0dHA6Ly9maWxlLndoeWNhbi5jb20vZmlsZXMvMjAyMzA0L1Y4NXgvTGlu
dXhfRU1BQ18lZTUlYmMlODAlZTUlOGYlOTElZTYlOGMlODclZTUlOGQlOTcucGRmCgpUcmFuc2xh
dGVkIGltcG9ydGFudCBzZWN0aW9uczoKCkZvciBBQzIwMDoKQVJNIGNvbW11bmljYXRlcyB3aXRo
IEFDMjAwIHRocm91Z2ggVFdJLCBpbml0aWFsaXplcyBFUEhZLCBhbmQgdGhlbgpNQUMgYWNjZXNz
ZXMgdGhlIE1ESU8gYnVzLgpFUEhZLCBQV00gbW9kdWxlIHByb3ZpZGVzIGFuIGludGVybmFsIDI1
TSBjbG9jayB0byBFUEhZLgoKRm9yIEFDMzAwOgpBUk0gY29tbXVuaWNhdGVzIHdpdGggQUMzMDAg
dGhyb3VnaCBNRElPIGJ1cywgaW5pdGlhbGl6ZXMgRVBIWSwgYW5kCnRoZW4gTUFDIGFjY2Vzc2Vz
IEVQSFkgdGhyb3VnaCBNRElPIGJ1cy4gUFdNIG1vZHVsZSBwcm92aWRlcyBhbgppbnRlcm5hbAoy
NU0gY2xvY2sgdG8gRVBIWS4KClNvIHRoZSBNQUMgdG8gRVBIWSBjb25uZWN0aW9uIGlzIG1vcmUg
b3IgbGVzcyB0aGUgc2FtZSBBRkFJVSwKYnV0IHRoZSBpbml0aWFsaXphdGlvbiBpcyBxdWl0ZSBk
aWZmZXJlbnQuCgo+Cj4gICAgICAgICBBbmRyZXcKPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
