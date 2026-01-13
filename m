Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D4AD18D8E
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 13:41:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53425C8F282;
	Tue, 13 Jan 2026 12:41:55 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78EF3C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 12:41:53 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so63072045e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 04:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1768308113; x=1768912913;
 darn=st-md-mailman.stormreply.com; 
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2dC4SplNK0CZduFW6/ZkQ29d/9pNlTULD+NHFTfquXY=;
 b=atZ/UrBilIT3DhR7Hjk9dV9ewyJztjWXKlk7UAkJ2pfja7KerPxB3GqhGeiC9z9UQ0
 nqrXcAAQvd4AWcYwzFgb0g0egOA6bX3fclOWy34/uxpvSh/bNX10Fw59TINoxpNWoE9z
 lJR6tXTRyf4dc4g1ME4PT3qPvjSG/n/OmMLGqUKhzfA1B/MurMg2kjJVGievv5ng4cAK
 U1utbHA6+DuSRQHxn87HS4D9OtVaLrxd8xzKutrLHXamz/y7/a17fG6o36EiM4Ksykrp
 y52RD3tUsKr1DPSU8Z6idcIiQJR7MC12+SOm85lwhRHLf5a+UpXvwkUC3yNXFeoPsChN
 RtZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768308113; x=1768912913;
 h=mime-version:user-agent:content-transfer-encoding:autocrypt
 :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2dC4SplNK0CZduFW6/ZkQ29d/9pNlTULD+NHFTfquXY=;
 b=NYygyEmdJ0gf+M/V/vmfUtdLbU2kq+oakbg1tTups/UgIgGtAT7eVjYt2313rXeOcC
 GIoFP7X2c+MHtXt1Bdo5NOg3Ml7C47GwQ1zwYv33ZEv+S2aBkNYjRuZOkROYWOhnTGEE
 BOxrO/kT1h2nwtoKsuQ2JT7nC7Umuaedg669rhFh+sutK12MOsNKwv2yRKrlOjfzUm9w
 hZQCMlxQNGWio97lzkSzX6EaVCElAqa6ZTcbtqqJnqb8LYKfuIdUWm87CEASS8VUkKhB
 TKHPInIEgjLOartseJAY6k+sBbLWL0t4D1rP6G7007yE+mBg4lGY2YNPpWBwg3qAke2f
 n5/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvp3Oh6gFKHUp9mrKMLxx4Sl0ozB5HjSwyic8PMwOLKFoE1U1lAiV6n1B+iKOEVTA/02xwt4em9gMiWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx63tN8FG3voYyCPETJVFaeuqGBd1GEVphZn2TOfTwT0pTdglJQ
 0F6fsGIXnwg29ciioZQCiYMPPlsLUwSd3eL3rsKpmxMbTTXbiAN0JHz7r63GC2V0nNY=
X-Gm-Gg: AY/fxX4rqyDhseNL1hWpOpCv6HwQT8q7kKOhijosgfDZR152Tkb2vgc3tbyu1H4I+0S
 tT/VknlmEx2cW7Gk1rbup3baxcc4MM8DutjljTImdYtAKnF3Rtz06cRs8d9dCkB4sPX2RmF2c2M
 cNpr/agQJ68+7psXa3TMua1R/zqVXgPZGoEN8Bko4UWwux4N/9ACSvAAuEDe1kaFXSu6u3CsAkt
 emQp1eJafE3FtzSPp0ZnhwVPWNKr6J7/9+tIaHvQl41Uhchfu1pSpujwohl5vHvhdfeK2ZmVDSf
 mswDAyjWIpduL+M6TaLT03sgaz5DOrxvY7U+QJ5FSWYZJUkErid9wA9UWyfaXzbepa0kS6YM7zE
 z6xxiDbpVLI7j12Elw65yihOm66s65wD969XVZx+kkDyJKOy5NRfB6lVAkQSfhxmojdrHZ0ePAP
 hW3Yksvo/pgiNdDhLlvtnBRRMAi7itxoaIvzoJp2+6qg==
X-Google-Smtp-Source: AGHT+IFNQeuw9WMG2h1Davmi36cm1P3WLycSIMCVChnxdfpM9EbZrc4Y9nv7bv2r6hTzREDcGxTpbg==
X-Received: by 2002:a05:600c:a08:b0:477:79c7:8994 with SMTP id
 5b1f17b1804b1-47d84b4900bmr279773315e9.30.1768308112530; 
 Tue, 13 Jan 2026 04:41:52 -0800 (PST)
