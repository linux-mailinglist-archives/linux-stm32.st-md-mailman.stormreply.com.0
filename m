Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 791BCABE73A
	for <lists+linux-stm32@lfdr.de>; Wed, 21 May 2025 00:35:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A9CBC7A821;
	Tue, 20 May 2025 22:35:02 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9E8BC78F9B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 22:35:00 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-328114b262aso41925451fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 May 2025 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747780500; x=1748385300;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
 b=wl19Ub0LPFQ3GK3ewZB8ObvLlDGecgWHk/f53SOAVRXrYpOsJeN98+8nCL4JZjynCV
 TyxCYy4xeZGZ3qWdhhxSYrCeTm4JcucLY8q92QvseWciQqZu8cCwJ5HIvnSYV4j4h2Ct
 Uedji9LlzC9I0av8by0tXmJ2hQg/9NApg7RDjDX2UYF6oCphlakW/WHjEyp9d+c5agmY
 BX8c/ygU2bXt4GOw2bYwbk9GtQ7jHEIdbgWtuZVF09sH/0tOk/UWWHZGkH3PXTXZBPwi
 3GAwxhsNVUPINP8OlScR8s86f6g9ryAmVXCqykad6axORjtckyb/95ecS1q84TWKFl+n
 /Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747780500; x=1748385300;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G2rh9i3/PUqd91HnT/agwHUBEJLIceaCRVKrhRf0A54=;
 b=q0DSri2c/mUOEbzQbvA4MGJqvbeQhLjbGOT5ctE2rpOFtS1yzXebMrEqB61ANZfvyP
 y7ydQ0znNSA7OmP6mp2dALr8+76oVlnJ5UvQmfT5urw2gkMg/6S6sAx3lfKDq+jorEZS
 tU+Jit+yepEAOkAWOVMe7C8PpQ5gDeNIyYsITYOVR5W5apurqNlTEOBbq3KuJ1Fq19SF
 +qG9WruBQtkk4kIzXlp8Dqm4QrKG0oYRV5qAx1932ChYVpQ8ofq2J7eaqBltYMyqpTob
 u1Ea/Eofpz+J8G27HUCUNN0AWisGVLfGsYhq7CpPvaQDYBYSFyij6UA5uqrZvHk5HSM1
 AIOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz6bFcfFQ7+HVI/omEJfF0JH8KAgM3l4t+tWAqH825pui2K6zAl4SWnooLds6rNn9B1vr2qNPViqh9Jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3UoIqphGILnjLyEHvfYz0KQ1/11yQJFdc4/LbYRvosQJWTXA9
 ngnzA/tVYUF5uL/LF4nEZy6sM2CCeOZg6dorK62vUsvQK5qNBUkDymvPIKwLdPoFEmIDJdUBDRI
 Zss3O1cscr/E2c309M+yJE70laQNaG+HPFpUnBVVq6Q==
X-Gm-Gg: ASbGnct8cKfkdY+0A99b4K51ioJF1QsB1V60Z0V5t+2+/Sgbv70uvL6rvs9RDW4KVK0
 PMd6jt+9exQAQhvznX7h0hc+zgdWf6vc+ngY7xrvgP6f99/gFI+fXI2+trziFCoDi7u1PTo8rIW
 GDrZtSQjkPpBt3lkcOzBW/QlFWfvQdu0z2vpS94++Jkys=
X-Google-Smtp-Source: AGHT+IG3zE80N3OdjZZgIj1CBi8G4bnNpTjDsApWfo+qPPNIniOdUu0Ts+pT4sWio2WYX62CWpyx5h4GPmpl48aN4uk=
X-Received: by 2002:a05:651c:f0a:b0:30b:ed8c:b1e7 with SMTP id
 38308e7fff4ca-32807728eb8mr48465441fa.18.1747780499896; Tue, 20 May 2025
 15:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-hdp-upstream-v2-0-53f6b8b5ffc8@foss.st.com>
 <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
In-Reply-To: <20250520-hdp-upstream-v2-2-53f6b8b5ffc8@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:34:48 +0200
X-Gm-Features: AX0GCFuW4vdoq3ZxavI5D-k3WcmH7E3A9H2e_P8Zln_7BppO66UxFChz04uYBvs
Message-ID: <CACRpkdZp6D-duzyVRLv5+PURb3Nu69njJx_33D-2aYS4DjmsoQ@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 2/8] pinctrl: stm32: Introduce HDP
	driver
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

