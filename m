Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE672AC988A
	for <lists+linux-stm32@lfdr.de>; Sat, 31 May 2025 02:03:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64165C3F92D;
	Sat, 31 May 2025 00:03:12 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F05CBC3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 31 May 2025 00:03:10 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7d09b0a5050so151269885a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 17:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748649789; x=1749254589;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=;
 b=VgwCl86Cmm2a2+Nbeyw40Q9qLRIOvJKWR0YI0lD5YdF1oHwP72HuZOXAR58GuyWtFz
 7NRHxjuAEWBP8l7cLm3B2fOWG/nQtnM/I7fi+O0fX1HDBKVO9E1EDyfHCgs7eVMIKWXm
 X04sqsywy6sA3g8gp1Vo3BeyOnnzzICgDeH4fQYmz77lXFoYLtgXnSePDT+9ir09rUx/
 FjbesQzfUQ9EkoJI1Y364SOkNrIlzS6ZucfEK5JHh7LCNMDv2/n6chMdFMNWMpFazNYx
 Yl5qjOdwKjf3LOsaEw+Eok2RVVTfyVA+oV4UTd9wtFTytfCVXH6bcUnDUEwgVNmqb6Yh
 BLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748649789; x=1749254589;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/dKbBbIAJRxT8vr39V0wwDize8rkJ2vri92QYY0yFU=;
 b=we8RoEMWGf/nlQTxk+bO0xQ5J4mPmMXI7eo6PvJrcZ6lOYfH401iozgwRabxluintu
 IzBlRPoQW8q65zNYphE+cDA95i2XXb5NLJAy7drTO5HjGk1dBAMUZL14UsMtwDugbMOC
 BnSx/UGDOfN/r0FJ+Oy+rKul7wsadQ3wH7xtx3aglkjvD8i2ig1sXEANT20+UjWKoCh2
 bdkgW1cwBm/6sGnYsXQgJIsQKrmm5PZidpxVCM0zy5wq7THw58VNrnmFFt6bXqDl1c1E
 NSc+XMw9NNudaBWCca2LNg+ZlqjWfC9MvjdB4K/We/4gO0+5aFFGD5ErJ8mdTwfGIX+U
 j0dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrsAPtn5wjQgE1jyixuCdyn542mDjpV48DoR5WZH+CyiYvPnebmmavLV+Mffxi40d8bvNcHxybSETceg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyfEkDKNmRELQxIf0N3oYOULyyRjOJzpWMuJQr/IEt1TpuGEOxt
 KA1xYIUALqj85BUDdBsHwXU3l5cov5WijOQGTVqbaxuNB4GTyvlFTEj7ff8IQChMxfmlt1Bpltq
 I4ORKGJK1Nk7I4qdvfgl2xHsJyGYiY8c=
X-Gm-Gg: ASbGncuoW/g5cucS3+yuMa+bWIqsT5QcnAaUgUTd61ghBAmYB4HXGpM0DSJICI/RI/6
 WlDxzkkTB08yJGWNt26WnyFh9PenYA+6jfQt69QRRmYTZ36ulcJT6U95u3/7c6ZwL59WuTnksWM
 SUQO+PcYSmE6Xpk2Y4QULVmbvW//bM1iRXRQ==
X-Google-Smtp-Source: AGHT+IHYyJlGTtpjLfDS2korruhddZalmtfRzHquW+3WyYzNkhp5Cmo7Al9su+C9WS0W0IHm4jkhbhjqHsgACCoVWZw=
X-Received: by 2002:a05:620a:4508:b0:7ce:f58e:7e9c with SMTP id
 af79cd13be357-7d0eac3dc9bmr54414885a.7.1748649789320; Fri, 30 May 2025
 17:03:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
 <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch>
 <CADvTj4posNXP4FCXPqABtP0cMD1dPUH+hXcRQnetZ65ReKjOKQ@mail.gmail.com>
 <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
In-Reply-To: <e1f4e2b7-edf9-444c-ad72-afae6e271e36@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 30 May 2025 18:02:58 -0600
X-Gm-Features: AX0GCFszR54VKhpbiCp7QT24c4JTQPW5wRggeGSsldqyRuwmihD2lRx7cFJ2K-I
Message-ID: <CADvTj4oSbYLy3-w7m19DP-p0vwaJ8swNhoOFjOQiPFA24JKfMQ@mail.gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Furong Xu <0x1207@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] net: stmmac: allow drivers to
 explicitly select PHY device
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

