Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 860CA7BCF8D
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Oct 2023 20:27:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1041AC6B442;
	Sun,  8 Oct 2023 18:27:36 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2079C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Oct 2023 18:27:34 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-32615eaa312so3499019f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Oct 2023 11:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696789654; x=1697394454;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UYhUlM0v/kiBnSA7qqkERNTe3ha0hd9wd9BeXsJuFRo=;
 b=EtFlpl1j+Ezrxb+hzqpICQZxZCOXmFDUyxm9kzanKfjcTaxbGvBNx8iLiy4Uww9mCs
 d0hxeXT1rp4kKujgVFPStVryIC5ssA+vpAE/CsuFlnRrIM7OvudLqed071e0XOFVvWXD
 IsQqTcUjfzRw75Ce7RsviSTzJihmmp1wpSKkyqu8W6Qo3s61cOyoaWN1gkBInBtKbFXA
 XTecefWnFuEwa2kh85UCJZOWXWPZ2Sw0r49V5VfmulYWzLpNG1GuqRwE7lALuokEg7rz
 9hAxlYcjvUO/pTpMStD/QBe63FqduuWm9efcD6/Te4/5bpD7nTaqDmJFdljRUVzHLzH3
 JPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696789654; x=1697394454;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UYhUlM0v/kiBnSA7qqkERNTe3ha0hd9wd9BeXsJuFRo=;
 b=QDJT+HQ8TlcY0tfSQducgtMMOab3ueLpHOZauZtQlws5n5IOeQoDBARCRf83YHCAQg
 0kuN7BqLPs0JOntAcJlWG6j6xjXqRYOAhfmmI8maTnIMCorV3aP7IgNeFHqzA0Cv+RM+
 or7UC9AFbA4opFQfdqkuRmQxoFQojaAMnphQxNzx9AGIIqzZRB//XO7MwJiGa5XaC1JM
 T90hc+BKIPjDJjzNJdEfySyJ+OngY28bYRAtZTrqsCX8hzAbV+HnCA6WFboWHPDR9pfi
 DGPMvuT0lygSX7kxnamvyHxpFkiLB2eQnMkMYq/Z8clFMksYvcQ9ZF7Ztwl2rJ1bQo0m
 MKJw==
X-Gm-Message-State: AOJu0YxRZzEqaiI2LNr21JCRGS2NPIb12HhcDHf9QGEIvi4ZKzuB6PKH
 IVZGPuZ+lD7NSg2uKJBChsA=
X-Google-Smtp-Source: AGHT+IG1Z2UQG/8uimtzwOsX0SSnSzQeAnFClPvayUdx2bESkKFHKQw9/TSlsvhrREuwaEcXQ8SiYA==
X-Received: by 2002:a5d:50c8:0:b0:316:f24b:597a with SMTP id
 f8-20020a5d50c8000000b00316f24b597amr11755917wrt.46.1696789653876; 
 Sun, 08 Oct 2023 11:27:33 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adff54e000000b003233a31a467sm7413627wrp.34.2023.10.08.11.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 11:27:33 -0700 (PDT)
