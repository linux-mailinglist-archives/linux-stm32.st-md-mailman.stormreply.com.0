Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4146C1D025
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 21:46:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA816C35E08
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2019 19:46:01 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 05D94C35E06
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 19:46:01 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id l25so538714eda.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 May 2019 12:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=SNWKhmqL1RfT8Ocb1OCe8VtXVVSNF6ph0Xhv4SOWB40=;
 b=CvOC26sX0Xespaa+PiqBMpVSVDalmpu07UNwcKEhcgmeP2TDr0wk6JF8RLwrn+q8XC
 tTzs0QE62dfTI68neDTbRlFyFY08xmW0ApwLtoG9MHfKXaTM9op4nNTlAisylxHhICqs
 Zn9bOWMTQWRFqK3iuLsX3ufb/cQ8OIaOscTRNoDTMK6SUPK8xlD5hPKhe737Gv5WMP/e
 8OYFSvpKd5U5A0a7Z5XGR9K3Vzlps8Dd7wEJNK5oGDkIPOgzbRRGDQKBHp39ynhfOUkj
 l0bxU5MA6DYnwb8//D2+Cw6tEhpXw8TMIh0ozArYTv8mAz9lJiTsa0Bb6Fjt4rYaf4Mu
 Yx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=SNWKhmqL1RfT8Ocb1OCe8VtXVVSNF6ph0Xhv4SOWB40=;
 b=LoyXoU0b0V0C64GRLLUDo6Ad7KozYPY6xwhkOMuoo3sFA7ZseCF3b2M8r606vC6mNs
 sZ3khfTH57F4K9EYo4e26baYFToWkiO3IS5siLl5o7DA4AomKm0PZO+f2lBDYI6fcQJ4
 N+u80E/V77Cu8FJ9G66xKoP34HTKFjEUJJ/4F92GscGUI/CigthJ+zHiHYsjQLNzyUSi
 0pz7unz308Z09GtfXTz3pkXp9wvS3JWaXu3oRdyGJWXuxYLV9O3d618UkSifNDzsaxsQ
 w3FDlaTh6QH9pR0cfzMJyC2birIYeTnevDJEWEDQGWwmjU9eg5d60CoGt/I76IAhAh8d
 Elgg==
X-Gm-Message-State: APjAAAWA55PzGq7SDMMkn2zo6hsdD7xqtZgymqoz8ZBgYhtuFRa1Gfwr
 xCDCiRghPm2CGBEJTNj5O6M=
X-Google-Smtp-Source: APXvYqzqsM6YxhwDwuwnA/BDNBMRsL7Bv72pN9sp+FWRDWg10cTe5/0GsN+ZRTKbAmaakhT/NWUJZA==
X-Received: by 2002:a50:9b10:: with SMTP id o16mr37943864edi.229.1557863160506; 
 Tue, 14 May 2019 12:46:00 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
 by smtp.gmail.com with ESMTPSA id x49sm4911383edm.25.2019.05.14.12.45.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 14 May 2019 12:45:59 -0700 (PDT)
Date: Tue, 14 May 2019 12:45:57 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20190514194557.GA12421@archlinux-i9>
References: <20190511012301.2661-1-natechancellor@gmail.com>
 <20190513073059.GH4319@dell> <20190514183900.GA7559@archlinux-i9>
 <20190514185404.GP4319@dell>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514185404.GP4319@dell>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mfd: stmfx: Fix macro definition spelling
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

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDc6NTQ6MDRQTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+IE9uIFR1ZSwgMTQgTWF5IDIwMTksIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+IAo+ID4g
T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDg6MzA6NTlBTSArMDEwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gPiBPbiBGcmksIDEwIE1heSAyMDE5LCBOYXRoYW4gQ2hhbmNlbGxvciB3cm90ZToKPiA+
ID4gCj4gPiA+ID4gQ2xhbmcgd2FybnM6Cj4gPiA+ID4gCj4gPiA+ID4gSW4gZmlsZSBpbmNsdWRl
ZCBmcm9tIGRyaXZlcnMvbWZkL3N0bWZ4LmM6MTM6Cj4gPiA+ID4gaW5jbHVkZS9saW51eC9tZmQv
c3RtZnguaDo3Ojk6IHdhcm5pbmc6ICdNRkRfU1RNRlhfSCcgaXMgdXNlZCBhcyBhCj4gPiA+ID4g
aGVhZGVyIGd1YXJkIGhlcmUsIGZvbGxvd2VkIGJ5ICNkZWZpbmUgb2YgYSBkaWZmZXJlbnQgbWFj
cm8KPiA+ID4gPiBbLVdoZWFkZXItZ3VhcmRdCj4gPiA+ID4gCj4gPiA+ID4gRml4ZXM6IDA2MjUy
YWRlOTE1NiAoIm1mZDogQWRkIFNUIE11bHRpLUZ1bmN0aW9uIGVYcGFuZGVyIChTVE1GWCkgY29y
ZSBkcml2ZXIiKQo+ID4gPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGlu
dXgvbGludXgvaXNzdWVzLzQ3NQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBDaGFuY2Vs
bG9yIDxuYXRlY2hhbmNlbGxvckBnbWFpbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGluY2x1
ZGUvbGludXgvbWZkL3N0bWZ4LmggfCAyICstCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gQXBwbGllZCwgdGhhbmtzLgo+
ID4gPiAKPiA+IAo+ID4gSGkgTGVlLAo+ID4gCj4gPiBUaGFua3MgZm9yIHBpY2tpbmcgaXQgdXAu
IEl0IHNlZW1zIHRoaXMgZGlkbid0IG1ha2UgaXQgaW50byB5b3VyIE1GRAo+ID4gcHVsbCByZXF1
ZXN0IGZvciA1LjIsIHdhcyB0aGF0IGludGVudGlvbmFsPyBJdCB3b3VsZCBiZSBuaWNlIHRvIGF2
b2lkCj4gPiB0aGlzIHdhcm5pbmcuCj4gCj4gSG1tLi4uIG5vIGl0IHdhcyBub3QgaW50ZW50aW9u
YWwuICBOb3Qgc3VyZSB3aGF0IGhhcHBlbmVkIHRoZXJlLgo+IAo+IEkgd2lsbCBwaWNrIGl0IHVw
IGZvciB0aGUgLXJjcy4KPiAKPiAtLSAKPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiBMaW5hcm8g
U2VydmljZXMgVGVjaG5pY2FsIExlYWQKPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKPiBGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBC
bG9nCgpUaGFuayB5b3UsIEkgYXBwcmVjaWF0ZSBpdCEKCk5hdGhhbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
