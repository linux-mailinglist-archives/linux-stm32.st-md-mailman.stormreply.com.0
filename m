Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1013890E5D
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Mar 2024 00:17:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A3DEC71281;
	Thu, 28 Mar 2024 23:17:32 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD5B6C6DD93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 23:17:31 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d46dd8b0b8so17012701fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 16:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711667851; x=1712272651;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VBPtswbRJVFEjRlZATnnC5PXpnMT+l8bd9tpx27HnBM=;
 b=gw029FszOEYVjJBv/uS6SmGTFo9t4urtqDgXBiSXuiEdQ7Qn2CUZbaBnHh8gLDC+U4
 5sWN9npe/J989ln3nLOZsYz9NgyfHu7xx5C3XmxFr2QAVakeQ9JPsKo7X0D0zsCakNuh
 M9n8H+eDonyicHFfyc20YxkVKN6GPKEQbdJGDcd8JtlZoZDZv50udt/bZU+d5pzuDIMp
 FVH24kdpiDuZb/e8sy1Cc5u40i7XAzx2z91lhHJX/61N5sMi8cxrMWXG5TJ9QP4ZFLXX
 p1jaaWrbu8NEPH/6XqPajvUcCWBKMD9UyJjSqSu4ruu4c5bV1/x/T765rzf+eRcwIPF1
 lBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711667851; x=1712272651;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VBPtswbRJVFEjRlZATnnC5PXpnMT+l8bd9tpx27HnBM=;
 b=PvtUd432z4OAI/qS2MrPjIfLMm8WMoBFBwQ9lE4ll5eSaTl+ccIXv+gfV7NUxW93Cv
 iQWhnsdqKoQFo83Hy77l0b8N1DGvwec+6b15Ajxy1cn6ewBamYHq+t4cH6cDeyMtdNHR
 KdmM0lH6gS4fLbS6XXQzGny2rsxqdjLUaymB3i6t393cfWgb+ZOraQpVPNa05+Sc+1ej
 MKWodr/cw+fhEaMHKW9IHLz0+3CndrWs36hZbvWXOUmX8cE/LH+9qc7psZqmlQm53ywU
 rLePu5rUXVQgbkhPCnLIx1lsgjmIIi+5+RB2NBePdjmN/qAWo62PpEHHPxVz2fWKLhsN
 gqzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpr0fvYguFs4rB3+f21i7WkFqlWTpc9uNThZdN1FYIMuFJackaEi1fqYf+m0Q+b420CMAJtxFO46dAF16Vi27rwlv3Z/dKiUz19vWOBF86L1b98Lzr6b7T
X-Gm-Message-State: AOJu0YyqTPEyPATNJsASQt69VljgdOs+BBuqOWD/7ziVY1LqRXSBrn3x
 J6lgcCeoyE2mmColBNnIXQVyeyvtBwl04rhnP1OchqOOt+xT7o9dl+ex8zOI553/vQHb5MzYgE/
 OlwplltY376UYBt0sHQoylRt+sYs=
X-Google-Smtp-Source: AGHT+IG5xIH2Dr8kwrbaPKFwGkwQN2RxPioeS2J7HN42D01hRwbUDEoBKIDHKJKBLqNdT3QFt8lsl8OnqZLOHWZb5Wo=
X-Received: by 2002:a05:651c:1692:b0:2d6:c7b5:989c with SMTP id
 bd18-20020a05651c169200b002d6c7b5989cmr378385ljb.28.1711667850565; Thu, 28
 Mar 2024 16:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com>
 <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
 <20240328111330.194dcbe5@gandalf.local.home>
