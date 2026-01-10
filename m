Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F98D0D67E
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jan 2026 14:42:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A35F0C055F4;
	Sat, 10 Jan 2026 13:42:18 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53211C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jan 2026 13:42:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso45680775e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jan 2026 05:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768052536; x=1768657336;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=niKD7lwOtoha0TRVTxtTbBYIAZIgplZuxoTzqvKJ568=;
 b=HfI0pqeEDJeqhFpw7FijAOGrL6MPHmguUGk6IikLl07DI3zfxdsmz3KyZfMIkIjRdg
 IBMczMkcemXIbXcMtHMEUi51CC+cIfXGdiiIM+X9E/j/3QCWUmTWuP201OxNS1gx2Rn0
 2dFKwkIqEHuslvw0TfNhchhzRQE0TaJeeJVEeiO/KowBAOHLPIOUuvzxgubumyJNptek
 P/B+gUtOvieb0M7cGEaE3aFf4rfUuJc6f07H00ppo4F+LJkp+xKkERiQSLfrsm8AiVF7
 Bu4SEnGLlMbHal7/mGGMpf9M6EXP286U7BrsVQV1O/S07BXs5JMPaaGzmWP7EXSsbwgV
 cmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768052536; x=1768657336;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=niKD7lwOtoha0TRVTxtTbBYIAZIgplZuxoTzqvKJ568=;
 b=PUBUBE5yHOKBKh0sz39cRMOdLTiW2j88Py1oAPz5Mt3UlPrXQybTCxeSmJkgrvEUT3
 6l50wy2mUCoOCZdTWTO6BDUG+gkP2mcyV4q04qSlOsJLLVYs1rMc09SFYIrLgxv9SvCj
 miWGwtGOrW+5+M1ovoKlP2DteNmmndOuzGJZyjNQ0FW7AedAbyoG5hpxxF/VPDgXOJIh
 MUt9V/encdwwGgJRnEcEbyMTGtdhPFX5WD7YyTivAxSseYdKvGCQBIQQsWc1pOd7T/PM
 eZnDCFVbiaI+eorjeYONLmQPTtTCrWrfup5flYHiWXU5dYTfIuKRDQ2Pjxemi0kXW9+b
 QCiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVofaFiB/G2XY91JRdDrghkHhuZoIPLSzFJ5EJLxmJY5NWT0zDyeSEzDirqZwah9kMPGXBStKb5c8N+Bw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzD57OhqHvEE/90sfzRE2KlzZ/jq5OjPyOUcMHMq4s5Z5YR0nv
 zCXPzCglk8GYb58qhq7No9Hfn295eCPgjdQ2XkC2CL/d1OjUnXsUYbbb
X-Gm-Gg: AY/fxX7hhEGO0WvtuTz7nW/rXFCMtyOg8exVYuQNTEzUMEj6unZQ4626yCFKHZH043g
 l1z1GNaBC45rDuZI6zp71VJYW203CvhVFDeeHeZWIC4XAmENbs9dVifUpRK0N9ZD9U4Mpf5z7sO
 M+wWbEqp/uRCv2BKmP+r7rA5kt6xzjFpp8AMmYsYxvyJ/9KKFFS6fC6SUJiG9auDT/3T/HBp3vL
 O4i/QFJo+qP01P8Z32IWes6EB1Z1bTCaVAhWrLzqyTHjWE07t4iG5ItkRJHJC0ZID/yO5CSkaig
 rTk1JNT7B1t4zRv9eqpRG5zl2vx7kJxnc6eYVspc4PRXjtjlubDJMDAR2N8Oy5F0+TZ8248+myT
 UOw1hV09SNBVoMwk1bADiSGlo+F10V9E1j8VMedBUm+9LnirxZFudKccn5fHrkxaqL24+fYIb+G
 n4HhL7bRqn6pQ1i0SPaxucvg==
