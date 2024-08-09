Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B137694D89E
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Aug 2024 00:10:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D14DC78021;
	Fri,  9 Aug 2024 22:10:26 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92893C7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Aug 2024 22:10:18 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-71871d5e087so1446290a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Aug 2024 15:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723241417; x=1723846217;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EdgOzJ4SnYOchjgUni5CLr7DrFPzCOvLYwE0f7b/ZBo=;
 b=h/eIiQMvMkQp4XtMBbpa1Wu4IQQXSIO3Gq4yMwPRfPFHA3nsV0k49/O6fhcCj5gGdp
 6T/zVsLw7FWYPF52gXBiCOMiYQSK2htxXmhvR14UrBZI69uhsBxTjzOvE35/FssJ+J9A
 DKuHTAHYvv7ijXJbJa6c6Dj2+5svx4eXbhhiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723241417; x=1723846217;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdgOzJ4SnYOchjgUni5CLr7DrFPzCOvLYwE0f7b/ZBo=;
 b=wKH30wwaFbLbvNT6fw1K7zi8uuN64qffIr/+H3RkQFdD0PeWac/aXBdDZDdcvAgZmG
 w5u3a0wnXdP7KrvJU4taxiMJEgjIJ0/JYxoT77xquKEGj06/3yOIVgPVK9vzDApaWXCV
 0OeZ4nOGTstcEuK/EBS7WOUZHaVfR2asIhOcbH0IXEeukHLDa1/55HaeiFNwq6njGg09
 WAnPitv9sGV2RPDJN6LnL2bV+kPWRsAuk83HxzXsdz5wnCIPb8acShMbtdOF2m16i2N+
 rf7MdKXjBYQEspQNzpbBG5AwK99P3RVKl9onTlqbwU45ppiYxwwXfYPVvPQYUOHRKm1h
 tbdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT9y5PRInbFF0drBVlZVDYtDGmDMJ8zqL3V2JYAgY/FhnlYm4y//U0KvWet6ir6sQTvHT9jhSpiNm7vg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzSg0t+g6YKfZG5VQCBq8kEJu3Jws+MS8K/PFgv7wl+QHW6Uj8/
 IIGtFr73AQI6OEeb1wjrYoAOAhytuJ/5tT1HUmerGEPgvbWqHy0MLvZqoa34+nals8lpVW8hCpj
 hh5qQ6TjP5w+igF3UIFBhID/6bsgZsMk6wf/a
X-Google-Smtp-Source: AGHT+IGd0LxCEbiIJm03ZGYgIE58Ul8Tl1iOdZ065agxmT/QApewqk/ptKbowjsggmPTAHnCOi7Pxy8tewPTsybuHfA=
X-Received: by 2002:a17:90b:190a:b0:2c2:df58:bb8c with SMTP id
 98e67ed59e1d1-2d1e7fdb96amr3584116a91.18.1723241417013; Fri, 09 Aug 2024
 15:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-4-jitendra.vegiraju@broadcom.com>
 <c2e2f11a-89d8-42fa-a655-972a4ab372da@lunn.ch>
 <CAMdnO-JBznFpExduwCAm929N73Z_p4S4_nzRaowL9SzseqC6LA@mail.gmail.com>
 <de5b4d42-c81d-4687-b244-073142e2967b@lunn.ch>
 <CAMdnO-+_2Fy=uNgGevtnL8PGPvKyWXPvYaxOJwKcUZj+nnfqYg@mail.gmail.com>
 <5ff4a297-bafd-4b33-aae1-5a983f49119a@lunn.ch>
In-Reply-To: <5ff4a297-bafd-4b33-aae1-5a983f49119a@lunn.ch>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 9 Aug 2024 15:10:05 -0700
Message-ID: <CAMdnO-KpcksaTiqazjVLXNTjJAT+bS8vTVmux94CKLooej=s7A@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac: Add PCI
	driver support for BCM8958x
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

