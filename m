Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E50D77A94DF
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 15:40:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91405C6A60C;
	Thu, 21 Sep 2023 13:40:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19F6EC0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=etZ2gpA0uz+JRPag03uqb6cfh/kPa8Z3gAMOKitX9GI=; b=XJFeAWsJK6qNPSOEXR7+0kE+V4
 4M/gOJKBPlGa+X30hfCd+WanZJzjvHIg3FOF+0PiDMyYKdq2GmP3ET7jaqP+coWsJhapZAKkw8XBp
 YXoEu+OSuRKJy8kMvQA+1uK6bnykQqT3wiDi16tAorZtuVizYtC0+q1DOQqAlh1wAjC8THQ5j1tBb
 n/IVlVmgzyC3E/JOKzyKNxwUAzemhr/7mg2Mnn9ljY2801G2xkTtLiqJpDZMyMiXD40F4Rjw8bpZ1
 iLzGICk+q44J1b1OKypm+kQ/qteOXGLyEtKJFXgJpGWWDjwMCPUvm9uR4EZYSUOWmQK0fR8ZT1pgq
 aMWFFDyg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46552)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1qjJuR-0004g0-21;
 Thu, 21 Sep 2023 14:39:59 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1qjJuO-0003aT-Te; Thu, 21 Sep 2023 14:39:56 +0100
Date: Thu, 21 Sep 2023 14:39:56 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Message-ID: <ZQxHrPS5C13SfTfA@shell.armlinux.org.uk>
References: <20230804084527.2082302-1-yong.liang.choong@linux.intel.com>
 <5bd05ba2-fd88-4e5c-baed-9971ff917484@lunn.ch>
 <f9b21a9d-4ae2-1f91-b621-2e27f746f661@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9b21a9d-4ae2-1f91-b621-2e27f746f661@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 platform-driver-x86@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, David E Box <david.e.box@linux.intel.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Wong Vee Khee <veekhee@apple.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/5] TSN auto negotiation
	between 1G and 2.5G
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