Received: from [192.168.3.33] (218.37.160.45.gramnet.com.br. [45.160.37.218])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5013bd680a1sm10831771cf.16.2026.01.13.04.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 04:41:51 -0800 (PST)
Message-ID: <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Daniel Thompson <daniel@riscstar.com>
Date: Tue, 13 Jan 2026 09:41:34 -0300
In-Reply-To: <aVvF2hivCm0vIlfE@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan> <aVvF2hivCm0vIlfE@aspen.lan>
Autocrypt: addr=mpdesouza@suse.com; prefer-encrypt=mutual;
 keydata=mDMEZ/0YqhYJKwYBBAHaRw8BAQdA4JZz0FED+JD5eKlhkNyjDrp6lAGmgR3LPTduPYGPT
 Km0Kk1hcmNvcyBQYXVsbyBkZSBTb3V6YSA8bXBkZXNvdXphQHN1c2UuY29tPoiTBBMWCgA7FiEE2g
 gC66iLbhUsCBoBemssEuRpLLUFAmf9GKoCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 QemssEuRpLLWGxwD/S1I0bjp462FlKb81DikrOfWbeJ0FOJP44eRzmn20HmEBALBZIMrfIH2dJ5eM
 GO8seNG8sYiP6JfRjl7Hyqca6YsE
User-Agent: Evolution 3.58.2 (by Flathub.org) 
MIME-Version: 1.0
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Jacky Huang <ychuang3@nuvoton.com>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-hardening@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/19] printk cleanup - part 3
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

