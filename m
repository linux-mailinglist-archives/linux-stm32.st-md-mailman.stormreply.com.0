Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DCFA1DBD2
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 19:04:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DDC1C78032;
	Mon, 27 Jan 2025 18:04:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22695C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 18:04:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DDDC1A4195C;
 Mon, 27 Jan 2025 18:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F93BC4CED2;
 Mon, 27 Jan 2025 18:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738001084;
 bh=H/TAc9fGLArvc2BRtJuDGahSmYMiOfZlb3sEWjWRvdk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pa1i/Uqj8nt3XnOgB4es4hq3WXqmWYJe+K+7Ypr1PhtZKUOMb+h3wCHGV8pGfCXWf
 V/jNdW1KJ0DAgBElQtp27kbynF6Xdb64ebEeDtcaavOt9nt3wH1DLI4Alev/ln14Z5
 8MnTCYVHpwTy5t3/GnzlRYIwYejiGooeUjDn1YgpVCFKG0fB11N85ZNFumQQbSP2kU
 WigdIP+MK+4Ziy2Bpk1ilyK4PIrxFTjdf+y0w2rgNqfwu0cfUToiNhOhF8q3sAM18+
 xPG+JfYTyHktRw2Gk07i3VSNMzu5ZS6RERP5ylIMJESoE+MWfyQ7kbBA6E5MKHoZY2
 EGi/oAiz8W3jA==
Date: Mon, 27 Jan 2025 10:04:41 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>
Message-ID: <20250127100441.0b11e1b8@kernel.org>
In-Reply-To: <87bjvwqvtl.fsf@toke.dk>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
 <PH0PR11MB583095A2F12DA10D57781D18D8E02@PH0PR11MB5830.namprd11.prod.outlook.com>
 <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
 <Z5KdSlzmyCKUyXTn@mini-arch> <87bjvwqvtl.fsf@toke.dk>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Florian Bezdeka <florian.bezdeka@siemens.com>, "Damato,
 Joe" <jdamato@fastly.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, Daniel Jurgens <danielj@nvidia.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Mykola Lysenko <mykolal@fb.com>,
 "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 Donald Hunter <donald.hunter@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>, "Fijalkowski,
 Maciej" <maciej.fijalkowski@intel.com>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>,
 Stanislav Fomichev <stfomichev@gmail.com>, KP Singh <kpsingh@kernel.org>,
 "Karlsson, Magnus" <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bouska,
 Zdenek" <zdenek.bouska@siemens.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Bjorn Topel <bjorn@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [xdp-hints] Re: [PATCH bpf-next v6 4/4] igc: Add
 launch time support to XDP ZC
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

T24gRnJpLCAyNCBKYW4gMjAyNSAxMjo0NTo0MiArMDEwMCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gPj4gSSB0aGluayB0aGVyZSBpcyBubyBzaW1wbGUgZml4IGZvciB0aGF0LiBU
aGF0IG5lZWRzIHNvbWUgZGlzY3Vzc2lvbgo+ID4+IGFyb3VuZCB0aGUgImV4cGVjdGF0aW9ucyIg
dG8gdGhlIGhlYWRyb29tIC8gbWV0YSBkYXRhIGFyZWEgaW4gZnJvbnQgb2YKPiA+PiB0aGUgYWN0
dWFsIHBhY2tldCBkYXRhLiAgCj4gPgo+ID4gQnkgJ3NpbXBsZScgeW91IG1lYW4gd2l0aG91dCBz
b21lIG5ldyBVQVBJIHRvIHNpZ25hbCB0aGUgc2l6ZSBvZiB0aGF0Cj4gPiAncmVzZXJ2ZWQgYXJl
YScgYnkgdGhlIGRyaXZlcj8gSSBkb24ndCBzZWUgYW55IG90aGVyIGVhc3kgd2F5IG91dCBhcyB3
ZWxsIDotLyAgCj4gCj4gWWVhaCwgSSBkb24ndCB0aGluayB3ZSBjYW4gaW1wb3NlIFVBUEkgcmVz
dHJpY3Rpb25zIG9uIHRoZSBtZXRhZGF0YSBhcmVhCj4gYXQgdGhpcyBwb2ludC4gSSBndWVzcyB0
aGUgYmVzdCB3ZSBjYW4gZG8gaXMgdG8gZWR1Y2F0ZSB1c2VycyB0aGF0IHRoZXkKPiBzaG91bGQg
Y2FsbCB0aGUgdGltZXN0YW1wIGtmdW5jIGJlZm9yZSB0aGV5IG1vZGlmeSB0aGUgbWV0YWRhdGE/
CgpJIG1heSBiZSBtaXN1bmRlcnN0YW5kaW5nIHRoZSBkaXNjdXNzaW9uLCBidXQgSSB0aGluayB0
aGUgYW5zd2VyIAppcyB0aGF0IHRoZSBkcml2ZXIgbXVzdCBiZSBmaXhlZC4gVGhlIG1ldGFkYXRh
LWluLXByZXBlbmQgcHJvYmxlbQphbHNvIGV4aXN0cyBmb3Igc2ltcGxlIGFkanVzdCBoZWFkIHVz
ZSBjYXNlLCBzbyBpdCBleGlzdGVkIHNpbmNlCmVhcmx5IGRheXMgb2YgQlBGLiBUaGUgZHJpdmVy
IHNob3VsZCBjb3B5IG91dCAob3IgcGFyc2UpIHRoZSBtZXRhZGF0YQpiZWZvcmUgaXQgaW52b2tl
cyB0aGUgWERQIHByb2cuIFRoZSBuZnAgZHJpdmVyIGRvZXMgdGhhdC4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
