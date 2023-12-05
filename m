Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDD0805EFA
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 21:01:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 512BBC6B475;
	Tue,  5 Dec 2023 20:01:50 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DC01C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 20:01:49 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-77dce4d41d5so329485285a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 12:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701806508; x=1702411308;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=57/0OhXNeSQH9MeOrdfridw7DT7/gjMEM3JF3mFlNJc=;
 b=cf8N9IxkeOojWjYKkSI61RitWOCesO/REvsop/HRDZPvSWg7ZcJ23Z97gg7U9H4hM1
 XyUr+r2oC4HfRi6HN9slT4V6q9xYOWvI88aY9zDwfxWHkNFnVuse3aZRrFeda/i3XGb9
 5V2aY8FCFoDJD/3Zr3uMjcSDgS2dhOCB5n+eftECbGFhDmuJlB1Ptw/yJ1JcFCdrMsXn
 gWR1IMMM2eSypDvqJy4uNuUQX/woXD5vzNRUPUDf9im4CsEPqK74gJXtodRRx2v9YvNc
 feCCu6j2cHcirrKTfyzwHV4/HRh5qEr9K9DOqu6VQXNzlyx8RlaU/EgGKM/DPnPvi+X9
 CCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701806508; x=1702411308;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=57/0OhXNeSQH9MeOrdfridw7DT7/gjMEM3JF3mFlNJc=;
 b=m2f1pV5yrfu/J8jbxmi010HNDSYo/jNR94LvxNWKaRjW2M4wOrJUmxCudVHA0Ud2CZ
 LFeVlQVeTZCzPgDb7I1A+Sc9O1kV53Ajgc8ZboQ/9fE6Pd3GzhghaQPom0UgTAOewQcn
 5p34rxk71bMJL49/JwF51CsWjpxhn0m9lYzezQVWiSz47VkQ7tc7P4UR9BAzICAcbaJh
 VOONfgMCigMycmfAY1BrQCkNLAXZYBi1SASgYo5H+EoMCZDybsSjKnZve2gCDrsvFqCR
 WafcDfsXhj8vds7w2rr9/vdFn2MLp/5P/q9YsulqI7kdfOl7e6qNqoV7ew4p/GH1Hu3F
 Ts2g==
X-Gm-Message-State: AOJu0YxEk1HyKHkaEBjx838yWPw9Rcmh5MCcTzwsWpUaibyKrcTBjkEz
 Fhx4mItXoq3FoPko6WspUwk=
X-Google-Smtp-Source: AGHT+IHPJi2LHTZ5kQ7UCzMYZnsbaKN6UHzf0dQ/epfmYxKwG30UraQugSMbGBuSqNfNoCTEbhSZPA==
X-Received: by 2002:a05:620a:5372:b0:77d:cf48:9358 with SMTP id
 op50-20020a05620a537200b0077dcf489358mr1535978qkn.9.1701806508231; 
 Tue, 05 Dec 2023 12:01:48 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 qj4-20020a05620a880400b0077589913a8bsm5267291qkn.132.2023.12.05.12.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 12:01:47 -0800 (PST)
Date: Tue, 05 Dec 2023 15:01:47 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Stanislav Fomichev <sdf@google.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Message-ID: <656f81abaeee7_3f5f95294ef@willemb.c.googlers.com.notmuch>
In-Reply-To: <ZW98UW033wCy9vI-@google.com>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
 <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
 <PH0PR11MB583000826591093B98BA841DD885A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <5a0faf8cc9ec3ab0d5082c66b909c582c8f1eae6.camel@siemens.com>
 <CAKH8qBuXL8bOYtfKKPS8y=KJqouDptyciCjr0wNKVHtNj6BmqA@mail.gmail.com>
 <656f66023f7bd_3dd6422942a@willemb.c.googlers.com.notmuch>
 <ZW98UW033wCy9vI-@google.com>
Mime-Version: 1.0
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