T24gRnJpLCBBdWcgOSwgMjAyNCBhdCAxOjEy4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5u
LmNoPiB3cm90ZToKPgo+IE9uIFRodSwgQXVnIDA4LCAyMDI0IGF0IDA2OjU0OjUxUE0gLTA3MDAs
IEppdGVuZHJhIFZlZ2lyYWp1IHdyb3RlOgo+ID4gT24gVHVlLCBBdWcgNiwgMjAyNCBhdCA0OjE1
4oCvUE0gQW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+ID4KPiA+ID4gT24g
TW9uLCBBdWcgMDUsIDIwMjQgYXQgMDU6NTY6NDNQTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJhanUg
d3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBBdWcgMiwgMjAyNCBhdCA0OjA44oCvUE0gQW5kcmV3IEx1
bm4gPGFuZHJld0BsdW5uLmNoPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE1hbmFnZW1l
bnQgb2YgaW50ZWdyYXRlZCBldGhlcm5ldCBzd2l0Y2ggb24gdGhpcyBTb0MgaXMgbm90IGhhbmRs
ZWQgYnkKPiA+ID4gPiA+ID4gdGhlIFBDSWUgaW50ZXJmYWNlLgo+ID4gPiA+ID4KPiA+ID4gPiA+
IE1ESU8/IFNQST8gSTJDPwo+ID4gPiA+ID4KPiA+ID4gPiBUaGUgZGV2aWNlIHVzZXMgU1BJIGlu
dGVyZmFjZS4gVGhlIHN3aXRjaCBoYXMgaW50ZXJuYWwgQVJNIE03IGZvcgo+ID4gPiA+IGNvbnRy
b2xsZXIgZmlybXdhcmUuCj4gPiA+Cj4gPiA+IFdpbGwgdGhlcmUgYmUgYSBEU0EgZHJpdmVyIHNv
bWV0aW1lIHNvb24gdGFsa2luZyBvdmVyIFNQSSB0byB0aGUKPiA+ID4gZmlybXdhcmU/Cj4gPiA+
Cj4gPiBIaSBBbmRyZXcsCj4KPiBTbyB0aGUgc3dpdGNoIHdpbGwgYmUgbGVmdCBpbiBkdW1iIHN3
aXRjaCBldmVyeXRoaW5nIHRvIGV2ZXJ5IHBvcnQKPiBtb2RlPyBPciBpdCB3aWxsIGJlIHRvdGFs
bHkgYXV0b25vbW91cyB1c2luZyB0aGUgaW4gYnVpbGQgZmlybXdhcmU/Cj4KPiBXaGF0IHlvdSBj
YW5ub3QgZXhwZWN0IGlzIHdlIGFsbG93IHlvdSB0byBtYW5hZ2UgdGhlIHN3aXRjaCBmcm9tIExp
bnV4Cj4gdXNpbmcgc29tZXRoaW5nIG90aGVyIHRoYW4gYW4gaW4ga2VybmVsIGRyaXZlciwgcHJv
YmFibHkgRFNBIG9yIHB1cmUKPiBzd2l0Y2hkZXYuCgpJIGFtIHN0YXJ0aW5nIHRvIGdldCBmYW1p
bGlhciB3aXRoIERTQSBhbmQgc3dpdGNoZGV2LgpUaGUgY29uZmlndXJhdGlvbiBjYW4gYmUgc2Vu
dCBvdmVyIHRoZSBTUEkgaW50ZXJmYWNlLgpJbiB0aGUgY3VycmVudCBhcHBsaWNhdGlvbiwgdGhl
IGhvc3QgcmVjZWl2aW5nIFBDSUUgbmV0d29yayB0cmFmZmljCm5lZWQgbm90IGJlIHRoZSBzYW1l
IGhvc3QgdGhhdCBjb250cm9scyB0aGUgU1BJIGludGVyZmFjZS4KCj4KPiAgICAgICAgIEFuZHJl
dwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
