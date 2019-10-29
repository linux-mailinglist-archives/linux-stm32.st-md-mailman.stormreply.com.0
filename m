Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF9FE8881
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Oct 2019 13:43:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EE48C36B0B;
	Tue, 29 Oct 2019 12:43:28 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFA41C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 12:43:26 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id o49so19919814qta.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2019 05:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OMRxOWZpu1dr96++kRLkGqF4JG/vk7voGkpNSd1iKXw=;
 b=ozcm2IWkf2kNtuYCUjt+8ArvFK/2tKRtrBxPUJbunA7rPNlc0HxCY71sOWY0wV6yle
 VMaj+9CPSz7Yh+ObskBaZxF9CqEBImBFo4eqIbA/24KRyE8rBYcXoqKjRR4hwZ0qfPJO
 F0EaQVN+YNPh/tNG58mPvXtcqsJZiw7ZiYHf1FBOuACg8X8xJeJDCtMf8QuKRHKPg2c0
 uNVeP+ABNB3gsrrfXF8eQ2co4oiynkaswFhPcMWQMivdB92SNJhepyCg18vMBP7iW/DD
 8UYO8Qt3O9X5/xm/wHCkzkG+AmSkAdPwsvYNzEjD3JbgHgEwtq8TUO94E8rJy5ospivy
 pi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OMRxOWZpu1dr96++kRLkGqF4JG/vk7voGkpNSd1iKXw=;
 b=O0c57Ma0iPk2hCtBOTTithj53k/bdxY70wZlQ6f23/LV5YdqJgjE/rdMq24HbOTseK
 JZE9r2vyeuVUF8Ii65X2+PJA8gEcNkpcqIg4DMzs+5D3PYUk/T7bO/NGdR81DwFw8hud
 8dCFnodvmNZUbHQ9SyNQ4ldzwDxT9ka+c1Rsv90k/oxyDp/25V3ioDvlv1NcuaPYbl/z
 3dODR+4a8SkR03qDRU08Cu/htcXqvfMbl8xSj7UXrcdXZg0K7gRH9qlt06UXH6vd7ACf
 GGTJDDTuIBWemtG9ni2KC+eiP9J7OjcObVuSmUAI6v5IKLzfZOw0y3cS031z3pCzVbcy
 FFng==
X-Gm-Message-State: APjAAAWsUe56p1eTqwSF5HNHFwrs/ejtCLhQWHMeA0jVlKENJgbEs8n9
 arZYRh5Wdr8XjXRRxmFmeeS4npVIhKJpXv8o9W7Bhw==
X-Google-Smtp-Source: APXvYqzDWQWqlapgFtGMUJS/HwMqtmBfC0dOaSKIjA060RzLLknu6eGt8PRIEE29kq1TixIMsSkusE9tCw1vWzpaF9o=
X-Received: by 2002:ac8:cc3:: with SMTP id o3mr4052238qti.239.1572353005620;
 Tue, 29 Oct 2019 05:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20191015084139.8510-1-benjamin.gaignard@st.com>
In-Reply-To: <20191015084139.8510-1-benjamin.gaignard@st.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 29 Oct 2019 13:43:14 +0100
Message-ID: <CA+M3ks51SNOfM9YJFv8wkLDar0qvbwGQVzVwxEVP7T=bGeTcKw@mail.gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maz@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] arm: kernel: initialize broadcast hrtimer
 based clock event device
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

