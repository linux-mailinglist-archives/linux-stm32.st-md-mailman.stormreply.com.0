Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 840DE2A82BF
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 16:55:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A165C3FAD4;
	Thu,  5 Nov 2020 15:55:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 44CC8C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 15:55:32 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FFE222203
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 15:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604591730;
 bh=Nn5yZsR5cVNdPLSt6ukSmkFIoHyl1vlOqpN4mmSJvtQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RTPEIBmfewbb9j0xYmB1HkpyH6PrUI2AEgbepb/+ZtWwJvbIx5R/IQaMIQ7MUiQe/
 8/XyD2sgCcWIN9ylAusxJbsGRFQJKmJBGv4RrP8uf/O2/JRQIvAA/DJSmd96kemuOp
 +Ha/C0JLYX19HxzNEW2Ynt9H+n0AttNuf0FeH/n8=
Received: by mail-ot1-f49.google.com with SMTP id j14so1867379ots.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Nov 2020 07:55:30 -0800 (PST)
X-Gm-Message-State: AOAM532x8hTrJzL2CShFtZxtvF11zOw120eWa+OnUqf4cvq4spbgsuZl
 eQ1Qg8XtmQP+4IOLGtid6T+FOq34ccgFE22o1Q==
X-Google-Smtp-Source: ABdhPJzFE9EXbkrCyHs8MI0I/5ukc4rsI6+2K2P6Vfp+sYo4ignpEJ+h06rHKi84VQz22pcJpGyw8es9BrIeRKrOcBE=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr1984194oti.107.1604591729675; 
 Thu, 05 Nov 2020 07:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20201029095806.10648-1-amelie.delaunay@st.com>
 <20201029095806.10648-2-amelie.delaunay@st.com>
 <20201029154016.GA1917373@bogus>
 <860d5620-4fdf-6e01-9a04-3967d6fcfd6b@st.com>
 <CAL_JsqKs-Po8BdShjQNDNPjNWBCD3FSPdq4KbQGx3=VnV+3nPw@mail.gmail.com>
 <ebccf61a-c88f-c7f4-9f06-01d2bd1f43de@st.com> <20201104210803.GA4115079@bogus>
 <2da804ff-3b3c-0ea9-14d5-a163b28ccc33@st.com>
 <CAKgpwJU_yTTYabeMYFBqNs_6=N7gaTAc1v-+fU-dshFUrL1qVA@mail.gmail.com>
In-Reply-To: <CAKgpwJU_yTTYabeMYFBqNs_6=N7gaTAc1v-+fU-dshFUrL1qVA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Nov 2020 09:55:17 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJUVRRD=j6FTFUgUuhfLkGe5WRex+gj7N6wvu-DbwL+bA@mail.gmail.com>
Message-ID: <CAL_JsqJUVRRD=j6FTFUgUuhfLkGe5WRex+gj7N6wvu-DbwL+bA@mail.gmail.com>
To: Jun Li <lijun.kernel@gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [RESEND PATCH v3 1/4] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