T24gTW9uLCAyMDI2LTAxLTA1IGF0IDE0OjA4ICswMDAwLCBEYW5pZWwgVGhvbXBzb24gd3JvdGU6
Cj4gT24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMTI6NTI6MTRQTSArMDAwMCwgRGFuaWVsIFRob21w
c29uIHdyb3RlOgo+ID4gSGkgTWFyY29zCj4gPiAKPiA+IE9uIFNhdCwgRGVjIDI3LCAyMDI1IGF0
IDA5OjE2OjA3QU0gLTAzMDAsIE1hcmNvcyBQYXVsbyBkZSBTb3V6YQo+ID4gd3JvdGU6Cj4gPiA+
IFRoZSBwYXJ0cyAxIGFuZCAyIGNhbiBiZSBmb3VuZCBoZXJlIFsxXSBhbmQgaGVyZVsyXS4KPiA+
ID4gCj4gPiA+IFRoZSBjaGFuZ2VzIHByb3Bvc2VkIGluIHRoaXMgcGFydCAzIGFyZSBtb3N0bHkg
dG8gY2xhcmlmeSB0aGUKPiA+ID4gdXNhZ2Ugb2YKPiA+ID4gdGhlIGludGVyZmFjZXMgZm9yIE5C
Q09OLCBhbmQgdXNlIHRoZSBwcmludGsgaGVscGVycyBtb3JlCj4gPiA+IGJyb2FkbHkuCj4gPiA+
IEJlc2lkZXMgaXQsIGl0IGFsc28gaW50cm9kdWNlcyBhIG5ldyB3YXkgdG8gcmVnaXN0ZXIgY29u
c29sZXMKPiA+ID4gYW5kIGRyb3AgdGhlcyB0aGUgQ09OX0VOQUJMRUQgZmxhZy4gSXQgc2VlbXMg
dG9vIG11Y2gsIGJ1dCBpbgo+ID4gPiByZWFsaXR5Cj4gPiA+IHRoZSBjaGFuZ2VzIGFyZSBub3Qg
Y29tcGxleCwgYW5kIGFzIHRoZSB0aXRsZSBzYXlzLCBpdCdzCj4gPiA+IGJhc2ljYWxseSBhCj4g
PiA+IGNsZWFudXAgd2l0aG91dCBjaGFuZ2luZyB0aGUgZnVuY3Rpb25hbCBjaGFuZ2VzLgo+ID4g
Cj4gPiBJIHJhbiB0aGlzIHBhdGNoc2V0IHRocm91Z2ggdGhlIGtnZGIgdGVzdCBzdWl0ZSBhbmQg
SSdtIGFmcmFpZCBpdAo+ID4gaXMKPiA+IHJlcG9ydGluZyBmdW5jdGlvbmFsIGNoYW5nZXMuCj4g
PiAKPiA+IFNwZWNpZmljYWxseSB0aGUgZWFybHljb24gc3VwcG9ydCBmb3Iga2RiIGhhcyByZWdy
ZXNzZWQgKEZXSVcgdGhlCj4gPiBwcm9ibGVtIGJpc2VjdHMgZG93biB0byB0aGUgZmluYWwgcGF0
Y2ggaW4gdGhlIHNlcmllcyB3aGVyZQo+ID4gQ09OX0VOQUJMRUQKPiA+IGlzIHJlbW92ZWQpLgo+
ID4gCj4gPiBSZXByb2R1Y3Rpb24gb24geDg2LTY0IEtWTSBvdXRzaWRlIG9mIHRoZSB0ZXN0IHN1
aXRlIHNob3VsZCBiZQo+ID4gZWFzeToKPiA+IAo+ID4gwqDCoMKgIG1ha2UgZGVmY29uZmlnCj4g
PiDCoMKgwqAgc2NyaXB0cy9jb25maWcgXAo+ID4gwqDCoMKgwqDCoMKgwqAgLS1lbmFibGUgREVC
VUdfSU5GTyBcCj4gPiAJLS1lbmFibGUgREVCVUdfSU5GT19EV0FSRl9UT09MQ0hBSU5fREVGQVVM
VCBcCj4gPiAJLS1lbmFibGUgREVCVUdfRlMgXAo+ID4gCS0tZW5hYmxlIEtBTExTWU1TX0FMTCBc
Cj4gPiAJLS1lbmFibGUgTUFHSUNfU1lTUlEgXAo+ID4gCS0tZW5hYmxlIEtHREIgXAo+ID4gCS0t
ZW5hYmxlIEtHREJfVEVTVFMgXAo+ID4gCS0tZW5hYmxlIEtHREJfS0RCIFwKPiA+IAktLWVuYWJs
ZSBLREJfS0VZQk9BUkQgXAo+ID4gCS0tZW5hYmxlIExLRFRNIFwKPiA+IAktLWVuYWJsZSBTRUNV
UklUWV9MT0NLRE9XTl9MU00KPiA+IMKgwqDCoCBtYWtlIG9sZGRlZmNvbmZpZwo+ID4gwqDCoMKg
IG1ha2UgLWokKG5wcm9jKQo+ID4gwqDCoMKgIHFlbXUtc3lzdGVtLXg4Nl82NCBcCj4gPiDCoMKg
wqDCoMKgwqDCoCAtbSAxRyAtc21wIDIgLW5vZ3JhcGhpYyBcCj4gPiAJLWtlcm5lbCBhcmNoL3g4
Ni9ib290L2J6SW1hZ2UgXAo+ID4gCS1hcHBlbmQgImNvbnNvbGU9dHR5UzAsMTE1MjAwIGtnZGJv
Yz10dHlTMAo+ID4gZWFybHljb249dWFydDgyNTAsaW8sMHgzZjgga2dkYm9jX2Vhcmx5Y29uIGtn
ZGJ3YWl0Igo+IAo+IEFjdHVhbGx5IEkgcmVhbGl6ZWQgdGhlcmUgd2FzIGEgc2ltcGxlciByZXBy
b2R1Y3Rpb24gKGhpbnRlZCBhdCBieQo+IHRoZQo+IG1pc3NpbmcgInByaW50azogbGVnYWN5IGJv
b3Rjb25zb2xlIFt1YXJ0ODI1MF0gZW5hYmxlZCIgaW4gdGhlCj4gcmVncmVzc2VkCj4gY2FzZSku
IEl0IGxvb2tzIGxpa2UgdGhlIGVhcmx5Y29uIHNpbXBseSBkb2Vzbid0IHdvcmsgYW5kIHRoYXQg
bWVhbnMKPiB0aGUKPiByZXByb2R1Y3Rpb24gZG9lc24ndCByZXF1aXJlIGFueXRoaW5nIHJlbGF0
ZWQgdG8ga2dkYiBhdCBhbGwuIFNpbXBseToKPiAKPiDCoMKgwqAgbWFrZSBkZWZjb25maWcKPiDC
oMKgwqAgbWFrZSAtaiQobnByb2MpCj4gwqDCoMKgIHFlbXUtc3lzdGVtLXg4Nl82NCAtbSAxRyAt
c21wIDIgLW5vZ3JhcGhpYyAta2VybmVsCj4gYXJjaC94ODYvYm9vdC9iekltYWdlIFwKPiDCoMKg
wqDCoMKgwqDCoCAtYXBwZW5kICJlYXJseWNvbj11YXJ0ODI1MCxpbywweDNmOCIKPiAKPiBXaXRo
IHRoZSBwYXJ0IDMgcGF0Y2hzZXQgYXBwbGllZCBJIGdldCBubyBvdXRwdXQgZnJvbSB0aGUgZWFy
bHljb24KPiAod2l0aG91dCB0aGUgcGF0Y2ggc2V0IEkgZ2V0IHRoZSBlYXJseSBib290IG1lc3Nh
Z2VzIHdoaWNoLCBhcwo+IGV4cGVjdGVkLAo+IHN0b3Agd2hlbiB0dHkwIGNvbWVzIHVwKS4KCkhp
IERhbmllbCwgc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5ISBMb3RzIG9mIHRoaW5ncyB0byBjaGVj
ayBsYXRlbHkgOikKCk9rLCBJIHJlcHJvZHVjZWQgaGVyZSwgdGhhbmtzIGEgbG90IGZvciB0ZXN0
aW5nIGtnZGJvYywgaXQncyBhIHF1aWNrCndheSB0byBjaGVjayB0aGF0IHRoZSBuZXcgcmVnaXN0
ZXJfY29uc29sZV9mb3JjZSBpcyBub3Qgd29ya2luZy4gTGV0IG1lCnRha2UgYSBsb29rIHRvIGZp
bmQgd2hhdCdzIHdyb25nLiBUaGFua3MgYSBsb3QgZm9yIGZpbmRpbmcgdGhpcyBpc3N1ZSEKCj4g
Cj4gCj4gRGFuaWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
