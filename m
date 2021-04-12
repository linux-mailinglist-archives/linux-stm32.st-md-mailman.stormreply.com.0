Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E36CB35C7D8
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Apr 2021 15:41:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99C51C57B79;
	Mon, 12 Apr 2021 13:41:57 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB3ADC57B76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 13:41:55 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id s16so8213413iog.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Apr 2021 06:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pv38UteoXPGc9YXROMqdyiZjnIKpHuvd+rCQ+sbZeWw=;
 b=IgnsvOg1yc+DKw8WBbPTuGFqtyCK45AVOGjp7CUdDarvXkIV1poSdV+eQLDgcHxDX8
 Kvz4nv3sE9Z8txCaFm6Ndroo5pPbrpSZsoCqj2eEK9gSs7icFybeHwkXzqyI5Kw9fV+x
 RK4S1ye3TnixqXv22X/w+CYQrVM4THdn1vMNtmM7f+kM57up82nKNlzola6F5LqheT0S
 S1G8hqz0525+dQX7t/7F5/MXkGv97BZHCe0PRHQ64R9yIBNWdxVVS0k+W6yafbdYiDQO
 SHpxtq+Lj3tVf8KW0UK2n/wGNiEj3SltZUBkx5v9nuQCIhU5HNQQa4aIbbH6vu3xEM3z
 OYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pv38UteoXPGc9YXROMqdyiZjnIKpHuvd+rCQ+sbZeWw=;
 b=Al3PwGKj5iIW48KQ+XTaT2HhYmjB/ade9MnUfTE2zpDazitgeEHuJcTczTCF7ts3aL
 D4rQcsdJxLm6bY4TtlXMkdR7OxPOk3y9qbb42pis0+0LsJiYQtXLGa4i3drksZxkoihY
 QErKi/xVM2sHC4lUeJR0W3P8ROzVAjlSj4awqUXxgxm8PUCTgi8BrejwZwaXO+IDpXy5
 Qvf12XyYMe6cZMMlllLHl7HOgS82tM5cGls+0DGES6ORkfuSSH5SiIFK9nPLNLh+E/vM
 /PXsoKwLnTAKKHzu/UWWX1hLmE+bzPnVgO26T8sAZAQX3872+epv1lvkNzk9SMGgWSTP
 tcGQ==
X-Gm-Message-State: AOAM530UoEWmcYW50Kcr7tBwWf6B5UBOUxzeRNFGNycz0MiET2o0W+uk
 +9Y4JTWYpcnSurnsVgMJ5NmD7IJ6SoOqyULViWQ=
X-Google-Smtp-Source: ABdhPJyIRqHuaDnOp8+loeCg8vnJNjHw72xLypbdBBrx8vI6+21/qEwTHah2Nclx/TaTP2h1BcpOzUH+VGmoo5YxRzQ=
X-Received: by 2002:a02:818b:: with SMTP id n11mr4899093jag.62.1618234913716; 
 Mon, 12 Apr 2021 06:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:8a0e:0:0:0:0:0 with HTTP; Mon, 12 Apr 2021 06:41:53
 -0700 (PDT)
In-Reply-To: <f3985d70-4f00-7442-de4e-e382b19e3e50@foss.st.com>
References: <1618202061-8243-1-git-send-email-dillon.minfei@gmail.com>
 <YHPgGI6EmTzmVH7g@kroah.com>
 <CAL9mu0Lt-3_O7V5HLxd5Hbt9afx9ryBUzWqmsc+2n3SP7JS6ig@mail.gmail.com>
 <YHQEA9jn5uXQCtrN@kroah.com>
 <CAL9mu0+hi5eYEder1Mj2yjUN+eicJ9qG8Kr4GTC2mqfY405Jkg@mail.gmail.com>
 <f3985d70-4f00-7442-de4e-e382b19e3e50@foss.st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 12 Apr 2021 21:41:53 +0800
Message-ID: <CAL9mu0LnxD69Y2F_TK_b+N5QhMS6bjz6YU-zJdscY75S3jj8qQ@mail.gmail.com>
To: Erwan LE RAY <erwan.leray@foss.st.com>
Cc: linux-serial@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
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

