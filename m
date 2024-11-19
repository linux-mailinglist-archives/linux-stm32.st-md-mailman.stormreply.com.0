Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA779D265C
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 14:06:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D29B5C78F9A;
	Tue, 19 Nov 2024 13:06:03 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CA855C78F99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 13:06:02 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53d9ff8f1e4so3677931e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 05:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732021561; x=1732626361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r5SnbOSPJM2xbQk5uUW2SdrCV3aSiK5t/lke9tIy5ZM=;
 b=eUmwJVpLQTxW1kp48OJpGrpAkAmFhRySGh+vGDgQbTm+1PZaZPUO6jT/T/ERhUgmxY
 mSn+YBphsJwaNrKA0oaYDi1BkNKvPhuQR9Y8U1fE2HaXF8N6ApOXlWocYbX+LLkry/CD
 ACyWA6Gk5M0dyuQli6o1YKvt0Mxozev5nBRlHSJqhMpTWhaJrByDU7a5hCUWKwFf7aNG
 ibu5Kz5KomW0gPuOa5SoCk+ZU45xGHp40x2aYclOBPTI4qks2fiyyAXSjNTmjGG+W79C
 QGusLASn+lcAQwZj/jCcY6FnmjpsGiH3sRvvO5kt7Jz3XLIWd/nL37C9W9klGW91Utjr
 Kyew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRCGUUE0UyFEzcltbkazCqlJwecc00qfU/rBkV4rokngm57Bqovl4hixGf0WTzdEMzZRP/wIcApfdGPQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzXFIcq3L13EkVV6TDsiRoSI/wCnKzGtVKota6SPotxuICin92f
 2pA4I5v5QeDJsxGHoXPF47QEuDMthCPAb3Qk7hBl12UKTPNU0OnFTGGETPC0
X-Google-Smtp-Source: AGHT+IE4PxK9Fk8oCgUXceS7ClK0fm7pX7g1bXYinrsb5LFBAcSsWPYSvjB2msuQa6dUVExGuHOoog==
X-Received: by 2002:a05:6512:10d6:b0:53d:a9a4:73c1 with SMTP id
 2adb3069b0e04-53dab2b9833mr6979419e87.39.1732021561061; 
 Tue, 19 Nov 2024 05:06:01 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbd46733asm294784e87.149.2024.11.19.05.05.54
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 05:06:00 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2fb5014e2daso26587911fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 05:05:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW7s7MrD1TU2xUz4NimkHwPkkJaQ3MOwiD6OiDJa7lkalBdYgJ7B+qQE+maawh+ObNaatxgrgyn4K1Pcw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:651c:1582:b0:2f7:4cf1:d6b1 with SMTP id
 38308e7fff4ca-2ff606226a5mr76184521fa.1.1732021553921; Tue, 19 Nov 2024
 05:05:53 -0800 (PST)
