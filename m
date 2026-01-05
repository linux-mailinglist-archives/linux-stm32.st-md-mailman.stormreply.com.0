Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A8DCF51DE
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 18:58:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E999C57A51;
	Mon,  5 Jan 2026 17:58:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15CE4C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 17:58:27 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso1316135e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Jan 2026 09:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767635907; x=1768240707;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7iZBF6QjNtcl2lReNYZdyjRB+ne20Y2sZ8E6JqBWeQw=;
 b=Fx/deOsqNVLldGkYzIZeuxa55zkrqxgFCEFEfCrGTXB4ZcRg+kxeaSV0HAD+W05Qu+
 1IIusM5/blN2dJCUUb50V75eeBGtCDAnLqnmEqNVSGWMKIk20VCEh+6Hxudk5umZCbNn
 5CVocumvbl7fd/7MNkKrqsjliK1p/gl+RUhVCXBJo8ZbhDuEFmxfI4AoVkGB+926Lwky
 /T+JIZTv+dUoWL60e8jBlbpwUOoaIA19FesitXyMyM5H8tLCkqdYuhFt78NtqTFO7L57
 HgtZzw1WNabeBra1Ppjp4vagPOE5eY84qWKRl+pEwHWbkVgsQY9z10HcQr6muhpVv/QI
 Mkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767635907; x=1768240707;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7iZBF6QjNtcl2lReNYZdyjRB+ne20Y2sZ8E6JqBWeQw=;
 b=DBdB/W+vvwPukg9Q0bNOsd4JvFuobv1QVOYZ8KtyD1drsHEUR8bO35g7YNj/TWUYK0
 ep1K+jxEjXFaNbcAo2uVt65aShurbpTwdkYcKs6k8ykrDt5Fm+bXdPt9+j7o//SKRIev
 sOHe+738UTLAEINTXUZdOQwED5MpGVot9VRU8isFky67hIKsxTGCjhAeWkhqz8MkPBvd
 T8K3ZMPNGGsSuu35D1qPcdYjRsccLpEYLfvY+/a8BoGC4AF7sr8eVdL0kTSIrYLto+nF
 EDrG+3T7RN38zDr+7QHcjjM6FJddSiSLo5a5LTfsfv2N567omZ1vJ9IRRR1LFdTFowWu
 vyzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU06JOraXuI/7d/aYKE0rK4RBlF4NgxJP8FYEcR/YPQXLywPQvhfFiAKqvUvfYFWpjd0mttF525b8V0Ig==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwgpaWY7/SPfGHZugitaXJ+PHgwxMyGvmyMxhNG8gS+b1StxcH7
 rx1EK5emqSG16sscTPkETOfd3NQlGASEIuR2MyGHjGtz5ed58G+stv49
X-Gm-Gg: AY/fxX4OlcEqsfoIZubxBCmbpEG5QqQmn3efheU9b1115hU1+kOZSm9e5NJMVE8rw4L
 C70HDo2nqnLid0+LkpOTI1AzBWipNj3MWLe5L5v+YLzNeqsJ+e8oEfXOTEbc0sQpMuk1BK2T9K0
 WY5G29cbzSdPi4jtNh1FbPqtfSSm5h3qY213UDAbkEaGJQtSxfGwz3sdOay5hJiY/2I/M9KUOPF
 SgFAqfZxZCbPHLWLQGOomXfpDlu+DpnR+arJpEGzrKSPLd9A36hBuB7B1DBgtYka2BcMGj+jCnK
 dZwCPN8BSL96alxlYdTkgbwAdIBW7L3gkZrO0t+HLDSGv30SLZqIdD+2LfD7qDDqtW5HB2v6AfW
 b/a9vSq3iWaqhTdi4v7NQNv8GUNjfitG4U+4Cv+pShTzaczjIKVcaODIbCisaFUykvbNanNiT/E
 TS4LANzy0KBQtjERTOx3fV0A==
X-Google-Smtp-Source: AGHT+IHvDnJREnvXI3rgUm0D8mHDlQfrv7fsBdnLRxoQbMQDvEB8slEC6JxGA2RCLuiUgT4GEjzJqg==
X-Received: by 2002:a05:600c:4fd3:b0:47a:7fbf:d5c8 with SMTP id
 5b1f17b1804b1-47d7f0a25d2mr1709695e9.26.1767635907151; 
 Mon, 05 Jan 2026 09:58:27 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:1b36:ec4b:aa3c:60f8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f390a69sm703765e9.0.2026.01.05.09.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 09:58:26 -0800 (PST)