T24gNC8xMi8yMSwgRXJ3YW4gTEUgUkFZIDxlcndhbi5sZXJheUBmb3NzLnN0LmNvbT4gd3JvdGU6
Cj4gSGkgRGlsbG9uLAo+Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLgo+Cj4gQ291bGQgeW91IHBs
ZWFzZSBlbGFib3JhdGUgdGhlIHVzZSBjYXNlIGluIHlvdXIgY29tbWl0IG1lc3NhZ2UgPwoKU29y
cnksIGxvY2FsX2lycV9zYXZlKCkgcGx1cyBzcGluX2xvY2soKSBzYW1lIHRvIHNwaW5fbG9ja19p
cnFzYXZlKCkKVGhlcmUgaXMgbm8gZGVhZGxvY2sgLiBQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2gu
CgpUaGFua3MKCkRpbGxvbgo+Cj4gQmVzdCBSZWdhcmRzLCBFcndhbi4KPgo+IE9uIDQvMTIvMjEg
MTA6NTQgQU0sIGRpbGxvbiBtaW4gd3JvdGU6Cj4+IEhpIEdyZWcsCj4+Cj4+IE9uIE1vbiwgQXBy
IDEyLCAyMDIxIGF0IDQ6MjUgUE0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
Cj4+IHdyb3RlOgo+Pj4KPj4+IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDAyOjUwOjIwUE0gKzA4
MDAsIGRpbGxvbiBtaW4gd3JvdGU6Cj4+Pj4gSGkgR3JlZ++8jAo+Pj4+Cj4+Pj4gVGhhbmtzIGZv
ciB0aGUgcXVpY2sgcmVzcG9uc2UsIHBsZWFzZSBpZ25vcmUgdGhlIGxhc3QgcHJpdmF0ZSBtYWls
Lgo+Pj4+Cj4+Pj4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgMTo1MiBQTSBHcmVnIEtIIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPj4+PiB3cm90ZToKPj4+Pj4KPj4+Pj4gT24gTW9uLCBB
cHIgMTIsIDIwMjEgYXQgMTI6MzQ6MjFQTSArMDgwMCwgZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20K
Pj4+Pj4gd3JvdGU6Cj4+Pj4+PiBGcm9tOiBkaWxsb24gbWluIDxkaWxsb24ubWluZmVpQGdtYWls
LmNvbT4KPj4+Pj4+Cj4+Pj4+PiBUbyBhdm9pZCBwb3RlbnRpYWwgZGVhZGxvY2sgaW4gc3Bpbl9s
b2NrIHVzYWdlLCBjaGFuZ2UgdG8gdXNlCj4+Pj4+PiBzcGluX2xvY2tfaXJxc2F2ZSgpLCBzcGlu
X3VubG9ja19pcnFyZXN0b3JlKCkgaW4gcHJvY2Vzcyh0aHJlYWRfZm4pCj4+Pj4+PiBjb250ZXh0
Lgo+Pj4+Pj4gc3Bpbl9sb2NrKCksIHNwaW5fdW5sb2NrKCkgdW5kZXIgaGFuZGxlciBjb250ZXh0
Lgo+Pj4+Pj4KPj4+Pj4+IHJlbW92ZSB1bnVzZWQgbG9jYWxfaXJxX3NhdmUvcmVzdG9yZSBjYWxs
Lgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlA
Z21haWwuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiBXYXMgdmVyaWZpZWQgb24gc3RtMzJmNDY5LWRp
c2NvIGJvYXJkLiBuZWVkIG1vcmUgdGVzdCBvbiBzdG0zMm1wCj4+Pj4+PiBwbGF0Zm9ybS4KPj4+
Pj4+Cj4+Pj4+PiAgIGRyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIHwgMjcgKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tCj4+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRp
b25zKCspLCAxMCBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKPj4+Pj4+IGIvZHJpdmVycy90dHkvc2VyaWFsL3N0
bTMyLXVzYXJ0LmMKPj4+Pj4+IGluZGV4IGIzNjc1Y2YyNWE2OS4uYzRjODU5YjM0MzY3IDEwMDY0
NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKPj4+Pj4+ICsr
KyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCj4+Pj4+PiBAQCAtMjE0LDcgKzIx
NCw3IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3VzYXJ0X3JlY2VpdmVfY2hhcnMoc3RydWN0Cj4+Pj4+
PiB1YXJ0X3BvcnQgKnBvcnQsIGJvb2wgdGhyZWFkZWQpCj4+Pj4+PiAgICAgICAgc3RydWN0IHR0
eV9wb3J0ICp0cG9ydCA9ICZwb3J0LT5zdGF0ZS0+cG9ydDsKPj4+Pj4+ICAgICAgICBzdHJ1Y3Qg
c3RtMzJfcG9ydCAqc3RtMzJfcG9ydCA9IHRvX3N0bTMyX3BvcnQocG9ydCk7Cj4+Pj4+PiAgICAg
ICAgY29uc3Qgc3RydWN0IHN0bTMyX3VzYXJ0X29mZnNldHMgKm9mcyA9Cj4+Pj4+PiAmc3RtMzJf
cG9ydC0+aW5mby0+b2ZzOwo+Pj4+Pj4gLSAgICAgdW5zaWduZWQgbG9uZyBjOwo+Pj4+Pj4gKyAg
ICAgdW5zaWduZWQgbG9uZyBjLCBmbGFnczsKPj4+Pj4+ICAgICAgICB1MzIgc3I7Cj4+Pj4+PiAg
ICAgICAgY2hhciBmbGFnOwo+Pj4+Pj4KPj4+Pj4+IEBAIC0yNzYsOSArMjc2LDE3IEBAIHN0YXRp
YyB2b2lkIHN0bTMyX3VzYXJ0X3JlY2VpdmVfY2hhcnMoc3RydWN0Cj4+Pj4+PiB1YXJ0X3BvcnQg
KnBvcnQsIGJvb2wgdGhyZWFkZWQpCj4+Pj4+PiAgICAgICAgICAgICAgICB1YXJ0X2luc2VydF9j
aGFyKHBvcnQsIHNyLCBVU0FSVF9TUl9PUkUsIGMsIGZsYWcpOwo+Pj4+Pj4gICAgICAgIH0KPj4+
Pj4+Cj4+Pj4+PiAtICAgICBzcGluX3VubG9jaygmcG9ydC0+bG9jayk7Cj4+Pj4+PiArICAgICBp
ZiAodGhyZWFkZWQpCj4+Pj4+PiArICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JnBvcnQtPmxvY2ssIGZsYWdzKTsKPj4+Pj4+ICsgICAgIGVsc2UKPj4+Pj4+ICsgICAgICAgICAg
ICAgc3Bpbl91bmxvY2soJnBvcnQtPmxvY2spOwo+Pj4+Pgo+Pj4+PiBZb3Ugc2hvdWxkbid0IGhh
dmUgdG8gY2hlY2sgZm9yIHRoaXMsIHNlZSB0aGUgb3RoZXIgcGF0Y2hlcyBvbiB0aGUKPj4+Pj4g
bGlzdAo+Pj4+PiByZWNlbnRseSB0aGF0IGZpeGVkIHRoaXMgdXAgdG8gbm90IGJlIGFuIGlzc3Vl
IGZvciBpcnEgaGFuZGxlcnMuCj4+Pj4gQ2FuIHlvdSBoZWxwIHRvIGdpdmUgbW9yZSBoaW50cywg
b3IgdGhlIGNvbW1pdCBpZCBvZiB0aGUgcGF0Y2ggd2hpY2gKPj4+PiBmaXhlZCB0aGlzLiB0aGFu
a3MuCj4+Pj4KPj4+PiBJJ20gc3RpbGwgY29uZnVzZWQgd2l0aCB0aGlzLgo+Pj4+Cj4+Pj4gVGhl
IHN0bTMyX3VzYXJ0X3RocmVhZGVkX2ludGVycnVwdCgpIGlzIGEga3RocmVhZCBjb250ZXh0LCBv
bmNlCj4+Pj4gcG9ydC0+bG9jayBob2xkcyBieSB0aGlzIGZ1bmN0aW9uLCBhbm90aGVyIHNlcmlh
bCBpbnRlcnJ1cHRzIHJhaXNlZCwKPj4+PiBzdWNoIGFzIFVTQVJUX1NSX1RYRSxzdG0zMl91c2Fy
dF9pbnRlcnJ1cHQoKSBjYW4ndCBnZXQgdGhlIGxvY2ssCj4+Pj4gdGhlcmUgd2lsbCBiZSBhIGRl
YWRsb2NrLiBpc24ndCBpdD8KPj4+Pgo+Pj4+ICAgU28sIHNob3VsZG4ndCBJIHVzZSBzcGluX2xv
Y2t7X2lycXNhdmV9IGFjY29yZGluZyB0byB0aGUgY2FsbGVyJ3MKPj4+PiBjb250ZXh0ID8KPj4+
Cj4+PiBQbGVhc2Ugc2VlIDgxZTIwNzNjMTc1YiAoImdlbmlycTogRGlzYWJsZSBpbnRlcnJ1cHRz
IGZvciBmb3JjZSB0aHJlYWRlZAo+Pj4gaGFuZGxlcnMiKSBmb3Igd2hlbiB0aHJlYWRlZCBpcnEg
aGFuZGxlcnMgaGF2ZSBpcnFzIGRpc2FibGVkLCBpc24ndCB0aGF0Cj4+PiB0aGUgY2FzZSB5b3Ug
YXJlIHRyeWluZyB0byAicHJvdGVjdCIgZnJvbSBoZXJlPwo+Pj4KPj4+IFdoeSBpcyB0aGUgInRo
cmVhZGVkIiBmbGFnIHVzZWQgYXQgYWxsPyAgVGhlIGRyaXZlciBzaG91bGQgbm90IGNhcmUuCj4+
Pgo+Pj4gQWxzbyBzZWUgOWJhZWRiN2JhZWRhICgic2VyaWFsOiBpbXg6IGRyb3Agd29ya2Fyb3Vu
ZCBmb3IgZm9yY2VkIGlycQo+Pj4gdGhyZWFkaW5nIikgaW4gbGludXgtbmV4dCBmb3IgYW4gZXhh
bXBsZSBvZiBob3cgdGhpcyB3YXMgZml4ZWQgdXAgaW4gYQo+Pj4gc2VyaWFsIGRyaXZlci4KPj4+
Cj4+PiBkb2VzIHRoYXQgaGVscD8KPj4+Cj4+IFllcywgaXQncyByZWFsbHkgaGVscGZ1bC4gYW5k
IDgxZTIwNzNjMTc1YiBzaG91bGQgYmUgaGlnaGxpZ2h0ZWQgaW4gYQo+PiBkb2MuCj4+IEluIG15
IHBhc3Qga25vd2xlZGdlLCB3ZSBzaG91bGQgY2FyZSBhYm91dCBoYXJkIGlycSAmIHRocmVhZF9m
biBsb2NrCj4+IGNvbmZsaWN0Lgo+PiBUaGlzIHBhdGNoIGhhcyB0b3RhbGx5IGF2b2lkZWQgcGF0
Y2hpbmcgY29kZSBpbiB0aGUgc2VwYXJhdGUgZHJpdmVyIHNpZGUuCj4+IHRoYW5rcy4KPj4KPj4g
SSB3aWxsIGp1c3Qga2VlcCB0aGUgY2hhbmdlcyBpbiBzdG0zMl91c2FydF9jb25zb2xlX3dyaXRl
KCksIHJlbW92ZQo+PiB0aGVzZSBjb2RlIGluCj4+IHRocmVhZF9mbi4gdXBkYXRlIHZlcnNpb24g
MiBmb3IgeW91Lgo+Pgo+PiB0aGFua3MuCj4+Cj4+IERpbGxvbiwKPj4+IHRoYW5rcywKPj4+Cj4+
PiBncmVnIGstaAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+PiBMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKPj4gTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQo+PiBodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo+Pgo+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
