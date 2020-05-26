Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 695CC1E33AF
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 01:28:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BE48C36B21;
	Tue, 26 May 2020 23:28:32 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B893EC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 May 2020 23:28:29 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 7956C120ED490;
 Tue, 26 May 2020 16:28:26 -0700 (PDT)
Date: Tue, 26 May 2020 16:28:25 -0700 (PDT)
Message-Id: <20200526.162825.1972012781165820310.davem@davemloft.net>
To: fugang.duan@nxp.com
From: David Miller <davem@davemloft.net>
In-Reply-To: <1590394694-5505-1-git-send-email-fugang.duan@nxp.com>
References: <1590394694-5505-1-git-send-email-fugang.duan@nxp.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 26 May 2020 16:28:26 -0700 (PDT)
Cc: p.zabel@pengutronix.de, netdev@vger.kernel.org, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: enable timestamp
 snapshot for required PTP packets in dwmac v5.10a
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
Content-Type: text/plain; charset="iso8859-7"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

RnJvbTogRnVnYW5nIER1YW4gPGZ1Z2FuZy5kdWFuQG54cC5jb20+DQpEYXRlOiBNb24sIDI1IE1h
eSAyMDIwIDE2OjE4OjE0ICswODAwDQoNCj4gRm9yIHJ4IGZpbHRlciAnSFdUU1RBTVBfRklMVEVS
X1BUUF9WMl9FVkVOVCcsIGl0IHNob3VsZCBiZQ0KPiBQVFAgdjIvODAyLkFTMSwgYW55IGxheWVy
LCBhbnkga2luZCBvZiBldmVudCBwYWNrZXQsIGJ1dCBIVyBvbmx5DQo+IHRha2UgdGltZXN0YW1w
IHNuYXBzaG90IGZvciBiZWxvdyBQVFAgbWVzc2FnZTogc3luYywgUGRlbGF5X3JlcSwNCj4gUGRl
bGF5X3Jlc3AuDQo+IA0KPiBUaGVuIGl0IGNhdXNlcyBiZWxvdyBpc3N1ZSB3aGVuIHRlc3QgRTJF
IGNhc2U6DQo+IHB0cDRsWzI0NzkuNTM0XTogcG9ydCAxOiByZWNlaXZlZCBERUxBWV9SRVEgd2l0
aG91dCB0aW1lc3RhbXANCj4gcHRwNGxbMjQ4MS40MjNdOiBwb3J0IDE6IHJlY2VpdmVkIERFTEFZ
X1JFUSB3aXRob3V0IHRpbWVzdGFtcA0KPiBwdHA0bFsyNDgxLjc1OF06IHBvcnQgMTogcmVjZWl2
ZWQgREVMQVlfUkVRIHdpdGhvdXQgdGltZXN0YW1wDQo+IHB0cDRsWzI0ODMuNTI0XTogcG9ydCAx
OiByZWNlaXZlZCBERUxBWV9SRVEgd2l0aG91dCB0aW1lc3RhbXANCj4gcHRwNGxbMjQ4NC4yMzNd
OiBwb3J0IDE6IHJlY2VpdmVkIERFTEFZX1JFUSB3aXRob3V0IHRpbWVzdGFtcA0KPiBwdHA0bFsy
NDg1Ljc1MF06IHBvcnQgMTogcmVjZWl2ZWQgREVMQVlfUkVRIHdpdGhvdXQgdGltZXN0YW1wDQo+
IHB0cDRsWzI0ODYuODg4XTogcG9ydCAxOiByZWNlaXZlZCBERUxBWV9SRVEgd2l0aG91dCB0aW1l
c3RhbXANCj4gcHRwNGxbMjQ4Ny4yNjVdOiBwb3J0IDE6IHJlY2VpdmVkIERFTEFZX1JFUSB3aXRo
b3V0IHRpbWVzdGFtcA0KPiBwdHA0bFsyNDg3LjMxNl06IHBvcnQgMTogcmVjZWl2ZWQgREVMQVlf
UkVRIHdpdGhvdXQgdGltZXN0YW1wDQo+IA0KPiBUaW1lc3RhbXAgc25hcHNob3QgZGVwZW5kZW5j
eSBvbiByZWdpc3RlciBiaXRzIGluIHJlY2VpdmVkIHBhdGg6DQo+IFNOQVBUWVBTRUwgVFNNU1RS
RU5BIFRTRVZOVEVOQSAJUFRQX01lc3NhZ2VzDQo+IDAxICAgICAgICAgeCAgICAgICAgIDAgICAg
ICAgICAgU1lOQywgRm9sbG93X1VwLCBEZWxheV9SZXEsDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgRGVsYXlfUmVzcCwgUGRlbGF5X1JlcSwgUGRlbGF5X1Jlc3AsDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUGRlbGF5X1Jlc3BfRm9sbG93X1VwDQo+IDAxICAg
ICAgICAgMCAgICAgICAgIDEgICAgICAgICAgU1lOQywgUGRlbGF5X1JlcSwgUGRlbGF5X1Jlc3AN
Cj4gDQo+IEZvciBkd21hYyB2NS4xMGEsIGVuYWJsaW5nIGFsbCBldmVudHMgYnkgc2V0dGluZyBy
ZWdpc3Rlcg0KPiBEV0NfRVFPU19USU1FX1NUQU1QSU5HW1NOQVBUWVBTRUxdIHRvIDKiYjAxLCBj
bGVhcmluZyBiaXQgW1RTRVZOVEVOQV0NCj4gdG8gMKJiMCwgd2hpY2ggY2FuIHN1cHBvcnQgYWxs
IHJlcXVpcmVkIGV2ZW50cy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEZ1Z2FuZyBEdWFuIDxmdWdh
bmcuZHVhbkBueHAuY29tPg0KDQpBcHBsaWVkIGFuZCBxdWV1ZWQgdXAgZm9yIC1zdGFibGUsIHRo
YW5rcy4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
