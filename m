Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D98926B23AE
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 13:09:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F8C7C6A60C;
	Thu,  9 Mar 2023 12:09:57 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFD8AC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 12:09:56 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id x3so6000264edb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 04:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678363796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YPxJ2OLIeiVM9zIWTy8Z43PNxojoFyB4wHkVvrTMHsI=;
 b=PCsPuCrSaeWNjmDcMFw4bgKtBYhGYqAj+i0zbY3WNGu0vBzRYo2/guv0/GeJl7bNfu
 3YZW8IM9wnoCeWWtit/jGd9sxzLQUNwy0zQ+E6mmPyFu9Vd5HsFxYTFOxB5W3z8ReLVC
 6OlM8tbxyXovsn7ZLBEGJ1lssXttPBcKEZEEPpjm8A6LdXJ5iHJZwP32FBlWhryra/Sg
 yyS6tl8QVZZkdPFrkE9ixOAd6/MtOQwY8fwNFyqS9qyQwyRq+Td43GQ6G2JXJ6ZDoHR6
 xxon3Itaz79Ep3O1CiueLrpg6250OlViZAS1Opi7Bswchq0FKEn9pw7RxKk7U3McWukW
 UyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678363796;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YPxJ2OLIeiVM9zIWTy8Z43PNxojoFyB4wHkVvrTMHsI=;
 b=Le4XP/aJRLd+wodlkS5RQ6OVUcsKuADKR8LeSlgNeyp3nwHNEuPYzPWd8b8pNroMyf
 PIKBz3J4l1lJpXilpZO8EWLiWK0Zv1RBDfdrZOF4gj0xyIU8S0mQhmgWsxvdUC/7NOU8
 kO98nVJgzbzfa0HyQhzQUTzhZ0Cs7Z2lhd/MEtW+mimZ6sszfDYau9lQMvx4Woc0GDej
 43SFREGEFV90OLyDS+kmlG1+ktd0EWS2rQNTTWZyNSCixOzaDcvIhUBnZ9WLrg2lFHaW
 lsXf5mJImqV08pm8Ok9QI3tHK2m1Vq3zX0h7ZxzSnZbkdB4Ad2ImxdE6hfu/w9Gq4Pdt
 MgWQ==
X-Gm-Message-State: AO0yUKVwjNxwZNR2pARCVv1rCWdJ6hb7xisf/KX/krxlcXE0GceLjknQ
 Ml+4orsn31wx9zbl092slmBgZg==
X-Google-Smtp-Source: AK7set/2yYrC/HUaBoW5bZf02GEocIZbb7pOirl6sFK8E+2O9TV3wFT42mnMHbUGh4cjSro0hUSJIQ==
X-Received: by 2002:a17:907:97d3:b0:883:b1b4:e798 with SMTP id
 js19-20020a17090797d300b00883b1b4e798mr25054045ejc.10.1678363796112; 
 Thu, 09 Mar 2023 04:09:56 -0800 (PST)
Received: from [172.20.10.10] ([213.233.108.171])
 by smtp.gmail.com with ESMTPSA id
 jy24-20020a170907763800b008d7a8083dffsm8751132ejc.222.2023.03.09.04.09.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 04:09:55 -0800 (PST)
Message-ID: <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
Date: Thu, 9 Mar 2023 12:09:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com,
 benjaminfair@google.com, kdasu.kdev@gmail.com, richard@nod.at,
 chin-ting_kuo@aspeedtech.com, Sergiu.Moga@microchip.com, haibo.chen@nxp.com,
 openbmc@lists.ozlabs.org, yuenn@google.com,
 bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yogeshgaur.83@gmail.com,
 linux-rockchip@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com,
 linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com,
 linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
 Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>,
 linux-kernel@vger.kernel.org, avifishman70@gmail.com,
 mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com,
 Pratyush Yadav <pratyush@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] spi: Replace `dummy.nbytes` with
	`dummy.ncycles`
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

