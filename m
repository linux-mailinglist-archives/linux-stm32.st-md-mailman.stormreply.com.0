Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAFF6B26B3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 15:22:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B4ECC6A617;
	Thu,  9 Mar 2023 14:22:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1C2EFC65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 14:20:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id q16so2045046wrw.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Mar 2023 06:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678371608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
 b=pQ8rH9hmAvMGPdlWLtsaiCL1tbAk6J5Bet/1wrFc3yD0T50sPxhzJap0s2h/tEDON1
 ZyckrHIm+7bwS9K33CaoBmOEZv2I7afmQGc2Er54g/6BTDs+CyEWTFawrPc5lAPk872n
 dmirs2Ttda4PnqKgROjUd7CIwz9tdnPCkSyzGIlnzIK6bEyGRSqA1H7/Ze090yaenbxK
 iPzeJNvkLQF6jNvmwsa7eHyXANDHZkBWQs6sisMepYXK+3QyecdSDDX0uIOJQsDjVcfx
 gAyo8YDxkCaJ9wJqVQYaGvOmMuszKOMwbyHS/bu+S6gVRzJL6eI6sGaSbulGjMzjlnVQ
 sYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678371608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
 b=uwz1rKnIw9bLPDMST3EKGCjKL7ythptSchqpcllsMZ7Tc8CUlxvOvGv/5WtnO+4aR/
 aOiO0y7N2+zX7VSiB4i/Gkp8Ory5CtidnwW/9ePGkl5RuyODEs+CxWGj5SM9PnXBBdCB
 banrf67zcTXdLpiPcQFrSkEMlP0P4KBb3c+X1/hX/niD4/nqwQhDIcO97MhjlWg2twVl
 66PCEbQpqkAUr9twrmIBsNhaiMRjiFZoFyITa6g8U6w255Faa/yytfaxoWbr27aQyk/2
 zqRKaSxqu+21IJtsjBFKL4seCLMQVM6lXqFmKZXG+J3pcf6Kpg4SxR1U0xusghkojvbc
 x70A==
X-Gm-Message-State: AO0yUKXznWdYZQ2Tp4TA05DX3rUaD1qS3u/i/Nukch0tpSN64cNXE1fA
 jFs7ZdmYRMs7rl4W5cGeJUDzabNdsNtTw5EyLTU=
X-Google-Smtp-Source: AK7set+Yd9KrImooA6uxrXUVmDh+Rcs9q/1b8CgKBFtf9L4gNgxW+NQjjkIdwpsMyntXGCBQF88sBj/dwaEvM3BdnWg=
X-Received: by 2002:adf:dd4f:0:b0:2c5:5297:1f9a with SMTP id
 u15-20020adfdd4f000000b002c552971f9amr4901402wrm.14.1678371608475; Thu, 09
 Mar 2023 06:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
In-Reply-To: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 9 Mar 2023 22:19:55 +0800
Message-ID: <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
X-Mailman-Approved-At: Thu, 09 Mar 2023 14:22:45 +0000
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-aspeed@lists.ozlabs.org, tali.perry1@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com,
 benjaminfair@google.com, kdasu.kdev@gmail.com, richard@nod.at,
 chin-ting_kuo@aspeedtech.com, Sergiu.Moga@microchip.com, haibo.chen@nxp.com,
 openbmc@lists.ozlabs.org, yuenn@google.com,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
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

