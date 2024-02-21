Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2588185CE83
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 04:02:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6C55C6B45E;
	Wed, 21 Feb 2024 03:02:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E0F9C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 03:02:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4125e435b38so31217215e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Feb 2024 19:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708484535; x=1709089335;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5YeEcEgxYmu09MXHLnpzvtsKYMcG3p92FbXHkOlhAMc=;
 b=bnJgooa/DYSfMrz9S4n1QLXkJaRdGzNlP0q08AkPQRlCLerabmm5ngnCOEZji6uvJa
 JhQfKGk4JcIZI0YJJkSs76+R3XiuKw1TvElxiKQ4ZTdE+09/ogu9Ogdk1lrXlOphDnk4
 /OBABI4jAk/vdCLmPGRCB1vR145yTyCASTwlc655LqDIwNbRIr4DrLJHPkYMN3yIbtn6
 XbQ3UXnkK464cMsTpZdyGrqo46PKTS8Kfiz/lTnmDo54XALofTuiy4l5DJN2WKdRZk8s
 7ZI9zr75uSiS9szZsFBBCe/099s4uIZIQW1UXupDRh0xOubpSUgXbEe+1WDKyFe5+6pT
 r3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708484535; x=1709089335;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5YeEcEgxYmu09MXHLnpzvtsKYMcG3p92FbXHkOlhAMc=;
 b=HdsZWGLPLbt0BBJVL0GppMZKi7yDI+PN/fMkf1BSJFBd3l9giTQD8/WtaKRYR8Ttf4
 dl2cDVXHhzxkrjetO7tXfv88cJcDEBZnqjTTnvg4/JD/z1GxyJkuyure5lwFSMttaKxS
 GXxPLRKJy7H5Atcdq+XB/IH+oku/GbhjX+Ns6O/CWPeeXpHPZwGyg8cU/gzs2HtSJiTo
 259Ea3IsGFaFq7Bkr6X58843nzWUbL9nVhimiTi7i2XyIKyvsLyGaqHM/gTVPZCpWw/i
 xNhuBGPbnLroLOPcMT27OefKIq/oTJz6Bax0EADdceGXFoNyk0kRi3VmFR/Rh9PSReZ8
 K8Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJSL2dRYSt0H1ajIJzU623kCoqAZSxeYnFFIE2Jby007aQFUl/H7j1z2wI2fVCdd+riwoV1zfSDWeyC+8r9RC8a5b7Cewc72XbxtxZq/gO7eda6hLtiROx
X-Gm-Message-State: AOJu0Yww1BRWxGUNPaon8euFk+g/E8O31FX+uw/3yiJV0K4dvzxJ8WK9
 3pwBe9aocU/mt4I3G0zD76CfVUBKXgRp5KNFiiCuoIPFYlW68CVox1zz7q7RIdOCMxKFkH/ZNQa
 LkquNxwi4MHSFehSHsUxTkua4c+U=
X-Google-Smtp-Source: AGHT+IFXflCjYIorkLHNj0/aaODvrUQ0PoLWhZ3TXJuBYcOMC310Oxt+Nm2xprv0m8PmSrNKxRGUijunEZU7KHlAhdA=
X-Received: by 2002:adf:cd81:0:b0:33d:731f:b750 with SMTP id
 q1-20020adfcd81000000b0033d731fb750mr1454359wrj.54.1708484534678; Tue, 20 Feb
 2024 19:02:14 -0800 (PST)
MIME-Version: 1.0
References: <20240220035105.34626-1-dongmenglong.8@bytedance.com>
 <CAADnVQ+E4ygZV6dcs8wj5FdFz9bfrQ=61235uiRoxe9RqQvR9Q@mail.gmail.com>
 <CALz3k9g__P+UdO2vLPrR5Y4sQonQJjOnGPNmhmxtRfhLKoV7Rg@mail.gmail.com>
 <CALz3k9h8CoAP8+ZmNvNGeXL9D_Q83Ovrubz9zHECr6C0TXuoVg@mail.gmail.com>