X-Google-Smtp-Source: AGHT+IGNmY6EuRXQMgmECxnNtQwrRUp+VeCi3/b3F25cOPZ8t8M9RwpG6+Ph3Pg2FEMSimcUer23+w==
X-Received: by 2002:a05:600c:4f53:b0:479:1a09:1c4a with SMTP id
 5b1f17b1804b1-47d84b3b389mr154806905e9.31.1768052536352; 
 Sat, 10 Jan 2026 05:42:16 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:6968:58fa:e72d:87c0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d871ac28bsm85184595e9.20.2026.01.10.05.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 05:42:15 -0800 (PST)
Date: Sat, 10 Jan 2026 14:42:13 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <aWJXNSiDLHLFGV8F@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop> <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, imx@lists.linux.dev, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
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

SGkgTWF4aW1lLAoKT24gRnJpLCBKYW4gMDksIDIwMjYgYXQgMTA6Mzg6MzBBTSArMDEwMCwgTWF4
aW1lIENoZXZhbGxpZXIgd3JvdGU6Cj4gSGkgU3RlZmFuLAo+IAo+IE9uIDA5LzAxLzIwMjYgMDk6
NDIsIFN0ZWZhbiBFaWNoZW5iZXJnZXIgd3JvdGU6Cj4gPiBIaSBldmVyeW9uZSwKPiA+IAo+ID4g
T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDY6NTg6MjRQTSArMDEwMCwgU3RlZmFuIEVpY2hlbmJl
cmdlciB3cm90ZToKPiA+PiBPbiBNb24sIEphbiAwNSwgMjAyNiBhdCAwNTowOToxM1BNICswMDAw
LCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gPj4+IE9uIE1vbiwgSmFuIDA1LCAyMDI2
IGF0IDA1OjQyOjIzUE0gKzAxMDAsIFN0ZWZhbiBFaWNoZW5iZXJnZXIgd3JvdGU6Cj4gPj4+PiBZ
ZXMgdGhpcyBpcyBjb3JyZWN0LiBFUlIwNTA2OTQgZnJvbSBOWFAgc3RhdGVzOgo+ID4+Pj4gVGhl
IElFRUUgODAyLjMgc3RhbmRhcmQgc3RhdGVzIHRoYXQsIGluIE1JSS9HTUlJIG1vZGVzLCB0aGUg
Ynl0ZQo+ID4+Pj4gcHJlY2VkaW5nIHRoZSBTRkQgKDB4RDUpLCBTTUQtUyAoMHhFNiwweDRDLCAw
eDdGLCBvciAweEIzKSwgb3IgU01ELUMKPiA+Pj4+ICgweDYxLCAweDUyLCAweDlFLCBvciAweDJB
KSBieXRlIGNhbiBiZSBhIG5vbi1QUkVBTUJMRSBieXRlIG9yIHRoZXJlIGNhbgo+ID4+Pj4gYmUg
bm8gcHJlY2VkaW5nIHByZWFtYmxlIGJ5dGUuIFRoZSBNQUMgcmVjZWl2ZXIgbXVzdCBzdWNjZXNz
ZnVsbHkKPiA+Pj4+IHJlY2VpdmUgYSBwYWNrZXQgd2l0aG91dCBhbnkgcHJlYW1ibGUoMHg1NSkg
Ynl0ZSBwcmVjZWRpbmcgdGhlIFNGRCwKPiA+Pj4+IFNNRC1TLCBvciBTTUQtQyBieXRlLgo+ID4+
Pj4gSG93ZXZlciBkdWUgdG8gdGhlIGRlZmVjdCwgaW4gY29uZmlndXJhdGlvbnMgd2hlcmUgZnJh
bWUgcHJlZW1wdGlvbiBpcwo+ID4+Pj4gZW5hYmxlZCwgd2hlbiBwcmVhbWJsZSBieXRlIGRvZXMg
bm90IHByZWNlZGUgdGhlIFNGRCwgU01ELVMsIG9yIFNNRC1DCj4gPj4+PiBieXRlLCB0aGUgcmVj
ZWl2ZWQgcGFja2V0IGlzIGRpc2NhcmRlZCBieSB0aGUgTUFDIHJlY2VpdmVyLiBUaGlzIGlzCj4g
Pj4+PiBiZWNhdXNlLCB0aGUgc3RhcnQtb2YtcGFja2V0IGRldGVjdGlvbiBsb2dpYyBvZiB0aGUg
TUFDIHJlY2VpdmVyCj4gPj4+PiBpbmNvcnJlY3RseSBjaGVja3MgZm9yIGEgcHJlYW1ibGUgYnl0
ZS4KPiA+Pj4+Cj4gPj4+PiBOWFAgcmVmZXJzIHRvIElFRUUgODAyLjMgd2hlcmUgaW4gY2xhdXNl
IDM1LjIuMy4yLjIgUmVjZWl2ZSBjYXNlIChHTUlJKQo+ID4+Pj4gdGhleSBzaG93IHR3byB0YWJs
ZXMgb25lIHdoZXJlIHRoZSBwcmVhbWJsZSBpcyBwcmVjZWRpbmcgdGhlIFNGRCBhbmQgb25lCj4g
Pj4+PiB3aGVyZSBpdCBpcyBub3QuIFRoZSB0ZXh0IHNheXM6Cj4gPj4+PiBUaGUgb3BlcmF0aW9u
IG9mIDEwMDAgTWIvcyBQSFlzIGNhbiByZXN1bHQgaW4gc2hyaW5rYWdlIG9mIHRoZSBwcmVhbWJs
ZQo+ID4+Pj4gYmV0d2VlbiB0cmFuc21pc3Npb24gYXQgdGhlIHNvdXJjZSBHTUlJIGFuZCByZWNl
cHRpb24gYXQgdGhlIGRlc3RpbmF0aW9uCj4gPj4+PiBHTUlJLiBUYWJsZSAzNeKAkzMgZGVwaWN0
cyB0aGUgY2FzZSB3aGVyZSBubyBwcmVhbWJsZSBieXRlcyBhcmUgY29udmV5ZWQKPiA+Pj4+IGFj
cm9zcyB0aGUgR01JSS4gVGhpcyBjYXNlIG1heSBub3QgYmUgcG9zc2libGUgd2l0aCBhIHNwZWNp
ZmljIFBIWSwgYnV0Cj4gPj4+PiBpbGx1c3RyYXRlcyB0aGUgbWluaW11bSBwcmVhbWJsZSB3aXRo
IHdoaWNoIE1BQyBzaGFsbCBiZSBhYmxlIHRvCj4gPj4+PiBvcGVyYXRlLiBUYWJsZSAzNeKAkzQg
ZGVwaWN0cyB0aGUgY2FzZSB3aGVyZSB0aGUgZW50aXJlIHByZWFtYmxlIGlzCj4gPj4+PiBjb252
ZXllZCBhY3Jvc3MgdGhlIEdNSUkuCj4gPj4+Pgo+ID4+Pj4gV2Ugd291bGQgY2hhbmdlIHRoZSBi
ZWhhdmlvciBmcm9tICJubyBwcmVhbWJsZSBpcyBwcmVjZWRpbmcgU0ZEIiB0byAidGhlCj4gPj4+
PiBlbml0cmUgcHJlYW1ibGUgaXMgcHJlY2VkaW5nIFNGRCIuIEJvdGggYXJlIGxpc3RlZCBpbiB0
aGUgc3RhbmRhcmQgYW5kCj4gPj4+PiBzaGFsbCBiZSBzdXBwb3J0ZWQgYnkgdGhlIE1BQy4KPiA+
Pj4KPiA+Pj4gVGhhbmtzIGZvciBwcm92aWRpbmcgdGhlIGZ1bGwgZXhwbGFuYXRpb24sIGl0IHdv
dWxkIGJlIGdvb2QgdG8gaGF2ZQo+ID4+PiB0aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiA+
Pgo+ID4+IE9rYXkgdGhhbmtzLCBJIHdpbGwgcHJvdmlkZSB0aGUgZnVsbCBleHBsYW5hdGlvbiBp
biB0aGUgbmV4dCBjb21taXQKPiA+PiBtZXNzYWdlLgo+ID4+Cj4gPj4+Cj4gPj4+IFRoZSBuZXh0
IHF1ZXN0aW9uIHdvdWxkIGJlLCBpcyBpdCBqdXN0IHRoZSBOWFAgRVFPUyBpbXBsZW1lbnRhdGlv
bgo+ID4+PiB0aGF0IHRoaXMgYnJlYWtzIG9uLCBvciBhcmUgb3RoZXIgRVFPUyBpbXBsZW1lbnRh
dGlvbnMgYWZmZWN0ZWQ/Cj4gPj4+Cj4gPj4+IEluIG90aGVyIHdvcmRzLCBpZiB3ZSBjaG9vc2Ug
dG8gY29uZGl0aW9uYWxseSBlbmFibGUgdGhlIHByZWFibGUgYXQKPiA+Pj4gdGhlIFBIWSwgc2hv
dWxkIHRoZSBnZW5lcmljIHBhcnRzIG9mIHN0bW1hYyBoYW5kbGUgdGhpcyByYXRoZXIgdGhhbgo+
ID4+PiBlbmRpbmcgdXAgd2l0aCBtdWx0aXBsZSBwbGF0Zm9ybSBzcGVjaWZpYyBnbHVlIGhhdmlu
ZyB0byBjb2RlIHRoaXMuCj4gPj4+IChUaGlzIGlzIHNvbWV0aGluZyBJIHJlYWxseSB3YW50IHRv
IGF2b2lkIC0gaXQgZG9lc24ndCBzY2FsZS4pCj4gPj4KPiA+PiBGcm9tIHRoZSBlcnJhdGEgZnJv
bSBOWFAgaXQgc291bmRzIHRvIG1lIGxpa2UgaXQgaXMgYSBjb25maWd1cmF0aW9uCj4gPj4gaXNz
dWUgYnkgTlhQLiBJIGNoZWNrZWQgdGhlIGZvbGxvd2luZyBFUlJBVEFzIGZyb20gdmVuZG9ycyB3
aGVyZSBJIGhhdmUKPiA+PiBhY2Nlc3MgdG86Cj4gPj4gLSBTVCBTVE0zMk1QMTogbm90IGFmZmVj
dGVkOiBodHRwczovL3d3dy5zdC5jb20vcmVzb3VyY2UvZW4vZXJyYXRhX3NoZWV0L2VzMDQzOC1z
dG0zMm1wMTUxeDN4N3gtZGV2aWNlLWVycmF0YS1zdG1pY3JvZWxlY3Ryb25pY3MucGRmCj4gPj4g
LSBSZW5lc2FzIFJaTjE6IG5vdCBhZmZlY3RlZDogaHR0cHM6Ly93d3cucmVuZXNhcy5jb20vZW4v
ZG9jdW1lbnQvdGN1L2V0aGVybmV0LW1hYy1nbWFjLWZ1bmN0aW9uLWlzc3VlLTA/cj0xMDU0NTYx
Cj4gPj4gLSBTdGFydml2ZSBKSDcxMTA6IG5vdCBhZmZlY3RlZDogaHR0cHM6Ly9kb2MtZW4ucnZz
cGFjZS5vcmcvSkg3MTEwL1BERi9KSDcxMTBfRXJyYXRhLnBkZgo+ID4+IC0gTlhQIFMzMjogYWZm
ZWN0ZWQ6IChFUlIwNTA3MDYgdW5kZXIgTkRBKQo+ID4+Cj4gPj4gU28gZnJvbSB0aGF0IEkgd291
bGQgY29uY2x1ZGUgdGhhdCBpdCBpcyBhbiBOWFAgc3BlY2lmaWMgaXNzdWUgYW5kIGl0J3MKPiA+
PiBub3QgdGhlIGZ1bGwgRVFPUyBpbXBsZW1lbnRhdGlvbiB0aGF0IGlzIGJyb2tlbi4KPiA+IAo+
ID4gSSBqdXN0IHdhbnRlZCB0byBjaGVjayB3aGV0aGVyIEkgc2hvdWxkIGNvbnRpbnVlIHdpdGgg
dGhlIGN1cnJlbnQKPiA+IGFwcHJvYWNoIG9yIGlmIEkgc2hvdWxkIGluc3RlYWQgZW5hYmxlIHRo
ZSBwcmVhbWJsZSBpbiB0aGUgUEhZIGZvciBhbGwKPiA+IE1BQ3MuIFdoaWxlIEkgcHJlZmVyIHRo
ZSBjdXJyZW50IGFwcHJvYWNoLCBhcyB0aGUgaXNzdWUgbGllcyB3aXRoIHRoZQo+ID4gTUFDIHJh
dGhlciB0aGFuIHRoZSBQSFksIEkgY2FuIGFsc28gc2VlIHRoZSBhZHZhbnRhZ2Ugb2YgYWx3YXlz
IGVuYWJsaW5nCj4gPiB0aGUgZmVhdHVyZS4KPiAKPiBNeSBtYWluIGNvbmNlcm4gd2FzIHRoYXQg
d2UgbWF5IGVuZC11cCB3aXRoIGEgbG90IG9mIGRpZmZlcmVudCBmaXh1cHMKPiBmb3IgdGhlIHZh
cmlvdXMgS1NaLWZhbWlseSBQSFkgZGV2aWNlcywgZXNwZWNpYWxseSBzaW5jZSB0aGlzIGZlYXR1
cmUgaXMKPiBzb21ldGltZXMgdW5kb2N1bWVudGVkLgo+IAo+IEkndmUgZ29uZSB0aHJvdWdoIHRo
ZSBtaWNyZWwuYyBkcml2ZXIsIGFuZCBsb29rZWQgYXQgdGhlIGRhdGFzaGVldCBvZgo+IG1vc3Qg
UEhZcyBpbiB0aGVyZSwgYW5kIHNvIGZhciBJJ3ZlIGZvdW5kIHRoYXQgdG8gZml4IHRoaXMgaXNz
dWUsIHdlCj4gbmVlZCB0byBzZXQgOgo+IAo+IEtTWjkxMzEgLyBLU1o4MDQxOiBSZWdpc3RlciAw
eDE0IGJpdCA2Cj4gS1NaODA2MSAvIEtTWjgwNTEgOiBSZWdpc3RlciAweDE4IGJpdCA2Cj4gCj4g
U28gaW4gdGhlIGVuZCwgdGhlIGNvbXBsZXhpdHkgYXBwZWFycyB0byBiZSBhIGJpdCBsZXNzIGV4
cG9uZW50aWFsIHRoYW4KPiBJIG9yaWdpbmFsbHkgdGhvdWdodCwgd2UgbWF5IGVuZC11cCB3aXRo
IG9ubHkgYSBmZXcgZml4dXBzIGluIHRoaXMgZHJpdmVyLgo+IAo+IEknZCBzYXksIEknbSBmaW5l
IHdpdGggeW91IHByb2NlZWRpbmcgd2l0aCB0aGlzIG9yaWdpbmFsIGFwcHJvYWNoIGFzIGl0Cj4g
bWluaW1pemVzIHRoZSBpbXBhY3QgYW5kIHJpc2sgdG8gYnJlYWsgb3RoZXIgc2V0dXBzLgo+IAo+
IEknbSBzb3JyeSBmb3IgdHJpZ2dlcmluZyB0aGlzIHdob2xlIGRpc2N1c3Npb24gb25seSB0byBn
ZXQgYmFjayB0byB0aGUKPiBzdGFydGluZyBwb2ludCA6KAoKTm90IHByb2JsZW0sIHRoYW5rcyBh
IGxvdCBmb3IgdGhlIGZlZWRiYWNrIGFuZCB0aGUgZGlzY3Vzc2lvbi4gSSB3aWxsCnRoZW4gcHJv
Y2VlZCB3aXRoIHRoZSBjdXJyZW50IGFwcHJvYWNoIGFuZCBzZW5kIGEgbmV3IHZlcnNpb24gd2l0
aCBhbgp1cGRhdGVkIGNvbW1pdCBtZXNzYWdlLgoKUmVnYXJkcywKU3RlZmFuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
