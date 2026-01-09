Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65334D07E32
	for <lists+linux-stm32@lfdr.de>; Fri, 09 Jan 2026 09:42:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1BDCCC8F286;
	Fri,  9 Jan 2026 08:42:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10CB9C8F27B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Jan 2026 08:42:15 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-432d256c2a9so935734f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Jan 2026 00:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767948135; x=1768552935;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=N/+wP7VUxOoGGhH+GyCKQ5tv6/IVz0LS1NxGo+a69kI=;
 b=PrnE2X18p+byZnJDKYcwm57sMkis+axEQk91JhgICrNnUafCq3gq/4/V49JoWGegj/
 cRPIyyZfURhy+rYGEPkJjtid8r8RYMDBjz+TE3dKzGmsAutCXf7438Kp/2DD2LHIKYlt
 A1KsTub/NGWmOiKOz/75XG8w+fifeNa/GsmJtt4viInJjIulBAlfgG3DhJU0/aws6zYu
 Wvykf4389Ma1u/sKg8CmdQwm0HJphzzIOoy0kzlo93a5u7E+raJw58Ack4zofxogRiYv
 duU6t/Vrtsf2pJ5WSErqai4ew9fcvc/H56tzwZH4bvJl4ecBOcZgC+CqymJ3cfgcC9qi
 U1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767948135; x=1768552935;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N/+wP7VUxOoGGhH+GyCKQ5tv6/IVz0LS1NxGo+a69kI=;
 b=kubdPW05gDVt7rrgnXTWDMWAgLnusyfsQQByLo8kubLQojxdlCU/lbHZ6etBaHuQBQ
 xRsmoqPSutnBHAHswSbgsKt+h2nrhso2dRC9aDhv9mH6hchgkAbfG9+5x+8FbK8ekMMG
 /2NTRBJ6rYSFCcCWTJ0E3RuXxTCYHsUMVORSdu4NPCTth1Cn2XxMbU06CgTQOdLaSmDd
 Y1yIUR3P3e3Yip68pXtfUxakgXziXdJ5/2GiryMoglepvXjAHiH0FC/SQiTJn6iFmCVE
 WCOYBdQVHwZW12ZI2CzObRI2SJtGH1lork+HqzVSB+3cjCRzgDpjswaspxFRG/TBJUio
 g2CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU77QL5zuUc837rp6QbyUV1HgjmyiH1RRQNsLmhE1pWmJ2sp6mvoLLPbqufDzSmNw9k49BnY4Ag70AC2A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx2gphKfQVBY665tvcFcwv4h3tRTKcWaCUpkspHClQbSI6vzv2f
 K93W/NVyoroahHdeoOffHzKJQQ0iwEkyEOhwprREz58QMgwoDir0827f
X-Gm-Gg: AY/fxX4FQJyFdkiBh7Ynco3sG6vKZWuX13TtYu4NSA41uj9IAJXdqsuQpi28silZsz5
 rrpDodtK9OgM5oaCOIThCuPdUNQ3GBi62Yuu5D+4kgN73cybJ6Hj0wl77iIDQhEEuauh6UXGXoQ
 AL0eXC1HZO6znrxXqK2OE6bqvQ+NAdLLkTyhjwDaWc6gOqx8e3t0LUNP9n4OEGfmsp5yilHj7++
 TFEE7r6FtBnl2SU7/TonLWWyHu5DJ1gyeOmcU2Vf+I6kdpAa64Ne6y/6zdYwPerKz0JBm4R72Dr
 RCAshjPSZGpQgoA4SBPbxGWM1CsoM2P2wdzhawNlym6/pjX8fcFBuWhdVWLPM0pmKAfDy3gXvmM
 NYhu/B/yxCKFMP/uqdbJul6x9ECH77a2ynIAaFv/C6r+y/Ww2RJI8vB7KBSwT3X2EtZnX4Od7rQ
 YT4ZMjaJi3HNM=
