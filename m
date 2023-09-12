Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0A079CB1A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 11:06:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEF00C6B46F;
	Tue, 12 Sep 2023 09:06:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70F62C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 09:06:54 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qfzM4-0001U4-6D; Tue, 12 Sep 2023 11:06:46 +0200
Message-ID: <99695befef06b025de2c457ea5f861aa81a0883c.camel@pengutronix.de>
From: Lucas Stach <l.stach@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>
Date: Tue, 12 Sep 2023 11:04:16 +0200
In-Reply-To: <ZQAa3277GC4c9W1D@xhacker>
References: <20230717160630.1892-1-jszhang@kernel.org>
 <20230717160630.1892-3-jszhang@kernel.org>
 <20230911171102.cwieugrpthm7ywbm@pengutronix.de> <ZQAa3277GC4c9W1D@xhacker>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 kernel@pengutronix.de, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [REGRESSION] [PATCH net-next v5 2/2] net: stmmac:
 use per-queue 64 bit statistics where necessary
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

QW0gRGllbnN0YWcsIGRlbSAxMi4wOS4yMDIzIHVtIDE2OjAxICswODAwIHNjaHJpZWIgSmlzaGVu
ZyBaaGFuZzoKPiBPbiBNb24sIFNlcCAxMSwgMjAyMyBhdCAwNzoxMTowMlBNICswMjAwLCBVd2Ug
S2xlaW5lLUvDtm5pZyB3cm90ZToKPiA+IEhlbGxvLAo+ID4gCj4gPiB0aGlzIHBhdGNoIGJlY2Ft
ZSBjb21taXQgMTMzNDY2YzNiYmUxNzFmODI2Mjk0MTYxZGIyMDNmNzY3MGJiMzBjOCBhbmQgaXMK
PiA+IHBhcnQgb2YgdjYuNi1yYzEuCj4gPiAKPiA+IE9uIG15IGFybS9zdG0zMm1wMTU3IGJhc2Vk
IG1hY2hpbmUgdXNpbmcgTkZTIHJvb3QgdGhpcyBjb21taXQgbWFrZXMgdGhlCj4gPiBmb2xsb3dp
bmcgYXBwZWFyIGluIHRoZSBrZXJuZWwgbG9nOgo+ID4gCj4gPiAJSU5GTzogdHJ5aW5nIHRvIHJl
Z2lzdGVyIG5vbi1zdGF0aWMga2V5Lgo+ID4gCVRoZSBjb2RlIGlzIGZpbmUgYnV0IG5lZWRzIGxv
Y2tkZXAgYW5ub3RhdGlvbiwgb3IgbWF5YmUKPiA+IAl5b3UgZGlkbid0IGluaXRpYWxpemUgdGhp
cyBvYmplY3QgYmVmb3JlIHVzZT8KPiA+IAl0dXJuaW5nIG9mZiB0aGUgbG9ja2luZyBjb3JyZWN0
bmVzcyB2YWxpZGF0b3IuCj4gPiAJQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyLzAgTm90IHRh
aW50ZWQgNi41LjAtcmMxLTAwNDQ5LWcxMzM0NjZjM2JiZTEtZGlydHkgIzIxCj4gPiAJSGFyZHdh
cmUgbmFtZTogU1RNMzIgKERldmljZSBUcmVlIFN1cHBvcnQpCj4gPiAJIHVud2luZF9iYWNrdHJh
Y2UgZnJvbSBzaG93X3N0YWNrKzB4MTgvMHgxYwo+ID4gCSBzaG93X3N0YWNrIGZyb20gZHVtcF9z
dGFja19sdmwrMHg2MC8weDkwCj4gPiAJIGR1bXBfc3RhY2tfbHZsIGZyb20gcmVnaXN0ZXJfbG9j
a19jbGFzcysweDk4Yy8weDk5Ywo+ID4gCSByZWdpc3Rlcl9sb2NrX2NsYXNzIGZyb20gX19sb2Nr
X2FjcXVpcmUrMHg3NC8weDI5M2MKPiA+IAkgX19sb2NrX2FjcXVpcmUgZnJvbSBsb2NrX2FjcXVp
cmUrMHgxMzQvMHgzOTgKPiA+IAkgbG9ja19hY3F1aXJlIGZyb20gc3RtbWFjX2dldF9zdGF0czY0
KzB4MmFjLzB4MmZjCj4gPiAJIHN0bW1hY19nZXRfc3RhdHM2NCBmcm9tIGRldl9nZXRfc3RhdHMr
MHg0NC8weDEzMAo+ID4gCSBkZXZfZ2V0X3N0YXRzIGZyb20gcnRubF9maWxsX3N0YXRzKzB4Mzgv
MHgxMjAKPiA+IAkgcnRubF9maWxsX3N0YXRzIGZyb20gcnRubF9maWxsX2lmaW5mbysweDgzNC8w
eDE3ZjQKPiA+IAkgcnRubF9maWxsX2lmaW5mbyBmcm9tIHJ0bXNnX2lmaW5mb19idWlsZF9za2Ir
MHhjMC8weDE0NAo+ID4gCSBydG1zZ19pZmluZm9fYnVpbGRfc2tiIGZyb20gcnRtc2dfaWZpbmZv
KzB4NTAvMHg4OAo+ID4gCSBydG1zZ19pZmluZm8gZnJvbSBfX2Rldl9ub3RpZnlfZmxhZ3MrMHhj
MC8weGVjCj4gPiAJIF9fZGV2X25vdGlmeV9mbGFncyBmcm9tIGRldl9jaGFuZ2VfZmxhZ3MrMHg1
MC8weDVjCj4gPiAJIGRldl9jaGFuZ2VfZmxhZ3MgZnJvbSBpcF9hdXRvX2NvbmZpZysweDJmNC8w
eDEyNjAKPiA+IAkgaXBfYXV0b19jb25maWcgZnJvbSBkb19vbmVfaW5pdGNhbGwrMHg3MC8weDM1
Ywo+ID4gCSBkb19vbmVfaW5pdGNhbGwgZnJvbSBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDJhYy8w
eDMwOAo+ID4gCSBrZXJuZWxfaW5pdF9mcmVlYWJsZSBmcm9tIGtlcm5lbF9pbml0KzB4MWMvMHgx
MzgKPiA+IAkga2VybmVsX2luaXQgZnJvbSByZXRfZnJvbV9mb3JrKzB4MTQvMHgyYwo+ID4gCUV4
Y2VwdGlvbiBzdGFjaygweGUwODE1ZmIwIHRvIDB4ZTA4MTVmZjgpCj4gPiAJNWZhMDogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAKPiA+IAk1ZmMwOiAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMAo+ID4gCTVmZTA6IDAwMDAwMDAwIDAw
MDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDEzIDAwMDAwMDAwCj4gPiAJZHdjMiA0OTAw
MDAwMC51c2Itb3RnOiBuZXcgZGV2aWNlIGlzIGhpZ2gtc3BlZWQKPiA+IAo+ID4gSSBkaWRuJ3Qg
dHJ5IHVuZGVyc3RhbmQgdGhpcyBwcm9ibGVtLCBpdCdzIHRvbyBjbG9zZSB0byBxdWl0dGluZyB0
aW1lCj4gPiA6LSkKPiAKPiBUaGFua3MgZm9yIHRoZSBidWcgcmVwb3J0LCBJJ20gY2hlY2tpbmcg
dGhlIGNvZGUuCgpUaGUgbmV3bHkgYWRkZWQgInN0cnVjdCB1NjRfc3RhdHNfc3luYyBzeW5jcCIg
dXNlcyBhIHNlcWxvY2sKaW50ZXJuYWxseSwgd2hpY2ggaXMgYnJva2VuIGludG8gbXVsdGlwbGUg
d29yZHMgb24gMzJiaXQgbWFjaGluZXMsIGFuZApuZWVkcyB0byBiZSBpbml0aWFsaXplZCBwcm9w
ZXJseS4gWW91IG5lZWQgdG8gY2FsbCB1NjRfc3RhdHNfaW5pdCBvbgpzeW5jcCBiZWZvcmUgZmly
c3QgdXNhZ2UuCgpSZWdhcmRzLApMdWNhcwoKPiA+IAo+ID4gQmVzdCByZWdhcmRzCj4gPiBVd2UK
PiA+IAo+ID4gLS0gCj4gPiBQZW5ndXRyb25peCBlLksuICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCBVd2UgS2xlaW5lLUvDtm5pZyAgICAgICAgICAgIHwKPiA+IEluZHVzdHJpYWwgTGludXgg
U29sdXRpb25zICAgICAgICAgICAgICAgICB8IGh0dHBzOi8vd3d3LnBlbmd1dHJvbml4LmRlLyB8
Cj4gCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
