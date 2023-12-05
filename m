Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D746B805AEF
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 18:13:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 888A4C6C841;
	Tue,  5 Dec 2023 17:13:54 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2927C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 17:13:53 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-7c45bee5fdaso1262291241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 09:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701796432; x=1702401232;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jhl4VBonzlc3pWBsupBzGj3hbqoDxmUEBnI+4/Xqy5c=;
 b=MHnf4ARGp5+6f8a2azZMvReDOqqbXtKPprJGmwwsjtCDs56fnl8pkD3OhrP0BTZu95
 UOV/bBY1hq3m5bWkdlWwloQ/LhupBXvvZU2JVTOxnXrRN9NWUyx1sOlN9RvTV0izXJnK
 cqvMtWwmMjSXptUH0E2kiNGFXK2Nafcqq7/GZswhF0tf0uhqX8iACdEr+/i+GdV2O41o
 NLpPxTQ6VLAhsHGSqMe0qpXhjicY2aFUveLGjPaG+29RWuYulWJi0XqqaXCp2bm8aCnY
 IL7tHWFHM1K3r1zpG3KM0ScF4dBR9NkqF+Tgo3A2Me/5aN+7I5bOqQMWOsOJcP0Ja6p+
 DTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701796432; x=1702401232;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jhl4VBonzlc3pWBsupBzGj3hbqoDxmUEBnI+4/Xqy5c=;
 b=DX8DvuaKJ2lQY4h5lJkR/nEcYaAasNTy5wFTOWEh0kMw8Mjkwo+OiPQlYup9FJ2JTH
 Q9ezwTdkSQDEnUzH3QDgEno/F3XhPzsKpIqB75qjMHGnPr18FFT8U+yoeAi/ZbjVgvTc
 N2BSEuq78Pe+rlCuvWH9AcyzwWgdEXUDp+VZQiREKTTI8KSCcfBZ5F6wTmDBb6sx2UYO
 tjCOsjjBYkZPQSKOBAvLnNP8WAt3Th3fDKS01DVdps+pAeQJ6BOOm0wf9wOjWzfqRCj5
 Pxa8yCt5cpglch+ZVHO5fT3OuiiMe9quUv0xUG/ci8ZKFKGb3BQtOty/mxB5rvP+NbfV
 Q6fQ==
X-Gm-Message-State: AOJu0YwjX7QVA03dyzdBhqKWVu0QxoT98jMeWHcjwpnkOO2ag2IkwkH/
 HuHC+1/sPuQ7yAzlvEqrmRxTIabZU4QW0y0bn/fggw==
X-Google-Smtp-Source: AGHT+IGZ2g2oFmmMcDVzmGa+ZZi/Dz9EWTryACUv6KZTkY8C1ML9of935relBOPEXVeT256piz2KyEWvu0yNMvy9fmw=
X-Received: by 2002:a1f:fc83:0:b0:4b2:7fa3:a965 with SMTP id
 a125-20020a1ffc83000000b004b27fa3a965mr4904643vki.11.1701796432618; Tue, 05
 Dec 2023 09:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
 <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
 <PH0PR11MB583000826591093B98BA841DD885A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <5a0faf8cc9ec3ab0d5082c66b909c582c8f1eae6.camel@siemens.com>
In-Reply-To: <5a0faf8cc9ec3ab0d5082c66b909c582c8f1eae6.camel@siemens.com>
From: Stanislav Fomichev <sdf@google.com>
Date: Tue, 5 Dec 2023 09:13:39 -0800
Message-ID: <CAKH8qBuXL8bOYtfKKPS8y=KJqouDptyciCjr0wNKVHtNj6BmqA@mail.gmail.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Cc: "Song, Yoong Siang" <yoong.siang.song@intel.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, "Fijalkowski,
 Maciej" <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
 KP Singh <kpsingh@kernel.org>, "Karlsson, Magnus" <magnus.karlsson@intel.com>,
 Hao Luo <haoluo@google.com>, Willem de Bruijn <willemb@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Bjorn Topel <bjorn@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [xdp-hints] Re: [PATCH bpf-next v3 2/3] net:
 stmmac: add Launch Time support to XDP ZC
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

