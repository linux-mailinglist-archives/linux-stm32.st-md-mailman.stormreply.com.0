Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACF8193C6
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 23:46:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F53AC6B44D;
	Tue, 19 Dec 2023 22:46:21 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3A561C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 22:46:20 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-336437ae847so5428531f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 14:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703025979; x=1703630779;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qg8naDClSZMfxKq9xF+hunOpmcdJyE6zAX983XcttK0=;
 b=iAuGlY/xVEPeOSStArhTaSYyIi5nK4/I+QpVkO8bNW2xHlXWXX92hdQznCHeyYMSP/
 K8lCGd6Q+7+VvlK4079UddXaj4dI/sNmJ4o1Gptz6b5TpZiAv/sTTuNuqsDfO3OFZtwf
 xrYEjPbgs+47Nwk+04bMODSTlfL6WPvwPKGHVmGFaFs8qffA596A9jE/TXLrqNUCli/4
 caQSFNygIn1fMEQtxk/VEFY9SAm3oPPupQZKN82N6wo8Oamx4lgoq/jJxgxDJPu/sJza
 EkEOjW+dqDk4n30xvzPNc6SrSqflHeTpRT8dfPupH8374FULuQUqABUkb0S2GsF25dAH
 l8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703025979; x=1703630779;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qg8naDClSZMfxKq9xF+hunOpmcdJyE6zAX983XcttK0=;
 b=QojyQP3jHf2o6m+EX2iaUzOwQjrypd4ojefLpwA4tv9CDQ50K9y9XTc9AhVGSxEvqA
 GFX6w51lZM5jfoqCR/nvUZxpu0Amw689rWVRH6g6EHKnqZk5DkKWUlzrAvtMyek9doPz
 21FyEmLInXUA4BQkqeEcTBmNR8KUugRS3xfx/g4M+yqfO8TfNH8e+6XngTY+cppsbY65
 FhgT5QlBnV3rMNQ1Bq0migJTM0sMuJgc17rRYBd5zaPWCfj9zf69NVVd87c/eHydB/Aj
 k3+juZ6NgUsdM2B/M9ZbPBmSl6s19f7zqAYPn0U0sMO6+Bws7/JldldSOhddQbzCk0Ny
 c2dg==
X-Gm-Message-State: AOJu0Yydlvqi34pxov64NBxBtAjEZf3pEwh05TfQGOyuOKXg/df3k4K3
 ig/bzz9EEqyzF79DDS5xxLM=
X-Google-Smtp-Source: AGHT+IGcgvfUPN5TljD09oQYCBLLUpvwhpt8PdFBlzZTpDiRyi8Oaqxf6OmPKHIRW2R0zoOHHV5cxA==
X-Received: by 2002:a05:600c:1e0c:b0:40d:1c37:c4fd with SMTP id
 ay12-20020a05600c1e0c00b0040d1c37c4fdmr1690636wmb.175.1703025979338; 
 Tue, 19 Dec 2023 14:46:19 -0800 (PST)
