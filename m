Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1F735BA4E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 08:51:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D682DC57B6F;
	Mon, 12 Apr 2021 06:50:59 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A85C8C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 06:50:57 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id j26so12330418iog.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Apr 2021 23:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vTiwfWDOHL0R66lm8M4vbR6GCdZy+DYNlhfLSATExuk=;
 b=GJzbzibedz+7aY9jZN6YF4quPTvBPMyZUx1znx7VsIVcfIcVRzZS/MP/kSXCKKDwx0
 FThm7lqBMMXqBaDIytRbt2QCabN1XcUHOE3ObdJ/Rbk+ROh8JIOUlkDfQDeLseHoNfEu
 SCZOQo2ZWrQFZb7RiIYMbSHQS0Xcg8QDji8/UzZEKfFGCvIuBFwzBZFJM1DBkNl0QEco
 qO3g8hgm+5s0KBDYniLFGJ62I/ryN9VgBLeCEQ9V/aoNEX2dIN3P8LL6xRvaM8QolBGi
 MeK2KdH01VCnnSiA/YaTei4xHpydDlmFyXH7Qjzo8iNjmA843N95RpdaSzKy5NMkSVd9
 LhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vTiwfWDOHL0R66lm8M4vbR6GCdZy+DYNlhfLSATExuk=;
 b=WcTFB/ARaN8rtvzOKRPoLPVFdYMdGKlCqzS0h9SISFsl+OaoW+G4g+CY3QYrrp1LxD
 dr+h50PdTzNzkiMwV+Go9BJ8u0vhjLzwTAGmpblSxgHYROYY22fyYYbBVUkra0T6gu5d
 WV/b/g83BT1ZvgkLj8QMPljxFHDEVJEh9SPeagZRXkyp4P4pI4uDA1QmeDCx4rwvSlZn
 BSwztY3SCUdsMi/iHKn0Y6420rx2hCj3RToQ/h8DxCAyt+hZvjBXWlSZe15+eArYg/3S
 HG8bWoeRiq/0qiDqmulYEt50hFM996xo3k6C8ZhclwNUyeJa6+RhUt56e9AG9dVUNdYt
 NgCw==
X-Gm-Message-State: AOAM532Ku3RXT7s5p98Ti0vi7rqvzrR9GHR+vCgPCTnOh4v0TZptGR1W
 UwUcKyOayelVMhyUaM4PtS/IiGBwdHEAWe/psL8=
X-Google-Smtp-Source: ABdhPJxlyRnpoW02tNdPtMyBwwWqJdEg+3sjQ9g7WBfcw7TH5Nf8/eBNmWPLcWbE3pzHxE9OzUBoKpiSB+Z47zRnNDk=
X-Received: by 2002:a05:6638:d47:: with SMTP id
 d7mr26785946jak.2.1618210256515; 
 Sun, 11 Apr 2021 23:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
 <YHPgGI6EmTzmVH7g@kroah.com>
In-Reply-To: <YHPgGI6EmTzmVH7g@kroah.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 12 Apr 2021 14:50:20 +0800
Message-ID: <CAL9mu0Lt-3_O7V5HLxd5Hbt9afx9ryBUzWqmsc+2n3SP7JS6ig@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, jirislaby@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] serial: stm32: optimize spin lock usage
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