T24gVGh1LCBOb3YgNSwgMjAyMCBhdCA2OjI0IEFNIEp1biBMaSA8bGlqdW4ua2VybmVsQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiBBbWVsaWUgREVMQVVOQVkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+
IOS6jjIwMjDlubQxMeaciDXml6Xlkajlm5sg5LiL5Y2INzozNuWGmemBk++8mgo+ID4KPiA+IE9u
IDExLzQvMjAgMTA6MDggUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gPiBPbiBGcmksIE9jdCAz
MCwgMjAyMCBhdCAwNDoyNzoxNFBNICswMTAwLCBBbWVsaWUgREVMQVVOQVkgd3JvdGU6Cj4gPiA+
Pgo+ID4gPj4KPiA+ID4+IE9uIDEwLzMwLzIwIDM6MjkgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+
ID4gPj4+IE9uIFRodSwgT2N0IDI5LCAyMDIwIGF0IDExOjQ5IEFNIEFtZWxpZSBERUxBVU5BWSA8
YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4gd3JvdGU6Cj4gPiA+Pj4+Cj4gPiA+Pj4+Cj4gPiA+Pj4+
Cj4gPiA+Pj4+IE9uIDEwLzI5LzIwIDQ6NDAgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gPj4+
Pj4gT24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMTA6NTg6MDNBTSArMDEwMCwgQW1lbGllIERlbGF1
bmF5IHdyb3RlOgo+ID4gPj4+Pj4+IFBvd2VyIG9wZXJhdGlvbiBtb2RlIG1heSBkZXBlbmRzIG9u
IGhhcmR3YXJlIGRlc2lnbiwgc28sIGFkZCB0aGUgb3B0aW9uYWwKPiA+ID4+Pj4+PiBwcm9wZXJ0
eSBwb3dlci1vcG1vZGUgZm9yIHVzYi1jIGNvbm5lY3RvciB0byBzZWxlY3QgdGhlIHBvd2VyIG9w
ZXJhdGlvbgo+ID4gPj4+Pj4+IG1vZGUgY2FwYWJpbGl0eS4KPiA+ID4+Pj4+Pgo+ID4gPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IEFtZWxpZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QHN0LmNvbT4K
PiA+ID4+Pj4+PiAtLS0KPiA+ID4+Pj4+PiAgICAgLi4uL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2It
Y29ubmVjdG9yLnlhbWwgICAgICB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ID4gPj4+Pj4+ICAg
ICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQo+ID4gPj4+Pj4+Cj4gPiA+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3Iv
dXNiLWNvbm5lY3Rvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nv
bm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwKPiA+ID4+Pj4+PiBpbmRleCA3MjhmODJkYjA3M2Qu
LjIwMGQxOWM2MGZkNSAxMDA2NDQKPiA+ID4+Pj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+ID4gPj4+Pj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5l
Y3Rvci55YW1sCj4gPiA+Pj4+Pj4gQEAgLTkzLDYgKzkzLDI0IEBAIHByb3BlcnRpZXM6Cj4gPiA+
Pj4+Pj4gICAgICAgICAgIC0gZGV2aWNlCj4gPiA+Pj4+Pj4gICAgICAgICAgIC0gZHVhbAo+ID4g
Pj4+Pj4+Cj4gPiA+Pj4+Pj4gKyAgcG93ZXItb3Btb2RlOgo+ID4gPj4+Pj4KPiA+ID4+Pj4+IEkn
dmUgYWNrZWQgdGhpcyB2ZXJzaW9uOgo+ID4gPj4+Pj4KPiA+ID4+Pj4+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyMDEwMjAwOTM2MjcuMjU2ODg1LTItYmFkaHJpQGdvb2dsZS5jb20KPiA+
ID4+Pj4+Cj4gPiA+Pj4+Cj4gPiA+Pj4+IGZycyBpcyB1c2VkIGZvciBGYXN0IFJvbGUgU3dhcCBk
ZWZpbmVkIGluIFVTQiBQRCBzcGVjLgo+ID4gPj4+PiBJIHVuZGVyc3RhbmQgaXQgYWxsb3dzIHRv
IGdldCB0aGUgc2FtZSBpbmZvcm1hdGlvbiBidXQgSSdtIHdvbmRlcmluZyB3aHkKPiA+ID4+Pj4g
dGhlIHByb3BlcnR5IG5hbWUgaXMgbGltaXRlZCB0byAtZnJzLSBpbiB0aGlzIGNhc2UuIFdoYXQg
YWJvdXQgYQo+ID4gPj4+PiBub24tcG93ZXIgZGVsaXZlcnkgVVNCLUMgY29ubmVjdG9yID8KPiA+
ID4+Pgo+ID4gPj4+IEkndmUgZ290IG5vIGlkZWEuIFRoZSBmb2xrcyB0aGF0IGtub3cgVVNCLUMg
YW5kIFBEIGRldGFpbHMgbmVlZCB0byBnZXQKPiA+ID4+PiB0b2dldGhlciBhbmQgd29yayBhbGwg
dGhpcyBvdXQuIFRvIG1lLCBpdCBsb29rcyBsaWtlIHRoZSBzYW1lIHRoaW5nLi4uCj4gPiA+Pj4K
PiA+ID4+Cj4gPiA+PiBJdCBsb29rcyBidXQuLi4KPiA+ID4+Cj4gPiA+PiBUaGUgcHVycG9zZSBv
ZiBwb3dlci1vcG1vZGUgcHJvcGVydHkgaXMgdG8gY29uZmlndXJlIHRoZSBVU0ItQyBjb250cm9s
bGVycywKPiA+ID4+IGVzcGVjaWFsbHkgdGhlIG5vbi1QRCBVU0ItQyBjb250cm9sbGVycyB0byBk
ZXRlcm1pbmUgdGhlIHBvd2VyIG9wZXJhdGlvbgo+ID4gPj4gbW9kZSB0aGF0IHRoZSBUeXBlIEMg
Y29ubmVjdG9yIHdpbGwgc3VwcG9ydCBhbmQgd2lsbCBhZHZlcnRpc2UgdGhyb3VnaCBDQwo+ID4g
Pj4gcGlucyB3aGVuIGl0IGhhcyBubyBwb3dlciBkZWxpdmVyeSBzdXBwb3J0LCB3aGF0ZXZlciB0
aGUgcG93ZXIgcm9sZTogU2luaywKPiA+ID4+IFNvdXJjZSBvciBEdWFsCj4gPiA+PiBUaGUgbWFu
YWdlbWVudCBvZiB0aGUgcHJvcGVydHkgaXMgdGhlIHNhbWUgdGhhdCBkYXRhLXJvbGUgYW5kIHBv
d2VyLXJvbGUKPiA+ID4+IHByb3BlcnRpZXMsIGFuZCBkb25lIGJ5IFVTQiBUeXBlLUMgQ29ubmVj
dG9yIENsYXNzLgo+ID4gPj4KPiA+ID4+IG5ldy1zb3VyY2UtZnJzLXR5cGVjLWN1cnJlbnQgc3Bl
Y2lmaWVzIGluaXRpYWwgY3VycmVudCBjYXBhYmlsaXR5IG9mIHRoZSBuZXcKPiA+ID4+IHNvdXJj
ZSB3aGVuIHZTYWZlNVYgaXMgYXBwbGllZCBkdXJpbmcgUEQzLjAgRmFzdCBSb2xlIFN3YXAuIFNv
IGhlcmUsIHRoaXMKPiA+ID4+IHByb3BlcnR5IGlzIG5vdCBhcHBsaWVkIGF0IHVzYi1jIGNvbnRy
b2xsZXIgY29uZmlndXJhdGlvbiBsZXZlbCwgYnV0IGR1cmluZwo+ID4gPj4gUEQgRmFzdCBSb2xl
IFN3YXAsIHNvIHdoZW4gdGhlIFNpbmsgYmVjb21lIHRoZSBTb3VyY2UuCj4gPiA+PiBNb3Jlb3Zl
ciwgdGhlIHJlbGF0ZWQgZHJpdmVyIGNvZGUgc2F5cyBGUlMgY2FuIG9ubHkgYmUgc3VwcG9ydGVk
IGJ5IERSUAo+ID4gPj4gcG9ydHMuIFNvIG5ldy1zb3VyY2UtZnJzLXR5cGVjLWN1cnJlbnQgcHJv
cGVydHksIGluIGFkZGl0aW9uIHRvIGJlaW5nCj4gPiA+PiBzcGVjaWZpYyB0byBQRCwgaXMgYWxz
byBkZWRpY2F0ZWQgdG8gRFJQIHVzYi1jIGNvbnRyb2xsZXIuCj4gPiA+PiBUaGUgcHJvcGVydHkg
aXMgbWFuYWdlZCBieSBUeXBlLUMgUG9ydCBDb250cm9sbGVyIE1hbmFnZXIgZm9yIFBELgo+ID4g
Pgo+ID4gPiBCdXQgaXQncyB0aGUgc2FtZSBzZXQgb2YgcG9zc2libGUgdmFsdWVzLCByaWdodD8g
U28gd2UgY2FuIGFsaWduIHRoZQo+ID4gPiB2YWx1ZXMgYXQgbGVhc3QuCj4gPiA+Cj4gPgo+ID4g
VVNCIFBvd2VyIERlbGl2ZXJ5IEZSUyB2YWx1ZXMgYXJlIGRlZmluZWQgaW4KPiA+IGluY2x1ZGUv
ZHQtYmluZGluZ3MvdXNiL3BkLmgKPgo+IEkgdGhpbmsgdGhpcyBjYW4gYmUgY2hhbmdlZCBpZiBi
b3RoIGNhbiBiZSBhbGlnbmVkLgo+Cj4gPnRvIGZpdCB3aXRoIGRyaXZlcnMvdXNiL3R5cGVjL3Rj
cG0vdGNwbS5jCj4gPiBmcnNfdHlwZWNfY3VycmVudCBlbnVtLgo+ID4KPiA+IFVTQi1DIHBvd2Vy
IG9wZXJhdGlvbiBtb2RlIHZhbHVlcyBhcmUgZGVmaW5lZCBpbgo+ID4gaW5jbHVkZS9saW51eC91
c2IvdHlwZWMuaCB3aXRoIHR5cGVjX3B3cl9vcG1vZGUgZW51bSBhbmQgbWF0Y2hpbmcgd2l0aAo+
ID4gc3RyaW5nIHZhbHVlcyBvZiB0eXBlY19wd3Jfb3Btb2RlcyB0YWIuCj4gPgo+ID4gVVNCIFBE
IHJlcXVpcmVzIFVTQi1DLgo+ID4gVVNCLUMgZG9lc24ndCByZXF1aXJlcyBVU0IgUEQuCj4gPgo+
ID4gZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BtLmMgYWxyZWFkeSB1c2VkIHR5cGVjX3B3cl9v
cG1vZGUgdmFsdWVzLgo+ID4KPiA+IFVTQiBQRCBzcGVjaWZpY2F0aW9uIFRhYmxlIDYtMTQgRml4
ZWQgU3VwcGx5IFBETyBzYXlzOgo+ID4gRmFzdCBSb2xlIFN3YXAgcmVxdWlyZWQgVVNCIFR5cGUt
QyBDdXJyZW50IChzZWUgYWxzbyBbVVNCIFR5cGUtQyAyLjBdKToKPiA+IFZhbHVlIHwgRGVzY3Jp
cHRpb24KPiA+ICAgMDBiICB8IEZhc3QgU3dhcCBub3Qgc3VwcG9ydGVkIChkZWZhdWx0KQo+ID4g
ICAwMWIgIHwgRGVmYXVsdCBVU0IgUG93ZXIKPiA+ICAgMTBiICB8IDEuNUEgQCA1Vgo+ID4gICAx
MWIgIHwgMy4wQSBAIDVWCj4KPiBUaGlzIGlzIHRoZSB2YWx1ZSBpbiBQRE8gb2Ygc2luaywgdGhl
IEZSUyBwcm9wZXJ0eSB2YWx1ZShvciBhZnRlciB0cmFuc2xhdGVkKQo+IGFjdHVhbGx5IGlzIHVz
ZWQgdG8gY29tcGFyZSB3aXRoIGFib3ZlIHZhbHVlLgo+Cj4gU28gSSB0aGluayBib3RoIHByb3Bl
cnRpZXMgY2FuIHNoYXJlIHRoZSBzYW1lICJ2YWx1ZSIsIG1heWJlIHN0cmluZwo+IGxpa2UgYmVs
b3cKPgo+ICAgMTAgc3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCB0eXBlY19wd3Jfb3Btb2Rlc1td
ID0gewo+ICAgMTEgICAgICAgICBbVFlQRUNfUFdSX01PREVfVVNCXSAgICA9ICJkZWZhdWx0IiwK
PiAgIDEyICAgICAgICAgW1RZUEVDX1BXUl9NT0RFXzFfNUFdICAgPSAiMS41QSIsCj4gICAxMyAg
ICAgICAgIFtUWVBFQ19QV1JfTU9ERV8zXzBBXSAgID0gIjMuMEEiLAo+Cj4gPgo+ID4gTm90ZSB0
aGUgKnNlZSBhbHNvIFVTQiBUeXBlLUMgMi4wKi4KPiA+Cj4gPiBVU0IgVHlwZS1DIHNwZWNpZmlj
YXRpb24gNC42LjIuMSBVU0IgVHlwZS1DIEN1cnJlbnQgc2F5czoKPiA+IFRoZSBVU0IgVHlwZS1D
IGNvbm5lY3RvciB1c2VzIENDIHBpbnMgZm9yIGNvbmZpZ3VyYXRpb24gaW5jbHVkaW5nIGFuCj4g
PiBhYmlsaXR5IGZvciBhIFNvdXJjZSB0byBhZHZlcnRpc2UgdG8gaXRzIHBvcnQgcGFydG5lciAo
U2luaykgdGhlIGFtb3VudAo+ID4gb2YgY3VycmVudCBpdCBzaGFsbCBzdXBwbHk6Cj4gPiDigKIg
RGVmYXVsdCBpcyB0aGUgYXMtY29uZmlndXJlZCBmb3IgaGlnaC1wb3dlciBvcGVyYXRpb24gY3Vy
cmVudCB2YWx1ZSBhcwo+ID4gZGVmaW5lZCBieSB0aGUgVVNCIFNwZWNpZmljYXRpb24gKDUwMCBt
QSBmb3IgVVNCIDIuMCBwb3J0czsgOTAwIG1BIG9yCj4gPiAxLDUwMCBtQSBmb3IgVVNCIDMuMiBw
b3J0cyBpbiBzaW5nbGUtbGFuZSBvciBkdWFsLWxhbmUgb3BlcmF0aW9uLAo+ID4gcmVzcGVjdGl2
ZWx5KQo+ID4g4oCiIDEuNSBBCj4gPiDigKIgMy4wIEEKPiA+Cj4gPiA+IENhbiB3ZSBhbGlnbiB0
aGUgbmFtZXMgaW4gc29tZSB3YXk/IHBvd2VyLW9wbW9kZSBhbmQgZnJzLXNvdXJjZS1vcG1vZGUK
PiA+ID4gb3IgPz8KPgo+IGhvdyBhYm91dCB0eXBlYy1wb3dlci1vcG1vZGUgYW5kIGZycy1uZXct
c291cmNlLW9wbW9kZQoKU3VyZS4KCj4KPiA+ID4KPiA+Cj4gPiBJIGxldCBVU0IgUEQgc3BlY2lh
bGlzdHMgYW5zd2VyLgo+ID4KPiA+ICpmcnMqIHByb3BlcnR5IGZpdHMgd2l0aCBVU0IgUEQgc3Bl
Y2lmaWNhdGlvbiwgc28gd2l0aCBVU0IgUEQgcHJvdG9jb2wuCj4gPiAqcG93ZXItb3Btb2RlIGZp
dHMgd2l0aCBVU0IgVHlwZS1DIHNwZWNpZmljYXRpb24sIHNvIHdpdGggVVNCLUMgaGFyZHdhcmUK
PiA+IHN1cHBvcnQuCj4gPgo+ID4gPiBBcmUgdGhlc2UgMiBwcm9wZXJ0aWVzIG11dHVhbGx5IGV4
Y2x1c2l2ZT8KPgo+IEkgdGhpbmsgeWVzLgoKVGhpcyBzaG91bGQgd29yayB0byBleHByZXNzIHRo
YXQ6CgphbGxPZjoKICAtIG5vdDoKICAgICAgcmVxdWlyZWQ6CiAgICAgICAgLSB0eXBlYy1wb3dl
ci1vcG1vZGUKICAgICAgICAtIGZycy1uZXctc291cmNlLW9wbW9kZQoKUm9iCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
