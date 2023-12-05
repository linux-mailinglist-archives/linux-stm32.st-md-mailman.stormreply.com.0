Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15B805EB3
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 20:39:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0857FC6B475;
	Tue,  5 Dec 2023 19:39:33 +0000 (UTC)
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com
 [209.85.215.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82640C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 19:39:31 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-5c680110ea9so2824216a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 11:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701805170; x=1702409970;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=xfq67iLmriDqfduTRY0M8dju8QhNwul2zcs5mKn+Qdk=;
 b=RJywIdCswIKLh50X47lCbX4AtY557vXPhwbOmRI4FOvk65wKUJ6yXK60YyMUvZy/7B
 N3f6NmUzWtikPt+wum/FrrvZUejqJYfw9XmA1v7M0Ev6WQktWHC8oNsrDEdRgQfFlbY4
 O2LsCokhgkAr6GKFXNBlC/h+rbXkFr1RP97MAcd5JOd4edXfRFTM8UJ9kioDJ5X0UiSI
 ynrcfc7hbDoBxR1KZ5/tWHAbVOVzul8uQs/EKoYtmOgObx/xQRXfbxAb52KzfXVSY9DZ
 ycbHM5A/VhDK2P2DsTjVWXnTRfv94mv3pMn0FQu3VU2JyJZLG0bnyWE9rodR5HXknqWe
 jg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701805170; x=1702409970;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xfq67iLmriDqfduTRY0M8dju8QhNwul2zcs5mKn+Qdk=;
 b=V/+R8g/+VVsTr7LL2bYQsi/2YG6aVLXfwxzthp5zWWOPqmTZFehVAn2b5XRe8cGWcT
 7S/2Nx5E2Yi19rLQDg8y8plZOiTg93M0fzw5CMLLOVMNLTNFHYLZ56vGJ+dDc6g+H2ao
 IUybtAtOzV+NegK1vapO8Ubc1iBhzigcfOsbxDoSiSXuq11NSpvZr58XNkjawSwqJYn2
 hwakHMAk04ArNvgPnxvDzHFDx15wWLhpGiMF2XUenadA3efXSyPQROeEmT16k1/MuAy1
 ljg+jigePNWNXV91f+CUWLxUIUHadLeDPgOneSLi2D7KAYNnX0mejBFE5qOY9igZsdy3
 ci2Q==
X-Gm-Message-State: AOJu0YxWn4D8qDO5H+MbQcnpNO3s85L6mP7oTYdKzXJkl+DP1f9M2AV2
 Qhb4+vj4FmoqTsUCi0Me9chN+a8=
X-Google-Smtp-Source: AGHT+IFIztxj2eUKXZ2GS1Ca6Xtk1G+ZaZVM3GaQJJGqcaBfxYyvfWdWIYuJqHVvsmWQlJgRFVSGrCQ=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a63:1220:0:b0:5c2:2f9:c374 with SMTP id
 h32-20020a631220000000b005c202f9c374mr4433763pgl.9.1701805169961; Tue, 05 Dec
 2023 11:39:29 -0800 (PST)
Date: Tue, 5 Dec 2023 11:39:28 -0800
In-Reply-To: <656f66023f7bd_3dd6422942a@willemb.c.googlers.com.notmuch>
Mime-Version: 1.0
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
 <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
 <PH0PR11MB583000826591093B98BA841DD885A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <5a0faf8cc9ec3ab0d5082c66b909c582c8f1eae6.camel@siemens.com>
 <CAKH8qBuXL8bOYtfKKPS8y=KJqouDptyciCjr0wNKVHtNj6BmqA@mail.gmail.com>
 <656f66023f7bd_3dd6422942a@willemb.c.googlers.com.notmuch>
Message-ID: <ZW98UW033wCy9vI-@google.com>
From: Stanislav Fomichev <sdf@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: yoong.siang.song@intel.com,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Florian Bezdeka <florian.bezdeka@siemens.com>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Mykola Lysenko <mykolal@fb.com>,
 "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jose Abreu <joabreu@synopsys.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, maciej.fijalkowski@intel.com,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 magnus.karlsson@intel.com, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Bjorn Topel <bjorn@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, davem@davemloft.net
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

T24gMTIvMDUsIFdpbGxlbSBkZSBCcnVpam4gd3JvdGU6Cj4gU3RhbmlzbGF2IEZvbWljaGV2IHdy
b3RlOgo+ID4gT24gVHVlLCBEZWMgNSwgMjAyMyBhdCA3OjM04oCvQU0gRmxvcmlhbiBCZXpkZWth
Cj4gPiA8Zmxvcmlhbi5iZXpkZWthQHNpZW1lbnMuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
VHVlLCAyMDIzLTEyLTA1IGF0IDE1OjI1ICswMDAwLCBTb25nLCBZb29uZyBTaWFuZyB3cm90ZToK
PiA+ID4gPiBPbiBNb25kYXksIERlY2VtYmVyIDQsIDIwMjMgMTA6NTUgUE0sIFdpbGxlbSBkZSBC
cnVpam4gd3JvdGU6Cj4gPiA+ID4gPiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIHdyb3RlOgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBPbiAxMi8zLzIzIDE3OjUxLCBTb25nIFlv
b25nIFNpYW5nIHdyb3RlOgo+ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggZW5hYmxlcyBMYXVuY2gg
VGltZSAoVGltZS1CYXNlZCBTY2hlZHVsaW5nKSBzdXBwb3J0IHRvIFhEUCB6ZXJvCj4gPiA+ID4g
PiA+ID4gY29weSB2aWEgWERQIFR4IG1ldGFkYXRhIGZyYW1ld29yay4KPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFNvbmcgWW9vbmcgU2lhbmc8eW9vbmcuc2lhbmcu
c29uZ0BpbnRlbC5jb20+Cj4gPiA+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiA+ID4gICBkcml2ZXJz
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaCAgICAgIHwgIDIgKysKPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gQXMgcmVxdWVzdGVkIGJlZm9yZSwgSSB0aGluayB3ZSBuZWVkIHRv
IHNlZSBhbm90aGVyIGRyaXZlciBpbXBsZW1lbnRpbmcKPiA+ID4gPiA+ID4gdGhpcy4KPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gSSBwcm9wb3NlIGRyaXZlciBpZ2MgYW5kIGNoaXAgaTIyNS4KPiA+
ID4gPgo+ID4gPiA+IFN1cmUuIEkgd2lsbCBpbmNsdWRlIGlnYyBwYXRjaGVzIGluIG5leHQgdmVy
c2lvbi4KPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgaW50ZXJlc3RpbmcgdGhp
bmcgZm9yIG1lIGlzIHRvIHNlZSBob3cgdGhlIExhdW5jaFRpbWUgbWF4IDEgc2Vjb25kCj4gPiA+
ID4gPiA+IGludG8gdGhlIGZ1dHVyZVsxXSBpcyBoYW5kbGVkIGNvZGUgd2lzZS4gT25lIHN1Z2dl
c3Rpb24gaXMgdG8gYWRkIGEKPiA+ID4gPiA+ID4gc2VjdGlvbiB0byBEb2N1bWVudGF0aW9uL25l
dHdvcmtpbmcveHNrLXR4LW1ldGFkYXRhLnJzdCBwZXIgZHJpdmVyIHRoYXQKPiA+ID4gPiA+ID4g
bWVudGlvbnMvZG9jdW1lbnRzIHRoZXNlIGRpZmZlcmVudCBoYXJkd2FyZSBsaW1pdGF0aW9ucy4g
IEl0IGlzIG5hdHVyYWwKPiA+ID4gPiA+ID4gdGhhdCBkaWZmZXJlbnQgdHlwZXMgb2YgaGFyZHdh
cmUgaGF2ZSBsaW1pdGF0aW9ucy4gIFRoaXMgaXMgYSBjbG9zZS10bwo+ID4gPiA+ID4gPiBoYXJk
d2FyZS1sZXZlbCBhYnN0cmFjdGlvbi9BUEksIGFuZCBJTUhPIGFzIGxvbmcgYXMgd2UgZG9jdW1l
bnQgdGhlCj4gPiA+ID4gPiA+IGxpbWl0YXRpb25zIHdlIGNhbiBleHBvc2UgdGhpcyBBUEkgd2l0
aG91dCB0b28gbWFueSBsaW1pdGF0aW9ucyBmb3IgbW9yZQo+ID4gPiA+ID4gPiBjYXBhYmxlIGhh
cmR3YXJlLgo+ID4gPiA+Cj4gPiA+ID4gU3VyZS4gSSB3aWxsIHRyeSB0byBhZGQgaGFyZHdhcmUg
bGltaXRhdGlvbnMgaW4gZG9jdW1lbnRhdGlvbi4KPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+
IEkgd291bGQgYXNzdW1lIHRoYXQgdGhlIGtmdW5jIHdpbGwgZmFpbCB3aGVuIGEgdmFsdWUgaXMg
cGFzc2VkIHRoYXQKPiA+ID4gPiA+IGNhbm5vdCBiZSBwcm9ncmFtbWVkLgo+ID4gPiA+ID4KPiA+
ID4gPgo+ID4gPiA+IEluIGN1cnJlbnQgZGVzaWduLCB0aGUgeHNrX3R4X21ldGFkYXRhX3JlcXVl
c3QoKSBkaW50IGdvdCByZXR1cm4gdmFsdWUuCj4gPiA+ID4gU28gdXNlciB3b24ndCBrbm93IGlm
IHRoZWlyIHJlcXVlc3QgaXMgZmFpbC4KPiA+ID4gPiBJdCBpcyBjb21wbGV4IHRvIGluZm9ybSB1
c2VyIHdoaWNoIHJlcXVlc3QgaXMgZmFpbGluZy4KPiA+ID4gPiBUaGVyZWZvcmUsIElNSE8sIGl0
IGlzIGdvb2QgdGhhdCB3ZSBsZXQgZHJpdmVyIGhhbmRsZSB0aGUgZXJyb3Igc2lsZW50bHkuCj4g
PiA+ID4KPiA+ID4KPiA+ID4gSWYgdGhlIHByb2dyYW1tZWQgdmFsdWUgaXMgaW52YWxpZCwgdGhl
IHBhY2tldCB3aWxsIGJlICJkcm9wcGVkIiAvIHdpbGwKPiA+ID4gbmV2ZXIgbWFrZSBpdCB0byB0
aGUgd2lyZSwgcmlnaHQ/Cj4gCj4gUHJvZ3JhbW1hYmxlIGJlaGF2aW9yIGlzIHRvIGVpdGhlciBk
cm9wIG9yIGNhcCB0byBzb21lIGJvdW5kYXJ5Cj4gdmFsdWUsIHN1Y2ggYXMgdGhlIGZhcnRoZXN0
IHByb2dyYW1tYWJsZSB0aW1lIGluIHRoZSBmdXR1cmU6IHRoZQo+IGhvcml6b24uIEluIGZxOgo+
IAo+ICAgICAgICAgICAgICAgICAvKiBDaGVjayBpZiBwYWNrZXQgdGltZXN0YW1wIGlzIHRvbyBm
YXIgaW4gdGhlIGZ1dHVyZS4gKi8KPiAgICAgICAgICAgICAgICAgaWYgKGZxX3BhY2tldF9iZXlv
bmRfaG9yaXpvbihza2IsIHEsIG5vdykpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
cS0+aG9yaXpvbl9kcm9wKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHEtPnN0YXRfaG9yaXpvbl9kcm9wcysrOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcWRpc2NfZHJvcChza2IsIHNjaCwgdG9fZnJlZSk7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHEtPnN0YXRf
aG9yaXpvbl9jYXBzKys7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc2tiLT50c3RhbXAgPSBu
b3cgKyBxLT5ob3Jpem9uOwo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGZx
X3NrYl9jYihza2IpLT50aW1lX3RvX3NlbmQgPSBza2ItPnRzdGFtcDsKPiAKPiBEcm9wIGlzIHRo
ZSBtb3JlIG9idmlvdXNseSBjb3JyZWN0IG1vZGUuCj4gCj4gUHJvZ3JhbW1pbmcgd2l0aCBhIGNs
b2NrIHNvdXJjZSB0aGF0IHRoZSBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCB3aWxsCj4gdGhlbiBi
ZSBhIHBlcnNpc3RlbnQgZmFpbHVyZS4KPiAKPiBQcmVmZXJhYmx5LCB0aGlzIGRyaXZlciBjYXBh
YmlsaXR5IGNhbiBiZSBxdWVyaWVkIGJlZm9yZWhhbmQgKHJhdGhlcgo+IHRoYW4gb25seSB0aHJv
dWdoIHJlYWRpbmcgZXJyb3IgY291bnRlcnMgYWZ0ZXJ3YXJkcykuCj4gCj4gUGVyaGFwcyBpdCBz
aG91bGQgbm90IGJlIGEgZHJpdmVyIHRhc2sgdG8gY29udmVydCBmcm9tIHBvc3NpYmx5Cj4gbXVs
dGlwbGUgY2xvY2sgc291cmNlcyB0byB0aGUgZGV2aWNlIG5hdGl2ZSBjbG9jay4gUmlnaHQgbm93
LCB3ZSBkbwo+IHVzZSBwZXItZGV2aWNlIHRpbWVjb3VudGVycyBmb3IgdGhpcywgaW1wbGVtZW50
ZWQgaW4gdGhlIGRyaXZlci4KPiAKPiBBcyBmb3Igd2hpY2ggY2xvY2tzIGFyZSByZWxldmFudC4g
Rm9yIFBUUCwgSSBzdXBwb3NlIHRoZSBkZXZpY2UgUEhDLAo+IGNvbnZlcnRlZCB0byBuc2VjLiBG
b3IgcGFjaW5nIG9mZmxvYWQsIFRDUCB1c2VzIENMT0NLX01PTk9UT05JQy4KCkRvIHdlIG5lZWQg
dG8gZXhwb3NlIHNvbWUgZ2VuZXJpYyBuZXRkZXYgbmV0bGluayBhcGlzIHRvIHF1ZXJ5L2FkanVz
dApuaWMgY2xvY2sgc291cmNlcyAob3IgbWF5YmUgdGhlcmUgaXMgc29tZXRoaW5nIGV4aXN0aW5n
IGFscmVhZHkpPwpUaGVuIHRoZSB1c2Vyc3BhY2UgY2FuIGJlIHJlc3BvbnNpYmxlIGZvciBzeW5j
aW5nL2NvbnZlcnRpbmcgdGhlCnRpbWVzdGFtcHMgdG8gdGhlIGludGVybmFsIG5pYyBjbG9ja3Mu
ICsxIHRvIHRyeWluZyB0byBhdm9pZCBkb2luZwp0aGlzIGluIHRoZSBkcml2ZXJzLgoKPiA+ID4g
VGhhdCBpcyBjbGVhcmx5IGEgc2l0dWF0aW9uIHRoYXQgdGhlIHVzZXIgc2hvdWxkIGJlIGluZm9y
bWVkIGFib3V0LiBGb3IKPiA+ID4gUlQgc3lzdGVtcyB0aGlzIG5vcm1hbGx5IG1lYW5zIHRoYXQg
c29tZXRoaW5nIGlzIHJlYWxseSB3cm9uZyByZWdhcmRpbmcKPiA+ID4gdGltaW5nIC8gY3ljbGUg
b3ZlcmZsb3cuIFN1Y2ggc3lzdGVtcyBoYXZlIHRvIHJlYWN0IG9uIHRoYXQgc2l0dWF0aW9uLgo+
ID4gCj4gPiBJbiBnZW5lcmFsLCBhZl94ZHAgaXMgYSBiaXQgbGFja2luZyBpbiB0aGlzICdub3Rp
ZnkgdGhlIHVzZXIgdGhhdCB0aGV5Cj4gPiBzb21laG93IG1lc3NlZCB1cCcgYXJlYSA6LSgKPiA+
IEZvciBleGFtcGxlLCBwdXNoaW5nIGEgdHggZGVzY3JpcHRvciB3aXRoIGEgd3JvbmcgYWRkci9s
ZW4gaW4gemMgbW9kZQo+ID4gd2lsbCBub3QgZ2l2ZSBhbnkgdmlzaWJsZSBzaWduYWwgYmFjayAo
YmVzaWRlcyBkcml2ZXIgcG90ZW50aWFsbHkKPiA+IHNwaWxsaW5nIHNvbWV0aGluZyBpbnRvIGRt
ZXNnIGFzIGl0IHdhcyBpbiB0aGUgbWx4IGNhc2UpLgo+ID4gV2UgY2FuIHByb2JhYmx5IHN0YXJ0
IHdpdGggaGF2aW5nIHNvbWUgY291bnRlcnMgZm9yIHRoZXNlIGV2ZW50cz8KPiAKPiBUaGlzIGlz
IGJlY2F1c2UgdGhlIEFGX1hEUCBjb21wbGV0aW9uIHF1ZXVlIGRlc2NyaXB0b3IgZm9ybWF0IGlz
IG9ubHkKPiBhIHU2NCBhZGRyZXNzPwoKWWVhaC4gWERQX0NPUFkgbW9kZSBoYXMgdGhlIGRlc2Ny
aXB0b3IgdmFsaWRhdGlvbiB3aGljaCBpcyBleHBvcnRlZCB2aWEKcmVjdm1zZyBlcnJubywgYnV0
IHplcm9jb3B5IHBhdGggc2VlbXMgdG8gYmUgdG9vIGRlZXAgaW4gdGhlIHN0YWNrCnRvIHJlcG9y
dCBzb21ldGhpbmcgYmFjay4gQW5kIHRoZXJlIGlzIG5vIHBsYWNlLCBhcyB5b3UgbWVudGlvbiwK
aW4gdGhlIGNvbXBsZXRpb24gcmluZyB0byByZXBvcnQgdGhlIHN0YXR1cy4KCj4gQ291bGQgZXJy
b3IgY29uZGl0aW9ucyBiZSByZXBvcnRlZCBvbiB0eCBjb21wbGV0aW9uIGluIHRoZSBtZXRhZGF0
YSwKPiB1c2luZyB4c2tfdHhfbWV0YWRhdGFfY29tcGxldGU/CgpUaGF0IHdvdWxkIGJlIG9uZSB3
YXkgdG8gZG8gaXQsIHllcy4gQnV0IHRoZW4gdGhlIGVycm9yIHJlcG9ydGluZyBkZXBlbmRzCm9u
IHRoZSBtZXRhZGF0YSBvcHQtaW4uIEhhdmluZyBhIHNlcGFyYXRlIHJpbmcgdG8gZXhwb3J0IHRo
ZSBlcnJvcnMsCm9yIGhhdmluZyBhIHYyIHR4LWNvbXBsZXRpb25zIGxheW91dCB3aXRoIGV4dHJh
ICdzdGF0dXMnIGZpZWxkIHdvdWxkIGFsc28Kd29yay4KCkJ1dCB0aGlzIHNlZW1zIGxpa2Ugc29t
ZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGhhbmRsZWQgc2VwYXJhdGVseT8gQmVjYXVzZQp3ZSdkIGhh
dmUgdG8gdGVhY2ggYWxsIGV4aXN0aW5nIHpjIGRyaXZlcnMgdG8gcmVwb3J0IHRob3NlIGVycm9y
cyBiYWNrCmluc3RlYWQgb2YgZHJvcHBpbmcgdGhlc2UgZGVzY3JpcHRvcnMuLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
