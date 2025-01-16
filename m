Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D21D4A12FE3
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 01:31:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A607BC78F7A;
	Thu, 16 Jan 2025 00:31:01 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB4E9C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 00:30:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2167141dfa1so6720535ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 16:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736987453; x=1737592253;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nbDhewnz6sF7NAjuh/IG2morMwwWY78lrdk+Dwk6HUA=;
 b=MXqVtMAWZHO4f/FxlZAZGOQanTMlWnPScqKDWZekW9GZM4y78V/Kog8Qs8v8GwtvNu
 cmKROflp7sgXGgvl3ahTrbYAwWA7sl100U9RWJqmOprXIR3X6kcaYVdLFGwZaic5jdUJ
 JMXOv/ORXdviGO/9W0RRhVRGcgrQq84STkjg0H9xPOGyT7NiZTxmidIYoUsG7Bbq5CAb
 A7LoYNt2/TVyfkIeOKr5I4cm6Q2C593bG/Xxx/YDIGUWjONxL7OTCu/WLfa3my+Y04vS
 PEtMrZeQyZceMAXyFYTacg1cCn8tzfIVuDg4/rMsNBZT88RokEFwDmWP/YKpw/m9x30W
 Llng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736987453; x=1737592253;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nbDhewnz6sF7NAjuh/IG2morMwwWY78lrdk+Dwk6HUA=;
 b=N3ghvVD8kjB98gZW10Wo91It+VQ5FkHnruk/AJh3mRSM3yYWs8ZIYXDUPbZpQMROJ8
 dbbYHkoYIBuA8jyN85PQH2iIvZas+nqf4aYsBeCWLjJixGxqE7y+TaQ//W3ntTJ+pUD4
 lYDPCXufAG6CuWWbI091ZJm36ZCi997YLUEF4ReZRpLFK/GVMHQWSBe6jlIKsJC8wOxV
 8Vnv+5h01NMMXBJ9iXQI//cSLh6oP4juUy694450bIJg5QoAMjoC4DjtxCXd8Zbq42+V
 y4QgB3ucPLH7atzEcqoiaGz2rO8b7Xb231xroKfLXA5D52j9aecHpHAsbWAqXsDpIIzr
 /xCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnGbmdfLgAKtEeRSOHf2VCsAmiwtIISziwr3VPibt+o1jlgYRvH7yPJlvXRXqKxucXP0RfYjkvs1stKw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YymohP6c4OFdVgCTynivPROFCjbo7MKi2bMh9W5LAzdL7HMjQVD
 f5htzgNWbH2TCH8pBK0AF1fydb71RwZktg8npCn//TsQOS3fMH3uM79pM64=
X-Gm-Gg: ASbGncuA+wPAYLR+x2DfWt0lleUD/H19L1HMhw+18/zhg7xf2SF4mKchAVkaMlyDzzS
 iaN7ZWoUE3oOmalBIdyob++MkIRB3kjyMoOlgXYZqTVMRGpT9R6ahijC64FTSs6dvQ7CtldY1Tg
 zT86RnttOlvVXG90n7RyNYtwm2JCHcgSbAUeO5cbSLOKVrHxWbyOVixEZvR1n8JivZzvizibbmb
 okuh0gp5KbfakkLTcQz26hjfZ5K1zcXXjeUDreMdQ128Hr6SSVTcZx6
X-Google-Smtp-Source: AGHT+IHL2kbDL71i52Tl5thJXHFKE0VJJEHYy6lN0jWJKKjChbh+K9Wolj1lEqEzzNUmnYNfgO9FbQ==
X-Received: by 2002:a17:903:2410:b0:216:2aec:2d54 with SMTP id
 d9443c01a7336-21bf077dbc9mr79922565ad.8.1736987453496; 
 Wed, 15 Jan 2025 16:30:53 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f10f6d7sm88927685ad.52.2025.01.15.16.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 16:30:53 -0800 (PST)
