Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A47592903B4
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Oct 2020 13:02:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66965C3FADE;
	Fri, 16 Oct 2020 11:02:42 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E016C32EA3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Oct 2020 11:02:41 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CCNXc3nM1z1sNds;
 Fri, 16 Oct 2020 13:02:40 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CCNXc2pJ4z1qtZK;
 Fri, 16 Oct 2020 13:02:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id q7nM7EvCOHoP; Fri, 16 Oct 2020 13:02:38 +0200 (CEST)
X-Auth-Info: QDhZ3xTKUHbLJbyPsbqW8SkHXNXF34pTN1a82TaLl1M=
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 16 Oct 2020 13:02:38 +0200 (CEST)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Yann GAUTIER <yann.gautier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
 <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
 <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
 <11b92f1e-fda0-e98a-8db7-f53004f2404d@denx.de>
 <e95247bd-7b1d-b44c-4a9e-c9951f37e6cf@pengutronix.de>
 <0f815500-9ff3-da51-42b2-7a262d57f510@st.com>
 <3c77bddb-362e-37e4-eef0-85239df98906@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <a6777c9f-69ed-0605-5037-43352c4d7e37@denx.de>
Date: Fri, 16 Oct 2020 13:02:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3c77bddb-362e-37e4-eef0-85239df98906@pengutronix.de>
Content-Language: en-US
Cc: hardware@linux-automation.com, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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

T24gMTAvMTYvMjAgODoxOSBBTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+IEhlbGxvIEFsZXgsCgpI
aSwKCj4gT24gMTAvMTUvMjAgNTo1MSBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4gT24g
MTAvMTUvMjAgMzo0NyBQTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+Pj4gZml4ZWQgdXAsIG5vdCBm
aXhlZC4gSSBkb24ndCBrbm93IGlmIFNUIGlzIGZpbmUgd2l0aCB0aGUgY2hhbmdlcywgZm9yCj4+
PiB0aGUgTUMtMSwgcGxlYXNlIGRvOgo+Pj4KPj4+IC0tLS0tLS0tLS0tLS0tIDg8IC0tLS0tLS0t
LS0tLS0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEt
bWMxLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWx4YS1tYzEuZHRzCj4+PiBp
bmRleCA1NzAwZTZiNzAwZDMuLjcxMzQ0NjYyNTZiMyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLWx4YS1tYzEuZHRzCj4+PiArKysgYi9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0cwo+Pj4gQEAgLTIwOCw2ICsyMDgsMTQgQEAgcGlu
czIgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gwqAgfTsKPj4+Cj4+PiArJnNkbW1jMl9k
NDdfcGluc19iIHsKPj4+ICvCoMKgwqDCoMKgwqAgLyogYm9hcmQgYWxyZWFkeSBoYXMgZXh0ZXJu
YWwgNDdLIHB1bGwtdXBzICovCj4+PiArCj4+PiArwqDCoMKgwqDCoMKgIHBpbnMgewo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL2RlbGV0ZS1wcm9wZXJ0eS8gYmlhcy1wdWxsLXVw
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1kaXNhYmxlOwo+Pj4gK8Kg
wqDCoMKgwqDCoCB9Owo+Pj4gK307Cj4+PiArCj4+Cj4+IFRoaXMgcHJvcG9zaXRpb24gcmVtaW5k
IG1lIGFuIG9sZCBkaXNjdXNzaW9uIHdlIGdvdCB3aXRoIE1hcmVrIGFib3V0ICJ3aGVyZSBwaW4g
ZGVmaW5pdGlvbnMgaGFzIHRvIGJlIGRvbmUgPyIuIE15IGFwcHJvYWNoIGlzIHRvIG5vdCBkZWZp
bmUgcGlucyBncm91cHMgaW5zaWRlIGJvYXJkIGR0cyBmaWxlIG1haW5seSBiZWNhdXNlIHBpbm11
eCBpcyBhIFNvQyBjb25maWd1cmF0aW9uIGFuZCBhIGJvYXJkIG9ubHkgdXNlIG9uZSBvZiB0aG9z
ZSBjb25maWd1cmF0aW9ucyBibGFibGFibGEgOikuIEJ1dCBjb3VudGVyLWFyZ3VtZW50IGlzIHRo
YXQgcHVsbC11cC9wdWxsLWRvd24sIE9wZW4tZHJhaW4gcHVzaC1wdWxsIHNldHRpbmdzIGFyZSAi
ZHJpdmVuIiBieSB0aGUgYm9hcmQgY29uZmlndXJhdGlvbiBhbmQgSSBhZ3JlZS4KPiAKPiBXZSBj
YW4gc3BsaXQgcGlubXV4IGF3YXkgZnJvbSBwaW5jb25mIGFuZCBzdGlsbCBoYXZlIGEgaGVhZGVy
IHRvIGJlIGluY2x1ZGVkIGV2ZXJ5d2hlcmUKPiBmb3IgcGluIG11eGluZyBsaWtlIHRoZSBpLk1Y
IGlzIGRvaW5nLCBlLmcuCj4gCj4gLyogc3RtMzJtcDE1LXBpbm11eC5oICovCj4gI2RlZmluZSBT
VE0zMk1QMTVfUEM4X19TRE1NQzFfRDAJPFNUTTMyX1BJTk1VWCgnQycsICA4LCBBRjEyKT4KPiAj
ZGVmaW5lIFNUTTMyTVAxNV9QQzlfX1NETU1DMV9EMQk8U1RNMzJfUElOTVVYKCdDJywgIDksIEFG
MTIpPgo+ICNkZWZpbmUgU1RNMzJNUDE1X1BDMTBfX1NETU1DMV9EMgk8U1RNMzJfUElOTVVYKCdD
JywgMTAsIEFGMTIpPgo+ICNkZWZpbmUgU1RNMzJNUDE1X1BDMTFfX1NETU1DMV9EMwk8U1RNMzJf
UElOTVVYKCdDJywgMTEsIEFGMTIpPgo+IAo+IFRoZSBzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kv
c3RtMzJtcDE1LXBpbmNvbmYuZHRzaS8gY2FuIGJlIG1hZGUgdG8gdXNlIGl0IGFuZCBkZWZpbmUK
PiB0aGUgcGluIGNvbmZpZ3VyYXRpb25zIHRoYXQgYXJlIGluIHVzZSBvbiB0aGUgU1QgYm9hcmRz
IGFuZCB0aGF0IG1vc3Qgb2YgdGhlIGJvYXJkcyB3aWxsCj4gcHJvYmFibHkgY29weSBvZmYuCj4g
Cj4gQm9hcmRzIERUUyBjYW4gdGhlbiBwaWNrIGFuZCBjaG9vc2Ugd2hpY2ggcGluY3RybCBncm91
cHMgdG8gdGFrZSBmcm9tIHRoZSBTVCBvbmUuCj4gSWYgdGhleSBoYXZlIGN1c3RvbSBuZWVkcyB0
aGV5IGp1c3QgZGVmaW5lIHRoZWlyIG93biBncm91cHMgaW5saW5lCj4gKEkga25vdyBJIHJlcGVh
dCBteXNlbGYsIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvMzEwYWEz
YTMtMDljZS00MmVmLWQxZWEtYjY1MzE2M2QxZDcyQHBlbmd1dHJvbml4LmRlLykKClRoZSBkb3du
c2lkZSBvZiB0aGlzIGlzIHRoYXQgeW91IHdpbGwgZW5kIHVwIHdpdGggYSBsb3Qgb2YgZHVwbGlj
YXRpb24Kb2YgInBpbiBncm91cHMiIGluIGJvYXJkIGZpbGVzLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