SGkgR3JlZ++8jAoKVGhhbmtzIGZvciB0aGUgcXVpY2sgcmVzcG9uc2UsIHBsZWFzZSBpZ25vcmUg
dGhlIGxhc3QgcHJpdmF0ZSBtYWlsLgoKT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgMTo1MiBQTSBH
cmVnIEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEFw
ciAxMiwgMjAyMSBhdCAxMjozNDoyMVBNICswODAwLCBkaWxsb24ubWluZmVpQGdtYWlsLmNvbSB3
cm90ZToKPiA+IEZyb206IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+ID4K
PiA+IFRvIGF2b2lkIHBvdGVudGlhbCBkZWFkbG9jayBpbiBzcGluX2xvY2sgdXNhZ2UsIGNoYW5n
ZSB0byB1c2UKPiA+IHNwaW5fbG9ja19pcnFzYXZlKCksIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
KSBpbiBwcm9jZXNzKHRocmVhZF9mbikgY29udGV4dC4KPiA+IHNwaW5fbG9jaygpLCBzcGluX3Vu
bG9jaygpIHVuZGVyIGhhbmRsZXIgY29udGV4dC4KPiA+Cj4gPiByZW1vdmUgdW51c2VkIGxvY2Fs
X2lycV9zYXZlL3Jlc3RvcmUgY2FsbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBkaWxsb24gbWlu
IDxkaWxsb24ubWluZmVpQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gV2FzIHZlcmlmaWVkIG9uIHN0
bTMyZjQ2OS1kaXNjbyBib2FyZC4gbmVlZCBtb3JlIHRlc3Qgb24gc3RtMzJtcCBwbGF0Zm9ybS4K
PiA+Cj4gPiAgZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgfCAyNyArKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9z
dG0zMi11c2FydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKPiA+IGluZGV4
IGIzNjc1Y2YyNWE2OS4uYzRjODU5YjM0MzY3IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy90dHkv
c2VyaWFsL3N0bTMyLXVzYXJ0LmMKPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11
c2FydC5jCj4gPiBAQCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X3Jl
Y2VpdmVfY2hhcnMoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgYm9vbCB0aHJlYWRlZCkKPiA+ICAg
ICAgIHN0cnVjdCB0dHlfcG9ydCAqdHBvcnQgPSAmcG9ydC0+c3RhdGUtPnBvcnQ7Cj4gPiAgICAg
ICBzdHJ1Y3Qgc3RtMzJfcG9ydCAqc3RtMzJfcG9ydCA9IHRvX3N0bTMyX3BvcnQocG9ydCk7Cj4g
PiAgICAgICBjb25zdCBzdHJ1Y3Qgc3RtMzJfdXNhcnRfb2Zmc2V0cyAqb2ZzID0gJnN0bTMyX3Bv
cnQtPmluZm8tPm9mczsKPiA+IC0gICAgIHVuc2lnbmVkIGxvbmcgYzsKPiA+ICsgICAgIHVuc2ln
bmVkIGxvbmcgYywgZmxhZ3M7Cj4gPiAgICAgICB1MzIgc3I7Cj4gPiAgICAgICBjaGFyIGZsYWc7
Cj4gPgo+ID4gQEAgLTI3Niw5ICsyNzYsMTcgQEAgc3RhdGljIHZvaWQgc3RtMzJfdXNhcnRfcmVj
ZWl2ZV9jaGFycyhzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCBib29sIHRocmVhZGVkKQo+ID4gICAg
ICAgICAgICAgICB1YXJ0X2luc2VydF9jaGFyKHBvcnQsIHNyLCBVU0FSVF9TUl9PUkUsIGMsIGZs
YWcpOwo+ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIHNwaW5fdW5sb2NrKCZwb3J0LT5sb2NrKTsK
PiA+ICsgICAgIGlmICh0aHJlYWRlZCkKPiA+ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmcG9ydC0+bG9jaywgZmxhZ3MpOwo+ID4gKyAgICAgZWxzZQo+ID4gKyAgICAgICAg
ICAgICBzcGluX3VubG9jaygmcG9ydC0+bG9jayk7Cj4KPiBZb3Ugc2hvdWxkbid0IGhhdmUgdG8g
Y2hlY2sgZm9yIHRoaXMsIHNlZSB0aGUgb3RoZXIgcGF0Y2hlcyBvbiB0aGUgbGlzdAo+IHJlY2Vu
dGx5IHRoYXQgZml4ZWQgdGhpcyB1cCB0byBub3QgYmUgYW4gaXNzdWUgZm9yIGlycSBoYW5kbGVy
cy4KQ2FuIHlvdSBoZWxwIHRvIGdpdmUgbW9yZSBoaW50cywgb3IgdGhlIGNvbW1pdCBpZCBvZiB0
aGUgcGF0Y2ggd2hpY2gKZml4ZWQgdGhpcy4gdGhhbmtzLgoKSSdtIHN0aWxsIGNvbmZ1c2VkIHdp
dGggdGhpcy4KClRoZSBzdG0zMl91c2FydF90aHJlYWRlZF9pbnRlcnJ1cHQoKSBpcyBhIGt0aHJl
YWQgY29udGV4dCwgb25jZQpwb3J0LT5sb2NrIGhvbGRzIGJ5IHRoaXMgZnVuY3Rpb24sIGFub3Ro
ZXIgc2VyaWFsIGludGVycnVwdHMgcmFpc2VkLApzdWNoIGFzIFVTQVJUX1NSX1RYRSxzdG0zMl91
c2FydF9pbnRlcnJ1cHQoKSBjYW4ndCBnZXQgdGhlIGxvY2ssCnRoZXJlIHdpbGwgYmUgYSBkZWFk
bG9jay4gaXNuJ3QgaXQ/CgogU28sIHNob3VsZG4ndCBJIHVzZSBzcGluX2xvY2t7X2lycXNhdmV9
IGFjY29yZGluZyB0byB0aGUgY2FsbGVyJ3MgY29udGV4dCA/CgpUaGVyZSBpcyBhIGJ1ZyBpbiB0
aGlzIHBhdGNoLCB0aGUgdmFyaWFibGUgZmxhZ3Mgc2hvdWxkIGJlIGEgZ2xvYmFsIHZhcmlhYmxl
LgoKVGhhbmtzLgoKRGlsbG9uLAo+Cj4gdGhhbmtzLAo+Cj4gZ3JlZyBrLWgKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