T24gVHVlLCBEZWMgNSwgMjAyMyBhdCA3OjM04oCvQU0gRmxvcmlhbiBCZXpkZWthCjxmbG9yaWFu
LmJlemRla2FAc2llbWVucy5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyMDIzLTEyLTA1IGF0IDE1
OjI1ICswMDAwLCBTb25nLCBZb29uZyBTaWFuZyB3cm90ZToKPiA+IE9uIE1vbmRheSwgRGVjZW1i
ZXIgNCwgMjAyMyAxMDo1NSBQTSwgV2lsbGVtIGRlIEJydWlqbiB3cm90ZToKPiA+ID4gSmVzcGVy
IERhbmdhYXJkIEJyb3VlciB3cm90ZToKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gT24gMTIvMy8y
MyAxNzo1MSwgU29uZyBZb29uZyBTaWFuZyB3cm90ZToKPiA+ID4gPiA+IFRoaXMgcGF0Y2ggZW5h
YmxlcyBMYXVuY2ggVGltZSAoVGltZS1CYXNlZCBTY2hlZHVsaW5nKSBzdXBwb3J0IHRvIFhEUCB6
ZXJvCj4gPiA+ID4gPiBjb3B5IHZpYSBYRFAgVHggbWV0YWRhdGEgZnJhbWV3b3JrLgo+ID4gPiA+
ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNvbmcgWW9vbmcgU2lhbmc8eW9vbmcuc2lhbmcu
c29uZ0BpbnRlbC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICAgZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjLmggICAgICB8ICAyICsrCj4gPiA+ID4KPiA+ID4g
PiBBcyByZXF1ZXN0ZWQgYmVmb3JlLCBJIHRoaW5rIHdlIG5lZWQgdG8gc2VlIGFub3RoZXIgZHJp
dmVyIGltcGxlbWVudGluZwo+ID4gPiA+IHRoaXMuCj4gPiA+ID4KPiA+ID4gPiBJIHByb3Bvc2Ug
ZHJpdmVyIGlnYyBhbmQgY2hpcCBpMjI1Lgo+ID4KPiA+IFN1cmUuIEkgd2lsbCBpbmNsdWRlIGln
YyBwYXRjaGVzIGluIG5leHQgdmVyc2lvbi4KPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGUgaW50ZXJl
c3RpbmcgdGhpbmcgZm9yIG1lIGlzIHRvIHNlZSBob3cgdGhlIExhdW5jaFRpbWUgbWF4IDEgc2Vj
b25kCj4gPiA+ID4gaW50byB0aGUgZnV0dXJlWzFdIGlzIGhhbmRsZWQgY29kZSB3aXNlLiBPbmUg
c3VnZ2VzdGlvbiBpcyB0byBhZGQgYQo+ID4gPiA+IHNlY3Rpb24gdG8gRG9jdW1lbnRhdGlvbi9u
ZXR3b3JraW5nL3hzay10eC1tZXRhZGF0YS5yc3QgcGVyIGRyaXZlciB0aGF0Cj4gPiA+ID4gbWVu
dGlvbnMvZG9jdW1lbnRzIHRoZXNlIGRpZmZlcmVudCBoYXJkd2FyZSBsaW1pdGF0aW9ucy4gIEl0
IGlzIG5hdHVyYWwKPiA+ID4gPiB0aGF0IGRpZmZlcmVudCB0eXBlcyBvZiBoYXJkd2FyZSBoYXZl
IGxpbWl0YXRpb25zLiAgVGhpcyBpcyBhIGNsb3NlLXRvCj4gPiA+ID4gaGFyZHdhcmUtbGV2ZWwg
YWJzdHJhY3Rpb24vQVBJLCBhbmQgSU1ITyBhcyBsb25nIGFzIHdlIGRvY3VtZW50IHRoZQo+ID4g
PiA+IGxpbWl0YXRpb25zIHdlIGNhbiBleHBvc2UgdGhpcyBBUEkgd2l0aG91dCB0b28gbWFueSBs
aW1pdGF0aW9ucyBmb3IgbW9yZQo+ID4gPiA+IGNhcGFibGUgaGFyZHdhcmUuCj4gPgo+ID4gU3Vy
ZS4gSSB3aWxsIHRyeSB0byBhZGQgaGFyZHdhcmUgbGltaXRhdGlvbnMgaW4gZG9jdW1lbnRhdGlv
bi4KPiA+Cj4gPiA+Cj4gPiA+IEkgd291bGQgYXNzdW1lIHRoYXQgdGhlIGtmdW5jIHdpbGwgZmFp
bCB3aGVuIGEgdmFsdWUgaXMgcGFzc2VkIHRoYXQKPiA+ID4gY2Fubm90IGJlIHByb2dyYW1tZWQu
Cj4gPiA+Cj4gPgo+ID4gSW4gY3VycmVudCBkZXNpZ24sIHRoZSB4c2tfdHhfbWV0YWRhdGFfcmVx
dWVzdCgpIGRpbnQgZ290IHJldHVybiB2YWx1ZS4KPiA+IFNvIHVzZXIgd29uJ3Qga25vdyBpZiB0
aGVpciByZXF1ZXN0IGlzIGZhaWwuCj4gPiBJdCBpcyBjb21wbGV4IHRvIGluZm9ybSB1c2VyIHdo
aWNoIHJlcXVlc3QgaXMgZmFpbGluZy4KPiA+IFRoZXJlZm9yZSwgSU1ITywgaXQgaXMgZ29vZCB0
aGF0IHdlIGxldCBkcml2ZXIgaGFuZGxlIHRoZSBlcnJvciBzaWxlbnRseS4KPiA+Cj4KPiBJZiB0
aGUgcHJvZ3JhbW1lZCB2YWx1ZSBpcyBpbnZhbGlkLCB0aGUgcGFja2V0IHdpbGwgYmUgImRyb3Bw
ZWQiIC8gd2lsbAo+IG5ldmVyIG1ha2UgaXQgdG8gdGhlIHdpcmUsIHJpZ2h0Pwo+Cj4gVGhhdCBp
cyBjbGVhcmx5IGEgc2l0dWF0aW9uIHRoYXQgdGhlIHVzZXIgc2hvdWxkIGJlIGluZm9ybWVkIGFi
b3V0LiBGb3IKPiBSVCBzeXN0ZW1zIHRoaXMgbm9ybWFsbHkgbWVhbnMgdGhhdCBzb21ldGhpbmcg
aXMgcmVhbGx5IHdyb25nIHJlZ2FyZGluZwo+IHRpbWluZyAvIGN5Y2xlIG92ZXJmbG93LiBTdWNo
IHN5c3RlbXMgaGF2ZSB0byByZWFjdCBvbiB0aGF0IHNpdHVhdGlvbi4KCkluIGdlbmVyYWwsIGFm
X3hkcCBpcyBhIGJpdCBsYWNraW5nIGluIHRoaXMgJ25vdGlmeSB0aGUgdXNlciB0aGF0IHRoZXkK
c29tZWhvdyBtZXNzZWQgdXAnIGFyZWEgOi0oCkZvciBleGFtcGxlLCBwdXNoaW5nIGEgdHggZGVz
Y3JpcHRvciB3aXRoIGEgd3JvbmcgYWRkci9sZW4gaW4gemMgbW9kZQp3aWxsIG5vdCBnaXZlIGFu
eSB2aXNpYmxlIHNpZ25hbCBiYWNrIChiZXNpZGVzIGRyaXZlciBwb3RlbnRpYWxseQpzcGlsbGlu
ZyBzb21ldGhpbmcgaW50byBkbWVzZyBhcyBpdCB3YXMgaW4gdGhlIG1seCBjYXNlKS4KV2UgY2Fu
IHByb2JhYmx5IHN0YXJ0IHdpdGggaGF2aW5nIHNvbWUgY291bnRlcnMgZm9yIHRoZXNlIGV2ZW50
cz8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
