Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE211D347E
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2020 17:08:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02CFFC36B12;
	Thu, 14 May 2020 15:08:11 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04C16C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 15:08:09 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id x5so766593ioh.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2020 08:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Gbex69XR4ZtBuJoqVeoYUx9nyFHm1kZR6S5jk554FrE=;
 b=FJPRMdQokqht7U+y1ela4OESMPvwo+hnpZbq+e01yT4sc7YmX6KhRapTLoooJGnaer
 no8q5/+yTTtmbVYURRxBEfQhhZ9J+LhKOFz0bqgGBx4PJ2Bw2ftahjLfUzXNEEvP8ccI
 2pAP6Y2aYPKnolxMJQZEZL2TjJA9jwPSwcgeBX6VoDfVfbkeZdHE4f3iGkIRzsuBERI3
 b0XGSa3ns7gvk1VcwnfVu1eKrphDamt+YQi9Z3l0nVtOAJFrtU66CW6UaoIx+NrhyDWG
 bpqevwejD/G29RpG/FpMT46mNvKB9gZs0esEtTpKHnxOjUpQp/TrM51cnY7zblKAAa2T
 Tr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Gbex69XR4ZtBuJoqVeoYUx9nyFHm1kZR6S5jk554FrE=;
 b=SKOLHzz0gBtcL+ZiVfafvoD0rXz6+JqnxPnR4dxMZimsoSkk+06Gh3RNwBgdByiMQl
 2BQ/l449N5eSx/6M+bJnWjBlWpf1bmmPQADpuVJnvyCML9iF1WM8gsDIoktUtT0BP6Tt
 B5RHBiFMBjn/qxl8UOpQrKFJP34EuMxa4zkDD29LKi/e5sTCEPHJQhSWt3LSVPYxUqkM
 USlOKeJ05DUBYMa3SDRgq4wDui4DNnTugNpoKJsDMyKSOuTvcyJYwRPtT1i2poryUfPN
 AqWXw9eKN9SIYJtgacgpZTl+26vD9mzlSuvt3PcHipzxe07IxFUSZcFqwcnR7eLtxlzZ
 dCZg==
X-Gm-Message-State: AOAM532bKnI/JtcVcazlMYXM/pRN8mh/6OdLLgGit33e3XV3zw+YYXlG
 9hlnUSqAgR/A7448goxrzSymMoZgOZ3bmRwut/4=
X-Google-Smtp-Source: ABdhPJxG7GXTkoxbTPKumJL1X0BkUdzHfDr7LxNY1mkd2t1RPi+rTYGSq8vStSCW40203NqyVRJ+wEEs4doBgLVXPhg=
X-Received: by 2002:a5d:8b8e:: with SMTP id p14mr4506860iol.110.1589468887821; 
 Thu, 14 May 2020 08:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <1589269010-18472-1-git-send-email-dillon.minfei@gmail.com>
 <1589269010-18472-3-git-send-email-dillon.minfei@gmail.com>
 <da9fbb80-571d-1217-4028-e413a0c7db84@st.com>
In-Reply-To: <da9fbb80-571d-1217-4028-e413a0c7db84@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 14 May 2020 15:07:32 +0800
Message-ID: <CAL9mu0KJ0j6Rxf7YjKxVWKz_d+B6vrwqqxJM-fmzG=NonLeDYQ@mail.gmail.com>
To: Alexandre Torgue <alexandre.torgue@st.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Hua Dillon <dillonhua@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, p.zabel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] ARM: dts: stm32: enable l3gd20 on
	stm32429-disco board
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

SGkgQWxleGFuZHJlLAoKQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBzdC5jb20+
IOS6jjIwMjDlubQ15pyIMTTml6Xlkajlm5sg5LiL5Y2IMTA6MTDlhpnpgZPvvJoKPgo+IEhpIERp
bGxvbgo+Cj4gT24gNS8xMi8yMCA5OjM2IEFNLCBkaWxsb24ubWluZmVpQGdtYWlsLmNvbSB3cm90
ZToKPiA+IEZyb206IGRpbGxvbiBtaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+ID4KPiA+
IEwzZ2QyMCwgc3QgbWVtcyBtb3Rpb24gc2Vuc29yLCAzLWF4aXMgZGlnaXRhbCBvdXRwdXQgZ3ly
b3Njb3BlLAo+ID4gY29ubmVjdCB0byBzdG0zMmY0MjkgdmlhIHNwaTUKPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBkaWxsb24gbWluIDxkaWxsb24ubWluZmVpQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4K
PiA+IEhpIEFsZXhhbmRyZSwKPiA+Cj4gPiBWMjoKPiA+ICAgICAgMSwgaW5zZXJ0IGJsYW5rIGxp
bmUgYXQgc3RtMzJmNDIwLWRpc2NvLmR0cyBsaW5lIDE0Mwo+ID4gICAgICAyLCBhZGQgbW9yZSBk
ZXNjcmlwdGlvbiBhYm91dCBsM2dkMjAgaW4gY29tbWl0IG1lc3NhZ2UKPiA+Cj4gPiBWMToKPiA+
ICAgICAgZW5hYmxlIGwzZ2QyMCBkdHMgYmluZGluZyBvbiBzdG0zMmY0MjktZGlzY28KPiA+Cj4g
PiB0aGFua3MuCj4gPgo+ID4gZGlsbG9uLAo+ID4KPiA+ICAgYXJjaC9hcm0vYm9vdC9kdHMvc3Rt
MzJmNDI5LWRpc2NvLmR0cyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAgMSBm
aWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vYm9vdC9kdHMvc3RtMzJmNDI5LWRpc2NvLmR0cyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
ZjQyOS1kaXNjby5kdHMKPiA+IGluZGV4IDMwYzBmNjcuLjFiZmI5MDMgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzCj4gPiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzCj4gPiBAQCAtNDksNiArNDksOCBAQAo+ID4g
ICAjaW5jbHVkZSAic3RtMzJmNDI5LmR0c2kiCj4gPiAgICNpbmNsdWRlICJzdG0zMmY0MjktcGlu
Y3RybC5kdHNpIgo+ID4gICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQuaD4KPiA+
ICsjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4gPiAr
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPgo+ID4KPiA+ICAgLyB7Cj4gPiAgICAg
ICBtb2RlbCA9ICJTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJGNDI5aS1ESVNDTyBib2FyZCI7Cj4g
PiBAQCAtMTI3LDMgKzEyOSwyNiBAQAo+ID4gICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKPiA+ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICAgfTsKPiA+ICsKPiA+ICsmc3BpNSB7
Cj4gPiArICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArICAgICBwaW5jdHJsLTAgPSA8JnNwaTVf
cGlucz47Cj4gPiArICAgICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ID4gKyAgICAgI2Fk
ZHJlc3MtY2VsbHMgPSA8MT47Cj4gPiArICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsgICAg
IGNzLWdwaW9zID0gPCZncGlvYyAxIEdQSU9fQUNUSVZFX0xPVz47Cj4gPiArICAgICBkbWFzID0g
PCZkbWEyIDMgMiAweDQwMCAweDA+LAo+ID4gKyAgICAgICAgICAgIDwmZG1hMiA0IDIgMHg0MDAg
MHgwPjsKPiA+ICsgICAgIGRtYS1uYW1lcyA9ICJyeCIsICJ0eCI7Cj4gPiArCj4KPiBZb3UgYWRk
ZWQgdGhpcyBzcGk1IG5vZGUgaW4gdGhpcyBwYXRjaCBidXQgYWxzbyBpbiB0aGUgZGlzcGxheSBz
ZXJpZXMuIEkKPiB3aWxsIGhhdmUgaXNzdWUgdG8gbWVyZ2UuIEV2ZW4gaWYgSSBjb3VsZCBmaXgg
aXQgZWFzaWx5LCBhcyB5b3UgYXJlCj4gZ29pbmcgdG8gcmVzZW5kLCB0aGUgZ29vZCBwcmFjdGlj
ZSBjb3VsZCBiZSB0byBoYXZlIHNldmVyYWwgcGF0Y2hlcyBpbgo+IG9uZSBzZXJpZXM6IG9uZSBw
YXRjaCBmb3Igc3BpNSBjb250cm9sbGVyLCBhbm90aGVyIGZvciBneXJvIGFuZCBhbm90aGVyCj4g
Zm9yIGRpc3BsYXkuCj4KPiBBbmQgYWxzbyBzYW1lIHJlbWFyayB0aGFuIExpbnVzIGRpZCBpbiBk
aXNwbGF5IHNlcmllcyBtb3ZlIERNQSB0byBzb2MKPiBkdHNpIGZpbGUgcGxlYXNlLgoKU3VyZSwg
aG93IGFib3V0IHRoaXMgcGF0Y2ggc2VxdWVuY2U6CjEgYWRkIHNwaTUgZG1hIHRvIHNvYyAoc3Rt
MzJmNDI5LmR0c2kpCjIgYWRkIHBpbiBtYXAgZm9yIHNwaTUgKHN0bTMyZjQtcGluY3RybC5kdHNp
KQozIGFkZCBzcGk1IGNvbnRyb2xsZXIgd2l0aCBneXJvIChzdG0zMmY0MjktZGlzY28uZHRzKQo0
IGFkZCBzcGkgbW9kaWZpY2F0aW9uIHRvIHN1cHBvcnQgZ3lybyAoc3BpLXN0bTMyLmMpCgo1IGFk
ZCBsdGRjIHBpbiBtYXAgZm9yIHN0bTMyZjQyOS1kaXNjbyBib2FyZCAoc3RtMzJmNC1waW5jdHJs
LmR0c2kpCjYgYWRkIGlsaXRlay1pbGk5MzQxIGR0cyBiaW5kaW5ncyBmb3IgZGlzY28gKHN0bTMy
ZjQyOS1kaXNjby5kdHMsCmRlcGVuZHMgb24gYWJvdmUgc3RlcCAzKQo3IGFkZCB5YW1sIGRvY3Vt
ZW50IGFib3V0IGlsaXRlay1pbGk5MzQxIChpbGl0ZWssaWxpOTM0MS55YW1sKQo4IGFkZCBjbGsg
Y2hhbmdlcyB0byBzdXBwb3J0IGx0ZGMgZHJpdmVyIChjbGstc3RtMzJmNC5jKQoKc28sIGkgd2ls
bCBjb21iaW5lIGd5cm8gYW5kIGRpc3BsYXkgdHdvIHBhdGNoZXMgdG8gb25lIHBhdGNoc2V0IG5l
eHQKdGltZS4gcmlnaHQgPwoKdGhhbmtzLgo+Cj4KPiA+ICsgICAgIGwzZ2QyMDogbDNnZDIwQDAg
ewo+ID4gKyAgICAgICAgICAgICBjb21wYXRpYmxlID0gInN0LGwzZ2QyMC1neXJvIjsKPiA+ICsg
ICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8MTAwMDAwMDA+Owo+ID4gKyAgICAgICAg
ICAgICBzdCxkcmR5LWludC1waW4gPSA8Mj47Cj4gPiArICAgICAgICAgICAgIGludGVycnVwdC1w
YXJlbnQgPSA8JmdwaW9hPjsKPiA+ICsgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwxIElSUV9U
WVBFX0VER0VfUklTSU5HPiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwyIElS
UV9UWVBFX0VER0VfUklTSU5HPjsKPiA+ICsgICAgICAgICAgICAgcmVnID0gPDA+Owo+ID4gKyAg
ICAgICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4gPiArICAgICB9Owo+ID4gK307Cj4gPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