Date: Mon, 5 Jan 2026 18:58:24 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aVv7wD2JFikGkt3F@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, imx@lists.linux.dev, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 francesco.dolcini@toradex.com, andrew+netdev@lunn.ch, edumazet@google.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, kuba@kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDU6MDk6MTNQTSArMDAwMCwgUnVzc2VsbCBLaW5nIChP
cmFjbGUpIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDA1LCAyMDI2IGF0IDA1OjQyOjIzUE0gKzAxMDAs
IFN0ZWZhbiBFaWNoZW5iZXJnZXIgd3JvdGU6Cj4gPiBZZXMgdGhpcyBpcyBjb3JyZWN0LiBFUlIw
NTA2OTQgZnJvbSBOWFAgc3RhdGVzOgo+ID4gVGhlIElFRUUgODAyLjMgc3RhbmRhcmQgc3RhdGVz
IHRoYXQsIGluIE1JSS9HTUlJIG1vZGVzLCB0aGUgYnl0ZQo+ID4gcHJlY2VkaW5nIHRoZSBTRkQg
KDB4RDUpLCBTTUQtUyAoMHhFNiwweDRDLCAweDdGLCBvciAweEIzKSwgb3IgU01ELUMKPiA+ICgw
eDYxLCAweDUyLCAweDlFLCBvciAweDJBKSBieXRlIGNhbiBiZSBhIG5vbi1QUkVBTUJMRSBieXRl
IG9yIHRoZXJlIGNhbgo+ID4gYmUgbm8gcHJlY2VkaW5nIHByZWFtYmxlIGJ5dGUuIFRoZSBNQUMg
cmVjZWl2ZXIgbXVzdCBzdWNjZXNzZnVsbHkKPiA+IHJlY2VpdmUgYSBwYWNrZXQgd2l0aG91dCBh
bnkgcHJlYW1ibGUoMHg1NSkgYnl0ZSBwcmVjZWRpbmcgdGhlIFNGRCwKPiA+IFNNRC1TLCBvciBT
TUQtQyBieXRlLgo+ID4gSG93ZXZlciBkdWUgdG8gdGhlIGRlZmVjdCwgaW4gY29uZmlndXJhdGlv
bnMgd2hlcmUgZnJhbWUgcHJlZW1wdGlvbiBpcwo+ID4gZW5hYmxlZCwgd2hlbiBwcmVhbWJsZSBi
eXRlIGRvZXMgbm90IHByZWNlZGUgdGhlIFNGRCwgU01ELVMsIG9yIFNNRC1DCj4gPiBieXRlLCB0
aGUgcmVjZWl2ZWQgcGFja2V0IGlzIGRpc2NhcmRlZCBieSB0aGUgTUFDIHJlY2VpdmVyLiBUaGlz
IGlzCj4gPiBiZWNhdXNlLCB0aGUgc3RhcnQtb2YtcGFja2V0IGRldGVjdGlvbiBsb2dpYyBvZiB0
aGUgTUFDIHJlY2VpdmVyCj4gPiBpbmNvcnJlY3RseSBjaGVja3MgZm9yIGEgcHJlYW1ibGUgYnl0
ZS4KPiA+IAo+ID4gTlhQIHJlZmVycyB0byBJRUVFIDgwMi4zIHdoZXJlIGluIGNsYXVzZSAzNS4y
LjMuMi4yIFJlY2VpdmUgY2FzZSAoR01JSSkKPiA+IHRoZXkgc2hvdyB0d28gdGFibGVzIG9uZSB3
aGVyZSB0aGUgcHJlYW1ibGUgaXMgcHJlY2VkaW5nIHRoZSBTRkQgYW5kIG9uZQo+ID4gd2hlcmUg
aXQgaXMgbm90LiBUaGUgdGV4dCBzYXlzOgo+ID4gVGhlIG9wZXJhdGlvbiBvZiAxMDAwIE1iL3Mg
UEhZcyBjYW4gcmVzdWx0IGluIHNocmlua2FnZSBvZiB0aGUgcHJlYW1ibGUKPiA+IGJldHdlZW4g
dHJhbnNtaXNzaW9uIGF0IHRoZSBzb3VyY2UgR01JSSBhbmQgcmVjZXB0aW9uIGF0IHRoZSBkZXN0
aW5hdGlvbgo+ID4gR01JSS4gVGFibGUgMzXigJMzIGRlcGljdHMgdGhlIGNhc2Ugd2hlcmUgbm8g
cHJlYW1ibGUgYnl0ZXMgYXJlIGNvbnZleWVkCj4gPiBhY3Jvc3MgdGhlIEdNSUkuIFRoaXMgY2Fz
ZSBtYXkgbm90IGJlIHBvc3NpYmxlIHdpdGggYSBzcGVjaWZpYyBQSFksIGJ1dAo+ID4gaWxsdXN0
cmF0ZXMgdGhlIG1pbmltdW0gcHJlYW1ibGUgd2l0aCB3aGljaCBNQUMgc2hhbGwgYmUgYWJsZSB0
bwo+ID4gb3BlcmF0ZS4gVGFibGUgMzXigJM0IGRlcGljdHMgdGhlIGNhc2Ugd2hlcmUgdGhlIGVu
dGlyZSBwcmVhbWJsZSBpcwo+ID4gY29udmV5ZWQgYWNyb3NzIHRoZSBHTUlJLgo+ID4gCj4gPiBX
ZSB3b3VsZCBjaGFuZ2UgdGhlIGJlaGF2aW9yIGZyb20gIm5vIHByZWFtYmxlIGlzIHByZWNlZGlu
ZyBTRkQiIHRvICJ0aGUKPiA+IGVuaXRyZSBwcmVhbWJsZSBpcyBwcmVjZWRpbmcgU0ZEIi4gQm90
aCBhcmUgbGlzdGVkIGluIHRoZSBzdGFuZGFyZCBhbmQKPiA+IHNoYWxsIGJlIHN1cHBvcnRlZCBi
eSB0aGUgTUFDLgo+IAo+IFRoYW5rcyBmb3IgcHJvdmlkaW5nIHRoZSBmdWxsIGV4cGxhbmF0aW9u
LCBpdCB3b3VsZCBiZSBnb29kIHRvIGhhdmUKPiB0aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZS4K
Ck9rYXkgdGhhbmtzLCBJIHdpbGwgcHJvdmlkZSB0aGUgZnVsbCBleHBsYW5hdGlvbiBpbiB0aGUg
bmV4dCBjb21taXQKbWVzc2FnZS4KCj4gCj4gVGhlIG5leHQgcXVlc3Rpb24gd291bGQgYmUsIGlz
IGl0IGp1c3QgdGhlIE5YUCBFUU9TIGltcGxlbWVudGF0aW9uCj4gdGhhdCB0aGlzIGJyZWFrcyBv
biwgb3IgYXJlIG90aGVyIEVRT1MgaW1wbGVtZW50YXRpb25zIGFmZmVjdGVkPwo+IAo+IEluIG90
aGVyIHdvcmRzLCBpZiB3ZSBjaG9vc2UgdG8gY29uZGl0aW9uYWxseSBlbmFibGUgdGhlIHByZWFi
bGUgYXQKPiB0aGUgUEhZLCBzaG91bGQgdGhlIGdlbmVyaWMgcGFydHMgb2Ygc3RtbWFjIGhhbmRs
ZSB0aGlzIHJhdGhlciB0aGFuCj4gZW5kaW5nIHVwIHdpdGggbXVsdGlwbGUgcGxhdGZvcm0gc3Bl
Y2lmaWMgZ2x1ZSBoYXZpbmcgdG8gY29kZSB0aGlzLgo+IChUaGlzIGlzIHNvbWV0aGluZyBJIHJl
YWxseSB3YW50IHRvIGF2b2lkIC0gaXQgZG9lc24ndCBzY2FsZS4pCgpGcm9tIHRoZSBlcnJhdGEg
ZnJvbSBOWFAgaXQgc291bmRzIHRvIG1lIGxpa2UgaXQgaXMgYSBjb25maWd1cmF0aW9uCmlzc3Vl
IGJ5IE5YUC4gSSBjaGVja2VkIHRoZSBmb2xsb3dpbmcgRVJSQVRBcyBmcm9tIHZlbmRvcnMgd2hl
cmUgSSBoYXZlCmFjY2VzcyB0bzoKLSBTVCBTVE0zMk1QMTogbm90IGFmZmVjdGVkOiBodHRwczov
L3d3dy5zdC5jb20vcmVzb3VyY2UvZW4vZXJyYXRhX3NoZWV0L2VzMDQzOC1zdG0zMm1wMTUxeDN4
N3gtZGV2aWNlLWVycmF0YS1zdG1pY3JvZWxlY3Ryb25pY3MucGRmCi0gUmVuZXNhcyBSWk4xOiBu
b3QgYWZmZWN0ZWQ6IGh0dHBzOi8vd3d3LnJlbmVzYXMuY29tL2VuL2RvY3VtZW50L3RjdS9ldGhl
cm5ldC1tYWMtZ21hYy1mdW5jdGlvbi1pc3N1ZS0wP3I9MTA1NDU2MQotIFN0YXJ2aXZlIEpINzEx
MDogbm90IGFmZmVjdGVkOiBodHRwczovL2RvYy1lbi5ydnNwYWNlLm9yZy9KSDcxMTAvUERGL0pI
NzExMF9FcnJhdGEucGRmCi0gTlhQIFMzMjogYWZmZWN0ZWQ6IChFUlIwNTA3MDYgdW5kZXIgTkRB
KQoKU28gZnJvbSB0aGF0IEkgd291bGQgY29uY2x1ZGUgdGhhdCBpdCBpcyBhbiBOWFAgc3BlY2lm
aWMgaXNzdWUgYW5kIGl0J3MKbm90IHRoZSBmdWxsIEVRT1MgaW1wbGVtZW50YXRpb24gdGhhdCBp
cyBicm9rZW4uCgpSZWdhcmRzLApTdGVmYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
