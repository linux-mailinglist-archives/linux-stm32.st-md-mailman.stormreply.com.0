Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB227566B
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Sep 2020 12:33:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128DBC3FADE;
	Wed, 23 Sep 2020 10:33:40 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFFD6C3FAD5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 10:33:38 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id o64so1021411uao.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Sep 2020 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/bBg3FhjP2lS/XUPeXQfiiwRoIzXoU/haAfZ553jXao=;
 b=DZsx62nN9d0HnGxwSaz3Q+J+ewBed0xSr6gDmdhUt8G4dnuvUX1Fe9R4x/yjUxNGQL
 47yPw8Fxn1atB+qP/C2aR+S+sz0b59HeVlXejXZXPqIbqZcHNohSRoIT5ZFTp3KDnb+r
 35JgzHhLIOfhwr9OsVslUtpggxJZ0+lzE5Eo46Njr0L4DDrVjD77dYXypPVz3S6xqcwa
 mQqWmXlhgdlNeMHf1lrMUOwDBoPgNqXfziD1rPxhoyvQca/qe/KYP9+CtzvcS1g9n0Ax
 QS0mnrkgfS+c7Z3KJLqR3yIUAXv+kcFSAbHvyGJ6gGtyQqi1f7dn43vNy8nZZwT35shB
 QomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/bBg3FhjP2lS/XUPeXQfiiwRoIzXoU/haAfZ553jXao=;
 b=e2ZiutL7sGRUwQzN/6HGFj4Qx+G3l+8DLIs1ecZvBNaYFsTrBiJwFMh9OBOqqYcQxz
 iTsUIvx8AAv1VpMTNhe+SQTz+xgqim5ZlzbG6uVdolGkuhxwsFxNLoDVvnEYNKgCXUWe
 vYNV+lIK4MJjz7vCNKFeHxhfuO1D1r8pGZDtGp7J2G6Qsp/qo/s6UK9CeB94mP+smwaZ
 +wRg7n3SA2aAGkqf9yLtMmczLpdwLJPCTTVXKAOTjj2GcDD+LGdRqDPMCVdNzlW8/gae
 ObTAE0REWGAovbd24MxWLKaCXtt7D/OD0LJFASRbH2yUz1j+lnmcK40ji6YCesrYGSRI
 ePvA==
X-Gm-Message-State: AOAM532AgxfRJbF9uf5aQpnQ5yMEH2EaVKPCMb3ig2e27snOOzFzU94G
 bh0HiXmKUVNnx01DmXxnc314abGgZ7AdZwx33JY=
X-Google-Smtp-Source: ABdhPJzVji5FHfi5sp07esYPfgiV5ohcWhR4VJ8CJipPI1S1QLhWtPKL65fR4ciPeVtnJUkSScw1TU/Okfb7eapcfpk=
X-Received: by 2002:ab0:6f91:: with SMTP id f17mr5705707uav.129.1600857217627; 
 Wed, 23 Sep 2020 03:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200902075707.9052-1-amelie.delaunay@st.com>
 <20200902075707.9052-2-amelie.delaunay@st.com>
 <CAKgpwJWPWFF_yWC0N_7qPONpWCN8U8tKVJ5Ctr1DGqXd_FyWkA@mail.gmail.com>
 <31ee8d7c-00b0-0ae1-eea1-e245f215c586@st.com>
In-Reply-To: <31ee8d7c-00b0-0ae1-eea1-e245f215c586@st.com>
From: Jun Li <lijun.kernel@gmail.com>
Date: Wed, 23 Sep 2020 18:33:26 +0800
Message-ID: <CAKgpwJUikcsbYz6Uy-iQsXgpDpBzJDpxTretYSfubfEJ7X5yWg@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 1/6] dt-bindings: connector: add
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

QW1lbGllIERFTEFVTkFZIDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPiDkuo4yMDIw5bm0OeaciDIz
5pel5ZGo5LiJIOS4i+WNiDU6MzHlhpnpgZPvvJoKPgo+Cj4KPiBPbiA5LzIzLzIwIDExOjA4IEFN
LCBKdW4gTGkgd3JvdGU6Cj4gPiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxhdW5heUBzdC5j
b20+IOS6jjIwMjDlubQ55pyIMuaXpeWRqOS4iSDkuIvljYg0OjAx5YaZ6YGT77yaCj4gPj4KPiA+
PiBQb3dlciBvcGVyYXRpb24gbW9kZSBtYXkgZGVwZW5kcyBvbiBoYXJkd2FyZSBkZXNpZ24sIHNv
LCBhZGQgdGhlIG9wdGlvbmFsCj4gPj4gcHJvcGVydHkgcG93ZXItb3Btb2RlIGZvciB1c2ItYyBj
b25uZWN0b3IgdG8gc2VsZWN0IHRoZSBwb3dlciBvcGVyYXRpb24KPiA+PiBtb2RlIGNhcGFiaWxp
dHkuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbWVsaWUgRGVsYXVuYXkgPGFtZWxpZS5kZWxh
dW5heUBzdC5jb20+Cj4gPj4gLS0tCj4gPj4gQ2hhbmdlcyBpbiB2MjoKPiA+PiAtIEFkZCBkZXNj
cmlwdGlvbiBmb3IgcG9zc2libGUgb3BlcmF0aW9uIGN1cnJlbnQgdmFsdWVzCj4gPj4gLS0tCj4g
Pj4gICAuLi4vYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbCAgICAgfCAyMCAr
KysrKysrKysrKysrKysrKysrCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwKPiA+PiBpbmRleCA5YmQ1MmU2
M2M5MzUuLjJmZDg1YjlhN2UxYSAxMDA2NDQKPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+ID4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNiLWNvbm5lY3Rvci55
YW1sCj4gPj4gQEAgLTg4LDYgKzg4LDI2IEBAIHByb3BlcnRpZXM6Cj4gPj4gICAgICAgICAtIGRl
dmljZQo+ID4+ICAgICAgICAgLSBkdWFsCj4gPj4KPiA+PiArICBwb3dlci1vcG1vZGU6Cj4gPj4g
KyAgICBkZXNjcmlwdGlvbjogRGV0ZXJtaW5lcyB0aGUgcG93ZXIgb3BlcmF0aW9uIG1vZGUgdGhh
dCB0aGUgVHlwZSBDIGNvbm5lY3Rvcgo+ID4+ICsgICAgICB3aWxsIHN1cHBvcnQgYW5kIHdpbGwg
YWR2ZXJ0aXNlIHRocm91Z2ggQ0MgcGlucy4KPiA+PiArICAgICAgLSAiZGVmYXVsdCIgY29ycmVz
cG9uZHMgdG8gZGVmYXVsdCBVU0Igdm9sdGFnZSBhbmQgY3VycmVudCBkZWZpbmVkIGJ5IHRoZQo+
ID4+ICsgICAgICAgIFVTQiAyLjAgYW5kIFVTQiAzLjIgc3BlY2lmaWNhdGlvbnMsIDVWIDUwMG1B
IGZvciBVU0IgMi4wIHBvcnRzIGFuZAo+ID4+ICsgICAgICAgIDVWIDkwMG1BIG9yIDE1MDBtQSBm
b3IgVVNCIDMuMiBwb3J0cyBpbiBzaW5nbGUtbGFuZSBvciBkdWFsLWxhbmUKPiA+PiArICAgICAg
ICBvcGVyYXRpb24gcmVzcGVjdGl2ZWx5Lgo+ID4+ICsgICAgICAtICIxLjVBIiBhbmQgIjMuMEEi
LCA1ViAxLjVBIGFuZCA1ViAzLjBBIHJlc3BlY3RpdmVseSwgYXMgZGVmaW5lZCBpbiBVU0IKPiA+
PiArICAgICAgICBUeXBlLUMgQ2FibGUgYW5kIENvbm5lY3RvciBzcGVjaWZpY2F0aW9uLCB3aGVu
IFBvd2VyIERlbGl2ZXJ5IGlzIG5vdAo+ID4+ICsgICAgICAgIHN1cHBvcnRlZC4KPiA+PiArICAg
ICAgLSAidXNiX3Bvd2VyX2RlbGl2ZXJ5IiB3aGVuIFBvd2VyIERlbGl2ZXJ5IGlzIHN1cHBvcnRl
ZCwgYXMgZGVmaW5lZCBpbgo+ID4+ICsgICAgICAgIFVTQiBQb3dlciBEZWxpdmVyeSBzcGVjaWZp
Y2F0aW9uLgo+ID4KPiA+IFdoeSBuZWVkICJ1c2JfcG93ZXJfZGVsaXZlcnkiPyBpc24ndCB0aGlz
IGluZm9ybWF0aW9uIGNhbiBiZSBpbXBsaWVkIGJ5Cj4gPiBleGlzdGluZyBwcm9wZXJ0aWVzIGxp
a2UgaWYgInNvdXJjZS1wZG9zIiBpcyBwcmVzZW50Pwo+ID4KPgo+IHBvd2VyLW9wbW9kZSBpcyBh
biBvcHRpb25hbCBwcm9wZXJ0eS4KPiB1c2JfcG93ZXJfZGVsaXZlcnksIGFzIDMuMEEsIDEuNUEg
b3IgZGVmYXVsdCBoZXJlLCBvbmx5IHJlZmxlY3QgdGhlCj4gcG9zc2libGUgcG93ZXIgb3BlcmF0
aW9uIG1vZGUgeW91IGNhbiBzZXQgYW5kIHRoYXQgYXJlIHVuZGVyc3Rvb2QgYnkKPiB0eXBlYyBj
bGFzczoKPiBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHR5cGVjX3B3cl9vcG1vZGVzW10gPSB7
Cj4gICAgICAgICBbVFlQRUNfUFdSX01PREVfVVNCXSAgICA9ICJkZWZhdWx0IiwKPiAgICAgICAg
IFtUWVBFQ19QV1JfTU9ERV8xXzVBXSAgID0gIjEuNUEiLAo+ICAgICAgICAgW1RZUEVDX1BXUl9N
T0RFXzNfMEFdICAgPSAiMy4wQSIsCj4gICAgICAgICBbVFlQRUNfUFdSX01PREVfUERdICAgICA9
ICJ1c2JfcG93ZXJfZGVsaXZlcnkiLAo+IH07Cj4KPiBCdXQgSSBndWVzcyB0aGF0IGEgVHlwZS1D
IGNvbnRyb2xsZXIgd2l0aCB1c2IgcG93ZXIgZGVsaXZlcnkgc3VwcG9ydAo+IHdvbid0IHVzZSBw
b3dlci1vcG1vZGUgcHJvcGVydHkgYnV0IHJhdGhlciBzb3VyY2Uvc2luay1wZG9zLgo+Cj4gcG93
ZXItb3Btb2RlIHNob3dzIHdoYXQgd2lsbCBiZSBhZHZlcnRpc2VkIHRocm91Z2ggQ0MgcGlucy4g
SSBjYW4gcmVtb3ZlCj4gdXNiX3Bvd2VyX2RlbGl2ZXJ5IGZyb20gdGhlIHBvc3NpYmxlIHZhbHVl
cywgYnV0IHdoYXQgYWJvdXQgdGhlIHVzZXIgd2hvCj4gd2lsbCBhZGQgcG93ZXItb3Btb2RlIHBy
b3BlcnR5IHRvIGNvbmZpZ3VyZSBoaXMgVHlwZS1DIGNvbnRyb2xsZXIgd2l0aAo+IFVTQiBwb3dl
ciBkZWxpdmVyeSBzdXBwb3J0IChzaW5rIGFuZC9vciBzb3VyY2UgYnkgdGhlIHdheSkgPwoKV2l0
aCBwb3dlciBkZWxpdmVyeSBzdXBwb3J0LCB0aGlzIGluZm9ybWF0aW9uIHNob3VsZCBiZSBhYnN0
cmFjdGVkIGZyb20Kc291cmNlLXBkb3MuCgo+IFNob3VsZCBJIHJlc3RyaWN0IHRoZSB1c2Ugb2Yg
cG93ZXItb3Btb2RlIHRvIG5vbi1VU0IgcG93ZXIgZGVsaXZlcnkKPiBUeXBlLUMgY29udHJvbGxl
cnMgPwoKSSB0aGluayBZZXMuIG9ubHkgbmVlZCBpdCBmb3Igbm9uLVBEKHBvd2VyIHNvdXJjZS9E
UlApLgoKTGkgSnVuCj4gUGxlYXNlIGFkdmlzZS4KPgo+IFJlZ2FyZHMsCj4gQW1lbGllCj4KPgo+
ID4gTGkgSnVuCj4gPj4gKyAgICBhbGxPZjoKPiA+PiArICAgICAgLSAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sI2RlZmluaXRpb25zL3N0cmluZwo+ID4+ICsgICAgZW51bToKPiA+PiArICAgICAg
LSBkZWZhdWx0Cj4gPj4gKyAgICAgIC0gMS41QQo+ID4+ICsgICAgICAtIDMuMEEKPiA+PiArICAg
ICAgLSB1c2JfcG93ZXJfZGVsaXZlcnkKPiA+PiArCj4gPj4gICAgICMgVGhlIGZvbGxvd2luZyBh
cmUgb3B0aW9uYWwgcHJvcGVydGllcyBmb3IgInVzYi1jLWNvbm5lY3RvciIgd2l0aCBwb3dlcgo+
ID4+ICAgICAjIGRlbGl2ZXJ5IHN1cHBvcnQuCj4gPj4gICAgIHNvdXJjZS1wZG9zOgo+ID4+IC0t
Cj4gPj4gMi4xNy4xCj4gPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
