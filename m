Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD4A219EC
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 10:34:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DBC8C78034;
	Wed, 29 Jan 2025 09:34:44 +0000 (UTC)
Received: from lynxeye.de (ns.lynxeye.de [87.118.118.114])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE3E3C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2025 20:04:58 +0000 (UTC)
Received: by lynxeye.de (Postfix, from userid 501)
 id 6F899E74071; Tue, 28 Jan 2025 21:04:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on lynxeye.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=ALL_TRUSTED,BAYES_00,
 T_SCC_BODY_TEXT_LINE autolearn=ham version=3.3.1
Received: from [192.168.178.25] (a89-182-99-197.net-htp.de [89.182.99.197])
 by lynxeye.de (Postfix) with ESMTPSA id 0A738E74067;
 Tue, 28 Jan 2025 21:04:57 +0100 (CET)
Message-ID: <c8db4ad722b7dd169ea71990238dbc82da91f3a4.camel@lynxeye.de>
From: Lucas Stach <dev@lynxeye.de>
To: Thierry Reding <thierry.reding@gmail.com>, Furong Xu <0x1207@gmail.com>
Date: Tue, 28 Jan 2025 21:04:56 +0100
In-Reply-To: <qkjv53fn32qdi5jh2d6bqdfnnl5x4x74cmir6fjtstfw2ijds6@eoxctjkqij7u>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com>
 <qkjv53fn32qdi5jh2d6bqdfnnl5x4x74cmir6fjtstfw2ijds6@eoxctjkqij7u>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 Jan 2025 09:34:43 +0000
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
 Joe Damato <jdamato@fastly.com>, linux-kernel@vger.kernel.org,
 Brad Griffis <bgriffis@nvidia.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Eric Dumazet <edumazet@google.com>, "David S.
 Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 1/4] net: stmmac: Switch to
 zero-copy in non-XDP RX path
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

QW0gRnJlaXRhZywgZGVtIDI0LjAxLjIwMjUgdW0gMTQ6MTUgKzAxMDAgc2NocmllYiBUaGllcnJ5
IFJlZGluZzoKPiAKWy4uLl0KPiA+IFRoZSBkbWEtY29oZXJlbnQgcHJvcGVydHkgaW4gZGV2aWNl
IHRyZWUgbm9kZSBpcyBTb0Mgc3BlY2lmaWMsIHNvIG9ubHkgdGhlCj4gPiB2ZW5kb3JzIGtub3cg
aWYgdGhlaXIgc3RtbWFjIGV0aGVybmV0IGNvbnRyb2xsZXIgaXMgZG1hIGNvaGVyZW50IGFuZAo+
ID4gd2hldGhlciB0aGVpciBkZXZpY2UgdHJlZSBhcmUgbWlzc2luZyB0aGUgY3JpdGljYWwgZG1h
LWNvaGVyZW50IHByb3BlcnR5Lgo+IAo+IFdoYXQgSSBmYWlsIHRvIHVuZGVyc3RhbmQgaXMgaG93
IGRtYS1jb2hlcmVudCBjYW4gbWFrZSBhIGRpZmZlcmVuY2UgaW4KPiB0aGlzIGNhc2UuIElmIGl0
J3Mgbm90IHByZXNlbnQsIHRoZW4gdGhlIGRyaXZlciBpcyBzdXBwb3NlZCB0byBtYWludGFpbgo+
IGNhY2hlcyBleHBsaWNpdGx5LiBCdXQgaXQgc2VlbXMgbGlrZSBleHBsaWNpdCBjYWNoZSBtYWlu
dGVuYW5jZSBhY3R1YWxseQo+IGNhdXNlcyB0aGluZ3MgdG8gYnJlYWsuIFNvIGRvIHdlIG5lZWQg
dG8gYXNzdW1lIHRoYXQgRE1BIGNvaGVyZW50Cj4gZGV2aWNlcyBpbiBnZW5lcmFsbHkgd29uJ3Qg
d29yayBpZiB0aGUgZHJpdmVyIG1hbmFnZXMgY2FjaGVzIGV4cGxpY2l0bHk/Cj4gCj4gSSBhbHdh
eXMgZmlndXJlZCBkbWEtY29oZXJlbnQgd2FzIG1vcmUgb2YgYW4gb3B0aW1pemF0aW9uLCBidXQg
dGhpcwo+IHNlZW1zIHRvIGluZGljYXRlIGl0IGlzbid0LgoKVGhlcmUgaXMgYSByZWFswqBmYWls
dXJlIHNjZW5hcmlvIHdoZW4gdGhlIGRldmljZSBpcyBhY3R1YWxseSBkbWEtCmNvaGVyZW50LCBi
dXQgdGhlIERUIGNsYWltcyBpdCBpc24ndDogSWYgYSBsb2NhdGlvbiBmcm9tIGUuZy4gYSByZWNl
aXZlCmJ1ZmZlciBpcyBhbHJlYWR5IGFsbG9jYXRlZCBpbiB0aGUgY2FjaGUsIHRoZSB3cml0ZSBm
cm9tIHRoZSBkZXZpY2UKd2lsbCB1cGRhdGUgdGhlIGNhY2hlIGxpbmUgYW5kIG5vdCBnbyBvdXQg
dG8gbWVtb3J5LiBJZiB5b3UgdGhlbiBkbyB0aGUKdXN1YWwgbm9uLWNvaGVyZW50IGNhY2hlIG1h
aW50ZW5hbmNlLCBpLmUuIGludmFsaWRhdGUgdGhlIFJYIGJ1ZmZlcgphcmVhIGFmdGVyIHRoZSBk
ZXZpY2UgaW5kaWNhdGVkIHRoZSByZWNlcHRpb24gb2YgdGhlIGJ1ZmZlciwgeW91IHdpbGwKZGVz
dHJveSB0aGUgdXBkYXRlZCBkYXRhIGluIHRoZSBjYWNoZSBhbmQgcmVhZCBzdGFsZSBkYXRhIGZy
b20gbWVtb3J5LgoKUmVnYXJkcywKTHVjYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