SGkgQ2zDqW1lbnQsCgp0aGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBUdWUsIE1heSAyMCwgMjAy
NSBhdCA1OjA04oCvUE0gQ2zDqW1lbnQgTGUgR29mZmljCjxjbGVtZW50LmxlZ29mZmljQGZvc3Mu
c3QuY29tPiB3cm90ZToKCj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2UgdGhlIGRyaXZlciBmb3IgdGhl
IEhhcmR3YXJlIERlYnVnIFBvcnQgYXZhaWxhYmxlIG9uCj4gU1RNMzJNUCBwbGF0Zm9ybXMuIFRo
ZSBIRFAgYWxsb3dzIHRoZSBvYnNlcnZhdGlvbiBvZiBpbnRlcm5hbCBTb0MKPiBzaWduYWxzIGJ5
IHVzaW5nIG11bHRpcGxleGVycy4gRWFjaCBIRFAgcG9ydCBjYW4gcHJvdmlkZSB1cCB0byAxNgo+
IGludGVybmFsIHNpZ25hbHMgKG9uZSBvZiB0aGVtIGNhbiBiZSBzb2Z0d2FyZSBjb250cm9sbGVk
IGFzIGEgR1BPKS4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVu
dC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KCiguLi4pCj4gK3N0YXRpYyBpbnQgc3RtMzJfaGRwX2dw
aW9fZ2V0X2RpcmVjdGlvbihzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IG9mZnNl
dCkKPiArewo+ICsgICAgICAgcmV0dXJuIEdQSU9fTElORV9ESVJFQ1RJT05fT1VUOwo+ICt9CgpU
aGF0J3MgcmVhc29uYWJsZS4KCj4gK3N0YXRpYyBpbnQgc3RtMzJfaGRwX2dwaW9fZ2V0KHN0cnVj
dCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3Qgc3RtMzJfaGRwICpoZHAgPSBncGlvY2hpcF9nZXRfZGF0YShnYyk7Cj4gKwo+ICsgICAgICAg
aWYgKCgoaGRwLT5tdXhfY29uZiAmIEhEUF9NVVhfTUFTSyhvZmZzZXQpKSkgPT0gSERQX01VWF9H
UE9WQUwob2Zmc2V0KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuICEhKHJlYWRsX3JlbGF4ZWQo
aGRwLT5iYXNlICsgSERQX0dQT1ZBTCkgJiBCSVQob2Zmc2V0KSk7Cj4gKyAgICAgICBlbHNlCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAhIShyZWFkbF9yZWxheGVkKGhkcC0+YmFzZSArIEhEUF9W
QUwpICYgQklUKG9mZnNldCkpOwo+ICt9CgouLi5idXQgeW91IHN0aWxsIG1ha2UgaXQgcG9zc2li
bGUgdG8gcmVhZCB0aGUgdmFsdWUgb2YgdGhlIGxpbmUKaWYgaXQncyBub3QgbXV4ZWQgYXMgR1BP
PwoKU2hvdWxkIGl0IG5vdCBzdG0zMl9oZHBfZ3Bpb19nZXRfZGlyZWN0aW9uKCkgcmV0dXJuCkdQ
SU9fTElORV9ESVJFQ1RJT05fSU4gaWYgSERQX01VWF9NQVNLKG9mZnNldCkpKSAhPSBIRFBfTVVY
X0dQT1ZBTChvZmZzZXQpPwoKPiArc3RhdGljIHZvaWQgc3RtMzJfaGRwX2dwaW9fc2V0KHN0cnVj
dCBncGlvX2NoaXAgKmdjLCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCBpbnQgdmFsdWUpCj4gK3sKPiAr
ICAgICAgIHN0cnVjdCBzdG0zMl9oZHAgKmhkcCA9IGdwaW9jaGlwX2dldF9kYXRhKGdjKTsKPiAr
Cj4gKyAgICAgICBpZiAodmFsdWUpCj4gKyAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKEJJ
VChvZmZzZXQpLCBoZHAtPmJhc2UgKyBIRFBfR1BPU0VUKTsKPiArICAgICAgIGVsc2UKPiArICAg
ICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQoQklUKG9mZnNldCksIGhkcC0+YmFzZSArIEhEUF9H
UE9DTFIpOwo+ICt9CgpDYW4ndCB5b3UganVzdCB1c2UgR1BJT19HRU5FUklDIGZvciB0aGlzPwoK
YmdwaW9faW5pdChnYywgZGV2LCBBUlJBWV9TSVpFKHN0bTMyX2hkcF9waW5zKSwgLy8gPT0gOAog
ICAgaGRwLT5iYXNlICsgSERQX1ZBTCwKICAgIGhkcC0+YmFzZSArIEhEUF9HUE9TRVQsCiAgICBo
ZHAtPmJhc2UgKyBIRFBfR1BPQ0xSLAogICAgTlVMTCwKICAgIE5VTEwsCiAgICAwKTsKClRoZSBk
ZWZhdWx0IGJlaGF2aW91ciBvZiBHUElPIE1NSU8gaXMgdG8gcmVhZCB0aGUgb3V0cHV0IHJlZ2lz
dGVyCmZvciB0aGUgdmFsdWUgaWYgdGhlIGxpbmUgaXMgaW4gb3V0cHV0IG1vZGUuCgpZb3UgbWF5
IHdhbm5hIG92ZXJyaWRlIHRoZSAuZ2V0X2RpcmVjdGlvbigpIGNhbGxiYWNrIGFmdGVyIGJncGlv
X2luaXQoKQphbmQgYmVmb3JlIHJlZ2lzdGVyaW5nIHRoZSBjaGlwLCBlaXRoZXIgd2l0aCB3aGF0
IHlvdSBoYXZlIG9yIHdoYXQKSSBkZXNjcmliZWQgYWJvdmUuCgpZb3VycywKTGludXMgV2FsbGVp
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