CgpPbiAzLzkvMjMgMTA6NTYsIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0gMjAyMy0wMy0wOSAx
MTo0Miwgc2NocmllYiBUdWRvciBBbWJhcnVzOgo+PiBPbiAwOS4wMy4yMDIzIDEwOjM4LCBNaWNo
YWVsIFdhbGxlIHdyb3RlOgo+Pj4+IEluIGFuIGlkZWFsIHdvcmxkLCB3aGVyZSBib3RoIHRoZSBj
b250cm9sbGVyIGFuZCB0aGUgZGV2aWNlIHRhbGsgYWJvdXQKPj4+PiBkdW1teSBudW1iZXIgb2Yg
Y3ljbGVzLCBJIHdvdWxkIGFncmVlIHdpdGggeW91LCBidXN3aWR0aCBhbmQgZHRyIHNob3VsZAo+
Pj4+IG5vdCBiZSByZWxldmFudCBmb3IgdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMuIEJ1dCBp
dCBzZWVtcyB0aGF0IHRoZXJlCj4+Pj4gYXJlIG9sZCBjb250cm9sbGVycyAoZS5nLiBzcGktaGlz
aS1zZmMtdjN4eC5jLCBzcGktbXQ2NXh4LmMsCj4+Pj4gc3BpLW14aWMuYykKPj4+PiB0aGF0IHN1
cHBvcnQgYnVzd2lkdGhzID4gMSBhbmQgd29yayBvbmx5IHdpdGggZHVtbXkgbmJ5dGVzLCB0aGV5
IGFyZQo+Pj4+IG5vdAo+Pj4+IGNhcGFibGUgb2Ygc3BlY2lmeWluZyBhIHNtYWxsZXIgZ3JhbnVs
YXJpdHkgKG5jeWNsZXMpLiBUaHVzIHRoZSBvbGRlcgo+Pj4+IGNvbnRyb2xsZXJzIHdvdWxkIGhh
dmUgdG8gY29udmVydCB0aGUgZHVtbXkgbmN5Y2xlcyB0byBkdW1teSBuYnl0ZXMuCj4+Pj4gU2lu
Y2UgbWl4ZWQgdHJhbnNmZXIgbW9kZXMgYXJlIGEgdGhpbmcgKHNlZSBqZXNkMjUxLCBpdCB0YWxr
cyBhYm91dAo+Pj4+IDRTLTRELTREKSwgd2hlcmUgc2luZ2xlIHRyYW5zZmVyIG1vZGUgKFMpIGNh
biBiZSBtaXhlZCB3aXRoIGRvdWJsZQo+Pj4+IHRyYW5zZmVyIG1vZGUgKEQpIGZvciBhIGNvbW1h
bmQsIHRoZSBjb250cm9sbGVyIHdvdWxkIGhhdmUgdG8gZ3Vlc3MgdGhlCj4+Pj4gYnVzd2lkdGgg
YW5kIGR0ciBvZiB0aGUgZHVtbXkuIFNoYWxsIHRoZXkgcmVwbGljYXRlIHRoZSBidXN3aWR0aCBh
bmQKPj4+PiBkdHIKPj4+PiBvZiB0aGUgYWRkcmVzcyBvciBvZiB0aGUgZGF0YT8gVGhlcmUncyBu
byBydWxlIGZvciB0aGF0Lgo+Pj4KPj4+IEJ1dCBpbiB0aGUgZW5kIHRoYXQgZG9lc24ndCBtYXR0
ZXIgYmVjYXVzZSB0aGV5IGFyZSBqdXN0IGR1bW15IGNsb2NrCj4+PiBjeWNsZXMgYW5kIHRoZSBt
b2RlIHdpbGwgb25seSBhZmZlY3QgdGhlIGRhdGEvYWRkcmVzcy9jb21tYW5kLgo+Pj4gVGhlcmVm
b3JlLAo+Pj4gdGhlIGNvbnRyb2xsZXIgaXMgZnJlZSB0byBjaG9vc2UgdGhlIG1vZGUgdGhhdCBz
dWl0cyBpdCBiZXN0Lgo+Pj4gwqA+IEJ1dCB0aGF0IGJlZ3MgdGhlIHF1ZXN0aW9uLCBpcyBuY3lj
bGVzIGluIHJlZ2FyZCB0byBEVFIgb3IgU0RSPwo+Pj4gVGhhdCBpcywKPj4+IGFyZSB5b3UgY291
bnRpbmcganVzdCBvbmUgdHlwZSBvZiBlZGdlcyBvciBib3RoIHRoZSBmYWxsaW5nIGFuZCByaXNp
bmcKPj4+IGVkZ2VzLiBUaGUgc21hbGxlc3QgZ3JhbnVsYXJpdHkgd291bGQgYmUgbmN5Y2xlcyBp
biByZWdhcmQgb2YgRFRSLiBUbwo+Pj4gbWUsCj4+PiBpdCdzIG5vdCBvYnZpb3VzIHdoYXQgdGhl
IFNFTVBFUiBOYW5vIEZsYXNoIFsxXSB1c2VzLiBJJ2Qgc2F5IHdlIGNob29zZQo+Pj4gdGhlIHNt
YWxsZXN0IGdyYW51bGFydHkgaW4gc3BpLW1lbSB0byBiZSBmdXR1cmUgcHJvb2YgYW5kIG1heWJl
IHByb3ZpZGUKPj4+IHNvbWUgc3BpLW1lbSBoZWxwZXIgdG8gaGVscCBzZXR0aW5nIHRoZSBjeWNs
ZXMgZm9yIFNEUi9EVFIuIEFzIGFuCj4+PiBleGFtcGxlLAo+Pj4gaWYgeW91IHdhbnQgdG8gd2Fp
dCA0IGN5Y2xlcyBpbiBTRFIgeW91J2QgaGF2ZSBuY3ljbGVzPTggaW4gc3BpLW1lbS4KPj4+Cj4+
Cj4+IE5vLCB3ZSBjYW4ndCBpbnZlbnQgb3VyIG93biBtZWFzdXJpbmcgdW5pdHMuIFdlIGhhdmUg
Y3ljbGVzIGFuZCBoYWxmCj4+IGN5Y2xlcyAocmVnYXJkbGVzcyBvZiB0aGUgdHJhbnNmZXIgbW9k
ZSB1c2VkIChTVFIsIERUUikpLgo+IAo+IFRoYXQgaXMgYmFzaWNhbGx5IHdoYXQgSSB3YXMgc2F5
aW5nLCBqdXN0IHVzaW5nIHRoZSBjb3JyZWN0IHRlcm0uCj4gT2suIFNvIHdlIGRvbid0IG5lZWQg
dGhlIGR0ciBwcm9wZXJ0eSwgcmlnaHQ/IEknbSBzdGlsbCBub3Qgc3VyZSwKCldlIGRvLgoKQXMg
b2Ygbm93IHlvdSBjYW4ndCBzcGVjaWZ5IDIwIGR1bW15IGN5Y2xlcyBmb3IgUkVBRElEIGluIDhE
LThELThEIG1vZGUKYmVjYXVzZSBhbGwgdGhlIGxheWVycyB0cmVhdHMgZHVtbXkgYXMgYnl0ZXMs
IHdoZXJlYXMgdGhleSBzaG91bGQgdHJlYXQKaXQgYXMgY3ljbGVzLiBPbmUgZHVtbXkgYnl0ZSBp
biA4RC04RC04RCBtZWFucyAxNiBkdW1teSBjeWNsZXMuIDIwIGR1bW15CmN5Y2xlcyBpbiA4RC04
RC04RCBtZWFucyBvbmUgYnl0ZSBhbmQgYSBxdWFydGVyPyBUaGlzIGlzIGEgbm9uLXNlbnNlLgoK
QXMgdGhlIGNvZGUgaXMgbm93LCBTUEkgTkFORCB1c2VzIGR1bW15IGN5Y2xlcyB0aGF0IGFyZSBt
dWx0aXBsZSBvZiA4LgpTUEkgTk9SIHJlcXVpcmVzIGEgdmFyaWFibGUgbnVtYmVyIG9mIGR1bW15
IGN5Y2xlcywgdGhlcmUncyBubwpyZXN0cmljdGlvbnMuIEluIFNQSSBOT1Igd2UgZ2V0IGZyb20g
U0ZEUCBvciBkYXRhc2hlZXRzIHRoZSBudW1iZXIgb2YKZHVtbXkgY3ljbGVzLCBhbmQgaW4gdGhl
IGNvZGUgd2UgY29udmVydCB0aGVtIHRvIGR1bW15IG5ieXRlcy4gVGhlbiB3aGVuCndlIGdldCBh
dCB0aGUgY29udHJvbGxlciBzaWRlLCB0aGUgbWFqb3JpdHkgb2YgdGhlIGNvbnRyb2xsZXJzIHVu
ZG8gdGhlCm9wZXJhdGlvbiwgdGhleSB0YWtlIHRoZSBkdW1teSBuYnl0ZXMgYW5kIGNvbnZlcnQg
dGhlbSB0byBkdW1teSBuY3ljbGVzLgpJc24ndCBiZXR0ZXIgdG8gdXNlIGR1bW15IG5jeWNsZXMg
ZnJvbSB0aGUgYmVnaW5uaW5nPwoKVGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuIHRhbGsgaW4gZHVt
bXkgbmN5Y2xlcyBkb24ndCBuZWVkIHRoZQpkdW1teS57YnVzd2lkdGgsIGR0cn0gZmllbGRzLgoK
VGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuJ3QgdGFsayBpbiBkdW1teSBjeWNsZXMsIGJ1dCBvbmx5
IG9uIGEgImJ5dGUiCmJvdW5kYXJ5IG5lZWQgYm90aCBidXN3aWR0aCBhbmQgZHRyIGZpZWxkcy4g
QXNzdW1lIGEgZmxhc2ggbmVlZHMgMzIKZHVtbXkgY3ljbGVzIGZvciBhbiBvcCBvbiA4RC04RC04
RCBtb2RlLiBJZiB0aGUgY29udHJvbGxlciBkb2VzIG5vdCBoYXZlCnRoZSBidXN3aWR0aCBhbmQg
ZHRyIGluZm8sIGl0IGNhbid0IGNvbnZlcnQgdGhlIGR1bW15IG5jeWNsZXMgdG8gbmJ5dGVzLgpJ
ZiBoZSBrbm93cyBvbmx5IHRoYXQgYnVzd2lkdGggaXMgOCwgaXQgd2lsbCBjb252ZXJ0IG5jeWNs
ZXMgdG8gNCBieXRlcy4KSWYgZHRyIGlzIGFsc28gc3BlY2lmaWVkIGl0IGNvbnZlcnRzIG5jeWNs
ZXMgdG8gMiBieXRlcy4KCj4gd2hhdCB0aGUgc2VtcGVyIG5hbm8gZmxhc2ggdXNlcy4gSGFsZiBj
eWNsZXM/IEJ1dCBhY2NvcmRpbmcgdG8geW91cgoKdGhlcmUncyBubyBzcGltZW0gZmxhc2ggY29k
ZSB0aGF0IHVzZSBoYWxmIGN5Y2xlcyBmb3Igbm93LgoKPiBuYW1pbmcgeW91J2Qgc3BlY2lmeSBm
dWxsIGN5bGNlcz8KCkEgY2xvY2sgcGVyaW9kLCB5ZXMuCgpIb3BlIGl0IGhlbHBzLgp0YQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
