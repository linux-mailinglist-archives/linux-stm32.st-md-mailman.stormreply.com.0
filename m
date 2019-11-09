Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C239DF5F2D
	for <lists+linux-stm32@lfdr.de>; Sat,  9 Nov 2019 13:43:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 785CEC36B0B;
	Sat,  9 Nov 2019 12:43:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AE958C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  9 Nov 2019 12:43:09 +0000 (UTC)
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABD5C21019;
 Sat,  9 Nov 2019 12:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573303388;
 bh=lfLddIGQZu8yh7JyCypDgx5/iez6bEwoAQmO+JsUsHM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iKEBM0GXOAc+4G624Fx5/UrFhOnzogFtFG+AqARetI+MonQAAGcQcTbFP/rVRnb65
 smwY4/Rp2Tk5MjL76tvIUotNH4eheT4KQ/1Hu5Ti5e7qI5rC9Kf1QLGCEITeLcMsud
 IaUcqUjRkj77/7ggShqYTMw3Whj03WlUxB/j93t8=
Date: Sat, 9 Nov 2019 12:43:01 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20191109124301.5ffda04b@archlinux>
In-Reply-To: <CAL_Jsq+b_e1MbXx6918+iKfrTgqoozxOZ2rEYgogChZDWR_+iQ@mail.gmail.com>
References: <20191031123040.26316-1-benjamin.gaignard@st.com>
 <20191031123040.26316-3-benjamin.gaignard@st.com>
 <20191103110841.3ad3ecfb@archlinux>
 <CA+M3ks5sZ6wwV-V+HCLC8OLdeLqrxK0Ga-pXTsdktQErbMOk4g@mail.gmail.com>
 <20191106040657.GA5294@bogus>
 <d0196570-9140-c775-742c-89092056e651@st.com>
 <CAL_Jsq+b_e1MbXx6918+iKfrTgqoozxOZ2rEYgogChZDWR_+iQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 Fabrice GASNIER <fabrice.gasnier@st.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/4] dt-bindings: iio: timer: Convert
 stm32 IIO trigger bindings to json-schema
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