Received: from skbuf ([188.27.185.68]) by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a1cbb289a7csm15832885ejc.183.2023.12.19.14.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 14:46:19 -0800 (PST)
Date: Wed, 20 Dec 2023 00:46:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <20231219224616.pw32w5eq2dbuja5i@skbuf>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
 <20231218162326.173127-2-romain.gantois@bootlin.com>
 <20231219122034.pg2djgrosa4irubh@skbuf>
 <20231219140754.7a7a8dbd@device-28.home>
 <CACRpkdaxy9u=1-rQ+f+1tb8xyV-GYOuq52xhb4_SRPk9-LpnUA@mail.gmail.com>
 <20231219172932.13f4b0c3@device-28.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231219172932.13f4b0c3@device-28.home>
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: Prevent DSA tags
	from breaking COE
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMDU6Mjk6MzJQTSArMDEwMCwgTWF4aW1lIENoZXZhbGxp
ZXIgd3JvdGU6Cj4gSGkgTGludXMsCj4gCj4gT24gVHVlLCAxOSBEZWMgMjAyMyAxNToxOTo0NSAr
MDEwMAo+IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4g
Cj4gPiBPbiBUdWUsIERlYyAxOSwgMjAyMyBhdCAyOjA34oCvUE0gTWF4aW1lIENoZXZhbGxpZXIK
PiA+IDxtYXhpbWUuY2hldmFsbGllckBib290bGluLmNvbT4gd3JvdGU6Cj4gPiAKPiA+ID4gU28g
aXQgbG9va3MgbGlrZSBhbiBhY2NlcHRhYmxlIHNvbHV0aW9uIHdvdWxkIGJlIHNvbWV0aGluZyBh
bG9uZyB0aGUKPiA+ID4gbGluZXMgb2Ygd2hhdCBMaW51cyBpcyBzdWdnZXN0aW5nIGhlcmUgOgo+
ID4gPgo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9uZXRkZXYvMjAyMzEyMTYtbmV3LWdl
bWluaS1ldGhlcm5ldC1yZWdyZXNzaW9uLXYyLTItNjRjMjY5NDEzZGZhQGxpbmFyby5vcmcvCj4g
PiA+Cj4gPiA+IElmIHNvLCBtYXliZSBpdCdzIHdvcnRoIGFkZGluZyBhIG5ldyBoZWxwZXIgZm9y
IHRoYXQgY2hlY2sgPyAgCj4gPiAKPiA+IFllYWggaXQncyBhIGJpdCBhbm5veWluZyB3aGVuIHNr
Yi0+cHJvdG9jb2wgaXMgbm90ID09IGV0aGVydHlwZSBvZiBidWZmZXIuCj4gPiAKPiA+IEkgY2Fu
IGNlcnRhaW5seSBhZGQgYSBoZWxwZXIgc3VjaCBhcyBza2JfZXRoX3Jhd19ldGhlcnR5cGUoKQo+
ID4gdG8gPGxpbnV4L2lmX2V0aGVyLmg+IHRoYXQgd2lsbCBpbnNwZWN0IHRoZSBhY3R1YWwgZXRo
ZXJ0eXBlIGluCj4gPiBza2ItPmRhdGEuCj4gPiAKPiA+IEl0J3MgdGhlIG1vc3Qgc3RyYWlnaHQt
Zm9yd2FyZCBhcHByb2FjaC4KPiAKPiBBZ3JlZWQgOikKCklmIHlvdSByZXdyaXRlIHRoYXQgcGF0
Y2ggdG8gdXNlIHNrYl92bGFuX2V0aF9oZHIoKSB0byBnZXQgYSBzdHJ1Y3QKdmxhbl9ldGhoZHIg
cG9pbnRlciB0aHJvdWdoIHdoaWNoIGhfdmxhbl9wcm90byBhbmQgaF92bGFuX2VuY2Fwc3VsYXRl
ZF9wcm90bwphcmUgYWNjZXNzaWJsZSwgSSBkb24ndCBzZWUgbXVjaCB2YWx1ZSBpbiB3cml0aW5n
IHRoYXQgaGVscGVyLiBJdCBpcwpnb2luZyB0byBiZWcgdGhlIHF1ZXN0aW9uIGhvdyBnZW5lcmlj
IHNob3VsZCBpdCBiZSAtIHNob3VsZCBpdCBhbHNvCnRyZWF0IEVUSF9QXzgwMjFBRCwgc2hvdWxk
IGl0IHRyZWF0IG5lc3RlZCBWTEFOcz8KCkF0IHRoZSBlbmQgb2YgdGhlIGRheSwgeW91IGFyZSB0
cnlpbmcgdG8gY292ZXIgaW4gc29mdHdhcmUgdGhlIGNhc2VzIGZvcgp3aGljaCB0aGUgaGFyZHdh
cmUgZW5naW5lIGNhbiBwZXJmb3JtIFRYIGNoZWNrc3VtIG9mZmxvYWRpbmcuIFRoYXQgaXMKZ29p
bmcgdG8gYmUgaGFyZHdhcmUgc3BlY2lmaWMuCgo+ID4gV2UgY291bGQgYWxzbyBhZGQgc29tZXRo
aW5nIGxpa2UgYm9vbCBjdXN0b21fZXRoZXJ0eXBlOyB0bwo+ID4gc3RydWN0IHNrX2J1ZmYgYW5k
IHNldCB0aGF0IHRvIHRydWUgaWYgdGhlIHRhZ2dlciBhZGRzIGEgY3VzdG9tCj4gPiBldGhlcnR5
cGUuIEJ1dCBJIGRvbid0IGtub3cgaG93IHRoZSBuZXR3b3JrIGRldmVsb3BlcnMgZmVlbCBhYm91
dAo+ID4gdGhhdC4KPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgd291bGQgYmUgT0ssIGZpcnN0IGJl
Y2F1c2Ugc2tfYnVmZiBpcyBwcmV0dHkKPiBzZW5zaXRpdmUgd2hlbiBpdCBjb21lcyB0byBjYWNo
ZSBhbGlnbm1lbnQsIGFkZGluZyB0aGluZ3MgZm9yIHRoaXMga2luZAo+IG9mIHVzZS1jYXNlcyBp
c24ndCBuZWNlc3NhcmlseSBhIGdvb2QgaWRlYS4gTW9yZW92ZXIsIHBvcHVsYXRpbmcgdGhpcwo+
IGZsYWcgaXNuJ3QgZ29pbmcgdG8gYmUgc3RyYWlnaHRmb3J3YXJkIGFzIHdlbGwuIEkgZ3Vlc3Mg
c29tZSBldGhlcnR5cGUKPiB3b3VsZCBiZSBjb21wYXRpYmxlIHdpdGggY2hlY2tzdW0gZW5naW5l
cywgd2hpbGUgb3RoZXIgd291bGRuJ3QsIHNvCj4gcHJvYmFibHkgd2hhdCAnY3VzdG9tX2V0aGVy
dHlwZScgbWVhbnMgd2lsbCBkZXBlbmQgb24gdGhlIE1BQyBkcml2ZXIuCj4gCj4gRnJvbSBteSBw
b2ludCBvZiB2aWV3IHRoZSBmaXJzdCBhcHByb2FjaCB3b3VsZCBpbmRlZWQgYmUgYmV0dGVyLgoK
SSBndWVzcyB3ZSBzaG91bGQgZmlyc3QgdHJ5IHRvIGFuc3dlciB0aGUgcXVlc3Rpb25zICJ3aGF0
IGRvZXMKc2tiLT5wcm90b2NvbCByZXByZXNlbnQ/IiBhbmQgImRvZXMgRFNBIHVzZSBpdCBjb3Jy
ZWN0bHk/IiBiZWZvcmUKZXZlbiB0aGlua2luZyBhYm91dCBhZGRpbmcgeWV0IGFub3RoZXIgZnV6
enkgbGF5ZXIgb24gdG9wIGl0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
