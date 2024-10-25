Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC39B00D9
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Oct 2024 13:05:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABA1DC78021;
	Fri, 25 Oct 2024 11:05:17 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0BF2C6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 11:05:10 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-539983beb19so2436634e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Oct 2024 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729854310; x=1730459110;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JuomQA4el8BSAut2vwLq507qc8/7nzyKhdkv644V4tk=;
 b=LYQPgW7t+fDdnVhFedmdtM6P+ln2yC17Wjf1B8Iu5//n3aUNJPJcKISpIKqn3DUsiN
 +uNMR5MhjEVAARHSa2DrTJx8SsNVOG5/Zm/ypjw10MG3VCIZ/aRpdyEVE6oY4p9DKGnK
 MKTNYP1Usgw4vJ806Dy8eeeTgGXkMpZtXl4840n/DPKWjEvP6VFgRUByE7muxcnQphQJ
 uIQeCVLjwv3yK+e0olhSsZsjmziRNx8a3f2OiYmv2szmab0rb5ZSpT7alQuBqhiGgMTi
 vbiBRwIosAHvxdz/oNM2i++PhfWjElqVhxl5LktrqlvIqKbKiY+1IUfSLdv2q62CQ5Lv
 Nvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729854310; x=1730459110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JuomQA4el8BSAut2vwLq507qc8/7nzyKhdkv644V4tk=;
 b=AiZlyeRauvLtVP6x+VAR4fnyuN4t4CiNqTlk4m2vYKLBy1JCYiOLoxOmud/kyRJClA
 Xr6usKaFFv7tgWQJRewT34kee5EZ9glpAdI0TWaZSjCydqhsy7glRg+mX5p/7/bYZ+hm
 lEZ9EZSkoSXOhUgy6eKte2tbObKdEhDAk3VATMqsxmuY+HJOyOgwQZd+rSdpmFgHoe+M
 GFsyGZiSZOYxDHpPhhwzzV9gAn1sZMyT1YZlJS63gPbcu+IepiGFRbJVZZ1TfQCbjMy6
 pCuOk3dIieWKGmoXirNA1r5kMc3wL49citi27yR0we2c2s313Ig3YjEjv5UK1TuUNIa0
 VxvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkaONkLW6s07P0MkI2d5FAhWthp+x+jz1mnMoRDeZi1hd4o5UWWqd4MlHVCdXtZ+z0NILduFoU2a5nTA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy8aAbA0zZfFMZHfEMSzSKbpVPdsKt1+8LcEdHQTeGMOglkA1zH
 JGUWRQ+bnkPsHhdxkN+CyMPO3WJ8AjE7qLLrtz1pRm+ei2wvkno9RzfOcAbJQfoYA/OhV6IRq+g
 rqCcB8Dp7h2kMqaAKvAjEhnrJAoOckCb6kU7JmQ==
X-Google-Smtp-Source: AGHT+IE3hHhqGmpopThdU7fUZ90CNqImMKu3l7SDYMnc1DU7abvZQL9XTwbVyoLLrq2iIOMeoYVGfYC3GvxR504MoZA=
X-Received: by 2002:a05:6512:3996:b0:539:f593:c19e with SMTP id
 2adb3069b0e04-53b1a3b018amr5062359e87.60.1729854309787; Fri, 25 Oct 2024
 04:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241017-arm-kasan-vmalloc-crash-v3-0-d2a34cd5b663@linaro.org>
 <20241017-arm-kasan-vmalloc-crash-v3-1-d2a34cd5b663@linaro.org>
 <69f71ac8-4ba6-46ed-b2ab-e575dcada47b@foss.st.com>
 <CACRpkdYvgZj1R4gAmzFhf4GmFOxZXhpHVTOio+hVP52OBAJP0A@mail.gmail.com>
 <46336aba-e7dd-49dd-aa1c-c5f765006e3c@foss.st.com>
 <CACRpkdY2=qdY_0GA1gB03yHODPEvxum+4YBjzsXRVnhLaf++6Q@mail.gmail.com>
 <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
In-Reply-To: <f3856158-10e6-4ee8-b4d5-b7f2fe6d1097@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Oct 2024 13:04:57 +0200
Message-ID: <CACRpkdZa5x6NvUg0kU6F0+HaFhKhVswvK2WaaCSBx3-JCVFcag@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kees Cook <kees@kernel.org>, Mark Brown <broonie@kernel.org>,
 Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] ARM: ioremap: Sync PGDs for
	VMALLOC shadow
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