In-Reply-To: <20240328111330.194dcbe5@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 28 Mar 2024 16:17:19 -0700
Message-ID: <CAADnVQKsuV2OhT4rc+k=WDmVMQxbjDiC4+zNbre2Kpj1hod5xw@mail.gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Quentin Monnet <quentin@isovalent.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-trace-kernel@vger.kernel.org, KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 1/9] bpf:
 tracing: add support to record and check the accessed args
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgODoxMOKAr0FNIFN0ZXZlbiBSb3N0ZWR0IDxyb3N0ZWR0
QGdvb2RtaXMub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgMjggTWFyIDIwMjQgMjI6NDM6NDYgKzA4
MDAKPiDmoqbpvpnokaMgPGRvbmdtZW5nbG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4g
PiBJIGhhdmUgZG9uZSBhIHNpbXBsZSBiZW5jaG1hcmsgb24gY3JlYXRpbmcgMTAwMAo+ID4gdHJh
bXBvbGluZXMuIEl0IGlzIHNsb3csIHF1aXRlIHNsb3csIHdoaWNoIGNvbnN1bWUgdXAgdG8KPiA+
IDYwcy4gV2UgY2FuJ3QgZG8gaXQgdGhpcyB3YXkuCj4gPgo+ID4gTm93LCBJIGhhdmUgYSBiYWQg
aWRlYS4gSG93IGFib3V0IHdlIGludHJvZHVjZQo+ID4gYSAiZHluYW1pYyB0cmFtcG9saW5lIj8g
VGhlIGJhc2ljIGxvZ2ljIG9mIGl0IGNhbiBiZToKPiA+Cj4gPiAiIiIKPiA+IHNhdmUgcmVncwo+
ID4gYnBmcyA9IHRyYW1wb2xpbmVfbG9va3VwX2lwKGlwKQo+ID4gZmVudHJ5ID0gYnBmcy0+ZmVu
dHJpZXMKPiA+IHdoaWxlIGZlbnRyeToKPiA+ICAgZmVudHJ5KGN0eCkKPiA+ICAgZmVudHJ5ID0g
ZmVudHJ5LT5uZXh0Cj4gPgo+ID4gY2FsbCBvcmlnaW4KPiA+IHNhdmUgcmV0dXJuIHZhbHVlCj4g
Pgo+ID4gZmV4aXQgPSBicGZzLT5mZXhpdHMKPiA+IHdoaWxlIGZleGl0Ogo+ID4gICBmZXhpdChj
dHgpCj4gPiAgIGZleGl0ID0gZmV4aXQtPm5leHQKPiA+Cj4gPiB4eHh4eHgKPiA+ICIiIgo+ID4K
PiA+IEFuZCB3ZSBsb29rdXAgdGhlICJicGZzIiBieSB0aGUgZnVuY3Rpb24gaXAgaW4gYSBoYXNo
IG1hcAo+ID4gaW4gdHJhbXBvbGluZV9sb29rdXBfaXAuIFRoZSB0eXBlIG9mICJicGZzIiBpczoK
PiA+Cj4gPiBzdHJ1Y3QgYnBmX2FycmF5IHsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpmZW50cmll
czsKPiA+ICBzdHJ1Y3QgYnBmX3Byb2cgKmZleGl0czsKPiA+ICAgc3RydWN0IGJwZl9wcm9nICpt
b2RpZnlfcmV0dXJuczsKPiA+IH0KPiA+Cj4gPiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHRoZSBi
cGYgcHJvZ0EgdG8gZnVuY3Rpb24gQS9CL0MsCj4gPiB3ZSBvbmx5IG5lZWQgdG8gY3JlYXRlIHRo
ZSBicGZfYXJyYXlBLCBicGZfYXJyYXlCLCBicGZfYXJyYXlDCj4gPiBhbmQgYWRkIHRoZSBwcm9n
QSB0byB0aGVtLCBhbmQgaW5zZXJ0IHRoZW0gdG8gdGhlIGhhc2ggbWFwCj4gPiAiZGlyZWN0X2Nh
bGxfYnBmcyIsIGFuZCBhdHRhY2ggdGhlICJkeW5hbWljIHRyYW1wb2xpbmUiIHRvCj4gPiBBL0Iv
Qy4gSWYgYnBmX2FycmF5QSBleGlzdCwganVzdCBhZGQgcHJvZ0EgdG8gdGhlIHRhaWwgb2YKPiA+
IGJwZl9hcnJheUEtPmZlbnRyaWVzLiBXaGVuIHdlIG5lZWQgdG8gYXR0YWNoIHByb2dCIHRvCj4g
PiBCL0MsIGp1c3QgYWRkIHByb2dCIHRvIGJwZl9hcnJheUItPmZlbnRyaWVzIGFuZAo+ID4gYnBm
X2FycmF5Qi0+ZmVudHJpZXMuCj4gPgo+ID4gQ29tcGFyZWQgdG8gdGhlIHRyYW1wb2xpbmUsIGV4
dHJhIG92ZXJoZWFkIGlzIGludHJvZHVjZWQKPiA+IGJ5IHRoZSBoYXNoIGxvb2t1cGluZy4KPiA+
Cj4gPiBJIGhhdmUgbm90IGJlZ3VuIHRvIGNvZGUgeWV0LCBhbmQgSSBhbSBub3Qgc3VyZSB0aGUg
b3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGUuIENvbnNpZGVyaW5nIHRoYXQgd2UgYWxzbyBuZWVk
IHRvIGRvIGhhc2ggbG9va3VwCj4gPiBieSB0aGUgZnVuY3Rpb24gaW4ga3Byb2JlX211bHRpLCBt
YXliZSB0aGUgb3ZlcmhlYWQgaXMKPiA+IGFjY2VwdGFibGU/Cj4KPiBTb3VuZHMgbGlrZSB5b3Ug
YXJlIGp1c3QgcmVjcmVhdGluZyB0aGUgZnVuY3Rpb24gbWFuYWdlbWVudCB0aGF0IGZ0cmFjZQo+
IGhhcy4gSXQgYWxzbyBjYW4gYWRkIHRob3VzYW5kcyBvZiB0cmFtcG9saW5lcyB2ZXJ5IHF1aWNr
bHksIGJlY2F1c2UgaXQgZG9lcwo+IGl0IGluIGJhdGNoZXMuIEl0IHRha2VzIHNwZWNpYWwgc3lu
Y2hyb25pemF0aW9uIHN0ZXBzIHRvIGF0dGFjaCB0byBmZW50cnkuCj4gZnRyYWNlIChhbmQgSSBi
ZWxpZXZlIG11bHRpLWtwcm9iZXMpIHVwZGF0ZXMgYWxsIHRoZSBhdHRhY2htZW50cyBmb3IgZWFj
aAo+IHN0ZXAsIHNvIHRoZSBzeW5jaHJvbml6YXRpb24gbmVlZGVkIGlzIG9ubHkgZG9uZSBvbmNl
Lgo+Cj4gSWYgeW91IHJlYWxseSB3YW50IHRvIGhhdmUgdGhvdXNhbmRzIG9mIGZ1bmN0aW9ucywg
d2h5IG5vdCBqdXN0IHJlZ2lzdGVyIGl0Cj4gd2l0aCBmdHJhY2UgaXRzZWxmLiBJdCB3aWxsIGdp
dmUgeW91IHRoZSBhcmd1bWVudHMgdmlhIHRoZSBmdHJhY2VfcmVncwo+IHN0cnVjdHVyZS4gQ2Fu
J3QgeW91IGp1c3QgcmVnaXN0ZXIgYSBwcm9ncmFtIGFzIHRoZSBjYWxsYmFjaz8KPgo+IEl0IHdp
bGwgcHJvYmFibHkgbWFrZSB5b3VyIGFjY291bnRpbmcgbXVjaCBlYXNpZXIsIGFuZCBqdXN0IGxl
dCBmdHJhY2UKPiBoYW5kbGUgdGhlIGZlbnRyeSBsb2dpYy4gVGhhdCdzIHdoYXQgaXQgd2FzIG1h
ZGUgdG8gZG8uCgpBYnNvbHV0ZWx5IGFncmVlLgpUaGVyZSBpcyBubyBwb2ludCByZS1pbnZlbnRp
bmcgdGhpcyBsb2dpYy4KCk1lbmxvbmcsCmJlZm9yZSB5b3UgaG9vayB1cCBpbnRvIGZ0cmFjZSBj
aGVjayB3aGV0aGVyCml0J3MgZ29pbmcgdG8gYmUgYW55IGRpZmZlcmVudCBmcm9tIGtwcm9iZS1t
dWx0aSwKc2luY2UgaXQncyB0aGUgc2FtZSBmdHJhY2UgdW5kZXJuZWF0aC4KSSBzdXNwZWN0IGl0
IHdpbGwgbG9vayBleGFjdGx5IHRoZSBzYW1lLgpTbyBpdCBzb3VuZHMgbGlrZSBtdWx0aS1mZW50
cnkgaWRlYSB3aWxsIGJlIHNoZWx2ZWQgb25jZSBhZ2Fpbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