T24gRnJpLCBNYXkgMzAsIDIwMjUgYXQgNTo1NuKAr1BNIEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFp
bmVsbGlAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDUvMzAvMjUgMTY6NDYsIEphbWVzIEhpbGxp
YXJkIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMjowMuKAr1BNIEFuZHJldyBM
dW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBUdWUsIE1heSAyNywgMjAy
NSBhdCAwMToyMToyMVBNIC0wNjAwLCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+Pj4gT24gVHVl
LCBNYXkgMjcsIDIwMjUgYXQgMToxNOKAr1BNIEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4g
d3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gT24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMTE6NTU6NTRBTSAt
MDYwMCwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPj4+Pj4gU29tZSBkZXZpY2VzIGxpa2UgdGhl
IEFsbHdpbm5lciBINjE2IG5lZWQgdGhlIGFiaWxpdHkgdG8gc2VsZWN0IGEgcGh5Cj4gPj4+Pj4g
aW4gY2FzZXMgd2hlcmUgbXVsdGlwbGUgUEhZJ3MgbWF5IGJlIHByZXNlbnQgaW4gYSBkZXZpY2Ug
dHJlZSBkdWUgdG8KPiA+Pj4+PiBuZWVkaW5nIHRoZSBhYmlsaXR5IHRvIHN1cHBvcnQgbXVsdGlw
bGUgU29DIHZhcmlhbnRzIHdpdGggcnVudGltZQo+ID4+Pj4+IFBIWSBzZWxlY3Rpb24uCj4gPj4+
Pgo+ID4+Pj4gSSdtIG5vdCBjb252aW5jZWQgYWJvdXQgdGhpcyB5ZXQuIEFzIGZhciBhcyBpIHNl
ZSwgaXQgaXMgZGlmZmVyZW50Cj4gPj4+PiB2YXJpYW50cyBvZiB0aGUgSDYxNi4gVGhleSBzaG91
bGQgaGF2ZSBkaWZmZXJlbnQgY29tcGF0aWJsZXMsIHNpbmNlCj4gPj4+PiB0aGV5IGFyZSBub3Qg
YWN0dWFsbHkgY29tcGF0aWJsZSwgYW5kIHlvdSBzaG91bGQgaGF2ZSBkaWZmZXJlbnQgRFQKPiA+
Pj4+IGRlc2NyaXB0aW9ucy4gU28geW91IGRvbid0IG5lZWQgcnVudGltZSBQSFkgc2VsZWN0aW9u
Lgo+ID4+Pgo+ID4+PiBEaWZmZXJlbnQgY29tcGF0aWJsZXMgZm9yIHdoYXQgc3BlY2lmaWNhbGx5
PyBJIG1lYW4gdGhlIFBIWSBjb21wYXRpYmxlcwo+ID4+PiBhcmUganVzdCB0aGUgZ2VuZXJpYyAi
ZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiIGNvbXBhdGlibGVzLgo+ID4+Cj4gPj4gWW91IGF0
IGxlYXN0IGhhdmUgYSBkaWZmZXJlbnQgTVREIGRldmljZXMsIGV4cG9ydGluZyBkaWZmZXJlbnQK
PiA+PiBjbG9ja3MvUFdNL1Jlc2V0IGNvbnRyb2xsZXJzLiBUaGF0IHNob3VsZCBoYXZlIGRpZmZl
cmVudCBjb21wYXRpYmxlcywKPiA+PiBzaW5jZSB0aGV5IGFyZSBub3QgY29tcGF0aWJsZS4gWW91
IHRoZW4gbmVlZCBwaGFuZGxlcyB0byB0aGVzZQo+ID4+IGRpZmZlcmVudCBjbG9ja3MvUFdNL1Jl
c2V0IGNvbnRyb2xsZXJzLCBhbmQgZm9yIG9uZSBvZiB0aGUgUEhZcyB5b3UKPiA+PiBuZWVkIGEg
cGhhbmRsZSB0byB0aGUgSTJDIGJ1cywgc28gdGhlIFBIWSBkcml2ZXIgY2FuIGRvIHRoZQo+ID4+
IGluaXRpYWxpc2F0aW9uLiBTbyBpIHRoaW5rIGluIHRoZSBlbmQgeW91IGtub3cgd2hhdCBQSFkg
eW91IGhhdmUgb24KPiA+PiB0aGUgYm9hcmQsIHNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gZG8gcnVu
dGltZSBkZXRlY3Rpb24uCj4gPgo+ID4gSG1tLCB0aGlua2luZyBhYm91dCB0aGlzIGFnYWluLCBt
YXliZSBpdCBtYWtlcyBzZW5zZSB0byBqdXN0Cj4gPiBkbyB0aGUgcnVudGltZSBkZXRlY3Rpb24g
aW4gdGhlIE1GRCBkcml2ZXIgZW50aXJlbHksIGFzIGl0IHR1cm5zCj4gPiBvdXQgdGhlIEFDMzAw
IGluaXRpYWxpemF0aW9uIHNlcXVlbmNlIGlzIGxhcmdlbHkgYSBzdWJzZXQgb2YgdGhlCj4gPiBB
QzIwMCBpbml0aWFsaXphdGlvbiBzZXF1ZW5jZShBQzMwMCB3b3VsZCBqdXN0IG5vdCBuZWVkIGFu
eQo+ID4gaTJjIHBhcnQgb2YgdGhlIGluaXRpYWxpemF0aW9uIHNlcXVlbmNlKS4gU28gaWYgd2Ug
dXNlIHRoZSBzYW1lCj4gPiBNRkQgZHJpdmVyIHdoaWNoIGludGVybmFsbHkgZG9lcyBhdXRvZGV0
ZWN0aW9uIHRoZW4gd2UgY2FuCj4gPiBhdm9pZCB0aGUgbmVlZCBmb3Igc2VsZWN0aW5nIHNlcGFy
YXRlIFBIWSdzIGVudGlyZWx5LiBUaGlzIGF0Cj4gPiBsZWFzdCBpcyBsYXJnZWx5IGhvdyB0aGUg
dmVuZG9yIEJTUCBkcml2ZXIgd29ya3MgYXQgdGhlIG1vbWVudC4KPiA+Cj4gPiBXb3VsZCB0aGlz
IGFwcHJvYWNoIG1ha2Ugc2Vuc2U/Cj4KPiBUaGlzIGhhcyBsaWtlbHkgYmVlbiBkaXNjdXNzZWQs
IGJ1dCBjYW5ub3QgeW91IG1vdmUgdGhlIGd1dHMgb2YgcGF0Y2ggIzIKPiBpbnRvIHUtYm9vdCBv
ciB0aGUgYm9vdCBsb2FkZXIgYmVpbmcgdXNlZCBhbmQgaGF2ZSBpdCBwYXRjaCB0aGUgUEhZCj4g
RGV2aWNlIFRyZWUgbm9kZSdzICJyZWciIHByb3BlcnR5IGFjY29yZGluZ2x5IGJlZm9yZSBoYW5k
aW5nIG91dCB0aGUgRFRCCj4gdG8gdGhlIGtlcm5lbD8KCk5vLCB0aGF0J3Mgbm90IHJlYWxseSB0
aGUgaXNzdWUsIHRoZSAicmVnIiBwcm9wZXJ0eSBjYW4gYWN0dWFsbHkgYmUKdGhlIHNhbWUgZm9y
IGJvdGggdGhlIEFDMjAwIGFuZCBBQzMwMCBwaHkncywgYm90aCBzdXBwb3J0IHVzaW5nCmFkZHJl
c3MgMCwgdGhlIEFDMjAwIGFkZGl0aW9uYWxseSBzdXBwb3J0cyBhZGRyZXNzIDEuIEluIG15IGV4
YW1wbGUKdGhleSBhcmUgZGlmZmVyZW50IHNpbXBseSBzbyB0aGF0IHRoZXkgZG9uJ3QgY29uZmxp
Y3QgaW4gdGhlIGRldmljZSB0cmVlLgoKVGhlIGFjdHVhbCBpc3N1ZSBpcyB0aGF0IHRoZXkgaGF2
ZSBkaWZmZXJpbmcgaW5pdGlhbGl6YXRpb24gc2VxdWVuY2VzIGFuZAp3b24ndCBhcHBlYXIgaW4g
bWRpbyBidXMgc2NhbnMgdW50aWwgYWZ0ZXIgdGhlIGluaXRpYWxpemF0aW9uIGlzIGNvbXBsZXRl
LgoKPiBBbm90aGVyIHdheSB0byBhZGRyZXNzIHdoYXQgeW91IHdhbnQgdG8gZG8gaXMgdG8gcmVt
b3ZlIHRoZSAicmVnIgo+IHByb3BlcnR5IGZyb20gdGhlIEV0aGVybmV0IFBIWSBub2RlIGFuZCBq
dXN0IGxldCBvZl9tZGlvYnVzX3JlZ2lzdGVyKCkKPiBhdXRvbWF0aWNhbGx5IHNjYW4sIHlvdSBo
YXZlIHRoZSBhZHZhbnRhZ2Ugb2YgaGF2aW5nIHRoZSBhZGRyZXNzZXMKPiBjb25zZWN1dGl2ZSBz
byB0aGlzIHdvbid0IGRyYW1hdGljYWxseSBpbmNyZWFzZSB0aGUgYm9vdCB0aW1lLi4uIEkgZG8K
PiB0aGF0IG9uIHRoZSBib2FyZHMgSSBzdXBwb3NlIHRoYXQgaGF2ZSBhIHJlbW92YWJsZSBtZXp6
YW5pbmUgY2FyZCB0aGF0Cj4gaW5jbHVkZXMgYSBQSFkgYWRkcmVzcyB3aG9zZSBhZGRyZXNzIGlz
IGRpY3RhdGVkIGJ5IHN0cmFwcyBzbyB3ZSBkb24ndAo+IHdhbnQgdG8gZ3Vlc3MsIHdlIGxldCB0
aGUga2VybmVsIGF1dG8gZGV0ZWN0IGluc3RlYWQuCgpZZWFoLCBJIG5vdGljZWQgdGhpcywgYnV0
IGl0IGRvZXNuJ3QgcmVhbGx5IGhlbHAgc2luY2UgaXQncyBub3QgdGhlIGFkZHJlc3MKdGhhdCdz
IGluY29tcGF0aWJsZSBidXQgdGhlIHJlc2V0IHNlcXVlbmNlLCBJJ20gaGF2aW5nIHRyb3VibGUg
ZmluZGluZwpleGFtcGxlcyBmb3IgbWRpbyBiYXNlZCByZXNldCBkcml2ZXJzIGluIHRoZSBrZXJu
ZWwgaG93ZXZlci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
