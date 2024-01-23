Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3645839D2E
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 00:25:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58306C6DD6D;
	Tue, 23 Jan 2024 23:25:15 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46BFAC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Jan 2024 23:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=3L0RW4HC32Lx5N8gtFQZihg57fFjleHQGb6GEyv904U=; b=Gr
 D29UDWX/6aQD2sRb7aY/kxmfBVq8gBCbrbzylkaj3+maXmg+39XjQ//bc3h0pQe6NrE5FlbECD2h1
 OFSQjWYIxZyLizyhMAttwp5ZPoa/PTVRkI3vqrWY6BNsDqw8u8oTCBTOTjFU9IPgjFHKVVgf1HL/O
 LnjELfdoswWP1DI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rSQ8h-005t6u-Hh; Wed, 24 Jan 2024 00:25:07 +0100
Date: Wed, 24 Jan 2024 00:25:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ziyang Huang <hzyitc@outlook.com>
Message-ID: <8488a274-148d-42da-9fd3-d56ef1db6061@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB55568ACB534944D7DEB00C7AC9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB555648886D03AB911224F6FAC9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TYZPR01MB555648886D03AB911224F6FAC9742@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 2/8] phy: Introduce Qualcomm ethernet
	uniphy driver
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

T24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMTE6NTg6MjZQTSArMDgwMCwgWml5YW5nIEh1YW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzEvMjEgMjA6NDIsIFppeWFuZyBIdWFuZyDlhpnpgZM6Cj4gPiArI2Rl
ZmluZSBybXdsKGFkZHIsIG1hc2ssIHZhbCkgXAo+ID4gKwl3cml0ZWwoKChyZWFkbChhZGRyKSAm
IH4obWFzaykpIHwgKCh2YWwpICYgKG1hc2spKSksIGFkZHIpCj4gPiArCj4gPiArc3RhdGljIGlu
dCBjbW5faW5pdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gK3sKPiA+ICsJc3Ry
dWN0IHJlc291cmNlICpyZXM7Cj4gPiArCXZvaWQgX19pb21lbSAqY21uX2Jhc2U7Cj4gPiArCXZv
aWQgX19pb21lbSAqdGNzcl9iYXNlOwo+ID4gKwl1MzIgdmFsOwo+ID4gKwo+ID4gKwlyZXMgPSBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAiY21uIik7
Cj4gPiArCWlmICghcmVzKQo+ID4gKwkJcmV0dXJuIDA7Cj4gPiArCj4gPiArCWNtbl9iYXNlID0g
ZGV2bV9pb3JlbWFwX3Jlc291cmNlKCZwZGV2LT5kZXYsIHJlcyk7Cj4gPiArCWlmIChJU19FUlJf
T1JfTlVMTChjbW5fYmFzZSkpCj4gPiArCQlyZXR1cm4gUFRSX0VSUihjbW5fYmFzZSk7Cj4gPiAr
Cj4gPiArCS8qIEZvciBJUFE1MHh4LCB0Y3NyIGlzIG5lY2Vzc2FyeSB0byBlbmFibGUgY21uIGJs
b2NrICovCj4gPiArCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9S
RVNPVVJDRV9NRU0sICJ0Y3NyIik7Cj4gPiArCWlmIChyZXMpIHsKPiA+ICsJCXRjc3JfYmFzZSA9
IGRldm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOwo+ID4gKwkJaWYgKElTX0VS
Ul9PUl9OVUxMKHRjc3JfYmFzZSkpCj4gPiArCQkJcmV0dXJuIFBUUl9FUlIodGNzcl9iYXNlKTsK
PiA+ICsKPiA+ICsJCXJtd2woKHRjc3JfYmFzZSArIFRDU1JfRVRIX0NNTiksIFRDU1JfRVRIX0NN
Tl9FTkFCTEUsCj4gPiArCQkgICAgIFRDU1JfRVRIX0NNTl9FTkFCTEUpOwo+ID4gKwl9Cj4gPiAr
Cj4gPiArCXJtd2woKGNtbl9iYXNlICsgQ01OX1BMTF9SRUZDTEtfU1JDKSwKPiA+ICsJICAgICBD
TU5fUExMX1JFRkNMS19TUkNfRlJPTV9NQVNLLAo+ID4gKwkgICAgIENNTl9QTExfUkVGQ0xLX1NS
Q19GUk9NX1JFRyk7Cj4gPiArCXJtd2woKGNtbl9iYXNlICsgQ01OX1BMTF9SRUZDTEspLAo+ID4g
KwkgICAgIChDTU5fUExMX1JFRkNMS19FWFRFUk5BTCB8IENNTl9QTExfUkVGQ0xLX0ZSRVFfTUFT
Swo+ID4gKwkgICAgICB8IENNTl9QTExfUkVGQ0xLX0RJVl9NQVNLKSwKPiA+ICsJICAgICAoQ01O
X1BMTF9SRUZDTEtfRlJFUV80OE0gfCBDTU5fUExMX1JFRkNMS19ESVYoMikpKTsKPiA+ICsKPiA+
ICsJcm13bCgoY21uX2Jhc2UgKyBDTU5fUExMX0NUUkwpLCBDTU5fUExMX0NUUkxfUlNUX04sIDAp
Owo+ID4gKwltc2xlZXAoMSk7Cj4gPiArCXJtd2woKGNtbl9iYXNlICsgQ01OX1BMTF9DVFJMKSwg
Q01OX1BMTF9DVFJMX1JTVF9OLAo+ID4gKwkgICAgIENNTl9QTExfQ1RSTF9SU1RfTik7Cj4gPiAr
CW1zbGVlcCgxKTsKPiA+ICsKPiA+ICsJcmV0dXJuIHJlYWRfcG9sbF90aW1lb3V0KHJlYWRsLCB2
YWwsCj4gPiArCQkJCSAodmFsICYgQ01OX1BMTF9TVEFUVVNfTE9DS0VEKSwKPiA+ICsJCQkJIDEw
MCwgMjAwMDAwLCBmYWxzZSwKPiA+ICsJCQkJIChjbW5fYmFzZSArIENNTl9QTExfU1RBVFVTKSk7
Cj4gPiArfQo+ID4gKwo+IAo+IEhpIEFuZHJldywKPiAKPiBTb3JyeSB0byBib3RoZXIgeW91LiBC
dXQgSSBjYW4ndCBtYWtlIGEgZGVjaXNpb24gaGVyZS4KPiAKPiBUaGUgQ01OIGJsb2NrIChTZWVt
IGxpa2UgdGhlIEFiYnJldmlhdGlvbiBvZiAiY29tcG9uZW50IikgY29udHJvbHMgdGhlCj4gZW50
aXJlIG5ldHdvcmsgYmxvY2suIEl0IG5lZWQgdG8gYmUgY29uZmlndXJlZCBiZWZvcmUgdW5pcGh5
LCBtZGlvLCBnbWFjLAo+IGV0Yy4uIEluIHRoZSBwYXN0LCBRdWFsY29tbSBwdXQgaXQgaW4gbWRp
byBkcml2ZXIuIEJ1dCBVTklQSFkgbmVlZCB0byBiZWVuCj4gaW5pdGlhbGl6YXRlZCBiZWZvcmUg
bWRpbyBiZWNhdXNlIHNvbWUgUEhZcy9zd2l0Y2hzIHVzZSB0aGUgb3V0Y2xrIHByb3ZpZGVkCj4g
YnkgVU5JUEhZIGFzIHRoZWlyIG1haW4gY2xvY2tzLgo+IAo+IFNvIGl0IHNlZW0gbGlrZSB0aGF0
IGl0IHNob3VsZCBiZSBkZXNjcmliZWQgaW4gYSBzZXBhcmF0ZSBub2RlLiBCdXQgSQo+IGNvdWxk
bid0IGZpbmQgYSBzdWl0YWJsZSBkcml2ZXIgZGlyZWN0b3J5IGZvciBpdC4gQ2FuIHlvdSBwbGVh
c2UgZ2l2ZSBtZQo+IHNvbWUgc3VnZ2VzdGlvbnM/IFRoYW5rcy4KCk1heWJlIGRyaXZlcnMvc29j
L3Fjb20uCgpEb2VzIGl0IHByb3ZpZGUgYW55IHJlc291cmNlcyB0byB0aGUgdW5pcGh5LCBtZGlv
LCBnbWFjLCBldGM/IEFueXRoaW5nCndoaWNoIGNhbiBiZSB1c2VkIHRvIGxpbmsgYWxsIHRoZSBi
aXRzIHRvZ2V0aGVyPwoKTG9va2luZyBhdCBDTU5fUExMX0NUUkxfUlNUX04sIGNvdWxkIGl0IGJl
IGNvbnNpZGVyZWQgYXMgYSByZXNldApkcml2ZXI/IEVhY2ggb2YgdGhlIG90aGVyIGRyaXZlcnMg
aGF2ZSBhIHBoYW5kbGUgdG8gaXQsIGFuZCB1c2UgdGhlCnJlc2V0IEFQSSB0byB0YWtlIGl0IG91
dCBvZiByZXNldCB3aGVuIHRoZXkgcHJvYmU/IFRoYXQgc2hvdWxkIGdpdmUKeW91IHNvbWUgb3Jk
ZXJpbmcgZ3VhcmFudGVlcy4KCiAgICBBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
