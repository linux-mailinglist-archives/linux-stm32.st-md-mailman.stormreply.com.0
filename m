Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D481E35BDCE
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 10:55:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DCDAC57B6F;
	Mon, 12 Apr 2021 08:55:34 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2350AC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 08:55:31 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id d2so10322023ilm.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LVJ7S4AbhmW2SReC6yCWbpFaYmnw9XX646YZrZZaOV4=;
 b=XXv1K4Af5TNvlVNHsnj90rtwt0QnzPrSuI6dVY64A7rbxYfPyLgygUuiqCv8/6BwSm
 QlUNslEIJilecqhOo/ND35gDq/xvLCwgeRRwiXlAYKBgujOnIi1FvUG4DgBt63U/XnAx
 e8ae+YDHN0WOVTHusYIsilwc/pUPZTyb4usURljFnke7HMj3ntJ2MVgk3jVuj0uC/aql
 DIFQNe7IeJLgLrnXhicnVFNZEyAN0iJ9cqsrLEcAulozFjDpdsykjA6yJqZedZpQ+wNV
 q3RMyBO9WsUmowo8yaW51jk43/c3wBjDW3xjHHdcdlNEtbx1uGGRRoV9v4dluN+u6b70
 L9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LVJ7S4AbhmW2SReC6yCWbpFaYmnw9XX646YZrZZaOV4=;
 b=D2JSTNknAujEF3EN8btMz41B+jwerOX+v/V0AXsXeYByHBSR7NWC971NyjU9QJRDsq
 4zyc0FAm3gnC1XaJlax/+mXrTbwgN+Pl5r7FDfGjUoS4nRw2sYLkRJ2i1h7qetkLO55F
 Qxzs3Z2H6i2Mw7GIgjx6q6L+AxrkfUd/bE41NyaW51aH86kWDWv1yCla4ZW3XXCPubE8
 oY9adMkZVhKYC1b2kPnbJeSwyLUWU76q7VRjLkqap0KjZK/XFQJUfwfpe5CCqp6P4G5r
 wyB5kIiKctWkhhSIubLDGV8dJkxWEv73Ni2RJkJllwO1BzBAbIoazAhjwkKv02CiBQEA
 bvZA==
X-Gm-Message-State: AOAM532+JTlOCjQyi3Tboilx8TM97VsfBfNSjDIVvDeAw03w1Zlo1kvk
 5+Z8EUbbomnpXBTUEvgC3ScRYjZN8OSx05Uafsc=
X-Google-Smtp-Source: ABdhPJzjvOSunZ3GFXhIDH+A2PRnZqLNajx99SY0l5RG/yhcKdxlkzSHA9lRYJ9e5NtH04cZ5o0zwI0TNaSspvdTwrc=
X-Received: by 2002:a05:6e02:1526:: with SMTP id
 i6mr18857159ilu.270.1618217730575; 
 Mon, 12 Apr 2021 01:55:30 -0700 (PDT)
MIME-Version: 1.0
References: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
 <YHPgGI6EmTzmVH7g@kroah.com>
 <CAL9mu0Lt-3_O7V5HLxd5Hbt9afx9ryBUzWqmsc+2n3SP7JS6ig@mail.gmail.com>
 <YHQEA9jn5uXQCtrN@kroah.com>
In-Reply-To: <YHQEA9jn5uXQCtrN@kroah.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 12 Apr 2021 16:54:54 +0800
Message-ID: <CAL9mu0+hi5eYEder1Mj2yjUN+eicJ9qG8Kr4GTC2mqfY405Jkg@mail.gmail.com>
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

