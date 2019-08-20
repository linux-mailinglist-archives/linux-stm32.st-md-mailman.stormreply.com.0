Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D899661F
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2019 18:20:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 56755C35E01;
	Tue, 20 Aug 2019 16:20:29 +0000 (UTC)
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5092EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2019 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1566318027; bh=Ur31+ewkQP7gvbR5TMeGYZky/kMp62NibJGT1/dfqKM=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=tvP41V/NpdED1yBnNgPzOZVg4qYsZcKimpIlQTgnpQzjxMVWbq9EcgYLJwdSCNp3R
 G2IRR2dUZG4NS44OINYR/oi3IypT/0iBxlISdDmcj28OTZIRbOmsPaccwz/39979EX
 jAjJK5Me4SuNhwsSo9OvUspxepr4iBchNOmp2WlM=
Date: Tue, 20 Aug 2019 18:20:27 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20190820162027.7erc2rlvoqasfjk7@core.my.home>
Mail-Followup-To: Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20190820145343.29108-1-megous@megous.com>
 <20190820145343.29108-4-megous@megous.com>
 <20190820153939.GL29991@lunn.ch>
 <20190820154714.2rt4ctovil5ol3u2@core.my.home>
 <20190820155744.GN29991@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820155744.GN29991@lunn.ch>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/6] net: stmmac: sun8i: Use
 devm_regulator_get for PHY regulator
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

SGksCgpPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAwNTo1Nzo0NFBNICswMjAwLCBBbmRyZXcgTHVu
biB3cm90ZToKPiBPbiBUdWUsIEF1ZyAyMCwgMjAxOSBhdCAwNTo0NzoxNFBNICswMjAwLCBPbmTF
mWVqIEppcm1hbiB3cm90ZToKPiA+IEhpIEFuZHJldywKPiA+IAo+ID4gT24gVHVlLCBBdWcgMjAs
IDIwMTkgYXQgMDU6Mzk6MzlQTSArMDIwMCwgQW5kcmV3IEx1bm4gd3JvdGU6Cj4gPiA+IE9uIFR1
ZSwgQXVnIDIwLCAyMDE5IGF0IDA0OjUzOjQwUE0gKzAyMDAsIG1lZ291c0BtZWdvdXMuY29tIHdy
b3RlOgo+ID4gPiA+IEZyb206IE9uZHJlaiBKaXJtYW4gPG1lZ291c0BtZWdvdXMuY29tPgo+ID4g
PiA+IAo+ID4gPiA+IFVzZSBkZXZtX3JlZ3VsYXRvcl9nZXQgaW5zdGVhZCBvZiBkZXZtX3JlZ3Vs
YXRvcl9nZXRfb3B0aW9uYWwgYW5kIHJlbHkKPiA+ID4gPiBvbiBkdW1teSBzdXBwbHkuIFRoaXMg
YXZvaWRzIE5VTEwgY2hlY2tzIGJlZm9yZSByZWd1bGF0b3JfZW5hYmxlL2Rpc2FibGUKPiA+ID4g
PiBjYWxscy4KPiA+ID4gCj4gPiA+IEhpIE9uZHJlago+ID4gPiAKPiA+ID4gV2hhdCBkbyB5b3Ug
bWVhbiBieSBhIGR1bW15IHN1cHBseT8gSSdtIGp1c3QgdHJ5aW5nIHRvIG1ha2Ugc3VyZSB5b3UK
PiA+ID4gYXJlIG5vdCBicmVha2luZyBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4KPiA+IAo+ID4g
U29ycnksIEkgbWVhbiBkdW1teSByZWd1bGF0b3IuIFNlZToKPiA+IAo+ID4gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL3JlZ3VsYXRvci9jb3Jl
LmMjTDE4NzQKPiA+IAo+ID4gT24gc3lzdGVtcyB0aGF0IHVzZSBEVCAoaS5lLiBoYXZlX2Z1bGxf
Y29uc3RyYWludHMoKSA9PSB0cnVlKSwgd2hlbiB0aGUKPiA+IHJlZ3VsYXRvciBpcyBub3QgZm91
bmQgKEVOT0RFViwgbm90IHNwZWNpZmllZCBpbiBEVCksIHJlZ3VsYXRvcl9nZXQgd2lsbCByZXR1
cm4KPiA+IGEgZmFrZSBkdW1teSByZWd1bGF0b3IgdGhhdCBjYW4gYmUgZW5hYmxlZC9kaXNhYmxl
ZCwgYnV0IGRvZXNuJ3QgZG8gYW55dGhpbmcKPiA+IHJlYWwuCj4gCj4gSGkgT25kcmVqCj4gCj4g
QnV0IHdlIGFsc28gZ2FpbiBhIG5ldyB3YXJuaW5nOgo+IAo+IAlkZXZfd2FybihkZXYsCj4gCQkg
IiVzIHN1cHBseSAlcyBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvclxuIiwKPiAJICAg
ICAgICAgZGV2bmFtZSwgaWQpOwo+IAo+IFRoaXMgcmVndWxhdG9yIGlzIGNsZWFybHkgb3B0aW9u
YWwsIHNvIHRoZXJlIHNob3VsZCBub3QgYmUgYSB3YXJuaW5nLgo+IAo+IE1heWJlIHlvdSBjYW4g
YWRkIGEgbmV3IGdldF90eXBlLCBPUFRJT05BTF9HRVQsIHdoaWNoIGRvZXMgbm90IGlzc3VlCj4g
dGhlIHdhcm5pbmcsIGJ1dCBkb2VzIGdpdmUgYmFjayBhIGR1bW15IHJlZ3VsYXRvci4KCldlIGFs
cmVhZHkgaGFkIGEgaW5mbyBtZXNzYWdlLiBTZWUgbXkgb3RoZXIgZS1tYWlsIHdpdGggdGhlIGRt
ZXNnIG91dHB1dC4KCklNTywgdGhhdCB3YXJuaW5nIGlzIHVzZWZ1bCBkdXJpbmcgZGV2ZWxvcG1l
bnQsIGFuZCBtb3JlIGluZm9ybWF0aXZlIHRoYW4gdGhlCnByZXZpb3VzIG9uZS4KCnJlZ2FyZHMs
CglvLgoKPiBUaGFua3MKPiAJQW5kcmV3Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