T24gVGh1LCBTZXAgMjEsIDIwMjMgYXQgMDg6MjU6MDVQTSArMDgwMCwgQ2hvb25nIFlvbmcgTGlh
bmcgd3JvdGU6Cj4gCj4gCj4gT24gNC84LzIwMjMgODowNCBwbSwgQW5kcmV3IEx1bm4gd3JvdGU6
Cj4gPiBPbiBGcmksIEF1ZyAwNCwgMjAyMyBhdCAwNDo0NToyMlBNICswODAwLCBDaG9vbmcgWW9u
ZyBMaWFuZyB3cm90ZToKPiA+ID4gSW50ZWwgcGxhdGZvcm1z4oCZIGludGVncmF0ZWQgR2lnYWJp
dCBFdGhlcm5ldCBjb250cm9sbGVycyBzdXBwb3J0Cj4gPiA+IDIuNUdicHMgbW9kZSBzdGF0aWNh
bGx5IHVzaW5nIEJJT1MgcHJvZ3JhbW1pbmcuIEluIHRoZSBjdXJyZW50Cj4gPiA+IGltcGxlbWVu
dGF0aW9uLCB0aGUgQklPUyBtZW51IHByb3ZpZGVzIGFuIG9wdGlvbiB0byBzZWxlY3QgYmV0d2Vl
bgo+ID4gPiAxMC8xMDAvMTAwME1icHMgYW5kIDIuNUdicHMgbW9kZXMuIEJhc2VkIG9uIHRoZSBz
ZWxlY3Rpb24sIHRoZSBCSU9TCj4gPiA+IHByb2dyYW1zIHRoZSBQaGFzZSBMb2NrIExvb3AgKFBM
TCkgcmVnaXN0ZXJzLiBUaGUgQklPUyBhbHNvIHJlYWQgdGhlCj4gPiA+IFRTTiBsYW5lIHJlZ2lz
dGVycyBmcm9tIEZsZXhpYmxlIEkvTyBBZGFwdGVyIChGSUEpIGJsb2NrIGFuZCBwcm92aWRlZAo+
ID4gPiAxMC8xMDAvMTAwME1icHMvMi41R2JwcyBpbmZvcm1hdGlvbiB0byB0aGUgc3RtbWFjIGRy
aXZlci4gQnV0Cj4gPiA+IGF1dG8tbmVnb3RpYXRpb24gYmV0d2VlbiAxMC8xMDAvMTAwME1icHMg
YW5kIDIuNUdicHMgaXMgbm90IGFsbG93ZWQuCj4gPiA+IFRoZSBuZXcgcHJvcG9zYWwgaXMgdG8g
c3VwcG9ydCBhdXRvLW5lZ290aWF0aW9uIGJldHdlZW4gMTAvMTAwLzEwMDBNYnBzCj4gPiA+IGFu
ZCAyLjVHYnBzIC4gQXV0by1uZWdvdGlhdGlvbiBiZXR3ZWVuIDEwLCAxMDAsIDEwMDBNYnBzIHdp
bGwgdXNlCj4gPiA+IGluLWJhbmQgYXV0byBuZWdvdGlhdGlvbi4gQXV0by1uZWdvdGlhdGlvbiBi
ZXR3ZWVuIDEwLzEwMC8xMDAwTWJwcyBhbmQKPiA+ID4gMi41R2JwcyB3aWxsIHdvcmsgYXMgdGhl
IGZvbGxvd2luZyBwcm9wb3NlZCBmbG93LCB0aGUgc3RtbWFjIGRyaXZlciByZWFkcwo+ID4gPiB0
aGUgUEhZIGxpbmsgc3RhdHVzIHJlZ2lzdGVycyB0aGVuIGlkZW50aWZpZXMgdGhlIG5lZ290aWF0
ZWQgc3BlZWQuCj4gPiA+IEJhc2VkIG9uIHRoZSBzcGVlZCBzdG1tYWMgZHJpdmVyIHdpbGwgaWRl
bnRpZnkgVFNOIGxhbmUgcmVnaXN0ZXJzIGZyb20KPiA+ID4gRklBIHRoZW4gc2VuZCBJUEMgY29t
bWFuZCB0byB0aGUgUG93ZXIgTWFuYWdlbWVudCBjb250cm9sbGVyIChQTUMpCj4gPiA+IHRocm91
Z2ggUE1DIGRyaXZlci9BUEkuIFBNQyB3aWxsIGFjdCBhcyBhIHByb3h5IHRvIHByb2dyYW1zIHRo
ZQo+ID4gPiBQTEwgcmVnaXN0ZXJzLgo+ID4gCj4gPiBIYXZlIHlvdSBjb25zaWRlcmVkIHVzaW5n
IG91dCBvZiBiYW5kIGZvciBhbGwgbGluayBtb2Rlcz8gWW91IG1pZ2h0Cj4gPiBlbmQgdXAgd2l0
aCBhIGNsZWFuZXIgYXJjaGl0ZWN0dXJlLCBhbmQgbm90IG5lZWQgYW55IHBoeWxpbmsvcGh5bGli
Cj4gPiBoYWNrcy4KPiA+IAo+ID4gCUFuZHJldwo+IEhpIEFuZHJldywKPiAKPiBBZnRlciBjb25k
dWN0aW5nIGEgY29tcHJlaGVuc2l2ZSBzdHVkeSwgaXQgc2VlbXMgdGhhdCBpbXBsZW1lbnRpbmcK
PiBvdXQtb2YtYmFuZCBmb3IgYWxsIGxpbmsgbW9kZXMgbWlnaHQgbm90IGJlIGZlYXNpYmxlLiBJ
IG1heSBoYXZlIG1pc3NlZCBzb21lCj4ga2V5IGFzcGVjdHMgZHVyaW5nIG15IGFuYWx5c2lzLgoK
WW91IG5lZWQgdG8gcHJvdmlkZSBkZXRhaWxzIG9mIHdoeSB5b3UgdGhpbmsgaXQncyBub3QgZmVh
c2libGUsIGJlY2F1c2UKeW91J3JlIG1ha2luZyB0aG9zZSByZWFkaW5nIHlvdXIgbWVzc2FnZSBo
YXZlIHRvIGd1ZXNzLgoKV2UgX2RvXyBoYXZlIGNhc2VzIHdoZXJlIHRoaXMgaXMgYWxyZWFkeSBz
dXBwb3J0ZWQuIFRoZSBETTcwNTIgU0ZQCm1vZHVsZSBmb3IgZXhhbXBsZSBoYXMgYSBCQ004NDg4
MSBQSFkgb24gYm9hcmQgdGhhdCBoYXMgbm8gaW4tYmFuZApzdXBwb3J0LCBzbyBhbHdheXMgaGFz
IHRvIHVzZSBvdXQtb2YtYmFuZC4gVGhpcyBtb2R1bGUgc3VwcG9ydHMgMTBHLAo1RywgMi41Rywg
MUcsIDEwME0gYW5kIDEwTSBzcGVlZHMuIEl0IHN3aXRjaGVzIGl0cyBpbnRlcmZhY2UgYmV0d2Vl
bgoxMEcsIDI1MDBiYXNlLVggYW5kIFNHTUlJIG1vZGUuIEl0J3MgYmVlbiBzdXBwb3J0ZWQgaW4g
TGludXggZm9yIGEKd2hpbGUgd2l0aCBNQUMvUENTIHRoYXQgaW1wbGVtZW50IHBoeWxpbmsgX2Nv
cnJlY3RseV8uCgpJIHdvdWxkbid0IGNhbGwgc3RtbWFjIGEgcHJvcGVyIHBoeWxpbmsgaW1wbGVt
ZW50YXRpb24sIGVzcGVjaWFsbHkKd2hlbiBpdCBjb21lcyB0byBzd2l0Y2hpbmcgYmV0d2VlbiBk
aWZmZXJlbnQgaW50ZXJmYWNlcy4KCk15IGF0dGVtcHQgYXQgc3RhcnRpbmcgdG8gY2xlYW4gdXAg
dGhlIHN0bW1hYyBjb2RlIHdhcyB0aHdhcnRlZCBieQpuaWdnbHkgcmV2aWV3IGNvbW1lbnRzIChv
dmVyIHdoZXRoZXIgJXUgb3IgJWQgc2hvdWxkIGJlIHVzZWQgdG8gcHJpbnQKYSBfc2lnbmVkIGlu
dGVnZXJfIHRoYXQgc3RtbWFjIHN0dXBpZGx5IGltcGxpY2l0bHkgY2FzdHMgdG8gYW4gdW5zaWdu
ZWQKaW50ZWdlci4gVGhhdCBsZWFkIG1lIHRvIGRlY2lkZSB0aGF0IHN0bW1hYyB3YXMgYmV5b25k
IGJlaW5nIGNsZWFuZWQKdXAsIHNvIEkganVua2VkIHRoZSBsYXJnZSBwYXRjaCBzZXQgb2YgaW1w
cm92ZW1lbnRzIHRoYXQgSSBoYWQgLSBhbG9uZwp3aXRoIG11bHRpcGxlIGlzc3VlcyB0aGF0IEkg
aGFkIGZvdW5kIGluIHRoZSBkcml2ZXIuCgpTb21lb25lIGVsc2UgbmVlZHMgdG8gc29ydCBzdG1t
YWMgb3V0LCBhbmQgSSBzdXNwZWN0IHRoYXQgbWF5IGJlIGEKcHJlLXJlcXVpc2l0IGZvciB5b3Vy
IGNoYW5nZXMgc28gdGhhdCBzdG1tYWMgb3BlcmF0ZXMgX2NvcnJlY3RseV8gd2l0aApwaHlsaW5r
LgoKLS0gClJNSydzIFBhdGNoIHN5c3RlbTogaHR0cHM6Ly93d3cuYXJtbGludXgub3JnLnVrL2Rl
dmVsb3Blci9wYXRjaGVzLwpGVFRQIGlzIGhlcmUhIDgwTWJwcyBkb3duIDEwTWJwcyB1cC4gRGVj
ZW50IGNvbm5lY3Rpdml0eSBhdCBsYXN0IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