X-Google-Smtp-Source: AGHT+IGYAk2S3Qdr9OmtCXbZaajNREwTznfK/Lnn5IG7bEwG+8LMc/qLBJq9BAHsaKGTT3hoN4rQcA==
X-Received: by 2002:a5d:64e3:0:b0:430:f68f:ee7d with SMTP id
 ffacd0b85a97d-432c379b79cmr11104260f8f.47.1767948135127; 
 Fri, 09 Jan 2026 00:42:15 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:66a2:be50:e0d3:29f9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dacc5sm20839538f8f.5.2026.01.09.00.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 00:42:14 -0800 (PST)
Date: Fri, 9 Jan 2026 09:42:12 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <aWC_ZDu0HipuVhQS@eichest-laptop>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVv7wD2JFikGkt3F@eichest-laptop>
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

SGkgZXZlcnlvbmUsCgpPbiBNb24sIEphbiAwNSwgMjAyNiBhdCAwNjo1ODoyNFBNICswMTAwLCBT
dGVmYW4gRWljaGVuYmVyZ2VyIHdyb3RlOgo+IE9uIE1vbiwgSmFuIDA1LCAyMDI2IGF0IDA1OjA5
OjEzUE0gKzAwMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+IE9uIE1vbiwgSmFu
IDA1LCAyMDI2IGF0IDA1OjQyOjIzUE0gKzAxMDAsIFN0ZWZhbiBFaWNoZW5iZXJnZXIgd3JvdGU6
Cj4gPiA+IFllcyB0aGlzIGlzIGNvcnJlY3QuIEVSUjA1MDY5NCBmcm9tIE5YUCBzdGF0ZXM6Cj4g
PiA+IFRoZSBJRUVFIDgwMi4zIHN0YW5kYXJkIHN0YXRlcyB0aGF0LCBpbiBNSUkvR01JSSBtb2Rl
cywgdGhlIGJ5dGUKPiA+ID4gcHJlY2VkaW5nIHRoZSBTRkQgKDB4RDUpLCBTTUQtUyAoMHhFNiww
eDRDLCAweDdGLCBvciAweEIzKSwgb3IgU01ELUMKPiA+ID4gKDB4NjEsIDB4NTIsIDB4OUUsIG9y
IDB4MkEpIGJ5dGUgY2FuIGJlIGEgbm9uLVBSRUFNQkxFIGJ5dGUgb3IgdGhlcmUgY2FuCj4gPiA+
IGJlIG5vIHByZWNlZGluZyBwcmVhbWJsZSBieXRlLiBUaGUgTUFDIHJlY2VpdmVyIG11c3Qgc3Vj
Y2Vzc2Z1bGx5Cj4gPiA+IHJlY2VpdmUgYSBwYWNrZXQgd2l0aG91dCBhbnkgcHJlYW1ibGUoMHg1
NSkgYnl0ZSBwcmVjZWRpbmcgdGhlIFNGRCwKPiA+ID4gU01ELVMsIG9yIFNNRC1DIGJ5dGUuCj4g
PiA+IEhvd2V2ZXIgZHVlIHRvIHRoZSBkZWZlY3QsIGluIGNvbmZpZ3VyYXRpb25zIHdoZXJlIGZy
YW1lIHByZWVtcHRpb24gaXMKPiA+ID4gZW5hYmxlZCwgd2hlbiBwcmVhbWJsZSBieXRlIGRvZXMg
bm90IHByZWNlZGUgdGhlIFNGRCwgU01ELVMsIG9yIFNNRC1DCj4gPiA+IGJ5dGUsIHRoZSByZWNl
aXZlZCBwYWNrZXQgaXMgZGlzY2FyZGVkIGJ5IHRoZSBNQUMgcmVjZWl2ZXIuIFRoaXMgaXMKPiA+
ID4gYmVjYXVzZSwgdGhlIHN0YXJ0LW9mLXBhY2tldCBkZXRlY3Rpb24gbG9naWMgb2YgdGhlIE1B
QyByZWNlaXZlcgo+ID4gPiBpbmNvcnJlY3RseSBjaGVja3MgZm9yIGEgcHJlYW1ibGUgYnl0ZS4K
PiA+ID4gCj4gPiA+IE5YUCByZWZlcnMgdG8gSUVFRSA4MDIuMyB3aGVyZSBpbiBjbGF1c2UgMzUu
Mi4zLjIuMiBSZWNlaXZlIGNhc2UgKEdNSUkpCj4gPiA+IHRoZXkgc2hvdyB0d28gdGFibGVzIG9u
ZSB3aGVyZSB0aGUgcHJlYW1ibGUgaXMgcHJlY2VkaW5nIHRoZSBTRkQgYW5kIG9uZQo+ID4gPiB3
aGVyZSBpdCBpcyBub3QuIFRoZSB0ZXh0IHNheXM6Cj4gPiA+IFRoZSBvcGVyYXRpb24gb2YgMTAw
MCBNYi9zIFBIWXMgY2FuIHJlc3VsdCBpbiBzaHJpbmthZ2Ugb2YgdGhlIHByZWFtYmxlCj4gPiA+
IGJldHdlZW4gdHJhbnNtaXNzaW9uIGF0IHRoZSBzb3VyY2UgR01JSSBhbmQgcmVjZXB0aW9uIGF0
IHRoZSBkZXN0aW5hdGlvbgo+ID4gPiBHTUlJLiBUYWJsZSAzNeKAkzMgZGVwaWN0cyB0aGUgY2Fz
ZSB3aGVyZSBubyBwcmVhbWJsZSBieXRlcyBhcmUgY29udmV5ZWQKPiA+ID4gYWNyb3NzIHRoZSBH
TUlJLiBUaGlzIGNhc2UgbWF5IG5vdCBiZSBwb3NzaWJsZSB3aXRoIGEgc3BlY2lmaWMgUEhZLCBi
dXQKPiA+ID4gaWxsdXN0cmF0ZXMgdGhlIG1pbmltdW0gcHJlYW1ibGUgd2l0aCB3aGljaCBNQUMg
c2hhbGwgYmUgYWJsZSB0bwo+ID4gPiBvcGVyYXRlLiBUYWJsZSAzNeKAkzQgZGVwaWN0cyB0aGUg
Y2FzZSB3aGVyZSB0aGUgZW50aXJlIHByZWFtYmxlIGlzCj4gPiA+IGNvbnZleWVkIGFjcm9zcyB0
aGUgR01JSS4KPiA+ID4gCj4gPiA+IFdlIHdvdWxkIGNoYW5nZSB0aGUgYmVoYXZpb3IgZnJvbSAi
bm8gcHJlYW1ibGUgaXMgcHJlY2VkaW5nIFNGRCIgdG8gInRoZQo+ID4gPiBlbml0cmUgcHJlYW1i
bGUgaXMgcHJlY2VkaW5nIFNGRCIuIEJvdGggYXJlIGxpc3RlZCBpbiB0aGUgc3RhbmRhcmQgYW5k
Cj4gPiA+IHNoYWxsIGJlIHN1cHBvcnRlZCBieSB0aGUgTUFDLgo+ID4gCj4gPiBUaGFua3MgZm9y
IHByb3ZpZGluZyB0aGUgZnVsbCBleHBsYW5hdGlvbiwgaXQgd291bGQgYmUgZ29vZCB0byBoYXZl
Cj4gPiB0aGF0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiAKPiBPa2F5IHRoYW5rcywgSSB3aWxs
IHByb3ZpZGUgdGhlIGZ1bGwgZXhwbGFuYXRpb24gaW4gdGhlIG5leHQgY29tbWl0Cj4gbWVzc2Fn
ZS4KPiAKPiA+IAo+ID4gVGhlIG5leHQgcXVlc3Rpb24gd291bGQgYmUsIGlzIGl0IGp1c3QgdGhl
IE5YUCBFUU9TIGltcGxlbWVudGF0aW9uCj4gPiB0aGF0IHRoaXMgYnJlYWtzIG9uLCBvciBhcmUg
b3RoZXIgRVFPUyBpbXBsZW1lbnRhdGlvbnMgYWZmZWN0ZWQ/Cj4gPiAKPiA+IEluIG90aGVyIHdv
cmRzLCBpZiB3ZSBjaG9vc2UgdG8gY29uZGl0aW9uYWxseSBlbmFibGUgdGhlIHByZWFibGUgYXQK
PiA+IHRoZSBQSFksIHNob3VsZCB0aGUgZ2VuZXJpYyBwYXJ0cyBvZiBzdG1tYWMgaGFuZGxlIHRo
aXMgcmF0aGVyIHRoYW4KPiA+IGVuZGluZyB1cCB3aXRoIG11bHRpcGxlIHBsYXRmb3JtIHNwZWNp
ZmljIGdsdWUgaGF2aW5nIHRvIGNvZGUgdGhpcy4KPiA+IChUaGlzIGlzIHNvbWV0aGluZyBJIHJl
YWxseSB3YW50IHRvIGF2b2lkIC0gaXQgZG9lc24ndCBzY2FsZS4pCj4gCj4gRnJvbSB0aGUgZXJy
YXRhIGZyb20gTlhQIGl0IHNvdW5kcyB0byBtZSBsaWtlIGl0IGlzIGEgY29uZmlndXJhdGlvbgo+
IGlzc3VlIGJ5IE5YUC4gSSBjaGVja2VkIHRoZSBmb2xsb3dpbmcgRVJSQVRBcyBmcm9tIHZlbmRv
cnMgd2hlcmUgSSBoYXZlCj4gYWNjZXNzIHRvOgo+IC0gU1QgU1RNMzJNUDE6IG5vdCBhZmZlY3Rl
ZDogaHR0cHM6Ly93d3cuc3QuY29tL3Jlc291cmNlL2VuL2VycmF0YV9zaGVldC9lczA0Mzgtc3Rt
MzJtcDE1MXgzeDd4LWRldmljZS1lcnJhdGEtc3RtaWNyb2VsZWN0cm9uaWNzLnBkZgo+IC0gUmVu
ZXNhcyBSWk4xOiBub3QgYWZmZWN0ZWQ6IGh0dHBzOi8vd3d3LnJlbmVzYXMuY29tL2VuL2RvY3Vt
ZW50L3RjdS9ldGhlcm5ldC1tYWMtZ21hYy1mdW5jdGlvbi1pc3N1ZS0wP3I9MTA1NDU2MQo+IC0g
U3RhcnZpdmUgSkg3MTEwOiBub3QgYWZmZWN0ZWQ6IGh0dHBzOi8vZG9jLWVuLnJ2c3BhY2Uub3Jn
L0pINzExMC9QREYvSkg3MTEwX0VycmF0YS5wZGYKPiAtIE5YUCBTMzI6IGFmZmVjdGVkOiAoRVJS
MDUwNzA2IHVuZGVyIE5EQSkKPiAKPiBTbyBmcm9tIHRoYXQgSSB3b3VsZCBjb25jbHVkZSB0aGF0
IGl0IGlzIGFuIE5YUCBzcGVjaWZpYyBpc3N1ZSBhbmQgaXQncwo+IG5vdCB0aGUgZnVsbCBFUU9T
IGltcGxlbWVudGF0aW9uIHRoYXQgaXMgYnJva2VuLgoKSSBqdXN0IHdhbnRlZCB0byBjaGVjayB3
aGV0aGVyIEkgc2hvdWxkIGNvbnRpbnVlIHdpdGggdGhlIGN1cnJlbnQKYXBwcm9hY2ggb3IgaWYg
SSBzaG91bGQgaW5zdGVhZCBlbmFibGUgdGhlIHByZWFtYmxlIGluIHRoZSBQSFkgZm9yIGFsbApN
QUNzLiBXaGlsZSBJIHByZWZlciB0aGUgY3VycmVudCBhcHByb2FjaCwgYXMgdGhlIGlzc3VlIGxp
ZXMgd2l0aCB0aGUKTUFDIHJhdGhlciB0aGFuIHRoZSBQSFksIEkgY2FuIGFsc28gc2VlIHRoZSBh
ZHZhbnRhZ2Ugb2YgYWx3YXlzIGVuYWJsaW5nCnRoZSBmZWF0dXJlLgoKUmVnYXJkcywKU3RlZmFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