SGkgR3JlZywKCk9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDQ6MjUgUE0gR3JlZyBLSCA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQg
MDI6NTA6MjBQTSArMDgwMCwgZGlsbG9uIG1pbiB3cm90ZToKPiA+IEhpIEdyZWfvvIwKPiA+Cj4g
PiBUaGFua3MgZm9yIHRoZSBxdWljayByZXNwb25zZSwgcGxlYXNlIGlnbm9yZSB0aGUgbGFzdCBw
cml2YXRlIG1haWwuCj4gPgo+ID4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgMTo1MiBQTSBHcmVn
IEtIIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1v
biwgQXByIDEyLCAyMDIxIGF0IDEyOjM0OjIxUE0gKzA4MDAsIGRpbGxvbi5taW5mZWlAZ21haWwu
Y29tIHdyb3RlOgo+ID4gPiA+IEZyb206IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlAZ21haWwu
Y29tPgo+ID4gPiA+Cj4gPiA+ID4gVG8gYXZvaWQgcG90ZW50aWFsIGRlYWRsb2NrIGluIHNwaW5f
bG9jayB1c2FnZSwgY2hhbmdlIHRvIHVzZQo+ID4gPiA+IHNwaW5fbG9ja19pcnFzYXZlKCksIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoKSBpbiBwcm9jZXNzKHRocmVhZF9mbikgY29udGV4dC4KPiA+
ID4gPiBzcGluX2xvY2soKSwgc3Bpbl91bmxvY2soKSB1bmRlciBoYW5kbGVyIGNvbnRleHQuCj4g
PiA+ID4KPiA+ID4gPiByZW1vdmUgdW51c2VkIGxvY2FsX2lycV9zYXZlL3Jlc3RvcmUgY2FsbC4K
PiA+ID4gPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlA
Z21haWwuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+IFdhcyB2ZXJpZmllZCBvbiBzdG0zMmY0Njkt
ZGlzY28gYm9hcmQuIG5lZWQgbW9yZSB0ZXN0IG9uIHN0bTMybXAgcGxhdGZvcm0uCj4gPiA+ID4K
PiA+ID4gPiAgZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMgfCAyNyArKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0
LmMKPiA+ID4gPiBpbmRleCBiMzY3NWNmMjVhNjkuLmM0Yzg1OWIzNDM2NyAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4gPiA+ID4gQEAgLTIxNCw3ICsyMTQsNyBA
QCBzdGF0aWMgdm9pZCBzdG0zMl91c2FydF9yZWNlaXZlX2NoYXJzKHN0cnVjdCB1YXJ0X3BvcnQg
KnBvcnQsIGJvb2wgdGhyZWFkZWQpCj4gPiA+ID4gICAgICAgc3RydWN0IHR0eV9wb3J0ICp0cG9y
dCA9ICZwb3J0LT5zdGF0ZS0+cG9ydDsKPiA+ID4gPiAgICAgICBzdHJ1Y3Qgc3RtMzJfcG9ydCAq
c3RtMzJfcG9ydCA9IHRvX3N0bTMyX3BvcnQocG9ydCk7Cj4gPiA+ID4gICAgICAgY29uc3Qgc3Ry
dWN0IHN0bTMyX3VzYXJ0X29mZnNldHMgKm9mcyA9ICZzdG0zMl9wb3J0LT5pbmZvLT5vZnM7Cj4g
PiA+ID4gLSAgICAgdW5zaWduZWQgbG9uZyBjOwo+ID4gPiA+ICsgICAgIHVuc2lnbmVkIGxvbmcg
YywgZmxhZ3M7Cj4gPiA+ID4gICAgICAgdTMyIHNyOwo+ID4gPiA+ICAgICAgIGNoYXIgZmxhZzsK
PiA+ID4gPgo+ID4gPiA+IEBAIC0yNzYsOSArMjc2LDE3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3Vz
YXJ0X3JlY2VpdmVfY2hhcnMoc3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgYm9vbCB0aHJlYWRlZCkK
PiA+ID4gPiAgICAgICAgICAgICAgIHVhcnRfaW5zZXJ0X2NoYXIocG9ydCwgc3IsIFVTQVJUX1NS
X09SRSwgYywgZmxhZyk7Cj4gPiA+ID4gICAgICAgfQo+ID4gPiA+Cj4gPiA+ID4gLSAgICAgc3Bp
bl91bmxvY2soJnBvcnQtPmxvY2spOwo+ID4gPiA+ICsgICAgIGlmICh0aHJlYWRlZCkKPiA+ID4g
PiArICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnBvcnQtPmxvY2ssIGZsYWdz
KTsKPiA+ID4gPiArICAgICBlbHNlCj4gPiA+ID4gKyAgICAgICAgICAgICBzcGluX3VubG9jaygm
cG9ydC0+bG9jayk7Cj4gPiA+Cj4gPiA+IFlvdSBzaG91bGRuJ3QgaGF2ZSB0byBjaGVjayBmb3Ig
dGhpcywgc2VlIHRoZSBvdGhlciBwYXRjaGVzIG9uIHRoZSBsaXN0Cj4gPiA+IHJlY2VudGx5IHRo
YXQgZml4ZWQgdGhpcyB1cCB0byBub3QgYmUgYW4gaXNzdWUgZm9yIGlycSBoYW5kbGVycy4KPiA+
IENhbiB5b3UgaGVscCB0byBnaXZlIG1vcmUgaGludHMsIG9yIHRoZSBjb21taXQgaWQgb2YgdGhl
IHBhdGNoIHdoaWNoCj4gPiBmaXhlZCB0aGlzLiB0aGFua3MuCj4gPgo+ID4gSSdtIHN0aWxsIGNv
bmZ1c2VkIHdpdGggdGhpcy4KPiA+Cj4gPiBUaGUgc3RtMzJfdXNhcnRfdGhyZWFkZWRfaW50ZXJy
dXB0KCkgaXMgYSBrdGhyZWFkIGNvbnRleHQsIG9uY2UKPiA+IHBvcnQtPmxvY2sgaG9sZHMgYnkg
dGhpcyBmdW5jdGlvbiwgYW5vdGhlciBzZXJpYWwgaW50ZXJydXB0cyByYWlzZWQsCj4gPiBzdWNo
IGFzIFVTQVJUX1NSX1RYRSxzdG0zMl91c2FydF9pbnRlcnJ1cHQoKSBjYW4ndCBnZXQgdGhlIGxv
Y2ssCj4gPiB0aGVyZSB3aWxsIGJlIGEgZGVhZGxvY2suIGlzbid0IGl0Pwo+ID4KPiA+ICBTbywg
c2hvdWxkbid0IEkgdXNlIHNwaW5fbG9ja3tfaXJxc2F2ZX0gYWNjb3JkaW5nIHRvIHRoZSBjYWxs
ZXIncyBjb250ZXh0ID8KPgo+IFBsZWFzZSBzZWUgODFlMjA3M2MxNzViICgiZ2VuaXJxOiBEaXNh
YmxlIGludGVycnVwdHMgZm9yIGZvcmNlIHRocmVhZGVkCj4gaGFuZGxlcnMiKSBmb3Igd2hlbiB0
aHJlYWRlZCBpcnEgaGFuZGxlcnMgaGF2ZSBpcnFzIGRpc2FibGVkLCBpc24ndCB0aGF0Cj4gdGhl
IGNhc2UgeW91IGFyZSB0cnlpbmcgdG8gInByb3RlY3QiIGZyb20gaGVyZT8KPgo+IFdoeSBpcyB0
aGUgInRocmVhZGVkIiBmbGFnIHVzZWQgYXQgYWxsPyAgVGhlIGRyaXZlciBzaG91bGQgbm90IGNh
cmUuCj4KPiBBbHNvIHNlZSA5YmFlZGI3YmFlZGEgKCJzZXJpYWw6IGlteDogZHJvcCB3b3JrYXJv
dW5kIGZvciBmb3JjZWQgaXJxCj4gdGhyZWFkaW5nIikgaW4gbGludXgtbmV4dCBmb3IgYW4gZXhh
bXBsZSBvZiBob3cgdGhpcyB3YXMgZml4ZWQgdXAgaW4gYQo+IHNlcmlhbCBkcml2ZXIuCj4KPiBk
b2VzIHRoYXQgaGVscD8KPgpZZXMsIGl0J3MgcmVhbGx5IGhlbHBmdWwuIGFuZCA4MWUyMDczYzE3
NWIgc2hvdWxkIGJlIGhpZ2hsaWdodGVkIGluIGEgZG9jLgpJbiBteSBwYXN0IGtub3dsZWRnZSwg
d2Ugc2hvdWxkIGNhcmUgYWJvdXQgaGFyZCBpcnEgJiB0aHJlYWRfZm4gbG9jayBjb25mbGljdC4K
VGhpcyBwYXRjaCBoYXMgdG90YWxseSBhdm9pZGVkIHBhdGNoaW5nIGNvZGUgaW4gdGhlIHNlcGFy
YXRlIGRyaXZlciBzaWRlLgp0aGFua3MuCgpJIHdpbGwganVzdCBrZWVwIHRoZSBjaGFuZ2VzIGlu
IHN0bTMyX3VzYXJ0X2NvbnNvbGVfd3JpdGUoKSwgcmVtb3ZlCnRoZXNlIGNvZGUgaW4KdGhyZWFk
X2ZuLiB1cGRhdGUgdmVyc2lvbiAyIGZvciB5b3UuCgp0aGFua3MuCgpEaWxsb24sCj4gdGhhbmtz
LAo+Cj4gZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