T24gV2VkLCA2IE5vdiAyMDE5IDE3OjM1OjIwIC0wNjAwClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgoKPiBPbiBXZWQsIE5vdiA2LCAyMDE5IGF0IDE6NTIgUE0gQmVuamFtaW4g
R0FJR05BUkQKPiA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPiB3cm90ZToKPiA+Cj4gPgo+ID4g
T24gMTEvNi8xOSA1OjA2IEFNLCBSb2IgSGVycmluZyB3cm90ZTogIAo+ID4gPiBPbiBUdWUsIE5v
diAwNSwgMjAxOSBhdCAxMTowNzoxNkFNICswMTAwLCBCZW5qYW1pbiBHYWlnbmFyZCB3cm90ZTog
IAo+ID4gPj4gTGUgZGltLiAzIG5vdi4gMjAxOSDDoCAxMjowOCwgSm9uYXRoYW4gQ2FtZXJvbiA8
amljMjNAa2VybmVsLm9yZz4gYSDDqWNyaXQgOiAgCj4gPiA+Pj4gT24gVGh1LCAzMSBPY3QgMjAx
OSAxMzozMDozOCArMDEwMAo+ID4gPj4+IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWln
bmFyZEBzdC5jb20+IHdyb3RlOgo+ID4gPj4+ICAKPiA+ID4+Pj4gQ29udmVydCB0aGUgU1RNMzIg
SUlPIHRyaWdnZXIgYmluZGluZyB0byBEVCBzY2hlbWEgZm9ybWF0IHVzaW5nIGpzb24tc2NoZW1h
Cj4gPiA+Pj4+Cj4gPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5q
YW1pbi5nYWlnbmFyZEBzdC5jb20+ICAKPiA+ID4+PiBJJ20gZmFyIGZyb20gZ3JlYXQgb24gdGhl
c2UgYXMgc3RpbGwgaGF2ZW4ndCB0YWtlbiB0aGUgdGltZSBJIHNob3VsZCB0byBsZWFybgo+ID4g
Pj4+IHRoZSB5YW1sIHN5bnRheCBwcm9wZXJseS4gIEEgZmV3IGNvbW1lbnRzIGlubGluZSBob3dl
dmVyIGJhc2VkIG1vc3RseSBvbiB0aGlzCj4gPiA+Pj4gZG9lc24ndCBxdWl0ZSBsb29rIGxpa2Ug
b3RoZXIgb25lcyBJJ3ZlIHNlZW4gcmVjZW50bHkuCj4gPiA+Pj4KPiA+ID4+PiBUaGFua3MsCj4g
PiA+Pj4KPiA+ID4+PiBKb25hdGhhbgo+ID4gPj4+ICAKPiA+ID4+Pj4gLS0tCj4gPiA+Pj4+ICAg
Li4uL2JpbmRpbmdzL2lpby90aW1lci9zdCxzdG0zMi10aW1lci10cmlnZ2VyLnlhbWwgfCA0NCAr
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+Pj4+ICAgLi4uL2JpbmRpbmdzL2lpby90aW1lci9z
dG0zMi10aW1lci10cmlnZ2VyLnR4dCAgICAgfCAyNSAtLS0tLS0tLS0tLS0KPiA+ID4+Pj4gICAy
IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+ID4gPj4+
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aWlvL3RpbWVyL3N0LHN0bTMyLXRpbWVyLXRyaWdnZXIueWFtbAo+ID4gPj4+PiAgIGRlbGV0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL3RpbWVyL3N0
bTMyLXRpbWVyLXRyaWdnZXIudHh0Cj4gPiA+Pj4+Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaWlvL3RpbWVyL3N0LHN0bTMyLXRpbWVyLXRy
aWdnZXIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9paW8vdGltZXIv
c3Qsc3RtMzItdGltZXItdHJpZ2dlci55YW1sCj4gPiA+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gPiA+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMWM4YzhiNTVlOGNkCj4gPiA+Pj4+IC0tLSAv
ZGV2L251bGwKPiA+ID4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lpby90aW1lci9zdCxzdG0zMi10aW1lci10cmlnZ2VyLnlhbWwKPiA+ID4+Pj4gQEAgLTAsMCAr
MSw0NCBAQAo+ID4gPj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpCj4gPiA+Pj4+ICslWUFNTCAxLjIKPiA+ID4+Pj4gKy0tLQo+ID4g
Pj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9paW8vdGltZXIvc3Qsc3Rt
MzItdGltZXItdHJpZ2dlci55YW1sIwo+ID4gPj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+Pj4+ICsKPiA+ID4+Pj4gK3RpdGxl
OiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzIgVGltZXJzIElJTyB0aW1lciBiaW5kaW5ncwo+ID4g
Pj4+PiArCj4gPiA+Pj4+ICttYWludGFpbmVyczoKPiA+ID4+Pj4gKyAgLSBCZW5qYW1pbiBHYWln
bmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAc3QuY29tPgo+ID4gPj4+PiArICAtIEZhYnJpY2UgR2Fz
bmllciA8ZmFicmljZS5nYXNuaWVyQHN0LmNvbT4KPiA+ID4+Pj4gKwo+ID4gPj4+PiArcHJvcGVy
dGllczoKPiA+ID4+Pj4gKyAgJG5vZGVtYW5lOiAgCj4gPiA+Pj4gbm9kZW5hbWU/ICAKPiA+ID4+
IFRoYXQgd2lsbCBiZSBpbiB2MiAgCj4gPiA+IE5vLCAkbm9kZW5hbWUgaXMgY29ycmVjdC4gVGhl
ICckJyBzaWduaWZpZXMgc29tZXRoaW5nIHdlIGdlbmVyYXRlIGFuZAo+ID4gPiBhZGQgaW4uIElP
Vywgbm90IGEgcmVhbCBwcm9wZXJ0eS4gSSBndWVzcyB3ZSBjb3VsZCBoYXZlIHVzZWQgJ25hbWUn
IGhlcmUKPiA+ID4gYW5kIHN0dWNrIHdpdGggdHJhZGl0aW9uYWwgT3BlbkZpcm13YXJlLiAgCj4g
PiBsZXQncyBnbyBmb3IgJG5hbWUgIAo+IAo+IE5vLCAkbm9kZW5hbWUgaXMgY29ycmVjdC4gWW91
IGRvbid0IGhhdmUgYSBjaG9pY2UuIFRoYXQgaXMgd2hhdCB0aGUKPiB0b29saW5nIGdlbmVyYXRl
cy4KClNvcnJ5IGFsbCwgSSBjYXVzZWQgY29uZnVzaW9uIGhlcmUuICBXYXMganVzdCB0cnlpbmcg
dG8gcG9pbnQgb3V0IHRoZSB0eXBvIQokbm9kZV9tX2FuZQoKOikKCj4gCj4gUm9iCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