T24gRnJpLCBPY3QgMjUsIDIwMjQgYXQgMTE6MjfigK9BTSBDbGVtZW50IExFIEdPRkZJQwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gT24gMTAvMjQvMjQgMjM6NTgsIExp
bnVzIFdhbGxlaWogd3JvdGU6Cj4gPiBIaSBDbGVtZW50LAo+ID4KPiA+IEkgc2F3IEkgbWlzc2Vk
IHRvIGxvb2sgY2xvc2VyIGF0IHRoZSBuZXcgYnVnIGZvdW5kIGluIGV4dDQKPiA+IG9uIHRoZSBT
VE0zMjoKPiA+Cj4gPiBPbiBNb24sIE9jdCAyMSwgMjAyNCBhdCAyOjEy4oCvUE0gQ2xlbWVudCBM
RSBHT0ZGSUMKPiA+IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPiB3cm90ZToKPiA+Cj4g
Pj4gUGVyaGFwcyBub3QgcmVsYXRlZCB3aXRoIHRoaXMgdG9waWMgYnV0IGFzIGluIHRoZSBiYWNr
dHJhY2UgSSBhbSBnZXR0aW5nCj4gPj4gc29tZSBrZXl3b3JkIGZyb20gb3VyIHN0YXJ0IGV4Y2hh
bmdlLCBJIGR1bXAgdGhlIGNyYXNoIGJlbG93Lgo+ID4+IElmIHRoaXMgYmFja3RyYWNlIGlzIHNv
bWVob3cgcmVsYXRlZCB3aXRoIG91ciBpc3N1ZSwgcGxlYXNlIGhhdmUgYSBsb29rLgo+ID4gKC4u
LikKPiA+PiBbIDE0MzkuMzUxOTQ1XSBQQyBpcyBhdCBfX3JlYWRfb25jZV93b3JkX25vY2hlY2sr
MHgwLzB4OAo+ID4+IFsgMTQzOS4zNTY5NjVdIExSIGlzIGF0IHVud2luZF9leGVjX2luc24rMHgz
NjQvMHg2NTgKPiA+ICguLi4pCj4gPj4gWyAxNDQwLjMzMzE4M10gIF9fcmVhZF9vbmNlX3dvcmRf
bm9jaGVjayBmcm9tIHVud2luZF9leGVjX2luc24rMHgzNjQvMHg2NTgKPiA+PiBbIDE0NDAuMzM5
NzI2XSAgdW53aW5kX2V4ZWNfaW5zbiBmcm9tIHVud2luZF9mcmFtZSsweDI3MC8weDYxOAo+ID4+
IFsgMTQ0MC4zNDUzNTJdICB1bndpbmRfZnJhbWUgZnJvbSBhcmNoX3N0YWNrX3dhbGsrMHg2Yy8w
eGUwCj4gPj4gWyAxNDQwLjM1MDY3NF0gIGFyY2hfc3RhY2tfd2FsayBmcm9tIHN0YWNrX3RyYWNl
X3NhdmUrMHg5MC8weGMwCj4gPj4gWyAxNDQwLjM1NjMwOF0gIHN0YWNrX3RyYWNlX3NhdmUgZnJv
bSBrYXNhbl9zYXZlX3N0YWNrKzB4MzAvMHg0Ywo+ID4+IFsgMTQ0MC4zNjIwNDJdICBrYXNhbl9z
YXZlX3N0YWNrIGZyb20gX19rYXNhbl9yZWNvcmRfYXV4X3N0YWNrKzB4ODQvMHg4Ywo+ID4+IFsg
MTQ0MC4zNjg0NzNdICBfX2thc2FuX3JlY29yZF9hdXhfc3RhY2sgZnJvbSB0YXNrX3dvcmtfYWRk
KzB4OTAvMHgyMTAKPiA+PiBbIDE0NDAuMzc0NzA2XSAgdGFza193b3JrX2FkZCBmcm9tIHNjaGVk
dWxlcl90aWNrKzB4MThjLzB4MjUwCj4gPj4gWyAxNDQwLjM4MDI0NV0gIHNjaGVkdWxlcl90aWNr
IGZyb20gdXBkYXRlX3Byb2Nlc3NfdGltZXMrMHgxMjQvMHgxNDgKPiA+PiBbIDE0NDAuMzg2Mjg3
XSAgdXBkYXRlX3Byb2Nlc3NfdGltZXMgZnJvbSB0aWNrX3NjaGVkX2hhbmRsZSsweDY0LzB4ODgK
PiA+PiBbIDE0NDAuMzkyNTIxXSAgdGlja19zY2hlZF9oYW5kbGUgZnJvbSB0aWNrX3NjaGVkX3Rp
bWVyKzB4NjAvMHhjYwo+ID4+IFsgMTQ0MC4zOTgzNDFdICB0aWNrX3NjaGVkX3RpbWVyIGZyb20g
X19ocnRpbWVyX3J1bl9xdWV1ZXMrMHgyYzQvMHg1OWMKPiA+PiBbIDE0NDAuNDA0NTcyXSAgX19o
cnRpbWVyX3J1bl9xdWV1ZXMgZnJvbSBocnRpbWVyX2ludGVycnVwdCsweDFiYy8weDNhMAo+ID4+
IFsgMTQ0MC40MTEwMDldICBocnRpbWVyX2ludGVycnVwdCBmcm9tIGFyY2hfdGltZXJfaGFuZGxl
cl92aXJ0KzB4MzQvMHgzYwo+ID4+IFsgMTQ0MC40MTc0NDddICBhcmNoX3RpbWVyX2hhbmRsZXJf
dmlydCBmcm9tCj4gPj4gaGFuZGxlX3BlcmNwdV9kZXZpZF9pcnErMHhmNC8weDM2OAo+ID4+IFsg
MTQ0MC40MjQ0ODBdICBoYW5kbGVfcGVyY3B1X2RldmlkX2lycSBmcm9tCj4gPj4gZ2VuZXJpY19o
YW5kbGVfZG9tYWluX2lycSsweDM4LzB4NDgKPiA+PiBbIDE0NDAuNDMxNjE4XSAgZ2VuZXJpY19o
YW5kbGVfZG9tYWluX2lycSBmcm9tIGdpY19oYW5kbGVfaXJxKzB4OTAvMHhhOAo+ID4+IFsgMTQ0
MC40Mzc5NTNdICBnaWNfaGFuZGxlX2lycSBmcm9tIGdlbmVyaWNfaGFuZGxlX2FyY2hfaXJxKzB4
MzAvMHg0MAo+ID4+IFsgMTQ0MC40NDQwOTRdICBnZW5lcmljX2hhbmRsZV9hcmNoX2lycSBmcm9t
IF9faXJxX3N2YysweDg4LzB4YzgKPiA+PiBbIDE0NDAuNDQ5OTIwXSBFeGNlcHRpb24gc3RhY2so
MHhkZTgwM2EzMCB0byAweGRlODAzYTc4KQo+ID4+IFsgMTQ0MC40NTQ5MTRdIDNhMjA6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRlODAzYjAwCj4gPj4gMDAwMDAwMDAgMDAw
MDAwMDEgMDAwMDAwYzAKPiA+PiBbIDE0NDAuNDYzMTQxXSAzYTQwOiBlNTMzM2Y0MCBkZTgwM2Jh
MCBkZTgwM2JkMCAwMDAwMDAwMSBlNTMzM2Y0MAo+ID4+IGRlODAzYjAwIGMxMjQxZDkwIGJhZDAw
NzVjCj4gPj4gWyAxNDQwLjQ3MTI2Ml0gM2E2MDogYzIwNTg0YjggZGU4MDNhN2MgYzAxMTQxMTQg
YzAxMTM4NTAgMjAwZjAwMTMgZmZmZmZmZmYKPiA+PiBbIDE0NDAuNDc3OTU5XSAgX19pcnFfc3Zj
IGZyb20gdW53aW5kX2V4ZWNfaW5zbisweDQvMHg2NTgKPiA+PiBbIDE0NDAuNDgzMDc4XSAgdW53
aW5kX2V4ZWNfaW5zbiBmcm9tIGNhbGxfd2l0aF9zdGFjaysweDE4LzB4MjAKPiA+Cj4gPiBUaGlz
IGlzIGhhcmQgdG8gYW5hbHl6ZSB3aXRob3V0IGJlaW5nIGFibGUgdG8gcmVwcm9kdWNlIGl0LCBi
dXQgaXQgdGFsa3MKPiA+IGFib3V0IHRoZSBzdGFjayBhbmQgS2FzYW4gYW5kIHVud2luZGluZywg
c28gY291bGQgaXQgKGFsc28pIGJlIHJlbGF0ZWQgdG8gdGhlCj4gPiBWTUFQOmVkIHN0YWNrPwo+
ID4KPiA+IERpZCB5b3UgdHJ5IHRvIHJldmVydCAob3IgY2hlY2sgb3V0IHRoZSBjb21taXQgYmVm
b3JlIGFuZCBhZnRlcikKPiA+IGI2NTA2OTgxZjg4MCBBUk06IHVud2luZDogc3VwcG9ydCB1bndp
bmRpbmcgYWNyb3NzIG11bHRpcGxlIHN0YWNrcwo+ID4gdG8gc2VlIGlmIHRoaXMgaXMgYWdhaW4g
Zml4aW5nIHRoZSBpc3N1ZT8KPiBJIExpbnVzLAo+Cj4gWWVzLCBJJ3ZlIHRyaWVkIHRvIHJldmVy
dCB0aGlzIHBhcnRpY3VsYXIgY29tbWl0IG9uIHRvcCBvZiB5b3VyIGxhc3QKPiBwYXRjaGVzIGJ1
dCBJIGhhdmUgc29tZSBjb25mbGljdHMgaW5zaWRlIGFyY2gvYXJtL2tlcm5lbC91bndpbmQuYwoK
V2hhdCBoYXBwZW5zIGlmIHlvdSBqdXN0CgpnaXQgY2hlY2tvdXQgYjY1MDY5ODFmODgwXgoKQW5k
IGJ1aWxkIGFuZCBib290IHRoYXQ/IEl0J3MganVzdCBydW5uaW5nIHRoZSBjb21taXQgcmlnaHQg
YmVmb3JlIHRoZQp1bndpbmRpbmcgcGF0Y2guCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
