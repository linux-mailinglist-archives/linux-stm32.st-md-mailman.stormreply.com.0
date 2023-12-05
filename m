Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0D3805CCB
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 19:03:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BC4DC6C820;
	Tue,  5 Dec 2023 18:03:49 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16EBDC6C820
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 18:03:47 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-77db736aae5so324111885a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 10:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701799427; x=1702404227;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtqmpldzJhepZSlcxwawCnd6BYpTKMMQiQbo2+VQqDs=;
 b=WxINh9QPi4/HWuw2OPeK+Y8uy5ZkQ1yiviDV1rsKSYLPxe19fOq1t5UZs9w63dOw55
 jXY1U5L+mrSFKajFZtoSHJnId2FpNFa6o9jcPC4L9D8YYxe1QbX7alcIDZV9EVVKKrW8
 gZnGWE5FVIT/AXyocdBXTd06+mVl0KlW1LgjktybHvpAOWyx7vZ42V7z6Fvp/oXrJoHZ
 7CHtWD6b1QGBjNJFWA55xLHLFA25FNGMCtRvrYQFb55uy8i5KS9hdM6fqE8SBIwIQMh4
 mRFedvL6VyfZGoROjdKrbM75imIP7//wYy2SxuqAVxIMp6P8GZJexFbTIQ9WDbZHaNZX
 pjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701799427; x=1702404227;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mtqmpldzJhepZSlcxwawCnd6BYpTKMMQiQbo2+VQqDs=;
 b=l2kWcBi6PgnCRz//hNlsdcHdXcmvu2z237TBsN5QGPFWEb0JK0l9yXKwElvjhA4G4E
 v6rzIIGx3WAfEF0PsQCKPzuxplqaqo5aUNziUpiuhVFvdjCNO6Z+iI7WVpnwziQDsMkl
 aj2TEJ2iu7rnTb321fJlNkHSxe6f6InmBJTzagkVAsOP+qaPAFAvAgdyhOAXt06M1Ldf
 GhZwY8UazZtVevFXqaKEJQODdhqT7in4B4YRw7GSwdGJ0Y6UPa+lfkiz6XOTFXLj6U69
 +QDoyytqpWLEhTiCU4XCWFLyghlYsz90SrcqAyK3dNVVlCXi3R9mtZAbw0tWIC0j4cLl
 DVhA==
X-Gm-Message-State: AOJu0YzcCGysCri8P3wtZoCVjEIWHfzdA3wQtXdDTq7ti1hYu4Wi3ZQJ
 yzaWZ/KKxE1is5pXDpMrFvU=
X-Google-Smtp-Source: AGHT+IH5nvUqAJXOSA/slhx2XextBvezJuOqw3B1kWvu8x7p9HMI0Usz1QLdc8DahjbJUTB515nU3A==
X-Received: by 2002:a05:620a:349:b0:77e:fba3:7574 with SMTP id
 t9-20020a05620a034900b0077efba37574mr1530842qkm.108.1701799426793; 
 Tue, 05 Dec 2023 10:03:46 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 qh13-20020a05620a668d00b0077d85d22e89sm5264273qkn.63.2023.12.05.10.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 10:03:46 -0800 (PST)
Date: Tue, 05 Dec 2023 13:03:46 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Stanislav Fomichev <sdf@google.com>, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
Message-ID: <656f66023f7bd_3dd6422942a@willemb.c.googlers.com.notmuch>
In-Reply-To: <CAKH8qBuXL8bOYtfKKPS8y=KJqouDptyciCjr0wNKVHtNj6BmqA@mail.gmail.com>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
 <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
 <PH0PR11MB583000826591093B98BA841DD885A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <5a0faf8cc9ec3ab0d5082c66b909c582c8f1eae6.camel@siemens.com>
 <CAKH8qBuXL8bOYtfKKPS8y=KJqouDptyciCjr0wNKVHtNj6BmqA@mail.gmail.com>
Mime-Version: 1.0
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

