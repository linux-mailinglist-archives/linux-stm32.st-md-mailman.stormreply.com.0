Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79215A1DC08
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jan 2025 19:29:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 007E3C78032;
	Mon, 27 Jan 2025 18:29:46 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net
 (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC77FC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 18:29:37 +0000 (UTC)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id
 20250127182936abce11416e5c951bcf
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jan 2025 19:29:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6panixb/x0os5ZapLWWRdFuJUYpBXz06VpJ2DjP+mog=;
 b=A1zeyUFFCuD1/01IlvyP8a7nStl/yDefRzLmN46eDButuHBxshahsCwHerO9PK5bZUwBaa
 JjuZ5wN8wapbhPC7RQH833+3AZaTuy5Hg9Ykwfzz2qbR4tv9DDUEljsoo1ZPr0Oe7Ctz7mC+
 wTnT8ep8aZOaz2/vVNjJtHPEGReehUgGbNGdIiGu/viqY/zVDKE21ZWEMttrkvLeZcasGW7/
 bUjQ/l9tUym2erHZPCi2O/EuxulhwAgkra8vG+fKXFKYgN5pwU4OI0YQpq+ElJ/AqKR+EZmY
 GFEQX2KONvo3NAcX/+vsmHnehfI7eOIDOwh9xoWZpnQY3dJH4fvY2VUg==;
Message-ID: <221bb71f7d2464cd566e4a4110423ea56b173cf6.camel@siemens.com>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Jakub Kicinski <kuba@kernel.org>, Toke
 =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Date: Mon, 27 Jan 2025 19:29:35 +0100
In-Reply-To: <20250127100441.0b11e1b8@kernel.org>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
 <PH0PR11MB583095A2F12DA10D57781D18D8E02@PH0PR11MB5830.namprd11.prod.outlook.com>
 <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
 <Z5KdSlzmyCKUyXTn@mini-arch> <87bjvwqvtl.fsf@toke.dk>
 <20250127100441.0b11e1b8@kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
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

T24gTW9uLCAyMDI1LTAxLTI3IGF0IDEwOjA0IC0wODAwLCBKYWt1YiBLaWNpbnNraSB3cm90ZToK
PiBPbiBGcmksIDI0IEphbiAyMDI1IDEyOjQ1OjQyICswMTAwIFRva2UgSMO4aWxhbmQtSsO4cmdl
bnNlbiB3cm90ZToKPiA+ID4gPiBJIHRoaW5rIHRoZXJlIGlzIG5vIHNpbXBsZSBmaXggZm9yIHRo
YXQuIFRoYXQgbmVlZHMgc29tZSBkaXNjdXNzaW9uCj4gPiA+ID4gYXJvdW5kIHRoZSAiZXhwZWN0
YXRpb25zIiB0byB0aGUgaGVhZHJvb20gLyBtZXRhIGRhdGEgYXJlYSBpbiBmcm9udCBvZgo+ID4g
PiA+IHRoZSBhY3R1YWwgcGFja2V0IGRhdGEuICAKPiA+ID4gCj4gPiA+IEJ5ICdzaW1wbGUnIHlv
dSBtZWFuIHdpdGhvdXQgc29tZSBuZXcgVUFQSSB0byBzaWduYWwgdGhlIHNpemUgb2YgdGhhdAo+
ID4gPiAncmVzZXJ2ZWQgYXJlYScgYnkgdGhlIGRyaXZlcj8gSSBkb24ndCBzZWUgYW55IG90aGVy
IGVhc3kgd2F5IG91dCBhcyB3ZWxsIDotLyAgCj4gPiAKPiA+IFllYWgsIEkgZG9uJ3QgdGhpbmsg
d2UgY2FuIGltcG9zZSBVQVBJIHJlc3RyaWN0aW9ucyBvbiB0aGUgbWV0YWRhdGEgYXJlYQo+ID4g
YXQgdGhpcyBwb2ludC4gSSBndWVzcyB0aGUgYmVzdCB3ZSBjYW4gZG8gaXMgdG8gZWR1Y2F0ZSB1
c2VycyB0aGF0IHRoZXkKPiA+IHNob3VsZCBjYWxsIHRoZSB0aW1lc3RhbXAga2Z1bmMgYmVmb3Jl
IHRoZXkgbW9kaWZ5IHRoZSBtZXRhZGF0YT8KPiAKPiBJIG1heSBiZSBtaXN1bmRlcnN0YW5kaW5n
IHRoZSBkaXNjdXNzaW9uLCBidXQgSSB0aGluayB0aGUgYW5zd2VyIAo+IGlzIHRoYXQgdGhlIGRy
aXZlciBtdXN0IGJlIGZpeGVkLiBUaGUgbWV0YWRhdGEtaW4tcHJlcGVuZCBwcm9ibGVtCj4gYWxz
byBleGlzdHMgZm9yIHNpbXBsZSBhZGp1c3QgaGVhZCB1c2UgY2FzZSwgc28gaXQgZXhpc3RlZCBz
aW5jZQo+IGVhcmx5IGRheXMgb2YgQlBGLiBUaGUgZHJpdmVyIHNob3VsZCBjb3B5IG91dCAob3Ig
cGFyc2UpIHRoZSBtZXRhZGF0YQo+IGJlZm9yZSBpdCBpbnZva2VzIHRoZSBYRFAgcHJvZy4gVGhl
IG5mcCBkcml2ZXIgZG9lcyB0aGF0LgoKVGhhdCB3b3VsZCBoYXZlIHRvIGhhcHBlbiBmb3IgZWFj
aCBwYWNrZXQsIHdpdGhvdXQgYWZmZWN0aW5nIFpDCnBlcmZvcm1hbmNlLiBIb3cgY2FuIHRoYXQg
YmUgYWNoaWV2ZWQ/CgpTbyB3ZSBoYXZlIGF0IGxlYXN0IHR3byBkcml2ZXJzIHdpdGggdGhhdCBw
cm9ibGVtLCBpZ2MgKyBuZnAuIAoKTXkgbWFpbiBwb2ludDogRW5hYmxpbmcgYW5kIGltcGxlbWVu
dGluZyBaQyAoemVybyBjb3B5KSBtb2RlIGF0IG9uZQpoYW5kLCBidXQgdGhlbiBzdGFydGluZyB0
byBjb3B5IHRoZSBtZXRhIGRhdGEgZm9yIGVhY2ggcGFja2V0IGRvZXNuJ3QKc291bmQgcmVhc29u
YWJsZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