In-Reply-To: <CALz3k9h8CoAP8+ZmNvNGeXL9D_Q83Ovrubz9zHECr6C0TXuoVg@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 Feb 2024 19:02:03 -0800
Message-ID: <CAADnVQ+bOhh1R_eCoThyNg50dd4nA4-qhpXxOWheLeA_44npXg@mail.gmail.com>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Marchevsky <davemarchevsky@fb.com>, Song Liu <song@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Kui-Feng Lee <thinker.li@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Feng Zhou <zhoufeng.zf@bytedance.com>, mcoquelin.stm32@gmail.com,
 Alexei Starovoitov <ast@kernel.org>, Daniel Xu <dxu@dxuuu.xyz>,
 KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next 0/5] bpf: make
 tracing program support multi-attach
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

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgNjo0NeKAr1BNIOaipum+meiRoyA8ZG9uZ21lbmdsb25n
LjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAyMSwgMjAyNCBhdCAxMDoz
NeKAr0FNIOaipum+meiRoyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gSGVsbG8sCj4gPgo+ID4gT24gV2VkLCBGZWIgMjEsIDIwMjQgYXQgOToyNOKAr0FNIEFs
ZXhlaSBTdGFyb3ZvaXRvdgo+ID4gPGFsZXhlaS5zdGFyb3ZvaXRvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4gPgo+ID4gPiBPbiBNb24sIEZlYiAxOSwgMjAyNCBhdCA3OjUx4oCvUE0gTWVuZ2xvbmcg
RG9uZwo+ID4gPiA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4K
PiA+ID4gPiBGb3Igbm93LCB0aGUgQlBGIHByb2dyYW0gb2YgdHlwZSBCUEZfUFJPR19UWVBFX1RS
QUNJTkcgaXMgbm90IGFsbG93ZWQgdG8KPiA+ID4gPiBiZSBhdHRhY2hlZCB0byBtdWx0aXBsZSBo
b29rcywgYW5kIHdlIGhhdmUgdG8gY3JlYXRlIGEgQlBGIHByb2dyYW0gZm9yCj4gPiA+ID4gZWFj
aCBrZXJuZWwgZnVuY3Rpb24sIGZvciB3aGljaCB3ZSB3YW50IHRvIHRyYWNlLCBldmVuIHRocm91
Z2ggYWxsIHRoZQo+ID4gPiA+IHByb2dyYW0gaGF2ZSB0aGUgc2FtZSAob3Igc2ltaWxhcikgbG9n
aWMuIFRoaXMgY2FuIGNvbnN1bWUgZXh0cmEgbWVtb3J5LAo+ID4gPiA+IGFuZCBtYWtlIHRoZSBw
cm9ncmFtIGxvYWRpbmcgc2xvdyBpZiB3ZSBoYXZlIHBsZW50eSBvZiBrZXJuZWwgZnVuY3Rpb24g
dG8KPiA+ID4gPiB0cmFjZS4KPiA+ID4KPiA+ID4gU2hvdWxkIHRoaXMgYmUgY29tYmluZWQgd2l0
aCBtdWx0aSBsaW5rID8KPiA+ID4gKEFzIHdhcyByZWNlbnRseSBkb25lIGZvciBrcHJvYmVfbXVs
dGkgYW5kIHVwcm9iZV9tdWx0aSkuCj4gPiA+IExvYWRpbmcgZmVudHJ5IHByb2cgb25jZSBhbmQg
YXR0YWNoaW5nIGl0IHRocm91Z2ggbWFueSBicGZfbGlua3MKPiA+ID4gdG8gbXVsdGlwbGUgcGxh
Y2VzIGlzIGEgbmljZSBhZGRpdGlvbiwKPiA+ID4gYnV0IHdlIHNob3VsZCBwcm9iYWJseSBhZGQg
YSBtdWx0aSBsaW5rIHJpZ2h0IGF3YXkgdG9vLgo+ID4KPiA+IEkgd2FzIHBsYW5uaW5nIHRvIGlt
cGxlbWVudCB0aGUgbXVsdGkgbGluayBmb3IgdHJhY2luZyBhZnRlciB0aGlzCj4gPiBzZXJpZXMg
aW4gYW5vdGhlciBzZXJpZXMuIEkgY2FuIGRvIGl0IHRvZ2V0aGVyIHdpdGggdGhpcyBzZXJpZXMK
PiA+IGlmIHlvdSBwcmVmZXIuCj4gPgo+Cj4gU2hvdWxkIEkgaW50cm9kdWNlIHRoZSBtdWx0aSBs
aW5rIGZvciB0cmFjaW5nIGZpcnN0LCB0aGVuIHRoaXMgc2VyaWVzPwo+IChGdXJ0aGVybW9yZSwg
dGhpcyBzZXJpZXMgc2VlbXMgbm90IG5lY2Vzc2FyeS4pCgpXaGF0IGRvIHlvdSBtZWFuICJub3Qg
bmVjZXNzYXJ5IiA/CkRvbid0IHlvdSB3YW50IHRvIHN0aWxsIGNoZWNrIHRoYXQgYnBmIHByb2cg
YWNjZXNzIG9ubHkgTiBhcmdzCmFuZCBCVEYgZm9yIHRoZXNlIGFyZ3MgbWF0Y2hlcyBhY3Jvc3Mg
YWxsIGF0dGFjaCBwb2ludHMgPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