U3RhbmlzbGF2IEZvbWljaGV2IHdyb3RlOgo+IE9uIDEyLzA1LCBXaWxsZW0gZGUgQnJ1aWpuIHdy
b3RlOgo+ID4gU3RhbmlzbGF2IEZvbWljaGV2IHdyb3RlOgo+ID4gPiBPbiBUdWUsIERlYyA1LCAy
MDIzIGF0IDc6MzTigK9BTSBGbG9yaWFuIEJlemRla2EKPiA+ID4gPGZsb3JpYW4uYmV6ZGVrYUBz
aWVtZW5zLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUdWUsIDIwMjMtMTItMDUgYXQg
MTU6MjUgKzAwMDAsIFNvbmcsIFlvb25nIFNpYW5nIHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uZGF5
LCBEZWNlbWJlciA0LCAyMDIzIDEwOjU1IFBNLCBXaWxsZW0gZGUgQnJ1aWpuIHdyb3RlOgo+ID4g
PiA+ID4gPiBKZXNwZXIgRGFuZ2FhcmQgQnJvdWVyIHdyb3RlOgo+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBPbiAxMi8zLzIzIDE3OjUxLCBTb25nIFlvb25nIFNpYW5n
IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBlbmFibGVzIExhdW5jaCBUaW1lIChU
aW1lLUJhc2VkIFNjaGVkdWxpbmcpIHN1cHBvcnQgdG8gWERQIHplcm8KPiA+ID4gPiA+ID4gPiA+
IGNvcHkgdmlhIFhEUCBUeCBtZXRhZGF0YSBmcmFtZXdvcmsuCj4gPiA+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU29uZyBZb29uZyBTaWFuZzx5b29uZy5zaWFuZy5z
b25nQGludGVsLmNvbT4KPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ID4gICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWMuaCAgICAgIHwgIDIgKysKPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEFzIHJlcXVlc3RlZCBiZWZvcmUsIEkgdGhpbmsgd2Ug
bmVlZCB0byBzZWUgYW5vdGhlciBkcml2ZXIgaW1wbGVtZW50aW5nCj4gPiA+ID4gPiA+ID4gdGhp
cy4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEkgcHJvcG9zZSBkcml2ZXIgaWdjIGFuZCBj
aGlwIGkyMjUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU3VyZS4gSSB3aWxsIGluY2x1ZGUgaWdjIHBh
dGNoZXMgaW4gbmV4dCB2ZXJzaW9uLgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IFRoZSBpbnRlcmVzdGluZyB0aGluZyBmb3IgbWUgaXMgdG8gc2VlIGhvdyB0aGUgTGF1bmNo
VGltZSBtYXggMSBzZWNvbmQKPiA+ID4gPiA+ID4gPiBpbnRvIHRoZSBmdXR1cmVbMV0gaXMgaGFu
ZGxlZCBjb2RlIHdpc2UuIE9uZSBzdWdnZXN0aW9uIGlzIHRvIGFkZCBhCj4gPiA+ID4gPiA+ID4g
c2VjdGlvbiB0byBEb2N1bWVudGF0aW9uL25ldHdvcmtpbmcveHNrLXR4LW1ldGFkYXRhLnJzdCBw
ZXIgZHJpdmVyIHRoYXQKPiA+ID4gPiA+ID4gPiBtZW50aW9ucy9kb2N1bWVudHMgdGhlc2UgZGlm
ZmVyZW50IGhhcmR3YXJlIGxpbWl0YXRpb25zLiAgSXQgaXMgbmF0dXJhbAo+ID4gPiA+ID4gPiA+
IHRoYXQgZGlmZmVyZW50IHR5cGVzIG9mIGhhcmR3YXJlIGhhdmUgbGltaXRhdGlvbnMuICBUaGlz
IGlzIGEgY2xvc2UtdG8KPiA+ID4gPiA+ID4gPiBoYXJkd2FyZS1sZXZlbCBhYnN0cmFjdGlvbi9B
UEksIGFuZCBJTUhPIGFzIGxvbmcgYXMgd2UgZG9jdW1lbnQgdGhlCj4gPiA+ID4gPiA+ID4gbGlt
aXRhdGlvbnMgd2UgY2FuIGV4cG9zZSB0aGlzIEFQSSB3aXRob3V0IHRvbyBtYW55IGxpbWl0YXRp
b25zIGZvciBtb3JlCj4gPiA+ID4gPiA+ID4gY2FwYWJsZSBoYXJkd2FyZS4KPiA+ID4gPiA+Cj4g
PiA+ID4gPiBTdXJlLiBJIHdpbGwgdHJ5IHRvIGFkZCBoYXJkd2FyZSBsaW1pdGF0aW9ucyBpbiBk
b2N1bWVudGF0aW9uLgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSB3b3VsZCBh
c3N1bWUgdGhhdCB0aGUga2Z1bmMgd2lsbCBmYWlsIHdoZW4gYSB2YWx1ZSBpcyBwYXNzZWQgdGhh
dAo+ID4gPiA+ID4gPiBjYW5ub3QgYmUgcHJvZ3JhbW1lZC4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiBJbiBjdXJyZW50IGRlc2lnbiwgdGhlIHhza190eF9tZXRhZGF0YV9yZXF1ZXN0
KCkgZGludCBnb3QgcmV0dXJuIHZhbHVlLgo+ID4gPiA+ID4gU28gdXNlciB3b24ndCBrbm93IGlm
IHRoZWlyIHJlcXVlc3QgaXMgZmFpbC4KPiA+ID4gPiA+IEl0IGlzIGNvbXBsZXggdG8gaW5mb3Jt
IHVzZXIgd2hpY2ggcmVxdWVzdCBpcyBmYWlsaW5nLgo+ID4gPiA+ID4gVGhlcmVmb3JlLCBJTUhP
LCBpdCBpcyBnb29kIHRoYXQgd2UgbGV0IGRyaXZlciBoYW5kbGUgdGhlIGVycm9yIHNpbGVudGx5
Lgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IElmIHRoZSBwcm9ncmFtbWVkIHZhbHVlIGlzIGlu
dmFsaWQsIHRoZSBwYWNrZXQgd2lsbCBiZSAiZHJvcHBlZCIgLyB3aWxsCj4gPiA+ID4gbmV2ZXIg
bWFrZSBpdCB0byB0aGUgd2lyZSwgcmlnaHQ/Cj4gPiAKPiA+IFByb2dyYW1tYWJsZSBiZWhhdmlv
ciBpcyB0byBlaXRoZXIgZHJvcCBvciBjYXAgdG8gc29tZSBib3VuZGFyeQo+ID4gdmFsdWUsIHN1
Y2ggYXMgdGhlIGZhcnRoZXN0IHByb2dyYW1tYWJsZSB0aW1lIGluIHRoZSBmdXR1cmU6IHRoZQo+
ID4gaG9yaXpvbi4gSW4gZnE6Cj4gPiAKPiA+ICAgICAgICAgICAgICAgICAvKiBDaGVjayBpZiBw
YWNrZXQgdGltZXN0YW1wIGlzIHRvbyBmYXIgaW4gdGhlIGZ1dHVyZS4gKi8KPiA+ICAgICAgICAg
ICAgICAgICBpZiAoZnFfcGFja2V0X2JleW9uZF9ob3Jpem9uKHNrYiwgcSwgbm93KSkgewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHEtPmhvcml6b25fZHJvcCkgewo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHEtPnN0YXRfaG9yaXpvbl9kcm9wcysr
Owo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBxZGlz
Y19kcm9wKHNrYiwgc2NoLCB0b19mcmVlKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIH0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHEtPnN0YXRfaG9yaXpvbl9jYXBzKys7Cj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBza2ItPnRzdGFtcCA9IG5vdyArIHEtPmhvcml6b247Cj4g
PiAgICAgICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAgIGZxX3NrYl9jYihza2IpLT50
aW1lX3RvX3NlbmQgPSBza2ItPnRzdGFtcDsKPiA+IAo+ID4gRHJvcCBpcyB0aGUgbW9yZSBvYnZp
b3VzbHkgY29ycmVjdCBtb2RlLgo+ID4gCj4gPiBQcm9ncmFtbWluZyB3aXRoIGEgY2xvY2sgc291
cmNlIHRoYXQgdGhlIGRyaXZlciBkb2VzIG5vdCBzdXBwb3J0IHdpbGwKPiA+IHRoZW4gYmUgYSBw
ZXJzaXN0ZW50IGZhaWx1cmUuCj4gPiAKPiA+IFByZWZlcmFibHksIHRoaXMgZHJpdmVyIGNhcGFi
aWxpdHkgY2FuIGJlIHF1ZXJpZWQgYmVmb3JlaGFuZCAocmF0aGVyCj4gPiB0aGFuIG9ubHkgdGhy
b3VnaCByZWFkaW5nIGVycm9yIGNvdW50ZXJzIGFmdGVyd2FyZHMpLgo+ID4gCj4gPiBQZXJoYXBz
IGl0IHNob3VsZCBub3QgYmUgYSBkcml2ZXIgdGFzayB0byBjb252ZXJ0IGZyb20gcG9zc2libHkK
PiA+IG11bHRpcGxlIGNsb2NrIHNvdXJjZXMgdG8gdGhlIGRldmljZSBuYXRpdmUgY2xvY2suIFJp
Z2h0IG5vdywgd2UgZG8KPiA+IHVzZSBwZXItZGV2aWNlIHRpbWVjb3VudGVycyBmb3IgdGhpcywg
aW1wbGVtZW50ZWQgaW4gdGhlIGRyaXZlci4KPiA+IAo+ID4gQXMgZm9yIHdoaWNoIGNsb2NrcyBh
cmUgcmVsZXZhbnQuIEZvciBQVFAsIEkgc3VwcG9zZSB0aGUgZGV2aWNlIFBIQywKPiA+IGNvbnZl
cnRlZCB0byBuc2VjLiBGb3IgcGFjaW5nIG9mZmxvYWQsIFRDUCB1c2VzIENMT0NLX01PTk9UT05J
Qy4KPiAKPiBEbyB3ZSBuZWVkIHRvIGV4cG9zZSBzb21lIGdlbmVyaWMgbmV0ZGV2IG5ldGxpbmsg
YXBpcyB0byBxdWVyeS9hZGp1c3QKPiBuaWMgY2xvY2sgc291cmNlcyAob3IgbWF5YmUgdGhlcmUg
aXMgc29tZXRoaW5nIGV4aXN0aW5nIGFscmVhZHkpPwo+IFRoZW4gdGhlIHVzZXJzcGFjZSBjYW4g
YmUgcmVzcG9uc2libGUgZm9yIHN5bmNpbmcvY29udmVydGluZyB0aGUKPiB0aW1lc3RhbXBzIHRv
IHRoZSBpbnRlcm5hbCBuaWMgY2xvY2tzLiArMSB0byB0cnlpbmcgdG8gYXZvaWQgZG9pbmcKPiB0
aGlzIGluIHRoZSBkcml2ZXJzLgoKUGVyaGFwcy4gSSdtIGp1c3QgYSBiaXQgaGVzaXRhbnQgc2lu
Y2UgdGhhdCBpcyBVQVBJIGFuZCB0aGlzIGlzIGFsbApxdWl0ZSBoYW5kLXdhdnkgc3RpbGwuCgpT
b21lIG9mIHRoZSBjb252ZXJzaW9uIG5lY2Vzc2FyaWx5IGhhcyB0byBiZSBpbiB0aGUgZHJpdmVy
LiBPbmx5IHRoZQpkcml2ZXIga25vd3MgdGhlIGRlc2NyaXB0b3IgZm9ybWF0LCBhbmQgbGltaXRh
dGlvbnMgb2YgdGhhdCwgc3VjaCBhcwp0aGUgYml0LXdpZHRoIHRoYXQgY2FuIGJlIGVuY29kZWQu
CgpJZiB3ZSBjYW5ub3QgbW92ZSBhbnl0aGluZyBvdXQgb2YgdGhlIGRyaXZlcnMgKHF1aXRlIGxp
a2VseSksIHRoZW4KYWdyZWVkIHRoYXQgYSBuZXRkZXYvZXRodG9vbCBuZXRsaW5rIHF1ZXJ5IGFw
cHJvYWNoIGlzIGhlbHBmdWwuCgpUbyBiZSBjbGVhcjogSSBkb24ndCBtZWFuIHRoYXQgdGhhdCBz
aG91bGQgYmUgcGFydCBvZiB0aGlzIHNlcmllcy4KVGhpcyBpcyBub3QgYW4gWFNLIHNwZWNpZmlj
IGNvbmNlcm4uCgo+ID4gPiA+IFRoYXQgaXMgY2xlYXJseSBhIHNpdHVhdGlvbiB0aGF0IHRoZSB1
c2VyIHNob3VsZCBiZSBpbmZvcm1lZCBhYm91dC4gRm9yCj4gPiA+ID4gUlQgc3lzdGVtcyB0aGlz
IG5vcm1hbGx5IG1lYW5zIHRoYXQgc29tZXRoaW5nIGlzIHJlYWxseSB3cm9uZyByZWdhcmRpbmcK
PiA+ID4gPiB0aW1pbmcgLyBjeWNsZSBvdmVyZmxvdy4gU3VjaCBzeXN0ZW1zIGhhdmUgdG8gcmVh
Y3Qgb24gdGhhdCBzaXR1YXRpb24uCj4gPiA+IAo+ID4gPiBJbiBnZW5lcmFsLCBhZl94ZHAgaXMg
YSBiaXQgbGFja2luZyBpbiB0aGlzICdub3RpZnkgdGhlIHVzZXIgdGhhdCB0aGV5Cj4gPiA+IHNv
bWVob3cgbWVzc2VkIHVwJyBhcmVhIDotKAo+ID4gPiBGb3IgZXhhbXBsZSwgcHVzaGluZyBhIHR4
IGRlc2NyaXB0b3Igd2l0aCBhIHdyb25nIGFkZHIvbGVuIGluIHpjIG1vZGUKPiA+ID4gd2lsbCBu
b3QgZ2l2ZSBhbnkgdmlzaWJsZSBzaWduYWwgYmFjayAoYmVzaWRlcyBkcml2ZXIgcG90ZW50aWFs
bHkKPiA+ID4gc3BpbGxpbmcgc29tZXRoaW5nIGludG8gZG1lc2cgYXMgaXQgd2FzIGluIHRoZSBt
bHggY2FzZSkuCj4gPiA+IFdlIGNhbiBwcm9iYWJseSBzdGFydCB3aXRoIGhhdmluZyBzb21lIGNv
dW50ZXJzIGZvciB0aGVzZSBldmVudHM/Cj4gPiAKPiA+IFRoaXMgaXMgYmVjYXVzZSB0aGUgQUZf
WERQIGNvbXBsZXRpb24gcXVldWUgZGVzY3JpcHRvciBmb3JtYXQgaXMgb25seQo+ID4gYSB1NjQg
YWRkcmVzcz8KPiAKPiBZZWFoLiBYRFBfQ09QWSBtb2RlIGhhcyB0aGUgZGVzY3JpcHRvciB2YWxp
ZGF0aW9uIHdoaWNoIGlzIGV4cG9ydGVkIHZpYQo+IHJlY3Ztc2cgZXJybm8sIGJ1dCB6ZXJvY29w
eSBwYXRoIHNlZW1zIHRvIGJlIHRvbyBkZWVwIGluIHRoZSBzdGFjawo+IHRvIHJlcG9ydCBzb21l
dGhpbmcgYmFjay4gQW5kIHRoZXJlIGlzIG5vIHBsYWNlLCBhcyB5b3UgbWVudGlvbiwKPiBpbiB0
aGUgY29tcGxldGlvbiByaW5nIHRvIHJlcG9ydCB0aGUgc3RhdHVzLgo+IAo+ID4gQ291bGQgZXJy
b3IgY29uZGl0aW9ucyBiZSByZXBvcnRlZCBvbiB0eCBjb21wbGV0aW9uIGluIHRoZSBtZXRhZGF0
YSwKPiA+IHVzaW5nIHhza190eF9tZXRhZGF0YV9jb21wbGV0ZT8KPiAKPiBUaGF0IHdvdWxkIGJl
IG9uZSB3YXkgdG8gZG8gaXQsIHllcy4gQnV0IHRoZW4gdGhlIGVycm9yIHJlcG9ydGluZyBkZXBl
bmRzCj4gb24gdGhlIG1ldGFkYXRhIG9wdC1pbi4gSGF2aW5nIGEgc2VwYXJhdGUgcmluZyB0byBl
eHBvcnQgdGhlIGVycm9ycywKPiBvciBoYXZpbmcgYSB2MiB0eC1jb21wbGV0aW9ucyBsYXlvdXQg
d2l0aCBleHRyYSAnc3RhdHVzJyBmaWVsZCB3b3VsZCBhbHNvCj4gd29yay4KPiAKPiBCdXQgdGhp
cyBzZWVtcyBsaWtlIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBoYW5kbGVkIHNlcGFyYXRlbHk/
IEJlY2F1c2UKPiB3ZSdkIGhhdmUgdG8gdGVhY2ggYWxsIGV4aXN0aW5nIHpjIGRyaXZlcnMgdG8g
cmVwb3J0IHRob3NlIGVycm9ycyBiYWNrCj4gaW5zdGVhZCBvZiBkcm9wcGluZyB0aGVzZSBkZXNj
cmlwdG9ycy4uCgpBZ3JlZWQgb24gYm90aCBwb2ludHMgOikgQSB2MiB0eC1jb21wbGV0aW9ucyB0
aGF0IHN1cHBvcnRzIHN0YXR1cwpjb3VsZCBiZSB1c2VmdWwuIEJ1dCBhZ2FpbiwgdGhpcyBpcyBv
dXQgb2Ygc2NvcGUgb2YgdGhpcyBzcGVjaWZpYwpsYXVuY2ggdGltZSBmZWF0dXJlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