SGkhCgpPbiBUaHUsIE1hciA5LCAyMDIzIGF0IDEwOjA04oCvUE0gTWljaGFlbCBXYWxsZSA8bWlj
aGFlbEB3YWxsZS5jYz4gd3JvdGU6Cj4KPiBBbSAyMDIzLTAzLTA5IDE0OjU0LCBzY2hyaWViIFR1
ZG9yIEFtYmFydXM6Cj4gPiBPbiAwOS4wMy4yMDIzIDE1OjMzLCBNaWNoYWVsIFdhbGxlIHdyb3Rl
Ogo+ID4+Pj4+IFRoZSBjb250cm9sbGVycyB0aGF0IGNhbiB0YWxrIGluIGR1bW15IG5jeWNsZXMg
ZG9uJ3QgbmVlZCB0aGUKPiA+Pj4+PiBkdW1teS57YnVzd2lkdGgsIGR0cn0gZmllbGRzLgo+ID4+
Pj4+Cj4gPj4+Pj4gVGhlIGNvbnRyb2xsZXJzIHRoYXQgY2FuJ3QgdGFsayBpbiBkdW1teSBjeWNs
ZXMsIGJ1dCBvbmx5IG9uIGEKPiA+Pj4+PiAiYnl0ZSIKPiA+Pj4+PiBib3VuZGFyeSBuZWVkIGJv
dGggYnVzd2lkdGggYW5kIGR0ciBmaWVsZHMuIEFzc3VtZSBhIGZsYXNoIG5lZWRzIDMyCj4gPj4+
Pj4gZHVtbXkgY3ljbGVzIGZvciBhbiBvcCBvbiA4RC04RC04RCBtb2RlLiBJZiB0aGUgY29udHJv
bGxlciBkb2VzIG5vdAo+ID4+Pj4+IGhhdmUKPiA+Pj4+PiB0aGUgYnVzd2lkdGggYW5kIGR0ciBp
bmZvLCBpdCBjYW4ndCBjb252ZXJ0IHRoZSBkdW1teSBuY3ljbGVzIHRvCj4gPj4+Pj4gbmJ5dGVz
Lgo+ID4+Pj4+IElmIGhlIGtub3dzIG9ubHkgdGhhdCBidXN3aWR0aCBpcyA4LCBpdCB3aWxsIGNv
bnZlcnQgbmN5Y2xlcyB0byA0Cj4gPj4+Pj4gYnl0ZXMuCj4gPj4+Pj4gSWYgZHRyIGlzIGFsc28g
c3BlY2lmaWVkIGl0IGNvbnZlcnRzIG5jeWNsZXMgdG8gMiBieXRlcy4KPiA+Pj4+Cj4gPj4+PiBO
byB0aGV5IGRvbid0IG5lZWQgaXQuIExldHMgdGFrZSB5b3VyIHNlbXBlciBmbGFzaCBhbmQgYXNz
dW1lIGl0Cj4gPj4+PiBuZWVkcwo+ID4+Pj4gMTIgbGF0ZW5jeSBjeWNsZXMuIFNQSS1OT1Igd2ls
bCBzZXQgbmN5Y2xlcyB0byAxMiAqcmVnYXJkbGVzcyBvZiB0aGUKPiA+Pj4+IG1vZGUKPiA+Pj4+
IG9yIGR0ciBzZXR0aW5nKi4gVGhlIGNvbnRyb2xsZXIgdGhlbiBrbm93cyB3ZSBuZWVkIDEyIGNs
b2NrIGN5Y2xlcy4KPiA+Pj4+IEl0IGhhcwo+ID4+Pj4gdGhlbiB0byBmaWd1cmUgb3V0IGhvdyB0
aGF0IGNhbiBiZSBhY2hpZXZlZC4gRS5nLiBpZiBpdCBjYW4gb25seSBkbwo+ID4+Pj4gdGhlCj4g
Pj4+PiAib2xkIiBieXRlIHByb2dyYW1taW5nIGFuZCBpcyBpbiBxdWFkIG1vZGUsIGdvb2QgZm9y
IGl0LiBJdCB3aWxsCj4gPj4+PiBzZW5kIDYKPiA+Pj4+IGR1bW15IGJ5dGVzLCB3aGljaCB3aWxs
IHJlc3VsdCBpbiAxMiBkdW1teSBjbG9jayBjeWNsZXMsIGJlY2F1c2UgMQo+ID4+Pj4gYnl0ZQo+
ID4+Pj4gdGFrZXMgdHdvIGNsb2NrIGN5Y2xlcyBpbiBxdWFkIFNEUiBtb2RlLiBJZiBpdHMgaW4g
b2N0YWwgbW9kZSwgc2VuZAo+ID4+Pj4gMTIKPiA+Pj4+IGJ5dGVzLiBJZiBpdHMgaW4gZHVhbCBt
b2RlLCBzZW5kIDMgYnl0ZXMuIE9iaW91c2x5LCBpdCBjYW5ub3QgYmUgaW4KPiA+Pj4+IHNpbmds
ZSBiaXQgbW9kZSwgYmVjYXVzZSBpdCBjYW5ub3Qgc2VuZCAxLjUgYnl0ZXMuLgo+ID4+Pj4KPiA+
Pj4KPiA+Pj4gWW91IG1pc3MgdGhlIGZhY3QgdGhhdCB5b3UgY2FuIGhhdmUgMS0xLTQuIFdoYXQg
YnVzd2lkdGggZG8geW91IHVzZQo+ID4+PiBmb3IgZHVtbXksIHRoZSBhZGRyZXNzIGJ1c3dpZHRo
IG9yIHRoZSBkYXRhIGJ1c3dpZHRoPwo+ID4+Cj4gPj4gRG9lc24ndCBtYXR0ZXIsIGRvZXMgaXQ/
IFRoZSBkcml2ZXIgaXMgZnJlZSB0byBjaG9zZSwgMSwgNCwgb3IKPiA+PiBhbnl0aGluZwo+ID4+
IGVsc2UuIFlvdSBkb24ndCBzYW1wbGUgYW55IGRhdGEgZHVyaW5nIHRoZSBkdW1teSBwaGFzZS4K
PiA+PiBUbyBhbnN3ZXIgeW91ciBxdWVzdGlvbjogc2luZ2xlIGZvciBpbnN0cnVjdGlvbiwgc2lu
Z2xlIGZvciBhZGRyZXNzLAo+ID4+IHdoYXRldmVyIHlvdSBjaG9vc2UgZm9yIGR1bW15IGFzIGxv
bmcgYXMgdGhlcmUgYXJlIG5jeWNsZXMgc3BhY2UKPiA+PiBiZXR3ZWVuCj4gPj4gYWRkcmVzcyBh
bmQgZGF0YSwgYW5kIHF1YWQgZm9yIGRhdGEuCj4gPgo+ID4gSHVoPyBIb3cgZG9lcyB0aGUgY29u
dHJvbGxlciBjaG9zZSwgYmFzZWQgb24gd2hhdD8KPgo+IEJhc2VkIG9uIGl0cyBvd24gY2FwYWJp
bGl0aWVzLiBJdCBjYW4gY2hvb3NlIGVpdGhlciB3YXkuIEluIHRoZSBlbmQKPiB3aGF0IG1hdHRl
cnMgaXMgaG93IG1hbnkgY2xvY2sgY3ljbGVzIHRoZXJlIGFyZSBiZXR3ZWVuIHRoZSBhZGRyZXNz
Cj4gYW5kIGRhdGEgcGhhc2UuIEFuZCB5b3Ugb25seSBuZWVkIHRvIGNvbnZleSB0aGF0IGluZm9y
bWF0aW9uIHRvIHRoZQo+IFNQSSBjb250cm9sbGVyIC0geW91ciBuZXcgbmN5Y2xlcy4KCkl0IGRv
ZXMgbWF0dGVyLiBDb250cm9sbGVyIG1heSBiZSBkZXNpZ25lZCB0byBhY3RpdmVseSBkcml2ZQpN
T1NJL1dQL0hPTEQgZHVyaW5nIHNpbmdsZS1zcGkgZHVtbXkgY3ljbGVzIGFuZCBXUC9IT0xECmR1
cmluZyBkdWFsLXNwaSBkdW1teSBjeWNsZXMuIElmIHRoZSBwaW4gbW9kZXMgYmV0d2VlbiB0aGUK
Y29udHJvbGxlciBhbmQgZGV2aWNlIG1pc21hdGNoZWQsIHdvcnN0IGNhc2Ugc2NlbmFyaW8KdGhl
IGNoaXAgbWF5IGdldCBmcmllZC4KCi0tIApSZWdhcmRzLApDaHVhbmhvbmcgR3VvCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