U3RhbmlzbGF2IEZvbWljaGV2IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDUsIDIwMjMgYXQgNzozNOKA
r0FNIEZsb3JpYW4gQmV6ZGVrYQo+IDxmbG9yaWFuLmJlemRla2FAc2llbWVucy5jb20+IHdyb3Rl
Ogo+ID4KPiA+IE9uIFR1ZSwgMjAyMy0xMi0wNSBhdCAxNToyNSArMDAwMCwgU29uZywgWW9vbmcg
U2lhbmcgd3JvdGU6Cj4gPiA+IE9uIE1vbmRheSwgRGVjZW1iZXIgNCwgMjAyMyAxMDo1NSBQTSwg
V2lsbGVtIGRlIEJydWlqbiB3cm90ZToKPiA+ID4gPiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIHdy
b3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiAxMi8zLzIzIDE3OjUxLCBTb25n
IFlvb25nIFNpYW5nIHdyb3RlOgo+ID4gPiA+ID4gPiBUaGlzIHBhdGNoIGVuYWJsZXMgTGF1bmNo
IFRpbWUgKFRpbWUtQmFzZWQgU2NoZWR1bGluZykgc3VwcG9ydCB0byBYRFAgemVybwo+ID4gPiA+
ID4gPiBjb3B5IHZpYSBYRFAgVHggbWV0YWRhdGEgZnJhbWV3b3JrLgo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTb25nIFlvb25nIFNpYW5nPHlvb25nLnNpYW5nLnNvbmdA
aW50ZWwuY29tPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gICBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaCAgICAgIHwgIDIgKysKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBBcyByZXF1ZXN0ZWQgYmVmb3JlLCBJIHRoaW5rIHdlIG5lZWQgdG8gc2VlIGFub3RoZXIg
ZHJpdmVyIGltcGxlbWVudGluZwo+ID4gPiA+ID4gdGhpcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJ
IHByb3Bvc2UgZHJpdmVyIGlnYyBhbmQgY2hpcCBpMjI1Lgo+ID4gPgo+ID4gPiBTdXJlLiBJIHdp
bGwgaW5jbHVkZSBpZ2MgcGF0Y2hlcyBpbiBuZXh0IHZlcnNpb24uCj4gPiA+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhlIGludGVyZXN0aW5nIHRoaW5nIGZvciBtZSBpcyB0byBzZWUgaG93IHRoZSBM
YXVuY2hUaW1lIG1heCAxIHNlY29uZAo+ID4gPiA+ID4gaW50byB0aGUgZnV0dXJlWzFdIGlzIGhh
bmRsZWQgY29kZSB3aXNlLiBPbmUgc3VnZ2VzdGlvbiBpcyB0byBhZGQgYQo+ID4gPiA+ID4gc2Vj
dGlvbiB0byBEb2N1bWVudGF0aW9uL25ldHdvcmtpbmcveHNrLXR4LW1ldGFkYXRhLnJzdCBwZXIg
ZHJpdmVyIHRoYXQKPiA+ID4gPiA+IG1lbnRpb25zL2RvY3VtZW50cyB0aGVzZSBkaWZmZXJlbnQg
aGFyZHdhcmUgbGltaXRhdGlvbnMuICBJdCBpcyBuYXR1cmFsCj4gPiA+ID4gPiB0aGF0IGRpZmZl
cmVudCB0eXBlcyBvZiBoYXJkd2FyZSBoYXZlIGxpbWl0YXRpb25zLiAgVGhpcyBpcyBhIGNsb3Nl
LXRvCj4gPiA+ID4gPiBoYXJkd2FyZS1sZXZlbCBhYnN0cmFjdGlvbi9BUEksIGFuZCBJTUhPIGFz
IGxvbmcgYXMgd2UgZG9jdW1lbnQgdGhlCj4gPiA+ID4gPiBsaW1pdGF0aW9ucyB3ZSBjYW4gZXhw
b3NlIHRoaXMgQVBJIHdpdGhvdXQgdG9vIG1hbnkgbGltaXRhdGlvbnMgZm9yIG1vcmUKPiA+ID4g
PiA+IGNhcGFibGUgaGFyZHdhcmUuCj4gPiA+Cj4gPiA+IFN1cmUuIEkgd2lsbCB0cnkgdG8gYWRk
IGhhcmR3YXJlIGxpbWl0YXRpb25zIGluIGRvY3VtZW50YXRpb24uCj4gPiA+Cj4gPiA+ID4KPiA+
ID4gPiBJIHdvdWxkIGFzc3VtZSB0aGF0IHRoZSBrZnVuYyB3aWxsIGZhaWwgd2hlbiBhIHZhbHVl
IGlzIHBhc3NlZCB0aGF0Cj4gPiA+ID4gY2Fubm90IGJlIHByb2dyYW1tZWQuCj4gPiA+ID4KPiA+
ID4KPiA+ID4gSW4gY3VycmVudCBkZXNpZ24sIHRoZSB4c2tfdHhfbWV0YWRhdGFfcmVxdWVzdCgp
IGRpbnQgZ290IHJldHVybiB2YWx1ZS4KPiA+ID4gU28gdXNlciB3b24ndCBrbm93IGlmIHRoZWly
IHJlcXVlc3QgaXMgZmFpbC4KPiA+ID4gSXQgaXMgY29tcGxleCB0byBpbmZvcm0gdXNlciB3aGlj
aCByZXF1ZXN0IGlzIGZhaWxpbmcuCj4gPiA+IFRoZXJlZm9yZSwgSU1ITywgaXQgaXMgZ29vZCB0
aGF0IHdlIGxldCBkcml2ZXIgaGFuZGxlIHRoZSBlcnJvciBzaWxlbnRseS4KPiA+ID4KPiA+Cj4g
PiBJZiB0aGUgcHJvZ3JhbW1lZCB2YWx1ZSBpcyBpbnZhbGlkLCB0aGUgcGFja2V0IHdpbGwgYmUg
ImRyb3BwZWQiIC8gd2lsbAo+ID4gbmV2ZXIgbWFrZSBpdCB0byB0aGUgd2lyZSwgcmlnaHQ/CgpQ
cm9ncmFtbWFibGUgYmVoYXZpb3IgaXMgdG8gZWl0aGVyIGRyb3Agb3IgY2FwIHRvIHNvbWUgYm91
bmRhcnkKdmFsdWUsIHN1Y2ggYXMgdGhlIGZhcnRoZXN0IHByb2dyYW1tYWJsZSB0aW1lIGluIHRo
ZSBmdXR1cmU6IHRoZQpob3Jpem9uLiBJbiBmcToKCiAgICAgICAgICAgICAgICAvKiBDaGVjayBp
ZiBwYWNrZXQgdGltZXN0YW1wIGlzIHRvbyBmYXIgaW4gdGhlIGZ1dHVyZS4gKi8KICAgICAgICAg
ICAgICAgIGlmIChmcV9wYWNrZXRfYmV5b25kX2hvcml6b24oc2tiLCBxLCBub3cpKSB7CiAgICAg
ICAgICAgICAgICAgICAgICAgIGlmIChxLT5ob3Jpem9uX2Ryb3ApIHsKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHEtPnN0YXRfaG9yaXpvbl9kcm9wcysrOwogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHFkaXNjX2Ryb3Aoc2tiLCBz
Y2gsIHRvX2ZyZWUpOwogICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAg
ICAgICAgIHEtPnN0YXRfaG9yaXpvbl9jYXBzKys7CiAgICAgICAgICAgICAgICAgICAgICAgIHNr
Yi0+dHN0YW1wID0gbm93ICsgcS0+aG9yaXpvbjsKICAgICAgICAgICAgICAgIH0KICAgICAgICAg
ICAgICAgIGZxX3NrYl9jYihza2IpLT50aW1lX3RvX3NlbmQgPSBza2ItPnRzdGFtcDsKCkRyb3Ag
aXMgdGhlIG1vcmUgb2J2aW91c2x5IGNvcnJlY3QgbW9kZS4KClByb2dyYW1taW5nIHdpdGggYSBj
bG9jayBzb3VyY2UgdGhhdCB0aGUgZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgd2lsbAp0aGVuIGJl
IGEgcGVyc2lzdGVudCBmYWlsdXJlLgoKUHJlZmVyYWJseSwgdGhpcyBkcml2ZXIgY2FwYWJpbGl0
eSBjYW4gYmUgcXVlcmllZCBiZWZvcmVoYW5kIChyYXRoZXIKdGhhbiBvbmx5IHRocm91Z2ggcmVh
ZGluZyBlcnJvciBjb3VudGVycyBhZnRlcndhcmRzKS4KClBlcmhhcHMgaXQgc2hvdWxkIG5vdCBi
ZSBhIGRyaXZlciB0YXNrIHRvIGNvbnZlcnQgZnJvbSBwb3NzaWJseQptdWx0aXBsZSBjbG9jayBz
b3VyY2VzIHRvIHRoZSBkZXZpY2UgbmF0aXZlIGNsb2NrLiBSaWdodCBub3csIHdlIGRvCnVzZSBw
ZXItZGV2aWNlIHRpbWVjb3VudGVycyBmb3IgdGhpcywgaW1wbGVtZW50ZWQgaW4gdGhlIGRyaXZl
ci4KCkFzIGZvciB3aGljaCBjbG9ja3MgYXJlIHJlbGV2YW50LiBGb3IgUFRQLCBJIHN1cHBvc2Ug
dGhlIGRldmljZSBQSEMsCmNvbnZlcnRlZCB0byBuc2VjLiBGb3IgcGFjaW5nIG9mZmxvYWQsIFRD
UCB1c2VzIENMT0NLX01PTk9UT05JQy4KCj4gPgo+ID4gVGhhdCBpcyBjbGVhcmx5IGEgc2l0dWF0
aW9uIHRoYXQgdGhlIHVzZXIgc2hvdWxkIGJlIGluZm9ybWVkIGFib3V0LiBGb3IKPiA+IFJUIHN5
c3RlbXMgdGhpcyBub3JtYWxseSBtZWFucyB0aGF0IHNvbWV0aGluZyBpcyByZWFsbHkgd3Jvbmcg
cmVnYXJkaW5nCj4gPiB0aW1pbmcgLyBjeWNsZSBvdmVyZmxvdy4gU3VjaCBzeXN0ZW1zIGhhdmUg
dG8gcmVhY3Qgb24gdGhhdCBzaXR1YXRpb24uCj4gCj4gSW4gZ2VuZXJhbCwgYWZfeGRwIGlzIGEg
Yml0IGxhY2tpbmcgaW4gdGhpcyAnbm90aWZ5IHRoZSB1c2VyIHRoYXQgdGhleQo+IHNvbWVob3cg
bWVzc2VkIHVwJyBhcmVhIDotKAo+IEZvciBleGFtcGxlLCBwdXNoaW5nIGEgdHggZGVzY3JpcHRv
ciB3aXRoIGEgd3JvbmcgYWRkci9sZW4gaW4gemMgbW9kZQo+IHdpbGwgbm90IGdpdmUgYW55IHZp
c2libGUgc2lnbmFsIGJhY2sgKGJlc2lkZXMgZHJpdmVyIHBvdGVudGlhbGx5Cj4gc3BpbGxpbmcg
c29tZXRoaW5nIGludG8gZG1lc2cgYXMgaXQgd2FzIGluIHRoZSBtbHggY2FzZSkuCj4gV2UgY2Fu
IHByb2JhYmx5IHN0YXJ0IHdpdGggaGF2aW5nIHNvbWUgY291bnRlcnMgZm9yIHRoZXNlIGV2ZW50
cz8KClRoaXMgaXMgYmVjYXVzZSB0aGUgQUZfWERQIGNvbXBsZXRpb24gcXVldWUgZGVzY3JpcHRv
ciBmb3JtYXQgaXMgb25seQphIHU2NCBhZGRyZXNzPwoKQ291bGQgZXJyb3IgY29uZGl0aW9ucyBi
ZSByZXBvcnRlZCBvbiB0eCBjb21wbGV0aW9uIGluIHRoZSBtZXRhZGF0YSwKdXNpbmcgeHNrX3R4
X21ldGFkYXRhX2NvbXBsZXRlPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