Date: Wed, 15 Jan 2025 16:30:52 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>
Message-ID: <Z4hTPNEGreEo6igW@mini-arch>
References: <20250114152718.120588-1-yoong.siang.song@intel.com>
 <20250114152718.120588-3-yoong.siang.song@intel.com>
 <e273b1f1-868f-440e-b226-84b493ef7ee2@iogearbox.net>
 <PH0PR11MB58300DA3845D1E3F788C4FC8D8192@PH0PR11MB5830.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH0PR11MB58300DA3845D1E3F788C4FC8D8192@PH0PR11MB5830.namprd11.prod.outlook.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "Bezdeka,
 Florian" <florian.bezdeka@siemens.com>, "Damato, Joe" <jdamato@fastly.com>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, Daniel Jurgens <danielj@nvidia.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Mina Almasry <almasrymina@google.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Mykola Lysenko <mykolal@fb.com>,
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
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>, "Fijalkowski,
 Maciej" <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 "Karlsson, Magnus" <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Bjorn Topel <bjorn@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v5 2/4] selftests/bpf: Add launch
 time request to xdp_hw_metadata
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

T24gMDEvMTUsIFNvbmcsIFlvb25nIFNpYW5nIHdyb3RlOgo+IE9uIFdlZG5lc2RheSwgSmFudWFy
eSAxNSwgMjAyNSAxMDo1NyBQTSwgRGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9nZWFyYm94Lm5l
dD4gd3JvdGU6Cj4gPk9uIDEvMTQvMjUgNDoyNyBQTSwgU29uZyBZb29uZyBTaWFuZyB3cm90ZToK
PiA+Wy4uLl0KPiA+PiArCS8qIEFkZCBtcXByaW8gcWRpc2Mgd2l0aCBUQyBhbmQgaGFyZHdhcmUg
cXVldWUgb25lLXRvLW9uZSBtYXBwaW5nICovCj4gPj4gKwljaGFyIG1hcFsyNTZdID0gezB9Owo+
ID4+ICsJY2hhciBxdWV1ZXNbMjU2XSA9IHswfTsKPiA+PiArCj4gPj4gKwlmb3IgKGkgPSAwOyBp
IDwgcnhxOyBpKyspIHsKPiA+PiArCQljaGFyIGJ1Zls4XTsKPiA+PiArCj4gPj4gKwkJc25wcmlu
dGYoYnVmLCBzaXplb2YoYnVmKSwgIiVkICIsIGkpOwo+ID4+ICsJCXN0cmNhdChtYXAsIGJ1Zik7
Cj4gPj4gKwo+ID4+ICsJCXNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICIxQCVkICIsIGkpOwo+
ID4+ICsJCXN0cmNhdChxdWV1ZXMsIGJ1Zik7Cj4gPj4gKwl9Cj4gPj4gKwlydW5fY29tbWFuZCgi
c3VkbyB0YyBxZGlzYyBhZGQgZGV2ICVzIGhhbmRsZSA4MDAxOiBwYXJlbnQgcm9vdCBtcXByaW8K
PiA+bnVtX3RjICVkIG1hcCAlcyBxdWV1ZXMgJXMgaHcgMCIsCj4gPj4gKwkJICAgIGlmbmFtZSwg
cnhxLCBtYXAsIHF1ZXVlcyk7Cj4gPgo+ID5GeWksIGFib3ZlIHRyaWdnZXJzIHNlbGZ0ZXN0IGJ1
aWxkIGVycm9yczoKPiA+Cj4gPiAgIHhkcF9od19tZXRhZGF0YS5jOiBJbiBmdW5jdGlvbiDigJht
YWlu4oCZOgo+ID4gICB4ZHBfaHdfbWV0YWRhdGEuYzo3NjM6NDU6IGVycm9yOiDigJglZOKAmSBk
aXJlY3RpdmUgb3V0cHV0IG1heSBiZSB0cnVuY2F0ZWQKPiA+d3JpdGluZyBiZXR3ZWVuIDEgYW5k
IDEwIGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSA4IFstV2Vycm9yPWZvcm1hdC0KPiA+dHJ1
bmNhdGlvbj1dCj4gPiAgICAgNzYzIHwgICAgICAgICAgICAgICAgIHNucHJpbnRmKGJ1Ziwgc2l6
ZW9mKGJ1ZiksICIlZCAiLCBpKTsKPiA+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gPiAgICAgVEVTVC1PQkogW3Rlc3RfcHJvZ3NdIGFy
Z19wYXJzaW5nLnRlc3Qubwo+ID4gICB4ZHBfaHdfbWV0YWRhdGEuYzo3NjM6NDQ6IG5vdGU6IGRp
cmVjdGl2ZSBhcmd1bWVudCBpbiB0aGUgcmFuZ2UgWzAsCj4gPjIxNDc0ODM2NDZdCj4gPiAgICAg
NzYzIHwgICAgICAgICAgICAgICAgIHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICIlZCAiLCBp
KTsKPiA+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn4KPiA+ICAgeGRwX2h3X21ldGFkYXRhLmM6NzYzOjE3OiBub3RlOiDigJhzbnByaW50
ZuKAmSBvdXRwdXQgYmV0d2VlbiAzIGFuZCAxMiBieXRlcyBpbnRvCj4gPmEgZGVzdGluYXRpb24g
b2Ygc2l6ZSA4Cj4gPiAgICAgNzYzIHwgICAgICAgICAgICAgICAgIHNucHJpbnRmKGJ1Ziwgc2l6
ZW9mKGJ1ZiksICIlZCAiLCBpKTsKPiA+ICAgICAgICAgfCAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAgIHhkcF9od19tZXRhZGF0YS5jOjc2
Njo0NzogZXJyb3I6IOKAmCVk4oCZIGRpcmVjdGl2ZSBvdXRwdXQgbWF5IGJlIHRydW5jYXRlZAo+
ID53cml0aW5nIGJldHdlZW4gMSBhbmQgMTAgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIDYg
Wy1XZXJyb3I9Zm9ybWF0LQo+ID50cnVuY2F0aW9uPV0KPiA+ICAgICA3NjYgfCAgICAgICAgICAg
ICAgICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIjFAJWQgIiwgaSk7Cj4gPiAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gPiAg
IHhkcF9od19tZXRhZGF0YS5jOjc2Njo0NDogbm90ZTogZGlyZWN0aXZlIGFyZ3VtZW50IGluIHRo
ZSByYW5nZSBbMCwKPiA+MjE0NzQ4MzY0Nl0KPiA+ICAgICA3NjYgfCAgICAgICAgICAgICAgICAg
c25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIjFAJWQgIiwgaSk7Cj4gPiAgICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KPiA+ICAgeGRw
X2h3X21ldGFkYXRhLmM6NzY2OjE3OiBub3RlOiDigJhzbnByaW50ZuKAmSBvdXRwdXQgYmV0d2Vl
biA1IGFuZCAxNCBieXRlcyBpbnRvCj4gPmEgZGVzdGluYXRpb24gb2Ygc2l6ZSA4Cj4gPiAgICAg
NzY2IHwgICAgICAgICAgICAgICAgIHNucHJpbnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICIxQCVkICIs
IGkpOwo+ID4gICAgICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgo+IAo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhpcyBvdXQuCj4gQnR3
LCBkbyB5b3Uga25vdyB3aGljaCBidWlsZCBjb21tYW5kIHdpbGwgdHJpZ2dlciB0aGVzZSBlcnJv
cnM/Cj4gSSBhbSB1c2luZyAibWFrZSAtQyB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYiIGJ1
dCBjYW5ub3QKPiByZXByb2R1Y2UgdGhlIGJ1aWxkIGVycm9yLgo+IAo+IFRoYW5rcyAmIFJlZ2Fy
ZHMKPiBTaWFuZwoKTGFzdCB0aW1lIEkgdXNlZCB0aGUgZm9sbG93aW5nIHRvIHJlcHJvZHVjZSBz
aW1pbGFyIGlzc3VlcyBvbiBteSBzaWRlOgoKbWFrZSAtQyB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cyBUQVJHRVRTPSJicGYiIExMVk09MSBVU0VSQ0ZMQUdTPSItV2Zvcm1hdC10cnVuY2F0aW9uIgoK
WW91IGNhbiBhbHNvIHRyeSB0byB1c2Ugc29tZXRoaW5nIGxpa2UgYXNwcmludGYgaW5zdGVhZCBv
ZiBtYW5hZ2luZyB0aGUgYnVmZmVyCnNpemVzIG1hbnVhbGx5LgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