TGUgbWFyLiAxNSBvY3QuIDIwMTkgw6AgMTA6NDIsIEJlbmphbWluIEdhaWduYXJkCjxiZW5qYW1p
bi5nYWlnbmFyZEBzdC5jb20+IGEgw6ljcml0IDoKPgo+IE9uIHBsYXRmb3JtcyBpbXBsZW1lbnRp
bmcgQ1BVIHBvd2VyIG1hbmFnZW1lbnQsIHRoZSBDUFVpZGxlIHN1YnN5c3RlbQo+IGNhbiBhbGxv
dyBDUFVzIHRvIGVudGVyIGlkbGUgc3RhdGVzIHdoZXJlIGxvY2FsIHRpbWVycyBsb2dpYyBpcyBs
b3N0IG9uIHBvd2VyCj4gZG93bi4gVG8ga2VlcCB0aGUgc29mdHdhcmUgdGltZXJzIGZ1bmN0aW9u
YWwgdGhlIGtlcm5lbCByZWxpZXMgb24gYW4KPiBhbHdheXMtb24gYnJvYWRjYXN0IHRpbWVyIHRv
IGJlIHByZXNlbnQgaW4gdGhlIHBsYXRmb3JtIHRvIHJlbGF5IHRoZQo+IGludGVycnVwdCBzaWdu
YWxsaW5nIHRoZSB0aW1lciBleHBpcmllcy4KPgo+IEZvciBwbGF0Zm9ybXMgaW1wbGVtZW50aW5n
IENQVSBjb3JlIGdhdGluZyB0aGF0IGRvIG5vdCBpbXBsZW1lbnQgYW4gYWx3YXlzLW9uCj4gSFcg
dGltZXIgb3IgaW1wbGVtZW50IGl0IGluIGEgYnJva2VuIHdheSwgdGhpcyBwYXRjaCBhZGRzIGNv
ZGUgdG8gaW5pdGlhbGl6ZQo+IHRoZSBrZXJuZWwgaHJ0aW1lciBiYXNlZCBjbG9jayBldmVudCBk
ZXZpY2UgdXBvbiBib290ICh3aGljaCBjYW4gYmUgY2hvc2VuIGFzCj4gdGljayBicm9hZGNhc3Qg
ZGV2aWNlIGJ5IHRoZSBrZXJuZWwpLgo+IEl0IHJlbGllcyBvbiBhIGR5bmFtaWNhbGx5IGNob3Nl
biBDUFUgdG8gYmUgYWx3YXlzIHBvd2VyZWQtdXAuIFRoaXMgQ1BVIHRoZW4KPiByZWxheXMgdGhl
IHRpbWVyIGludGVycnVwdCB0byBDUFVzIGluIGRlZXAtaWRsZSBzdGF0ZXMgdGhyb3VnaCBpdHMg
SFcgbG9jYWwKPiB0aW1lciBkZXZpY2UuCj4KPiBIYXZpbmcgYSBDUFUgYWx3YXlzLW9uIGhhcyBp
bXBsaWNhdGlvbnMgb24gcG93ZXIgbWFuYWdlbWVudCBwbGF0Zm9ybQo+IGNhcGFiaWxpdGllcyBh
bmQgbWFrZXMgQ1BVaWRsZSBzdWJvcHRpbWFsLCBzaW5jZSBhdCBsZWFzdCBhIENQVSBpcyBrZXB0
Cj4gYWx3YXlzIGluIGEgc2hhbGxvdyBpZGxlIHN0YXRlIGJ5IHRoZSBrZXJuZWwgdG8gcmVsYXkg
dGltZXIgaW50ZXJydXB0cywKPiBidXQgYXQgbGVhc3QgbGVhdmVzIHRoZSBrZXJuZWwgd2l0aCBh
IGZ1bmN0aW9uYWwgc3lzdGVtIHdpdGggc29tZSB3b3JraW5nCj4gcG93ZXIgbWFuYWdlbWVudCBj
YXBhYmlsaXRpZXMuCj4KPiBUaGUgaHJ0aW1lciBiYXNlZCBjbG9jayBldmVudCBkZXZpY2UgaXMg
dW5jb25kaXRpb25hbGx5IHJlZ2lzdGVyZWQsIGJ1dAo+IGhhcyB0aGUgbG93ZXN0IHBvc3NpYmxl
IHJhdGluZyBzdWNoIHRoYXQgYW55IGJyb2FkY2FzdC1jYXBhYmxlIEhXIGNsb2NrCj4gZXZlbnQg
ZGV2aWNlIHByZXNlbnQgd2lsbCBiZSBjaG9zZW4gaW4gcHJlZmVyZW5jZSBhcyB0aGUgdGljayBi
cm9hZGNhc3QKPiBkZXZpY2UuCgpHZW50bGUgcGluZywKClRoYW5rcywKQmVuamFtaW4KPgo+IFNp
Z25lZC1vZmYtYnk6IEJlbmphbWluIEdhaWduYXJkIDxiZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+
Cj4gLS0tCj4gTm90ZToKPiAtIFRoZSBzYW1lIHJlYXNvbnMgbGVhZCB0byBzYW1lIHBhdGNoIHRo
YW4gZm9yIGFybTY0IHNvIEkgaGF2ZSBjb3B5IHRoZQo+ICAgY29tbWl0IG1lc3NhZ2UgZnJvbTog
OTM1OGQ3NTViZDVjICgiYXJtNjQ6IGtlcm5lbDogaW5pdGlhbGl6ZSBicm9hZGNhc3QKPiAgIGhy
dGltZXIgYmFzZWQgY2xvY2sgZXZlbnQgZGV2aWNlIikKPiAgYXJjaC9hcm0va2VybmVsL3RpbWUu
YyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvYXJtL2tlcm5lbC90aW1lLmMgYi9hcmNoL2FybS9rZXJuZWwvdGltZS5jCj4gaW5k
ZXggYjk5NmIyY2YwNzAzLi5kZGRjN2ViZjRkYjQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0va2Vy
bmVsL3RpbWUuYwo+ICsrKyBiL2FyY2gvYXJtL2tlcm5lbC90aW1lLmMKPiBAQCAtOSw2ICs5LDcg
QEAKPiAgICogIHJlYWRpbmcgdGhlIFJUQyBhdCBib290dXAsIGV0Yy4uLgo+ICAgKi8KPiAgI2lu
Y2x1ZGUgPGxpbnV4L2Nsay1wcm92aWRlci5oPgo+ICsjaW5jbHVkZSA8bGludXgvY2xvY2tjaGlw
cy5oPgo+ICAjaW5jbHVkZSA8bGludXgvY2xvY2tzb3VyY2UuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2Vycm5vLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiBAQCAtMTA3LDUgKzEwOCw2
IEBAIHZvaWQgX19pbml0IHRpbWVfaW5pdCh2b2lkKQo+ICAgICAgICAgICAgICAgICBvZl9jbGtf
aW5pdChOVUxMKTsKPiAgI2VuZGlmCj4gICAgICAgICAgICAgICAgIHRpbWVyX3Byb2JlKCk7Cj4g
KyAgICAgICAgICAgICAgIHRpY2tfc2V0dXBfaHJ0aW1lcl9icm9hZGNhc3QoKTsKPiAgICAgICAg
IH0KPiAgfQo+IC0tCj4gMi4xNS4wCj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKPiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