Message-ID: <6522f495.df0a0220.326ed.de6c@mx.google.com>
X-Google-Original-Message-ID: <ZSL0kLgKGmK2HJ9x@Ansuel-xps.>
Date: Sun, 8 Oct 2023 20:27:28 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
 <20231003145150.2498-4-ansuelsmth@gmail.com>
 <CANn89iLtYZJPOQE7OkAbEdmhT8qjzAJ+27poa__3c8Nf0M6u_w@mail.gmail.com>
 <652056c5.5d0a0220.2b60d.c5dc@mx.google.com>
 <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89i+Cie+oE_hTWkyJWutTG9CnPy+dbW+-A97Q+E9Rq-f9rQ@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Ziwei Xiao <ziweixiao@google.com>, Chris Snook <chris.snook@gmail.com>,
 Rick Lindsley <ricklind@linux.ibm.com>, Krzysztof Halasa <khalasa@piap.pl>,
 Yuri Karpov <YKarpov@ispras.ru>, netdev@vger.kernel.org,
 ath10k@lists.infradead.org, Dany Madden <danymadden@us.ibm.com>,
 Gregory Greenman <gregory.greenman@intel.com>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
 Dawei Li <set_pte_at@outlook.com>, Intel Corporation <linuxwwan@intel.com>,
 Rob Herring <robh@kernel.org>, Jeroen de Borst <jeroendb@google.com>,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Lee Jones <lee@kernel.org>,
 Haren Myneni <haren@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-stm32@st-md-mailman.stormreply.com, Rushil Gupta <rushilg@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Thomas Falcon <tlfalcon@linux.ibm.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-wireless@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Wei Fang <wei.fang@nxp.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Nick Child <nnac123@linux.ibm.com>,
 Simon Horman <horms@kernel.org>, Liu Haijun <haijun.liu@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org,
 Yuanjun Gong <ruc_gongyuanjun@163.com>, Shailend Chand <shailend@google.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Benjamin Berg <benjamin.berg@intel.com>,
 M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Coco Li <lixiaoyan@google.com>,
 linux-arm-kernel@lists.infradead.org,
 Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
 Ricardo Martinez <ricardo.martinez@linux.intel.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Zheng Zengkai <zhengzengkai@huawei.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Douglas Miller <dougmill@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Tariq Toukan <tariqt@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Junfeng Guo <junfeng.guo@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next PATCH v2 4/4] netdev: use napi_schedule
 bool instead of napi_schedule_prep/__napi_schedule
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