MIME-Version: 1.0
References: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <6f0297ba884c670d604232c2861347940082c8e6.1732004078.git.u.kleine-koenig@baylibre.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 19 Nov 2024 22:05:42 +0900
X-Gmail-Original-Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
Message-ID: <CAGb2v66f6WEYYVm+UQzmz_V87Vqt4BSUkoW5S_qqr_arczc6ug@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: imx@lists.linux.dev, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Samuel Holland <samuel@sholland.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-sunxi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] mailbox: Switch back to struct
	platform_driver::remove()
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCBOb3YgMTksIDIwMjQgYXQgNToxN+KAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAYmF5bGlicmUuY29tPiB3cm90ZToKPgo+IEFmdGVyIGNvbW1pdCAwZWRiNTU1
YTY1ZDEgKCJwbGF0Zm9ybTogTWFrZSBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZSgpCj4gcmV0dXJu
IHZvaWQiKSAucmVtb3ZlKCkgaXMgKGFnYWluKSB0aGUgcmlnaHQgY2FsbGJhY2sgdG8gaW1wbGVt
ZW50IGZvcgo+IHBsYXRmb3JtIGRyaXZlcnMuCj4KPiBDb252ZXJ0IGFsbCBwbGF0Zm9ybSBkcml2
ZXJzIGJlbG93IGRyaXZlcnMvbWFpbGJveCB0byB1c2UgLnJlbW92ZSgpLAo+IHdpdGggdGhlIGV2
ZW50dWFsIGdvYWwgdG8gZHJvcCBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVfbmV3KCku
IEFzCj4gLnJlbW92ZSgpIGFuZCAucmVtb3ZlX25ldygpIGhhdmUgdGhlIHNhbWUgcHJvdG90eXBl
cywgY29udmVyc2lvbiBpcyBkb25lCj4gYnkganVzdCBjaGFuZ2luZyB0aGUgc3RydWN0dXJlIG1l
bWJlciBuYW1lIGluIHRoZSBkcml2ZXIgaW5pdGlhbGl6ZXIuCj4KPiBNYWtlIGEgZmV3IGluZGVu
dGlvbnMgY29uc2lzdGVudCB3aGlsZSB0b3VjaGluZyB0aGVzZSBzdHJ1Y3QKPiBpbml0aWFsaXpl
cnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QGJheWxpYnJlLmNvbT4KPiAtLS0KPiBIZWxsbywKPgo+IEkgZGlkIGEgc2luZ2xlIHBhdGNoIGZv
ciBhbGwgb2YgZHJpdmVycy9tYWlsYm94LiBXaGlsZSBJIHVzdWFsbHkgcHJlZmVyCj4gdG8gZG8g
b25lIGxvZ2ljYWwgY2hhbmdlIHBlciBwYXRjaCwgdGhpcyBzZWVtcyB0byBiZSBvdmVyZW5naW5l
ZXJpbmcKPiBoZXJlIGFzIHRoZSBpbmRpdmlkdWFsIGNoYW5nZXMgYXJlIHJlYWxseSB0cml2aWFs
IGFuZCBzaG91bGRuJ3QgYmUgbXVjaAo+IGluIHRoZSB3YXkgZm9yIHN0YWJsZSBiYWNrcG9ydHMu
IEJ1dCBJJ2xsIGhhcHBpbHkgc3BsaXQgdGhlIHBhdGNoIGlmIHlvdQo+IHByZWZlciBpdCBzcGxp
dC4KPgo+IFRoaXMgaXMgYmFzZWQgb24gdG9kYXkncyBuZXh0LCBpZiBjb25mbGljdHMgYXJpc2Ug
d2hlbiB5b3UgYXBwbHkgaXQgYXQKPiBzb21lIGxhdGVyIHRpbWUgYW5kIGRvbid0IHdhbnQgdG8g
cmVzb2x2ZSB0aGVtLCBmZWVsIGZyZWUgdG8ganVzdCBkcm9wCj4gdGhlIGNoYW5nZXMgdG8gdGhl
IGNvbmZsaWN0aW5nIGZpbGVzLiBJJ2xsIG5vdGljZSBhbmQgZm9sbG93dXAgYXQgYQo+IGxhdGVy
IHRpbWUgdGhlbi4gT3IgYXNrIG1lIGZvciBhIGZpeGVkIHJlc2VuZC4KPgo+IEJlc3QgcmVnYXJk
cwo+IFV3ZQo+Cj4gIGRyaXZlcnMvbWFpbGJveC9iY20tZmxleHJtLW1haWxib3guYyAgICB8IDIg
Ky0KPiAgZHJpdmVycy9tYWlsYm94L2JjbS1wZGMtbWFpbGJveC5jICAgICAgIHwgMiArLQo+ICBk
cml2ZXJzL21haWxib3gvaW14LW1haWxib3guYyAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMv
bWFpbGJveC9tYWlsYm94LXRlc3QuYyAgICAgICAgICB8IDQgKystLQo+ICBkcml2ZXJzL21haWxi
b3gvbXRrLWNtZHEtbWFpbGJveC5jICAgICAgfCAyICstCj4gIGRyaXZlcnMvbWFpbGJveC9xY29t
LWFwY3MtaXBjLW1haWxib3guYyB8IDIgKy0KPiAgZHJpdmVycy9tYWlsYm94L3Fjb20taXBjYy5j
ICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21haWxib3gvc3RtMzItaXBjYy5jICAgICAg
ICAgICAgfCAyICstCgoKPiAgZHJpdmVycy9tYWlsYm94L3N1bjZpLW1zZ2JveC5jICAgICAgICAg
IHwgNCArKy0tCgpBY2tlZC1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zQGNzaWUub3JnPgoKPiAgZHJp
dmVycy9tYWlsYm94L3RlZ3JhLWhzcC5jICAgICAgICAgICAgIHwgMiArLQo+ICBkcml2ZXJzL21h
aWxib3gvenlucW1wLWlwaS1tYWlsYm94LmMgICAgfCAyICstCj4gIDExIGZpbGVzIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
