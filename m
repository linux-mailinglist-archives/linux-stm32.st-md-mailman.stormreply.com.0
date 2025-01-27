Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD5CA1DCA1
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 20:20:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5B91C71289;
	Mon, 27 Jan 2025 19:20:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F294EC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 19:20:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D5F8FA419E9;
 Mon, 27 Jan 2025 19:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1C8C4CED2;
 Mon, 27 Jan 2025 19:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738005648;
 bh=YeJVXMPKQVT2qsyx36ahTAqXBMoa9oYa3q1Abfi3NGk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=X/EKy9OgP8a/LbZ2+lTRgcEO98s5Q0e1iAJTMz4l9hD2J3dHrzjvTTRln8GGKfwMx
 gXoEPDaOxs1078NbidR7ETR3lQXPuvQj6o97rpdgTt5nmVX7CnW9kVpybWiq52kcjO
 PnQSV0eQyFqEIM6fwU09ysiQVyygIu5mQBoh6wcWh00yGxuCAqMy84r6TrUt3JqcGQ
 Ige7cvkgY8D7eTqbUJ4smnrzZK9K6t1/No66UKwMjSznrq7Izo3TDhCW3hQRaV2U8A
 EL0zrywHlI0Sj+Y7YMn+op7H7PbtXeAbIz0riCWqAKG/P6SGefd57yFL550KIAwfnZ
 TbJou8dble8Xw==
Date: Mon, 27 Jan 2025 11:20:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Message-ID: <20250127112045.7e3997fc@kernel.org>
In-Reply-To: <221bb71f7d2464cd566e4a4110423ea56b173cf6.camel@siemens.com>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
 <PH0PR11MB583095A2F12DA10D57781D18D8E02@PH0PR11MB5830.namprd11.prod.outlook.com>
 <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
 <Z5KdSlzmyCKUyXTn@mini-arch> <87bjvwqvtl.fsf@toke.dk>
 <20250127100441.0b11e1b8@kernel.org>
 <221bb71f7d2464cd566e4a4110423ea56b173cf6.camel@siemens.com>
MIME-Version: 1.0
Cc: Jose Abreu <joabreu@synopsys.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Damato,
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
 Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?= <toke@redhat.com>,
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

T24gTW9uLCAyNyBKYW4gMjAyNSAxOToyOTozNSArMDEwMCBGbG9yaWFuIEJlemRla2Egd3JvdGU6
Cj4gPiA+IFllYWgsIEkgZG9uJ3QgdGhpbmsgd2UgY2FuIGltcG9zZSBVQVBJIHJlc3RyaWN0aW9u
cyBvbiB0aGUgbWV0YWRhdGEgYXJlYQo+ID4gPiBhdCB0aGlzIHBvaW50LiBJIGd1ZXNzIHRoZSBi
ZXN0IHdlIGNhbiBkbyBpcyB0byBlZHVjYXRlIHVzZXJzIHRoYXQgdGhleQo+ID4gPiBzaG91bGQg
Y2FsbCB0aGUgdGltZXN0YW1wIGtmdW5jIGJlZm9yZSB0aGV5IG1vZGlmeSB0aGUgbWV0YWRhdGE/
ICAKPiA+IAo+ID4gSSBtYXkgYmUgbWlzdW5kZXJzdGFuZGluZyB0aGUgZGlzY3Vzc2lvbiwgYnV0
IEkgdGhpbmsgdGhlIGFuc3dlciAKPiA+IGlzIHRoYXQgdGhlIGRyaXZlciBtdXN0IGJlIGZpeGVk
LiBUaGUgbWV0YWRhdGEtaW4tcHJlcGVuZCBwcm9ibGVtCj4gPiBhbHNvIGV4aXN0cyBmb3Igc2lt
cGxlIGFkanVzdCBoZWFkIHVzZSBjYXNlLCBzbyBpdCBleGlzdGVkIHNpbmNlCj4gPiBlYXJseSBk
YXlzIG9mIEJQRi4gVGhlIGRyaXZlciBzaG91bGQgY29weSBvdXQgKG9yIHBhcnNlKSB0aGUgbWV0
YWRhdGEKPiA+IGJlZm9yZSBpdCBpbnZva2VzIHRoZSBYRFAgcHJvZy4gVGhlIG5mcCBkcml2ZXIg
ZG9lcyB0aGF0LiAgCj4gCj4gVGhhdCB3b3VsZCBoYXZlIHRvIGhhcHBlbiBmb3IgZWFjaCBwYWNr
ZXQsIHdpdGhvdXQgYWZmZWN0aW5nIFpDCj4gcGVyZm9ybWFuY2UuIEhvdyBjYW4gdGhhdCBiZSBh
Y2hpZXZlZD8KCkFyZSB5b3UgYXNraW5nIGhvdyB3ZSBjYW4gbWFrZSBpdCBub3QgYWZmZWN0IHBl
cmZvcm1hbmNlPwpXZSBzaG91bGQgcmVhbGx5IHNlZSBzb21lIGJlbmNobWFya3MgYmVmb3JlIHdl
IHNheSB0aGF0IGl0IGlzIG9rYXkKdG8gc2FjcmlmaWNlIGNvcnJlY3RuZXNzLi4KCj4gU28gd2Ug
aGF2ZSBhdCBsZWFzdCB0d28gZHJpdmVycyB3aXRoIHRoYXQgcHJvYmxlbSwgaWdjICsgbmZwLiAK
ClRvIGJlIGNsZWFyIG5mcCBjb3BpZXMgdGhlIEhXIG1ldGFkYXRhIG91dCBiZWZvcmUgY2FsbGlu
ZyBYRFAuClNvIFhEUCBwcm9ncmFtIGNhbiBkbyB3aGF0ZXZlciBpdCB3YW50cyB0byB0aGUgc3Bh
Y2UgYmVmb3JlIHRoZSBwYWNrZXQuCgo+IE15IG1haW4gcG9pbnQ6IEVuYWJsaW5nIGFuZCBpbXBs
ZW1lbnRpbmcgWkMgKHplcm8gY29weSkgbW9kZSBhdCBvbmUKPiBoYW5kLCBidXQgdGhlbiBzdGFy
dGluZyB0byBjb3B5IHRoZSBtZXRhIGRhdGEgZm9yIGVhY2ggcGFja2V0IGRvZXNuJ3QKPiBzb3Vu
ZCByZWFzb25hYmxlLgoK8J+kt++4jwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