T24gU3VuLCBPY3QgMDgsIDIwMjMgYXQgMDk6MDg6NDFBTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIEZyaSwgT2N0IDYsIDIwMjMgYXQgODo0OeKAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBPY3QgMDUsIDIw
MjMgYXQgMDY6MTY6MjZQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdyb3RlOgo+ID4gPiBPbiBUdWUs
IE9jdCAzLCAyMDIzIGF0IDg6MzbigK9QTSBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gUmVwbGFjZSBpZiBjb25kaXRpb24gb2Yg
bmFwaV9zY2hlZHVsZV9wcmVwL19fbmFwaV9zY2hlZHVsZSBhbmQgdXNlIGJvb2wKPiA+ID4gPiBm
cm9tIG5hcGlfc2NoZWR1bGUgZGlyZWN0bHkgd2hlcmUgcG9zc2libGUuCj4gPiA+ID4KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBnbWFpbC5jb20+
Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9h
dGwxLmMgICAgIHwgNCArLS0tCj4gPiA+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEv
dGMzNTgxNS5jICAgICAgIHwgNCArLS0tCj4gPiA+ID4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2lu
dGVsL2l3bHdpZmkvcGNpZS9yeC5jIHwgNCArLS0tCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0aGVyb3MvYXRseC9hdGwxLmMgYi9kcml2ZXJzL25l
dC9ldGhlcm5ldC9hdGhlcm9zL2F0bHgvYXRsMS5jCj4gPiA+ID4gaW5kZXggMDJhYTZmZDhlYmMy
Li5hOTAxNGQ3OTMyZGIgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
YXRoZXJvcy9hdGx4L2F0bDEuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2F0
aGVyb3MvYXRseC9hdGwxLmMKPiA+ID4gPiBAQCAtMjQ0Niw3ICsyNDQ2LDcgQEAgc3RhdGljIGlu
dCBhdGwxX3JpbmdzX2NsZWFuKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwgaW50IGJ1ZGdldCkK
PiA+ID4gPgo+ID4gPiA+ICBzdGF0aWMgaW5saW5lIGludCBhdGwxX3NjaGVkX3JpbmdzX2NsZWFu
KHN0cnVjdCBhdGwxX2FkYXB0ZXIqIGFkYXB0ZXIpCj4gPiA+ID4gIHsKPiA+ID4gPiAtICAgICAg
IGlmICghbmFwaV9zY2hlZHVsZV9wcmVwKCZhZGFwdGVyLT5uYXBpKSkKPiA+ID4gPiArICAgICAg
IGlmICghbmFwaV9zY2hlZHVsZSgmYWRhcHRlci0+bmFwaSkpCj4gPiA+ID4gICAgICAgICAgICAg
ICAgIC8qIEl0IGlzIHBvc3NpYmxlIGluIGNhc2UgZXZlbiB0aGUgUlgvVFggaW50cyBhcmUgZGlz
YWJsZWQgdmlhIElNUgo+ID4gPiA+ICAgICAgICAgICAgICAgICAgKiByZWdpc3RlciB0aGUgSVNS
IGJpdHMgYXJlIHNldCBhbnl3YXkgKGJ1dCBkbyBub3QgcHJvZHVjZSBJUlEpLgo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgKiBUbyBoYW5kbGUgc3VjaCBzaXR1YXRpb24gdGhlIG5hcGkgZnVuY3Rp
b25zIHVzZWQgdG8gY2hlY2sgaXMKPiA+ID4gPiBAQCAtMjQ1NCw4ICsyNDU0LDYgQEAgc3RhdGlj
IGlubGluZSBpbnQgYXRsMV9zY2hlZF9yaW5nc19jbGVhbihzdHJ1Y3QgYXRsMV9hZGFwdGVyKiBh
ZGFwdGVyKQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+ID4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIDA7Cj4gPiA+ID4KPiA+ID4gPiAtICAgICAgIF9fbmFwaV9zY2hlZHVsZSgmYWRh
cHRlci0+bmFwaSk7Cj4gPiA+ID4gLQo+ID4gPiA+ICAgICAgICAgLyoKPiA+ID4gPiAgICAgICAg
ICAqIERpc2FibGUgUlgvVFggaW50cyB2aWEgSU1SIHJlZ2lzdGVyIGlmIGl0IGlzCj4gPiA+ID4g
ICAgICAgICAgKiBhbGxvd2VkLiBOQVBJIGhhbmRsZXIgbXVzdCByZWVuYWJsZSB0aGVtIGluIHNh
bWUKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1
ODE1LmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC90b3NoaWJhL3RjMzU4MTUuYwo+ID4gPiA+IGlu
ZGV4IDE0Y2Y2ZWNmNmQwZC4uYThiOGEwZTEzZjlhIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L3Rvc2hpYmEvdGMzNTgxNS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvdG9zaGliYS90YzM1ODE1LmMKPiA+ID4gPiBAQCAtMTQzNiw5ICsxNDM2LDcg
QEAgc3RhdGljIGlycXJldHVybl90IHRjMzU4MTVfaW50ZXJydXB0KGludCBpcnEsIHZvaWQgKmRl
dl9pZCkKPiA+ID4gPiAgICAgICAgIGlmICghKGRtYWN0bCAmIERNQV9JbnRNYXNrKSkgewo+ID4g
PiA+ICAgICAgICAgICAgICAgICAvKiBkaXNhYmxlIGludGVycnVwdHMgKi8KPiA+ID4gPiAgICAg
ICAgICAgICAgICAgdGNfd3JpdGVsKGRtYWN0bCB8IERNQV9JbnRNYXNrLCAmdHItPkRNQV9DdGwp
Owo+ID4gPiA+IC0gICAgICAgICAgICAgICBpZiAobmFwaV9zY2hlZHVsZV9wcmVwKCZscC0+bmFw
aSkpCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgX19uYXBpX3NjaGVkdWxlKCZscC0+
bmFwaSk7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIGVsc2Ugewo+ID4gPiA+ICsgICAgICAgICAg
ICAgICBpZiAoIW5hcGlfc2NoZWR1bGUoJmxwLT5uYXBpKSkgewo+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHByaW50ayhLRVJOX0VSUiAiJXM6IGludGVycnVwdCB0YWtlbiBpbiBwb2xs
XG4iLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPm5hbWUpOwo+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEJVRygpOwo+ID4gPgo+ID4gPiBIbW1tLi4u
IGNvdWxkIHlvdSBhbHNvIHJlbW92ZSB0aGlzIEJVRygpID8gSSB0aGluayB0aGlzIGNvZGUgcGF0
aCBjYW4gYmUgdGFrZW4KPiA+ID4gaWYgc29tZSBhcHBsaWNhdGlvbnMgYXJlIHVzaW5nIGJ1c3kg
cG9sbGluZy4KPiA+ID4KPiA+ID4gT3Igc2ltcGx5IHJld3JpdGUgdGhpcyB3aXRoIHRoZSB0cmFk
aXRpb25hbAo+ID4gPgo+ID4gPiBpZiAobmFwaV9zY2hlZHVsZV9wcmVwKCZscC0+bmFwaSkpIHsK
PiA+ID4gICAgLyogZGlzYWJsZSBpbnRlcnJ1cHRzICovCj4gPiA+ICAgIHRjX3dyaXRlbChkbWFj
dGwgfCBETUFfSW50TWFzaywgJnRyLT5ETUFfQ3RsKTsKPiA+ID4gICAgIF9fbmFwaV9zY2hlZHVs
ZSgmbHAtPm5hcGkpOwo+ID4gPiB9Cj4gPiA+Cj4gPiA+Cj4gPgo+ID4gTWhoaCBpcyBpdCBzYWZl
IHRvIGRvIHNvPyBJIG1lYW4gaXQgc2VlbXMgdmVyeSB3cm9uZyB0byBwcmludCBhIHdhcm5pbmcK
PiA+IGFuZCBCVUcoKSBpbnN0ZWFkIG9mIGRpc2FibGluZyB0aGUgaW50ZXJydXB0IG9ubHkgaWYg
bmFwaSBjYW4gYmUKPiA+IHNjaGVkdWxlZC4uLiBNYXliZSBpcyB2ZXJ5IG9sZCBjb2RlPyBUaGUg
bW9yZSBJIHNlZSB0aGlzIHRoZSBtb3JlIEkgc2VlCj4gPiBwcm9ibGVtLi4uIChyYW5kb21seSBk
aXNhYmxpbmcgdGhlIGludGVycnVwdCBhbmQgdGhlbiBtYWtlIHRoZSBrZXJuZWwKPiA+IGRpZSkK
PiAKPiBJIGFtIHByZXR0eSBzdXJlIHRoaXMgQlVHKCkgY2FuIGJlIGhpdCB0aGVzZSBkYXlzIHdp
dGggYnVzeSBwb2xsaW5nIG9yCj4gc2V0dGluZyBncm9fZmx1c2hfdGltZW91dC4KPiAKPiBJIHdp
c2ggd2UgY291bGQgcmVtb3ZlIHRoZXNlIGJ1Z3MgYmVmb3JlIHNvbWVvbmUgY29weS1wYXN0ZSB0
aGVtLgo+IAo+IEFnYWluLCB0aGlzIGlzIG9ydGhvZ29uYWwsIEkgbWlnaHQgc2ltcGx5IHN0b3Ag
ZG9pbmcgcmV2aWV3cyBpZiB0aGlzCj4gaXMgbm90IHVzZWZ1bC4KClRoZXkgYXJlIHZlcnkgdXNl
ZnVsIGFuZCB0aGFua3MgYSBsb3QgZm9yIHRoZW0hIEknbSBhc2tpbmcgdGhlc2UgYXMgdG8KdW5k
ZXJzdGFuZCBob3cgdG8gcHJvY2VlZC4gSSBoYXZlIGluIHF1ZXVlIDIgb3RoZXIgc2VyaWVzIHRo
YXQgZGVwZW5kcwpvbiB0aGlzIGFuZCBJJ20ganVzdCBhc2tpbmcgaW5mbyBvbiBob3cgdG8gc3Bl
ZWR1cCB0aGUgcHJvZ3Jlc3Mgb24gdGhpcyEKClNvbyB0aGluayBJIGhhdmUgdG8gc2VuZCB2MyB3
aXRoIHRoZSBzdWdnZXN0ZWQgY2hhbmdlIGFuZCBCVUcoKSBkcm9wcGVkPwpIYXBweSB0byBkbyBl
dmVyeXRoaW5nIHRvIGZpeCBhbmQgaW1wcm92ZSB0aGlzIHNlcmllcyEKCi0tIAoJQW5zdWVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
