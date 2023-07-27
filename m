Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A4764704
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 08:39:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37166C6B45D;
	Thu, 27 Jul 2023 06:39:56 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E191CC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 06:39:54 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[127.0.0.1]) by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <j.zink@pengutronix.de>)
 id 1qOuf3-0001oC-9Q; Thu, 27 Jul 2023 08:39:45 +0200
Message-ID: <8742d597-e8b1-705f-6616-dca4ead529f4@pengutronix.de>
Date: Thu, 27 Jul 2023 08:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US, de-DE
To: Richard Cochran <richardcochran@gmail.com>
References: <20230719-stmmac_correct_mac_delay-v2-1-3366f38ee9a6@pengutronix.de>
 <20230725200606.5264b59c@kernel.org> <ZMCRjcRF9XqEPg/Z@hoboy.vegasvil.org>
 <09a2d767-d781-eba2-028f-a949f1128fbd@pengutronix.de>
 <ZME/GjBWdodiUO+8@hoboy.vegasvil.org>
From: Johannes Zink <j.zink@pengutronix.de>
In-Reply-To: <ZME/GjBWdodiUO+8@hoboy.vegasvil.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: j.zink@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel test robot <lkp@intel.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, patchwork-jzi@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: correct MAC propagation
	delay
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUmljaGFyZCwKCk9uIDcvMjYvMjMgMTc6NDMsIFJpY2hhcmQgQ29jaHJhbiB3cm90ZToKPiBP
biBXZWQsIEp1bCAyNiwgMjAyMyBhdCAwODoxMDozNUFNICswMjAwLCBKb2hhbm5lcyBaaW5rIHdy
b3RlOgo+IAo+PiBBbHNvIG9uIGEgc2lkZS1ub3RlLCAiZHJpdmVyIG5vbnNlbnNlIiBzb3VuZHMg
YSBiaXQgaGFyc2ggZnJvbSBzb21lb25lCj4+IGFsd2F5cyBpbnNpc3RpbmcgdGhhdCBvbmUgc2hv
dWxkIG5vdCBjb21wZW5zYXRlIGZvciBiYWQgZHJpdmVycyBpbiB0aGUKPj4gdXNlcnNwYWNlIHN0
YWNrIGFuZCBpbnN0ZWFkIGZpeGluZyBkcml2ZXIgYW5kIGhhcmR3YXJlIGlzc3VlcyBpbiB0aGUg
a2VybmVsLAo+PiBkb24ndCB5b3UgdGhpbms/Cj4gCj4gRXZlcnl0aGluZyBoYXMgaXRzIHBsYWNl
Lgo+IAo+IFRoZSBwcm9wZXIgcGxhY2UgdG8gYWNjb3VudCBmb3IgZGVsYXkgYXN5bW1ldHJpZXMg
aXMgaW4gdGhlIHVzZXIgc3BhY2UKPiBjb25maWd1cmF0aW9uLCBmb3IgZXhhbXBsZSBpbiBsaW51
eHB0cCB5b3UgaGF2ZQpUaGlzIGlzIG5vdCBhYm91dCBEZWxheSBBc3ltbWV0cnksIGJ1dCBhYm91
dCBBZGRpdGlvbmFsIEVycm9ycyBpbiBQYXRoIERlbGF5LCAKbmFtZWx5IE1BQyBJbmdyZXNzIGFu
ZCBFZ3Jlc3MgRGVsYXkuCgo+IAo+ICAgICAgICAgZGVsYXlBc3ltbWV0cnkKPiAgICAgICAgICAg
ICAgICBUaGUgIHRpbWUgIGRpZmZlcmVuY2UgaW4gbmFub3NlY29uZHMgb2YgdGhlIHRyYW5zbWl0
IGFuZCByZWNlaXZlCj4gICAgICAgICAgICAgICAgcGF0aHMuIFRoaXMgdmFsdWUgc2hvdWxkIGJl
IHBvc2l0aXZlIHdoZW4gIHRoZSAgc2VydmVyLXRvLWNsaWVudAo+ICAgICAgICAgICAgICAgIHBy
b3BhZ2F0aW9uICB0aW1lICBpcyAgbG9uZ2VyICBhbmQgIG5lZ2F0aXZlIHdoZW4gdGhlIGNsaWVu
dC10by0KPiAgICAgICAgICAgICAgICBzZXJ2ZXIgdGltZSBpcyBsb25nZXIuIFRoZSBkZWZhdWx0
IGlzIDAgbmFub3NlY29uZHMuCj4gCj4gICAgICAgICBlZ3Jlc3NMYXRlbmN5Cj4gICAgICAgICAg
ICAgICAgU3BlY2lmaWVzIHRoZSAgZGlmZmVyZW5jZSAgaW4gIG5hbm9zZWNvbmRzICBiZXR3ZWVu
ICB0aGUgIGFjdHVhbAo+ICAgICAgICAgICAgICAgIHRyYW5zbWlzc2lvbiB0aW1lIGF0IHRoZSBy
ZWZlcmVuY2UgcGxhbmUgYW5kIHRoZSByZXBvcnRlZCB0cmFuc+KAkAo+ICAgICAgICAgICAgICAg
IG1pdCB0aW1lIHN0YW1wLiBUaGlzIHZhbHVlIHdpbGwgYmUgYWRkZWQgdG8gZWdyZXNzICB0aW1l
ICBzdGFtcHMKPiAgICAgICAgICAgICAgICBvYnRhaW5lZCBmcm9tIHRoZSBoYXJkd2FyZS4gIFRo
ZSBkZWZhdWx0IGlzIDAuCj4gPiAgICAgICAgIGluZ3Jlc3NMYXRlbmN5Cj4gICAgICAgICAgICAg
ICAgU3BlY2lmaWVzIHRoZSBkaWZmZXJlbmNlIGluIG5hbm9zZWNvbmRzIGJldHdlZW4gdGhlIHJl
cG9ydGVkIHJl4oCQCj4gICAgICAgICAgICAgICAgY2VpdmUgIHRpbWUgIHN0YW1wICBhbmQgIHRo
ZSAgYWN0dWFsIHJlY2VwdGlvbiB0aW1lIGF0IHJlZmVyZW5jZQo+ICAgICAgICAgICAgICAgIHBs
YW5lLiBUaGlzIHZhbHVlIHdpbGwgYmUgc3VidHJhY3RlZCBmcm9tICBpbmdyZXNzICB0aW1lICBz
dGFtcHMKPiAgICAgICAgICAgICAgICBvYnRhaW5lZCBmcm9tIHRoZSBoYXJkd2FyZS4gIFRoZSBk
ZWZhdWx0IGlzIDAuCkZvciB0aGUgUFRQIHN0YWNrIHlvdSBjb3VsZCBwcm9iYWJseSBjb25maWd1
cmUgdGhlc2UgaW4gdGhlIHN0YWNrLCBidXQgZml4aW5nIAp0aGUgZGVsYXkgaW4gdGhlIGRyaXZl
ciBhbHNvIGhhcyB0aGUgYWR2YW50YWdlIG9mIHJlZHVjaW5nIHBoYXNlIG9mZnNldCBlcnJvciAK
d2hlbiBkb2luZyBjbG9jayByZXZvdmVyeSBmcm9tIHRoZSBQSEMuCgo+IAo+IFRyeWluZyB0byBo
YXJkIGNvZGUgdGhvc2UgaW50byB0aGUgZHJpdmVyPyAgR29vZCBsdWNrIGdldHRpbmcgdGhhdAo+
IHJpZ2h0IGZvciBldmVyeW9uZS4KVGhhdCdzIHdoeSB3ZSBkb24ndCBoYXJkY29kZSB0aGUgdmFs
dWVzIGJ1dCByZWFkIHRoZW0gZnJvbSB0aGUgcmVnaXN0ZXJzIApwcm92aWRlZCBieSB0aGUgSVAg
Y29yZS4KCj4gCj4gQlRXIHRoaXMgZHJpdmVyIGlzIGFjdHVhbGx5IGZvciBhbiBJUCBjb3JlIHVz
ZWQgaW4gbWFueSwgbWFueSBTb0NzLgo+IAo+IEhvdyBtYW55IF9vdGhlcl8gU29DcyBkaWQgeW91
IHRlc3QgeW91ciBwYXRjaCBvbj8KPiAKSSBkb24ndCBoYXZlIG1hbnkgYXZhaWxhYmxlLCB0aHVz
IGFzIHN0YXRlZCBpbiB0aGUgZGVzY3JpcHRpb246IG9uIHRoZSBpLk1YOE1QIApvbmx5LiBUaGF0
J3Mgd2h5IEkgYW0gaW1wbGVtZW50aW5nIG15IHN0dWZmIGluIHRoZSBpbXggZ2x1ZSBjb2RlLCB5
b3UncmUgCndlbGNvbWUgdG8gaGVscCB0ZXN0aW5nIG9uIG90aGVyIGhhcmR3YXJlIGlmIHlvdSBo
YXZlIGFueSBhdCBoYW5kLgoKQmVzdCByZWdhcmRzCkpvaGFubmVzCgo+IFRoYW5rcywKPiBSaWNo
YXJkCj4gCj4gCj4gCgoKLS0gClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgfCBKb2hh
bm5lcyBaaW5rICAgICAgICAgICAgICAgICAgfApTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAg
ICAgIHwgaHR0cHM6Ly93d3cucGVuZ3V0cm9uaXguZGUvICAgIHwKMzExMzcgSGlsZGVzaGVpbSwg
R2VybWFueSAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICAgICB8CkFtdHNnZXJp
Y2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2fCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUgICAg
fAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
